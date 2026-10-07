/**
 * Synthetic Seed Data Generator for All 1,296 Guidewire BillingCenter Tables
 * Generates 3 realistic synthetic rows for every table defined in importedSchema.json
 */

const fs = require('fs');
const path = require('path');

function generateRowForTable(table, rowIndex) {
  const row = {};
  const tName = table.name.toLowerCase();

  for (const col of table.columns) {
    const cName = col.name.toLowerCase();
    const cType = (col.type || 'text').toLowerCase();

    // 1. Primary & Foreign Keys
    if (cName === 'id') {
      row[col.name] = rowIndex + 1;
      continue;
    }
    if (cName === 'publicid') {
      row[col.name] = `${tName.replace(/^bc_|^bcst_|^bctl_|^bcx_/, '')}:${rowIndex + 1001}`;
      continue;
    }
    if (cName.endsWith('id') && (cType.includes('int') || cType.includes('bigint'))) {
      row[col.name] = (rowIndex % 3) + 1;
      continue;
    }

    // 2. Boolean flags
    if (cType.includes('bool')) {
      row[col.name] = rowIndex % 2 === 0;
      continue;
    }

    // 3. Numeric / Amounts / Currencies
    if (cType.includes('numeric') || cType.includes('decimal') || cType.includes('double') || cType.includes('real')) {
      if (cName.includes('amount') || cName.includes('paid') || cName.includes('due') || cName.includes('balance') || cName.includes('premium')) {
        row[col.name] = parseFloat(((rowIndex + 1) * 1250.50).toFixed(2));
      } else if (cName.includes('pct') || cName.includes('rate') || cName.includes('percent')) {
        row[col.name] = parseFloat((12.50 + rowIndex * 2.5).toFixed(2));
      } else {
        row[col.name] = parseFloat(((rowIndex + 1) * 100.00).toFixed(2));
      }
      continue;
    }

    // 4. Integers
    if (cType.includes('int')) {
      if (cName.includes('currency')) {
        row[col.name] = 1; // USD
      } else if (cName.includes('status')) {
        row[col.name] = rowIndex + 1;
      } else if (cName.includes('method')) {
        row[col.name] = rowIndex + 1;
      } else if (cName.includes('year')) {
        row[col.name] = 2026;
      } else if (cName.includes('day') || cName.includes('dom')) {
        row[col.name] = (rowIndex * 5) + 1;
      } else {
        row[col.name] = rowIndex + 1;
      }
      continue;
    }

    // 5. Timestamps & Dates
    if (cType.includes('time') || cType.includes('date')) {
      const day = String(10 + rowIndex * 5).padStart(2, '0');
      if (cName.includes('expir') || cName.includes('end')) {
        row[col.name] = `2027-04-${day} 10:00:00`;
      } else {
        row[col.name] = `2026-09-${day} 09:30:00`;
      }
      continue;
    }

    // 6. Strings / Varchar / Text
    if (cName.includes('policynumber') || cName.includes('policy_number')) {
      row[col.name] = `TWIA-POL-${rowIndex + 1001}`;
    } else if (cName.includes('accountnumber') || cName.includes('account_number')) {
      row[col.name] = `BC-TWIA-80010${rowIndex + 1}`;
    } else if (cName.includes('invoicenumber') || cName.includes('invoice_number')) {
      row[col.name] = `INV-TWIA-2026-00${rowIndex + 1}`;
    } else if (cName.includes('accountname') || cName.includes('account_name')) {
      const names = ['Galveston Coastal Resort LLC', 'Corpus Christi Bay Marina', 'Vance Beachfront Properties'];
      row[col.name] = names[rowIndex % names.length];
    } else if (cName.includes('firstname') || cName.includes('first_name')) {
      const firstNames = ['Marcus', 'Sarah', 'David'];
      row[col.name] = firstNames[rowIndex % firstNames.length];
    } else if (cName.includes('lastname') || cName.includes('last_name')) {
      const lastNames = ['Vance', 'Jennings', 'Thornton'];
      row[col.name] = lastNames[rowIndex % lastNames.length];
    } else if (cName.includes('email')) {
      row[col.name] = `contact${rowIndex + 1}@twia-insurance.example.com`;
    } else if (cName.includes('phone')) {
      row[col.name] = `(512) 555-010${rowIndex + 1}`;
    } else if (cName.includes('ssn') || cName.includes('fein') || cName.includes('taxid')) {
      const taxIds = ['74-3298142', '74-8819203', '458-22-9182'];
      row[col.name] = taxIds[rowIndex % taxIds.length];
    } else if (cName.includes('status')) {
      const statuses = ['In Force', 'Active', 'Processed'];
      row[col.name] = statuses[rowIndex % statuses.length];
    } else if (cName.includes('type')) {
      const types = ['Commercial Property', 'Residential Dwelling', 'Commercial Marine'];
      row[col.name] = types[rowIndex % types.length];
    } else if (cName.includes('city')) {
      const cities = ['Galveston', 'Corpus Christi', 'Port Arthur'];
      row[col.name] = cities[rowIndex % cities.length];
    } else if (cName.includes('state')) {
      row[col.name] = 'TX';
    } else if (cName.includes('postal') || cName.includes('zip')) {
      row[col.name] = '77550';
    } else if (cName.includes('refnumber') || cName.includes('reference')) {
      row[col.name] = `REF-TX-882${rowIndex + 1}`;
    } else if (cName.includes('controlcode')) {
      row[col.name] = `CTRL-BOA-80${rowIndex + 1}`;
    } else if (cName.includes('sequencenumber')) {
      row[col.name] = `SEQ-00${rowIndex + 1}`;
    } else if (cName.includes('coupon')) {
      row[col.name] = rowIndex === 1 ? 'Scanline Remittance' : 'Standard Coupon';
    } else if (cName.includes('description') || cName.includes('desc')) {
      row[col.name] = `Synthetic record ${rowIndex + 1} for table ${tName}`;
    } else {
      row[col.name] = `${col.name}_val_${rowIndex + 1}`;
    }
  }

  return row;
}

const emptyTablesPath = path.join(__dirname, 'emptyTables.json');
let emptyTablesSet = new Set();
if (fs.existsSync(emptyTablesPath)) {
  try {
    const list = JSON.parse(fs.readFileSync(emptyTablesPath, 'utf8'));
    emptyTablesSet = new Set(list.map(t => t.toLowerCase()));
  } catch (e) {
    console.error('[Seed] Error reading emptyTables.json:', e.message);
  }
}

/**
 * Generate synthetic rows for tables in importedSchema.json
 * Skips 559 tables identified as having 0 rows in live database
 * @param {Object} schema - The imported schema object
 * @param {Object} [curatedData] - Existing curated data for key tables to preserve
 * @returns {Object} Map of tableName -> Array of rows
 */
function generateAllTablesSyntheticData(schema, curatedData = {}) {
  const result = { ...curatedData };
  const tables = schema?.tables || [];

  for (const table of tables) {
    const tName = table.name.toLowerCase();
    // If table already has curated data with rows, merge each row with full schema columns
    if (result[table.name] && result[table.name].length > 0) {
      result[table.name] = result[table.name].map((curatedRow, idx) => ({
        ...generateRowForTable(table, idx),
        ...curatedRow
      }));
      continue;
    }

    // If table is identified as having 0 rows in live DB, leave it completely empty (0 rows)
    if (emptyTablesSet.has(tName)) {
      result[table.name] = [];
      continue;
    }

    const rows = [];
    for (let i = 0; i < 3; i++) {
      rows.push(generateRowForTable(table, i));
    }
    result[table.name] = rows;
  }

  return result;
}

module.exports = {
  generateAllTablesSyntheticData,
  getEmptyTablesSet: () => emptyTablesSet
};
