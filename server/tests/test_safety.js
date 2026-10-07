/**
 * Deterministic Test Suite
 * Adheres to Anti-HalluconationRule - Querybuilder.md (Rules 6-9):
 * - Positive, Negative, Boundary, Edge & Error test cases
 * - Zero redundant tests (each validates a unique condition)
 */

const assert = require('assert');
const { validateSqlSafety } = require('../src/safety');
const { applyDataMasking, classifyColumn } = require('../src/masking');
const { checkInformationSufficiency, verifySqlAgainstCatalog } = require('../src/antiHallucination');

console.log('--- STARTING GUIDREWIRE QUERY STUDIO TEST SUITE ---');

let passed = 0;
let total = 0;

function runTest(name, fn) {
  total++;
  try {
    fn();
    console.log(`  ✅ PASS: ${name}`);
    passed++;
  } catch (err) {
    console.error(`  ❌ FAIL: ${name}`);
    console.error(`     ${err.message}`);
  }
}

// 1. POSITIVE TESTS
runTest('Positive: Valid SELECT query with CTE is approved', () => {
  const sql = 'WITH active_pol AS (SELECT id, policynumber FROM pc_policy WHERE status = \'In Force\') SELECT * FROM active_pol';
  const result = validateSqlSafety(sql);
  assert.strictEqual(result.isSafe, true);
  assert.ok(result.sanitizedSql.includes('LIMIT 200'));
});

runTest('Positive: Dynamic Data Masking masks SSN, Email, and Phone', () => {
  const rows = [{
    policynumber: 'POL-RES-1001',
    firstname: 'Marcus',
    ssn: '458-22-9182',
    email: 'mvance@example.com',
    phone: '512-555-0149'
  }];
  const { maskedRows, maskedCount } = applyDataMasking(rows);
  assert.strictEqual(maskedRows[0].ssn, '***-**-9182');
  assert.strictEqual(maskedRows[0].email, 'm***@example.com');
  assert.strictEqual(maskedRows[0].phone, '(***) ***-0149');
  assert.strictEqual(maskedRows[0].firstname, 'Marcus'); // Non-NPI preserved
  assert.strictEqual(maskedCount, 3);
});

// 2. NEGATIVE TESTS
runTest('Negative: Rejects DROP TABLE statement', () => {
  const sql = 'DROP TABLE pc_policy';
  const result = validateSqlSafety(sql);
  assert.strictEqual(result.isSafe, false);
  assert.ok(result.error.includes('Only SELECT or WITH'));
});

runTest('Negative: Rejects UPDATE statement in subquery', () => {
  const sql = 'SELECT * FROM pc_policy; UPDATE pc_policy SET status = \'Expired\'';
  const result = validateSqlSafety(sql);
  assert.strictEqual(result.isSafe, false);
  assert.ok(result.error.includes('Multi-statement'));
});

runTest('Negative: Anti-Hallucination rejects unsupported attributes (e.g. credit score)', () => {
  const prompt = 'Show me policyholders with a credit score above 750';
  const result = checkInformationSufficiency(prompt, {});
  assert.strictEqual(result.isSufficient, false);
  assert.ok(result.message.includes('Insufficient information to determine'));
});

runTest('Negative: Anti-Hallucination rejects invented table names', () => {
  const sql = 'SELECT * FROM pc_hallucinated_agents WHERE id = 1';
  const schema = {
    tables: [{ name: 'pc_policy' }, { name: 'bc_account' }, { name: 'cc_claim' }]
  };
  const result = verifySqlAgainstCatalog(sql, schema);
  assert.strictEqual(result.isValid, false);
  assert.ok(result.error.includes('Anti-Hallucination Violation'));
});

// 3. BOUNDARY & EDGE TESTS
runTest('Edge: Handles empty rows gracefully in masking engine', () => {
  const { maskedRows, maskedCount } = applyDataMasking([]);
  assert.deepStrictEqual(maskedRows, []);
  assert.strictEqual(maskedCount, 0);
});

runTest('Boundary: Retains user specified LIMIT if already present', () => {
  const sql = 'SELECT * FROM pc_policy LIMIT 5';
  const result = validateSqlSafety(sql);
  assert.strictEqual(result.isSafe, true);
  assert.strictEqual(result.sanitizedSql, 'SELECT * FROM pc_policy LIMIT 5');
});

runTest('Error Case: Rejects blank, whitespace, or comment-only SQL', () => {
  const sql = '   -- just a comment\n  /* another comment */  ';
  const result = validateSqlSafety(sql);
  assert.strictEqual(result.isSafe, false);
  assert.ok(result.error.includes('comments or whitespace'));
});

// 4. JOIN & SCHEMA VERIFICATION TESTS
const db = require('../src/db');
const ollama = require('../src/ollama');

runTest('Positive: Latest payment join with policy in TWIA BillingCenter mode', () => {
  db.switchToImported();
  const res = ollama.getDeterministicGuidewireQuery('asking to give policy number for the invoice that payment was recived last', { mode: 'imported' });
  assert.ok(res && res.sql);
  assert.ok(res.sql.includes('bc_basemoneyreceived'));
  assert.ok(res.sql.includes('bc_policyperiod'));
  assert.ok(res.sql.includes('bc_invoice'));
});

runTest('Positive: Latest payment join with policy in Demo mode', () => {
  db.switchToDemo();
  const res = ollama.getDeterministicGuidewireQuery('asking to give policy number for the invoice that payment was recived last', { mode: 'demo' });
  assert.ok(res && res.sql);
  assert.ok(res.sql.includes('bc_payment'));
  assert.ok(res.sql.includes('pc_policy'));
  assert.ok(res.sql.includes('bc_invoice'));
});

runTest('Positive: Policy expiration query in TWIA mode', () => {
  db.switchToImported();
  const res = ollama.getDeterministicGuidewireQuery('give me policy which are expired in last one month', { mode: 'imported' });
  assert.ok(res && res.sql);
  assert.ok(res.sql.includes('bc_policyperiod'));
  assert.ok(res.sql.includes('Expired') || res.sql.includes('CURRENT_DATE'));
});

runTest('Positive: verifySqlAgainstCatalog supports schema-qualified tables (e.g. public.bc_account)', () => {
  const sql = 'SELECT * FROM public.bc_account a JOIN public.bc_invoice i ON a.id = i.accountid';
  const schema = {
    tables: [{ name: 'bc_account' }, { name: 'bc_invoice' }]
  };
  const res = verifySqlAgainstCatalog(sql, schema);
  assert.strictEqual(res.isValid, true);
});

runTest('Positive: Custom table lockbox batch payments query in TWIA mode', () => {
  db.switchToImported();
  const res = ollama.getDeterministicGuidewireQuery('show lockbox payments received from remittance batch process', { mode: 'imported' });
  assert.ok(res && res.sql);
  assert.ok(res.sql.includes('bcx_lockboxlineitem_ext') || res.sql.includes('bc_lockboxlineitem_ext'));
  assert.ok(res.sql.includes('amountpaid'));
  assert.strictEqual(res.sql.includes('policynumber'), false);
});

runTest('Positive: Lockbox query dynamically updates SQL to include policy number when requested', async () => {
  db.switchToImported();
  const res = ollama.getDeterministicGuidewireQuery("' Show lockbox payments received from the remittance batch process with policy number", { mode: 'imported' });
  assert.ok(res && res.sql);
  assert.ok(res.sql.includes('pp.policynumber'));
  assert.ok(res.sql.includes('bc_policyperiod'));
  const execResult = await db.executeQuery(res.sql);
  assert.ok(execResult.rowCount > 0);
  assert.ok(execResult.rows[0].policynumber);
});

runTest('Positive: Anti-Hallucination validates custom extension tables (bcx_lockboxlineitem_ext, *_ext)', () => {
  const schema = {
    tables: [
      { name: 'bc_account', columns: [{ name: 'id' }, { name: 'accountnumber' }] },
      { name: 'bcx_lockboxlineitem_ext', columns: [{ name: 'id' }, { name: 'amountpaid' }] }
    ]
  };
  const res = verifySqlAgainstCatalog('SELECT * FROM bcx_lockboxlineitem_ext', schema);
  assert.strictEqual(res.isValid, true);
});

runTest('Positive: 559 empty tables have 0 rows while active tables retain data', async () => {
  db.switchToImported();
  // 1. Staging table in empty list has 0 rows
  const emptyRes = await db.executeQuery('SELECT * FROM bcst_account');
  assert.strictEqual(emptyRes.rowCount, 0, 'bcst_account must have 0 rows');

  // 2. Active operational table has data
  const activeRes = await db.executeQuery('SELECT * FROM bc_account');
  assert.ok(activeRes.rowCount > 0, 'bc_account must have active rows');

  // 3. Custom extension table has data
  const customRes = await db.executeQuery('SELECT * FROM bcx_lockboxlineitem_ext');
  assert.ok(customRes.rowCount >= 3);
});

runTest('Positive: selectRelevantTables completely excludes 559 empty tables from Ollama prompt', () => {
  const schema = {
    tables: [
      { name: 'bcst_account', columns: [{ name: 'id' }, { name: 'accountnumber' }] },
      { name: 'bc_account', columns: [{ name: 'id' }, { name: 'accountnumber' }] }
    ]
  };
  const { buildAntiHallucinationSystemPrompt } = require('../src/antiHallucination');
  const prompt = buildAntiHallucinationSystemPrompt(schema, 'show all accounts', 'bc');
  assert.ok(prompt.includes('bc_account'), 'Prompt must include active bc_account');
  assert.strictEqual(prompt.includes('bcst_account'), false, 'Prompt must omit empty bcst_account');
});

runTest('Positive: "latest added history event" queries bc_history and excludes test tables (bc_appeventstest)', async () => {
  db.switchToImported();
  const res = ollama.getDeterministicGuidewireQuery('latest added history event', { mode: 'imported' });
  assert.ok(res && res.sql);
  assert.ok(res.sql.includes('bc_history'), 'Query must target bc_history');
  assert.strictEqual(res.sql.includes('bc_appeventstest'), false, 'Query must NOT target bc_appeventstest');
  assert.ok(res.sql.includes('ORDER BY') && res.sql.includes('DESC'));
  assert.ok(res.sql.includes('LIMIT 1'));

  const execRes = await db.executeQuery(res.sql);
  assert.strictEqual(execRes.rowCount, 1);
  assert.ok(execRes.rows[0].description);
});

runTest('Positive: selectRelevantTables ranks bc_history above bc_appeventstest for history queries', () => {
  const schema = {
    tables: [
      { name: 'bc_appeventstest', columns: [{ name: 'id' }, { name: 'updatetime' }] },
      { name: 'bc_history', columns: [{ name: 'id' }, { name: 'eventtimestamp' }, { name: 'description' }] },
      { name: 'bc_account', columns: [{ name: 'id' }, { name: 'accountnumber' }] }
    ]
  };
  const { buildAntiHallucinationSystemPrompt } = require('../src/antiHallucination');
  const prompt = buildAntiHallucinationSystemPrompt(schema, 'latest added history event', 'bc');
  assert.ok(prompt.includes('bc_history'));
  assert.strictEqual(prompt.includes('bc_appeventstest'), false, 'bc_appeventstest must be penalized and omitted');
});

runTest('Positive: "show all records from bcx_lockboxlineitem" generates SELECT * with all columns (>=33)', async () => {
  db.switchToImported();
  const res = ollama.getDeterministicGuidewireQuery('show all records from bcx_lockboxlineitem', { mode: 'imported' });
  assert.ok(res && res.sql);
  assert.ok(res.sql.includes('SELECT * FROM bcx_lockboxlineitem_ext'), 'Must be SELECT * on bcx_lockboxlineitem_ext');
  assert.strictEqual(res.sql.includes('JOIN'), false, 'Must not perform lockbox remittance batch join');

  const execRes = await db.executeQuery(res.sql);
  assert.ok(execRes.rowCount > 0, 'Must return rows');
  const columnCount = Object.keys(execRes.rows[0]).length;
  assert.ok(columnCount >= 33, `Expected at least 33 columns, got ${columnCount}`);
});

console.log(`\nTEST RESULTS: ${passed}/${total} PASSED`);
if (passed !== total) {
  process.exit(1);
}



