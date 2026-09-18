/**
 * Comprehensive parser for all CREATE TABLE statements in dump
 */
const fs = require('fs');
const path = require('path');

const DUMP_PATH = path.join(__dirname, '..', '..', 'dump-twia_gwcppre_qa02_bc-202609181333.sql');
const text = fs.readFileSync(DUMP_PATH, 'latin1');

// Match CREATE TABLE ... up to closing parenthesis and semicolon
// PostgreSQL tables often end with:
// );
// ) WITH ( ... );
// ) TABLESPACE ... ;
const regex = /CREATE TABLE\s+(?:IF NOT EXISTS\s+)?([a-zA-Z0-9_."]+)\s*\(([\s\S]*?)\n\)(?:\s+WITH[^\n;]+)?(?:\s+TABLESPACE[^\n;]+)?\s*;/gi;

let match;
const tables = [];
const tableMap = new Map();

while ((match = regex.exec(text)) !== null) {
  const fullTable = match[1].replace(/["']/g, '');
  const body = match[2];

  // Parse columns
  const lines = body.split('\n');
  const columns = [];

  for (const line of lines) {
    const trimmed = line.trim().replace(/,$/, '');
    if (!trimmed) continue;
    if (/^(CONSTRAINT|PRIMARY KEY|FOREIGN KEY|UNIQUE|CHECK)\b/i.test(trimmed)) continue;

    const parts = trimmed.split(/\s+/);
    if (parts.length >= 2) {
      const colName = parts[0].replace(/["']/g, '');
      const colType = parts.slice(1).join(' ')
        .replace(/NOT NULL/i, '')
        .replace(/DEFAULT [^,]+/i, '')
        .replace(/COLLATE [^,]+/i, '')
        .trim();
      
      if (colName && !colName.startsWith('--')) {
        columns.push({
          name: colName,
          type: colType || 'TEXT'
        });
      }
    }
  }

  const parts = fullTable.split('.');
  const schemaName = parts.length > 1 ? parts[0] : 'public';
  const tableName = parts.length > 1 ? parts[1] : parts[0];

  if (!tableMap.has(tableName)) {
    const tableObj = {
      schema: schemaName,
      name: tableName,
      columns
    };
    tableMap.set(tableName, tableObj);
    tables.push(tableObj);
  }
}

console.log(`Extracted ${tables.length} unique tables from dump!`);

// Sort tables alphabetically
tables.sort((a, b) => a.name.localeCompare(b.name));

const schemaOutput = {
  source: 'dump-twia_gwcppre_qa02_bc-202609181333.sql',
  database: 'twia_gwcppre_qa02_bc',
  extractedAt: new Date().toISOString(),
  tableCount: tables.length,
  tables
};

fs.writeFileSync(
  path.join(__dirname, 'importedSchema.json'),
  JSON.stringify(schemaOutput, null, 2)
);

// Also generate a clean, readable SQL DDL file!
let sqlContent = `-- TWIA Guidewire BillingCenter QA02 Schema (Clean DDL)\n-- Database: twia_gwcppre_qa02_bc\n-- Extracted: ${new Date().toISOString()}\n-- Total Tables: ${tables.length}\n\n`;

for (const t of tables) {
  sqlContent += `CREATE TABLE IF NOT EXISTS ${t.schema}.${t.name} (\n`;
  const colLines = t.columns.map(c => `  ${c.name} ${c.type}`);
  sqlContent += colLines.join(',\n');
  sqlContent += `\n);\n\n`;
}

fs.writeFileSync(
  path.join(__dirname, '..', '..', 'twia_billingcenter_clean_schema.sql'),
  sqlContent
);

console.log(`Saved clean SQL DDL to D:\\QueryBuilder\\twia_billingcenter_clean_schema.sql!`);
console.log(`Saved importedSchema.json to server/src/importedSchema.json!`);

// Summary of table types
const bcTables = tables.filter(t => t.name.startsWith('bc_'));
console.log(`BillingCenter (bc_*) tables: ${bcTables.length}`);
console.log(`Other tables: ${tables.length - bcTables.length}`);
console.log(`Top 10 BC Tables:`, bcTables.slice(0, 10).map(t => t.name));
