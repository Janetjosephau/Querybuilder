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

console.log(`\nTEST RESULTS: ${passed}/${total} PASSED`);
if (passed !== total) {
  process.exit(1);
}
