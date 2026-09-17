/**
 * SQL Safety & Guardrail Engine
 * Enforces strict Read-Only constraints, rejects malicious commands,
 * prevents multi-statement injection, and enforces pagination limits.
 */

const FORBIDDEN_KEYWORDS = [
  'DROP', 'DELETE', 'UPDATE', 'INSERT', 'TRUNCATE', 'ALTER', 
  'GRANT', 'REVOKE', 'EXEC', 'EXECUTE', 'CREATE', 'REPLACE', 
  'MERGE', 'UPSERT', 'LOCK', 'COPY', 'VACUUM', 'REINDEX'
];

/**
 * Validates that an SQL query is safe and strictly read-only
 * @param {string} sql - Raw SQL string
 * @returns {{ isSafe: boolean, error?: string, sanitizedSql?: string }}
 */
function validateSqlSafety(sql) {
  if (!sql || typeof sql !== 'string') {
    return { isSafe: false, error: 'Empty or invalid SQL query provided.' };
  }

  const cleanSql = sql.trim().replace(/--.*$/gm, '').replace(/\/\*[\s\S]*?\*\//g, '').trim();

  if (!cleanSql) {
    return { isSafe: false, error: 'Query contains only comments or whitespace.' };
  }

  // Check for statement stacking / multi-statement injection (semicolons with more SQL)
  const statements = cleanSql.split(';').map(s => s.trim()).filter(Boolean);
  if (statements.length > 1) {
    return { 
      isSafe: false, 
      error: 'Security Violation: Multi-statement queries are strictly prohibited.' 
    };
  }

  const singleQuery = statements[0];

  // Tokenize words
  const tokens = singleQuery.toUpperCase().split(/[\s,()]+/).filter(Boolean);
  const firstToken = tokens[0];

  // Must begin with SELECT or WITH (Common Table Expression)
  if (firstToken !== 'SELECT' && firstToken !== 'WITH') {
    return {
      isSafe: false,
      error: `Security Violation: Only SELECT or WITH statements are permitted. Found '${firstToken}'.`
    };
  }

  // Scan all tokens for forbidden write/DDL keywords
  for (const token of tokens) {
    if (FORBIDDEN_KEYWORDS.includes(token)) {
      return {
        isSafe: false,
        error: `Security Violation: Forbidden command '${token}' detected. Only read-only operations are allowed.`
      };
    }
  }

  // Ensure LIMIT clamp is present to prevent denial of service (max 200 rows by default)
  let clampedSql = singleQuery;
  if (!/\bLIMIT\s+\d+/i.test(singleQuery)) {
    clampedSql += ' LIMIT 200';
  }

  return {
    isSafe: true,
    sanitizedSql: clampedSql
  };
}

module.exports = {
  validateSqlSafety,
  FORBIDDEN_KEYWORDS
};
