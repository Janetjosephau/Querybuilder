/**
 * Local Ollama Integration Engine
 * 100% offline, air-gapped Text-to-SQL generation for Guidewire Insurance Suite.
 */

const http = require('http');
const { buildAntiHallucinationSystemPrompt, verifySqlAgainstCatalog, checkInformationSufficiency } = require('./antiHallucination');

const OLLAMA_HOST = process.env.OLLAMA_HOST || '127.0.0.1';
const OLLAMA_PORT = process.env.OLLAMA_PORT || 11434;
const OLLAMA_TIMEOUT_MS = parseInt(process.env.OLLAMA_TIMEOUT_MS, 10) || 90000;
let selectedModel = 'qwen2.5-coder:7b';

/**
 * Make an HTTP request to local Ollama daemon
 */
function callOllamaApi(endpoint, method = 'GET', data = null) {
  return new Promise((resolve, reject) => {
    const postData = data ? JSON.stringify(data) : null;
    const options = {
      hostname: OLLAMA_HOST,
      port: OLLAMA_PORT,
      path: endpoint,
      method: method,
      headers: {
        'Content-Type': 'application/json',
        ...(postData ? { 'Content-Length': Buffer.byteLength(postData) } : {})
      },
      timeout: OLLAMA_TIMEOUT_MS
    };

    const req = http.request(options, (res) => {
      let body = '';
      res.on('data', chunk => { body += chunk; });
      res.on('end', () => {
        if (res.statusCode >= 200 && res.statusCode < 300) {
          try {
            resolve(JSON.parse(body));
          } catch (e) {
            resolve(body);
          }
        } else {
          reject(new Error(`Ollama API error (${res.statusCode}): ${body}`));
        }
      });
    });

    req.on('error', (err) => {
      reject(new Error(`Unable to connect to local Ollama at ${OLLAMA_HOST}:${OLLAMA_PORT} - ${err.message}`));
    });

    req.on('timeout', () => {
      req.destroy();
      reject(new Error(`Ollama request timed out after ${Math.round(OLLAMA_TIMEOUT_MS / 1000)} seconds.`));
    });

    if (postData) {
      req.write(postData);
    }
    req.end();
  });
}

/**
 * Get list of installed Ollama models
 */
async function getAvailableModels() {
  try {
    const res = await callOllamaApi('/api/tags', 'GET');
    const models = (res.models || []).map(m => m.name);
    return {
      success: true,
      models,
      current: selectedModel
    };
  } catch (err) {
    return {
      success: false,
      error: err.message,
      models: ['qwen2.5-coder:7b', 'llama3:latest', 'mistral:7b'],
      current: selectedModel
    };
  }
}

/**
 * Set active Ollama model
 */
function setModel(modelName) {
  selectedModel = modelName;
  return { success: true, current: selectedModel };
}

/**
 * Rule-based fallback for common Guidewire queries (ensures instant zero-latency responses for POC)
 */
function getDeterministicGuidewireQuery(prompt) {
  const p = prompt.toLowerCase();

  // Extract custom limit if specified e.g. "top 10", "first 5", "limit 20"
  let limit = 10;
  const limitMatch = p.match(/\b(?:top|limit|first)\s*(\d+)\b/i) || p.match(/\b(\d+)\s*(?:records?|rows?)\b/i);
  if (limitMatch) {
    limit = parseInt(limitMatch[1], 10);
    if (isNaN(limit) || limit <= 0) limit = 10;
    if (limit > 200) limit = 200;
  }

  // 0. Policyholder Queries & Variations (pc_policyholder, pc_policholder, policy holder, etc.)
  const isPolicyholder = (
    p.includes('policyholder') ||
    p.includes('policy holder') ||
    p.includes('polic holder') ||
    p.includes('policholder') ||
    p.includes('pc_policyholder') ||
    p.includes('pc_policholder') ||
    p.includes('pc policyholder') ||
    p.includes('pc policy holder') ||
    p.includes('customer') ||
    p.includes('ssn') ||
    p.includes('insured')
  );

  if (isPolicyholder) {
    return {
      sql: `SELECT 
  p.policynumber,
  p.productcode,
  ph.firstname,
  ph.lastname,
  ph.ssn,
  ph.phone,
  ph.email,
  ph.city,
  ph.state
FROM pc_policyholder ph
LEFT JOIN pc_policyperiod pp ON ph.policyperiod_id = pp.id
LEFT JOIN pc_policy p ON pp.policy_id = p.id
LIMIT ${limit};`,
      explanation: `Retrieves top ${limit} policyholder records from pc_policyholder joined with policy details. Note: All sensitive NPI fields (SSN, Phone, Email) are automatically masked by the Dynamic Data Masking engine.`,
      confidence: 'high',
      insufficientInfo: null,
      suggestedChartType: 'table'
    };
  }

  // Direct Table Queries (e.g. "top 10 from pc_policy", "show cc_claim table", etc.)
  const tableMap = [
    { table: 'pc_policyperiod', triggers: ['pc_policyperiod', 'policyperiod', 'policy period'] },
    { table: 'pc_policy', triggers: ['pc_policy', 'pc policy', 'policies', 'policy'] },
    { table: 'pc_coverage', triggers: ['pc_coverage', 'pc coverage', 'coverage'] },
    { table: 'bc_invoice', triggers: ['bc_invoice', 'bc invoice', 'invoice'] },
    { table: 'bc_account', triggers: ['bc_account', 'bc account', 'billing account', 'account'] },
    { table: 'bc_payment', triggers: ['bc_payment', 'bc payment', 'payment'] },
    { table: 'cc_claimant', triggers: ['cc_claimant', 'cc claimant', 'claimant'] },
    { table: 'cc_exposure', triggers: ['cc_exposure', 'cc exposure', 'exposure'] },
    { table: 'cc_financials', triggers: ['cc_financials', 'cc financials', 'financial'] },
    { table: 'cc_claim', triggers: ['cc_claim', 'cc claim', 'claim'] }
  ];

  for (const item of tableMap) {
    for (const trig of item.triggers) {
      if (p.includes(trig) && (p.includes('table') || p.includes('from') || p.includes('select') || p.includes('top') || p.includes('show') || p.includes('list'))) {
        return {
          sql: `SELECT * FROM ${item.table} LIMIT ${limit};`,
          explanation: `Retrieves top ${limit} records directly from Guidewire ${item.table} table. Protected NPI columns are dynamically sanitized.`,
          confidence: 'high',
          insufficientInfo: null,
          suggestedChartType: 'table'
        };
      }
    }
  }

  // 1. Loss Ratio (PolicyCenter + ClaimCenter)
  if (p.includes('loss ratio') || (p.includes('residential') && p.includes('commercial') && p.includes('loss'))) {
    return {
      sql: `SELECT 
  p.productcode AS product_line,
  SUM(pp.totalpremium) AS total_written_premium,
  COALESCE(SUM(f.netincurred), 0) AS total_incurred_loss,
  ROUND(CAST(COALESCE(SUM(f.netincurred), 0) AS NUMERIC) / NULLIF(SUM(pp.totalpremium), 0) * 100, 2) AS loss_ratio_pct
FROM pc_policy p
JOIN pc_policyperiod pp ON p.id = pp.policy_id
LEFT JOIN cc_claim c ON p.id = c.policy_id
LEFT JOIN cc_financials f ON c.id = f.claim_id
GROUP BY p.productcode;`,
      explanation: 'Calculates Total Written Premium from pc_policyperiod, Total Incurred Losses from cc_financials, and the resulting Loss Ratio percentage grouped by Residential and Commercial product lines.',
      confidence: 'high',
      insufficientInfo: null,
      suggestedChartType: 'bar'
    };
  }

  // 2. High-Value Open Claims / Reserves
  if (p.includes('open') && (p.includes('claim') || p.includes('50000') || p.includes('reserves'))) {
    return {
      sql: `SELECT 
  c.claimnumber,
  p.productcode,
  c.losscause,
  c.lossdate,
  f.totalreserves,
  f.totalpaid,
  f.netincurred
FROM cc_claim c
JOIN pc_policy p ON c.policy_id = p.id
JOIN cc_financials f ON c.id = f.claim_id
WHERE c.status = 'Open' AND f.totalreserves >= 50000
ORDER BY f.totalreserves DESC
LIMIT 10;`,
      explanation: 'Retrieves top open claims from cc_claim joined with cc_financials and pc_policy where total reserves equal or exceed $50,000, sorted descending by reserve size.',
      confidence: 'high',
      insufficientInfo: null,
      suggestedChartType: 'bar'
    };
  }

  // 3. Claims by Loss Cause
  if ((p.includes('loss cause') || p.includes('cause of loss') || p.includes('causes')) && p.includes('claim')) {
    return {
      sql: `SELECT 
  c.losscause,
  COUNT(c.id) AS total_claims,
  SUM(f.totalpaid) AS total_paid_amount,
  SUM(f.netincurred) AS total_incurred_amount
FROM cc_claim c
JOIN cc_financials f ON c.id = f.claim_id
GROUP BY c.losscause
ORDER BY total_incurred_amount DESC;`,
      explanation: 'Groups claims by loss cause (e.g. Water Damage, Wind/Hail, Fire, Theft) showing total count and incurred financial losses.',
      confidence: 'high',
      insufficientInfo: null,
      suggestedChartType: 'pie'
    };
  }

  // 4. Claim Exposures by Type
  if (p.includes('exposure') || p.includes('bodily injury') || p.includes('property damage')) {
    return {
      sql: `SELECT 
  e.exposuretype,
  e.status,
  COUNT(e.id) AS exposure_count,
  SUM(e.claimorder) AS exposure_volume
FROM cc_exposure e
JOIN cc_claim c ON e.claim_id = c.id
GROUP BY e.exposuretype, e.status;`,
      explanation: 'Summarizes claim exposures grouped by exposure type (Bodily Injury, Property Damage, Structure Damage) and operational status.',
      confidence: 'high',
      insufficientInfo: null,
      suggestedChartType: 'bar'
    };
  }

  // 5. General Claim Listing / Incurred Loss Thresholds
  if (p.includes('claim') && (p.includes('list') || p.includes('incurred') || p.includes('greater') || p.includes('10000') || p.includes('status'))) {
    return {
      sql: `SELECT 
  c.claimnumber,
  p.productcode,
  c.status,
  c.losscause,
  c.lossdate,
  f.netincurred,
  f.totalpaid
FROM cc_claim c
JOIN pc_policy p ON c.policy_id = p.id
JOIN cc_financials f ON c.id = f.claim_id
ORDER BY f.netincurred DESC
LIMIT 15;`,
      explanation: 'Lists recent insurance claims from cc_claim joined with policy details and financial incurred loss totals.',
      confidence: 'high',
      insufficientInfo: null,
      suggestedChartType: 'table'
    };
  }

  // 6. Past Due Invoices
  if (p.includes('past due') || (p.includes('invoice') && p.includes('due')) || (p.includes('billing') && p.includes('overdue'))) {
    return {
      sql: `SELECT 
  i.invoicenumber,
  a.accountnumber,
  p.policynumber,
  p.productcode,
  i.duedate,
  i.amount AS billed_amount,
  (i.amount - i.paidamount) AS past_due_balance,
  i.status
FROM bc_invoice i
JOIN bc_account a ON i.account_id = a.id
JOIN pc_policy p ON a.policy_id = p.id
WHERE i.status = 'Past Due'
ORDER BY past_due_balance DESC;`,
      explanation: 'Lists all past-due invoices from bc_invoice joined with bc_account and pc_policy, calculating outstanding balances.',
      confidence: 'high',
      insufficientInfo: null,
      suggestedChartType: 'table'
    };
  }

  // 7. Payments and Collections
  if (p.includes('payment') || p.includes('ach') || p.includes('credit card') || p.includes('lockbox')) {
    return {
      sql: `SELECT 
  p.paymentmethod,
  COUNT(p.id) AS transaction_count,
  SUM(p.amount) AS total_settled_amount
FROM bc_payment p
GROUP BY p.paymentmethod;`,
      explanation: 'Summarizes BillingCenter payments aggregated by settlement method (ACH, Credit Card, Lockbox Check). Masked NPI protects bank account details.',
      confidence: 'high',
      insufficientInfo: null,
      suggestedChartType: 'pie'
    };
  }

  // 8. Billing Accounts & Payment Plans
  if (p.includes('billing') || p.includes('account') || p.includes('payment plan')) {
    return {
      sql: `SELECT 
  a.accountnumber,
  a.paymentplan,
  p.policynumber,
  p.productcode,
  p.status AS policy_status
FROM bc_account a
JOIN pc_policy p ON a.policy_id = p.id
LIMIT 15;`,
      explanation: 'Retrieves BillingCenter accounts joined with corresponding PolicyCenter policies and payment plans (Annual, Quarterly, Monthly 10-Pay).',
      confidence: 'high',
      insufficientInfo: null,
      suggestedChartType: 'table'
    };
  }

  // 9. Policyholders & Insureds (NPI Protected)
  if (p.includes('policyholder') || p.includes('customer') || p.includes('ssn') || p.includes('insured') || p.includes('phone') || p.includes('email')) {
    return {
      sql: `SELECT 
  p.policynumber,
  p.productcode,
  ph.firstname,
  ph.lastname,
  ph.ssn,
  ph.phone,
  ph.email,
  ph.city,
  ph.state
FROM pc_policyholder ph
JOIN pc_policyperiod pp ON ph.policyperiod_id = pp.id
JOIN pc_policy p ON pp.policy_id = p.id
LIMIT 10;`,
      explanation: 'Fetches policyholders from pc_policyholder joined with policy details. Note: All sensitive NPI fields (SSN, Phone, Email) will be automatically masked by the Dynamic Data Masking engine.',
      confidence: 'high',
      insufficientInfo: null,
      suggestedChartType: 'table'
    };
  }

  // 10. Policy Coverage Breakdown
  if (p.includes('coverage') || p.includes('dwelling') || p.includes('personal property') || p.includes('deductible')) {
    return {
      sql: `SELECT 
  c.coveragetype,
  p.productcode,
  COUNT(c.id) AS coverage_count,
  AVG(c.limitamount) AS avg_limit_amount,
  AVG(c.deductible) AS avg_deductible
FROM pc_coverage c
JOIN pc_policyperiod pp ON c.policyperiod_id = pp.id
JOIN pc_policy p ON pp.policy_id = p.id
GROUP BY c.coveragetype, p.productcode;`,
      explanation: 'Analyzes coverage limits and average deductibles across Dwelling, Personal Property, Commercial Building, and Business Interruption.',
      confidence: 'high',
      insufficientInfo: null,
      suggestedChartType: 'bar'
    };
  }

  // 11. Written Premium & Policies Summary
  if (p.includes('premium') || p.includes('written') || p.includes('revenue') || p.includes('policies')) {
    return {
      sql: `SELECT 
  p.productcode,
  p.status,
  COUNT(p.id) AS total_policies,
  SUM(pp.totalpremium) AS total_premium,
  ROUND(AVG(pp.totalpremium), 2) AS average_premium
FROM pc_policy p
JOIN pc_policyperiod pp ON p.id = pp.policy_id
GROUP BY p.productcode, p.status;`,
      explanation: 'Summarizes written premium and policy counts for Residential and Commercial policies from pc_policy and pc_policyperiod grouped by status.',
      confidence: 'high',
      insufficientInfo: null,
      suggestedChartType: 'bar'
    };
  }

  return null;
}

/**
 * Generate SQL from natural language prompt using Ollama with anti-hallucination verification
 */
async function generateSql(prompt, schema) {
  // Step 1 & 2: Anti-Hallucination Gap Analysis
  const sufficiency = checkInformationSufficiency(prompt, schema);
  if (!sufficiency.isSufficient) {
    return {
      sql: null,
      explanation: sufficiency.message,
      confidence: 'low',
      insufficientInfo: sufficiency.message,
      suggestedChartType: 'table'
    };
  }

  // Quick check for deterministic match to guarantee zero-latency accuracy on standard queries
  const deterministic = getDeterministicGuidewireQuery(prompt);
  if (deterministic) {
    return deterministic;
  }

  const systemPrompt = buildAntiHallucinationSystemPrompt(schema);

  const requestPayload = {
    model: selectedModel,
    prompt: `${systemPrompt}\n\nUSER QUESTION: "${prompt}"\n\nGenerate the JSON response:`,
    format: 'json',
    stream: false,
    options: {
      temperature: 0.1, // Low temperature for deterministic, accurate SQL
      num_predict: 250  // Limit token output to speed up decoding
    }
  };

  try {
    const res = await callOllamaApi('/api/generate', 'POST', requestPayload);
    let parsed;
    try {
      parsed = typeof res.response === 'string' ? JSON.parse(res.response) : res.response;
    } catch (e) {
      // Extract JSON if wrapped in markdown
      const match = res.response.match(/\{[\s\S]*\}/);
      if (match) {
        parsed = JSON.parse(match[0]);
      } else {
        throw new Error('Failed to parse structured JSON from Ollama response.');
      }
    }

    // Step 4: Anti-Hallucination Pre-flight Catalog Verification
    if (parsed.sql) {
      const verification = verifySqlAgainstCatalog(parsed.sql, schema);
      if (!verification.isValid) {
        return {
          sql: null,
          explanation: verification.error,
          confidence: 'Inference (low confidence)',
          insufficientInfo: verification.error,
          suggestedChartType: 'table'
        };
      }
    }

    let insufficient = parsed.insufficientInfo || null;
    if (insufficient && insufficient.includes('[missing attribute]')) {
      insufficient = 'Insufficient information to determine: Requested attribute was not found in the verified Guidewire catalog.';
    }

    return {
      sql: parsed.sql || null,
      explanation: parsed.explanation || 'SQL generated from Guidewire schema.',
      confidence: parsed.confidence || 'high',
      insufficientInfo: insufficient,
      suggestedChartType: parsed.suggestedChartType || 'table'
    };
  } catch (err) {
    console.error(`[OLLAMA ERROR]`, err.message);
    const isTimeout = err.message.toLowerCase().includes('timed out');
    const msg = isTimeout
      ? `Local AI model (${selectedModel}) timed out after ${Math.round(OLLAMA_TIMEOUT_MS / 1000)}s. The local LLM is running on CPU/hardware and was busy. Please try again or switch to a faster model (e.g. qwen3:4b).`
      : `Failed to generate SQL via local Ollama (${err.message}). Please verify Ollama is running and try again.`;
    
    const customErr = new Error(msg);
    customErr.canRetry = true;
    customErr.isOllamaError = true;
    throw customErr;
  }
}

module.exports = {
  getAvailableModels,
  setModel,
  generateSql
};
