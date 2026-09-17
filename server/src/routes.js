/**
 * Express API Router for Guidewire AI Query Studio
 */

const express = require('express');
const router = express.Router();
const db = require('./db');
const ollama = require('./ollama');
const audit = require('./audit');

// 1. Health check & System status
router.get('/health', async (req, res) => {
  const models = await ollama.getAvailableModels();
  res.json({
    status: 'ONLINE',
    dbMode: db.getMode(),
    activeModel: models.current,
    ollamaStatus: models.success ? 'CONNECTED' : 'DISCONNECTED',
    timestamp: new Date().toISOString()
  });
});

// 2. Schema Introspection
router.get('/schema', async (req, res) => {
  try {
    const schema = await db.getSchema();
    res.json({ success: true, schema });
  } catch (err) {
    res.status(500).json({ success: false, error: err.message });
  }
});

// 3. Conversational Text-to-SQL Chat endpoint
router.post('/chat', async (req, res) => {
  const { prompt, sessionId } = req.body;

  if (!prompt || typeof prompt !== 'string') {
    return res.status(400).json({ success: false, error: 'A valid text prompt is required.' });
  }

  try {
    const schema = await db.getSchema();
    
    // Generate SQL with Anti-Hallucination rules
    const aiResult = await ollama.generateSql(prompt, schema);

    // If information is insufficient or missing, return early without execution
    if (aiResult.insufficientInfo || !aiResult.sql) {
      audit.logAuditRecord({
        sessionId,
        prompt,
        sql: null,
        mode: db.getMode(),
        status: 'INSUFFICIENT_INFO',
        error: aiResult.insufficientInfo
      });

      return res.json({
        success: true,
        prompt,
        sql: null,
        explanation: aiResult.explanation,
        confidence: aiResult.confidence,
        insufficientInfo: aiResult.insufficientInfo,
        rows: [],
        rowCount: 0,
        maskedCount: 0,
        maskedFields: [],
        suggestedChartType: 'table'
      });
    }

    // Execute query with Read-Only Safety & Dynamic Data Masking
    const queryResult = await db.executeQuery(aiResult.sql);

    // Audit log
    audit.logAuditRecord({
      sessionId,
      prompt,
      sql: queryResult.executedSql,
      mode: queryResult.mode,
      maskedCount: queryResult.maskedCount,
      maskedFields: queryResult.maskedFields,
      rowCount: queryResult.rowCount,
      executionTimeMs: queryResult.executionTimeMs,
      status: 'SUCCESS'
    });

    res.json({
      success: true,
      prompt,
      sql: queryResult.executedSql,
      explanation: aiResult.explanation,
      confidence: aiResult.confidence,
      rows: queryResult.rows,
      rowCount: queryResult.rowCount,
      executionTimeMs: queryResult.executionTimeMs,
      maskedCount: queryResult.maskedCount,
      maskedFields: queryResult.maskedFields,
      suggestedChartType: aiResult.suggestedChartType,
      mode: queryResult.mode
    });
  } catch (err) {
    audit.logAuditRecord({
      sessionId,
      prompt,
      sql: null,
      mode: db.getMode(),
      status: 'ERROR',
      error: err.message
    });

    res.status(400).json({
      success: false,
      error: err.message,
      canRetry: err.canRetry || false
    });
  }
});

// 4. Raw SQL Execution (Studio mode)
router.post('/execute', async (req, res) => {
  const { sql, sessionId } = req.body;

  if (!sql) {
    return res.status(400).json({ success: false, error: 'SQL query is required.' });
  }

  try {
    const result = await db.executeQuery(sql);

    audit.logAuditRecord({
      sessionId,
      prompt: '[MANUAL_SQL_EXECUTION]',
      sql: result.executedSql,
      mode: result.mode,
      maskedCount: result.maskedCount,
      maskedFields: result.maskedFields,
      rowCount: result.rowCount,
      executionTimeMs: result.executionTimeMs,
      status: 'SUCCESS'
    });

    res.json({
      success: true,
      ...result
    });
  } catch (err) {
    audit.logAuditRecord({
      sessionId,
      prompt: '[MANUAL_SQL_EXECUTION]',
      sql,
      mode: db.getMode(),
      status: 'ERROR',
      error: err.message
    });

    res.status(400).json({
      success: false,
      error: err.message
    });
  }
});

// 5. Connect to PostgreSQL or switch to Demo DB
router.post('/connect', async (req, res) => {
  const { mode, config } = req.body;

  if (mode === 'demo') {
    db.switchToDemo();
    return res.json({ success: true, mode: 'demo', message: 'Switched to Guidewire Demo Database.' });
  }

  try {
    const result = await db.connectPostgres(config || {});
    res.json(result);
  } catch (err) {
    res.status(400).json({ success: false, error: `Failed to connect to PostgreSQL: ${err.message}` });
  }
});

// 6. Models endpoint
router.get('/models', async (req, res) => {
  const models = await ollama.getAvailableModels();
  res.json(models);
});

router.post('/models/select', (req, res) => {
  const { model } = req.body;
  if (!model) {
    return res.status(400).json({ success: false, error: 'Model name is required.' });
  }
  const result = ollama.setModel(model);
  res.json(result);
});

// 7. Audit logs endpoint (for Security Officer review)
router.get('/audit', (req, res) => {
  const logs = audit.getRecentAuditLogs(50);
  res.json({ success: true, logs });
});

module.exports = router;
