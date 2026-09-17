/**
 * Database Management Layer
 * Supports both Preloaded Guidewire Demo DB (in-memory)
 * and Live PostgreSQL database connections with schema introspection.
 */

const { Pool } = require('pg');
const alasql = require('alasql');
const { generateGuidewireData } = require('./guidewireSeed');
const { applyDataMasking, classifyColumn } = require('./masking');
const { validateSqlSafety } = require('./safety');

let currentMode = 'demo'; // 'demo' | 'postgres'
let pgPool = null;
let liveDbConfig = null;

// Initialize in-memory Demo Database
function initDemoDatabase() {
  const data = generateGuidewireData();
  
  // Clear any prior tables
  for (const tableName of Object.keys(data)) {
    try {
      alasql(`DROP TABLE IF EXISTS ${tableName}`);
    } catch (e) {}
    
    // Create and seed tables in alasql
    alasql(`CREATE TABLE ${tableName}`);
    alasql.tables[tableName].data = [...data[tableName]];
  }

  console.log('[DB] Preloaded Guidewire Demo Database initialized successfully with 11 tables.');
}

// Initialize on startup
initDemoDatabase();

/**
 * Configure live PostgreSQL connection
 */
async function connectPostgres(config) {
  if (pgPool) {
    try { await pgPool.end(); } catch (e) {}
  }

  const connectionConfig = {
    host: config.host || 'localhost',
    port: parseInt(config.port, 10) || 5432,
    database: config.database || 'postgres',
    user: config.user || 'postgres',
    password: config.password || '',
    ssl: config.ssl ? { rejectUnauthorized: false } : false,
    statement_timeout: 10000 // 10-second timeout
  };

  if (config.connectionString) {
    pgPool = new Pool({
      connectionString: config.connectionString,
      ssl: config.ssl ? { rejectUnauthorized: false } : false,
      statement_timeout: 10000
    });
  } else {
    pgPool = new Pool(connectionConfig);
  }

  // Test connection
  const client = await pgPool.connect();
  try {
    await client.query('SELECT 1');
  } finally {
    client.release();
  }

  currentMode = 'postgres';
  liveDbConfig = config;
  console.log(`[DB] Successfully connected to Live PostgreSQL DB: ${connectionConfig.database}`);
  return { success: true, mode: 'postgres' };
}

/**
 * Switch back to Demo DB
 */
function switchToDemo() {
  currentMode = 'demo';
  return { success: true, mode: 'demo' };
}

/**
 * Introspect database schema
 */
async function getSchema() {
  if (currentMode === 'postgres' && pgPool) {
    try {
      const query = `
        SELECT 
          table_name, 
          column_name, 
          data_type 
        FROM information_schema.columns 
        WHERE table_schema = 'public'
        ORDER BY table_name, ordinal_position;
      `;
      const res = await pgPool.query(query);
      const tablesMap = {};

      for (const row of res.rows) {
        if (!tablesMap[row.table_name]) {
          tablesMap[row.table_name] = {
            name: row.table_name,
            columns: []
          };
        }
        tablesMap[row.table_name].columns.push({
          name: row.column_name,
          type: row.data_type,
          isNpi: classifyColumn(row.column_name) !== null
        });
      }

      return {
        mode: 'postgres',
        database: liveDbConfig?.database || 'postgres',
        tables: Object.values(tablesMap)
      };
    } catch (err) {
      console.error('[DB] Error introspecting PostgreSQL schema:', err.message);
    }
  }

  // Demo Database Schema
  const sampleData = generateGuidewireData();
  const tables = Object.keys(sampleData).map(tableName => {
    const rows = sampleData[tableName];
    const firstRow = rows[0] || {};
    const columns = Object.keys(firstRow).map(col => {
      const val = firstRow[col];
      let type = 'TEXT';
      if (typeof val === 'number') {
        type = Number.isInteger(val) ? 'INTEGER' : 'NUMERIC';
      } else if (typeof val === 'boolean') {
        type = 'BOOLEAN';
      }
      return {
        name: col,
        type,
        isNpi: classifyColumn(col) !== null
      };
    });

    return {
      name: tableName,
      columns,
      rowCount: rows.length
    };
  });

  return {
    mode: 'demo',
    database: 'guidewire_demo_db (Residential & Commercial)',
    tables
  };
}

/**
 * Safely execute an SQL query with read-only validation & Dynamic Data Masking
 */
async function executeQuery(rawSql) {
  const startTime = Date.now();

  // 1. Safety validation
  const safety = validateSqlSafety(rawSql);
  if (!safety.isSafe) {
    throw new Error(safety.error);
  }

  const finalSql = safety.sanitizedSql;
  let rawRows = [];

  if (currentMode === 'postgres' && pgPool) {
    const client = await pgPool.connect();
    try {
      // Enforce read-only transaction isolation
      await client.query('BEGIN READ ONLY');
      await client.query('SET statement_timeout = 10000');
      const res = await client.query(finalSql);
      rawRows = res.rows || [];
      await client.query('COMMIT');
    } catch (err) {
      await client.query('ROLLBACK').catch(() => {});
      throw err;
    } finally {
      client.release();
    }
  } else {
    // Demo mode with alasql
    try {
      const result = alasql(finalSql);
      rawRows = Array.isArray(result) ? result : [];
    } catch (err) {
      throw new Error(`Demo SQL Execution Error: ${err.message}`);
    }
  }

  const executionTimeMs = Date.now() - startTime;

  // 2. Dynamic Data Masking
  const { maskedRows, maskedCount, maskedFields } = applyDataMasking(rawRows);

  return {
    rows: maskedRows,
    rowCount: maskedRows.length,
    executionTimeMs,
    maskedCount,
    maskedFields,
    mode: currentMode,
    executedSql: finalSql
  };
}

module.exports = {
  getSchema,
  executeQuery,
  connectPostgres,
  switchToDemo,
  getMode: () => currentMode
};
