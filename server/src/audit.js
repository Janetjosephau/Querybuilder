/**
 * Compliance Audit Logger
 * Writes immutable JSONL audit entries for all natural language prompts,
 * generated SQL queries, and NPI masking events.
 */

const fs = require('fs');
const path = require('path');

const AUDIT_FILE = path.join(__dirname, '..', 'audit_log.jsonl');

function logAuditRecord(record) {
  const entry = {
    timestamp: new Date().toISOString(),
    session: record.sessionId || 'local-session',
    prompt: record.prompt || '',
    sql: record.sql || '',
    mode: record.mode || 'demo',
    tablesAccessed: record.tablesAccessed || [],
    maskedCount: record.maskedCount || 0,
    maskedFields: record.maskedFields || [],
    rowCount: record.rowCount || 0,
    executionTimeMs: record.executionTimeMs || 0,
    status: record.status || 'SUCCESS',
    error: record.error || null
  };

  const line = JSON.stringify(entry) + '\n';
  fs.appendFile(AUDIT_FILE, line, (err) => {
    if (err) {
      console.error('[AUDIT] Failed to append audit record:', err.message);
    }
  });
}

function getRecentAuditLogs(limit = 50) {
  if (!fs.existsSync(AUDIT_FILE)) {
    return [];
  }

  try {
    const data = fs.readFileSync(AUDIT_FILE, 'utf-8');
    const lines = data.trim().split('\n').filter(Boolean);
    const recent = lines.slice(-limit).map(l => {
      try {
        return JSON.parse(l);
      } catch (e) {
        return null;
      }
    }).filter(Boolean);
    return recent.reverse();
  } catch (err) {
    console.error('[AUDIT] Error reading audit logs:', err.message);
    return [];
  }
}

module.exports = {
  logAuditRecord,
  getRecentAuditLogs
};
