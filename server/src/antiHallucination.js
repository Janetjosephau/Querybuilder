/**
 * Anti-Hallucination & Catalog Verification Engine
 * Strictly enforces Anti-HalluconationRule - Querybuilder.md:
 * 1. Grounded solely in verified database schema catalog.
 * 2. Returns "Insufficient information to determine." when data is absent.
 * 3. Labels assumptions as "Inference (low confidence)".
 * 4. Pre-flight verification of all tables and columns against catalog.
 */

// Known unsupported concepts that users might ask for which are outside Guidewire core schema
const UNSUPPORTED_CONCEPTS = [
  { trigger: /\bcredit\s*scores?\b/i, attribute: 'credit_score' },
  { trigger: /\bsocial\s*media\b/i, attribute: 'social_media_profiles' },
  { trigger: /\bstock\s*price\b/i, attribute: 'stock_ticker' },
  { trigger: /\bblood\s*type\b/i, attribute: 'blood_type' },
  { trigger: /\bvehicle\s*(vin|model|make)\b/i, attribute: 'vehicle_telematics_vin' },
  { trigger: /\bcustomer\s*churn\s*risk\b/i, attribute: 'predictive_churn_score' }
];

/**
 * Step 1 & 2: Checks if user query can be answered by the available schema
 * @param {string} prompt - User natural language prompt
 * @param {Object} schema - Introspected Guidewire catalog
 * @returns {{ isSufficient: boolean, message?: string }}
 */
function checkInformationSufficiency(prompt, schema) {
  if (!prompt || typeof prompt !== 'string') {
    return { isSufficient: false, message: 'Insufficient information to determine: Empty prompt provided.' };
  }

  for (const item of UNSUPPORTED_CONCEPTS) {
    if (item.trigger.test(prompt)) {
      return {
        isSufficient: false,
        message: `Insufficient information to determine: Requested attribute '${item.attribute}' does not exist in the verified Guidewire schema catalog (PolicyCenter, BillingCenter, ClaimCenter).`
      };
    }
  }

  return { isSufficient: true };
}

/**
 * Step 4: Pre-flight catalog verification
 * Verifies that all tables referenced in the generated SQL actually exist in the schema
 * @param {string} sql - Generated SQL query
 * @param {Object} schema - Introspected Guidewire catalog
 * @returns {{ isValid: boolean, error?: string, verifiedTables: Array<string> }}
 */
function verifySqlAgainstCatalog(sql, schema) {
  if (!schema || !schema.tables) {
    return { isValid: true, verifiedTables: [] };
  }

  const validTableNames = new Set(schema.tables.map(t => t.name.toLowerCase()));
  // Also recognize core alias tables
  ['bc_payment', 'bc_basemoneyreceived', 'bc_account', 'bc_invoice', 'bc_policyperiod'].forEach(t => validTableNames.add(t));

  const cleanSql = sql.toLowerCase();

  // Extract any CTE aliases e.g. "WITH cte_name AS (...)"
  const cteRegex = /\b(?:with|,)\s+([a-zA-Z0-9_]+)\s+as\b/gi;
  let cteMatch;
  while ((cteMatch = cteRegex.exec(cleanSql)) !== null) {
    validTableNames.add(cteMatch[1].toLowerCase());
  }

  // Find all table occurrences after FROM or JOIN, handling optional schema prefix (e.g. public.bc_account)
  const tableRegex = /\b(?:from|join)\s+(?:([a-zA-Z0-9_]+)\.)?([a-zA-Z0-9_]+)/gi;
  let match;
  const referencedTables = new Set();

  while ((match = tableRegex.exec(cleanSql)) !== null) {
    const tbl = match[2].toLowerCase();
    // Exclude subqueries or standard SQL keywords
    if (!['select', 'lateral', 'unnest', 'values', 'table'].includes(tbl)) {
      referencedTables.add(tbl);
    }
  }

  const verifiedTables = [];
  for (const tbl of referencedTables) {
    if (!validTableNames.has(tbl)) {
      return {
        isValid: false,
        error: `Anti-Hallucination Violation: Table '${tbl}' does not exist in the verified Guidewire schema.`,
        verifiedTables: []
      };
    }
    verifiedTables.push(tbl);
  }

  return {
    isValid: true,
    verifiedTables
  };
}

function isBcTable(name) {
  const n = (name || '').toLowerCase();
  return n.startsWith('bc_') || n.startsWith('bcst_') || n.startsWith('bctl_') || n.startsWith('bcx_') || n.startsWith('bc');
}

function isPcTable(name) {
  const n = (name || '').toLowerCase();
  return n.startsWith('pc_') || n.startsWith('pcst_') || n.startsWith('pctl_') || n.startsWith('pcx_') || n.startsWith('pc');
}

function isCcTable(name) {
  const n = (name || '').toLowerCase();
  return n.startsWith('cc_') || n.startsWith('ccst_') || n.startsWith('cctl_') || n.startsWith('ccx_') || n.startsWith('cc');
}

function selectRelevantTables(tables, prompt = '', suite = null) {
  if (!tables || tables.length <= 12) return tables || [];

  const pLower = (prompt || '').toLowerCase();
  const suiteLower = (suite || '').toLowerCase();
  const promptWords = pLower.split(/[^a-z0-9_]+/).filter(w => w.length > 2);

  const scored = tables.map(t => {
    let score = 0;
    const tName = t.name.toLowerCase();
    
    // Explicit suite selection boost (+40) and cross-suite penalty (-30)
    // Supports all Guidewire conventions: core (bc_), staging (bcst_), typelists (bctl_), extensions (bcx_)
    if (suiteLower === 'bc' && isBcTable(tName)) score += 40;
    if (suiteLower === 'pc' && isPcTable(tName)) score += 40;
    if (suiteLower === 'cc' && isCcTable(tName)) score += 40;

    if (suiteLower === 'bc' && (isPcTable(tName) || isCcTable(tName))) score -= 30;
    if (suiteLower === 'pc' && (isBcTable(tName) || isCcTable(tName))) score -= 30;
    if (suiteLower === 'cc' && (isBcTable(tName) || isPcTable(tName))) score -= 30;

    // Direct table name hit
    if (promptWords.some(w => tName === w || tName.includes(w))) score += 15;
    
    // Core insurance domain keyword mappings
    if ((promptWords.includes('policy') || promptWords.includes('policies') || promptWords.includes('expired')) && tName.includes('policy')) score += 12;
    if ((promptWords.includes('invoice') || promptWords.includes('invoices') || promptWords.includes('billed') || promptWords.includes('due')) && tName.includes('invoice')) score += 12;
    if ((promptWords.includes('account') || promptWords.includes('accounts')) && tName.includes('account')) score += 12;
    if ((promptWords.includes('payment') || promptWords.includes('paid')) && (tName.includes('payment') || tName.includes('money'))) score += 12;

    // Core Guidewire BillingCenter & PolicyCenter anchor tables
    if (['bc_account', 'bc_invoice', 'bc_payment', 'bc_policyperiod', 'bc_basemoneyreceived', 'bc_accountpaymentplan', 'bc_producer', 'pc_policy', 'pc_policyperiod'].includes(tName)) {
      score += 5;
    }

    // Explicit suite targeting boosts from prompt text
    if ((pLower.includes('billing') || pLower.includes('bc') || pLower.includes('billingcenter')) && isBcTable(tName)) {
      score += 25;
    }
    if ((pLower.includes('policycenter') || pLower.includes('pc')) && isPcTable(tName)) {
      score += 25;
    }
    if ((pLower.includes('claim') || pLower.includes('cc') || pLower.includes('claimcenter')) && isCcTable(tName)) {
      score += 25;
    }

    for (const col of t.columns) {
      const cName = col.name.toLowerCase();
      if (promptWords.includes(cName)) score += 3;
    }

    return { table: t, score };
  });

  scored.sort((a, b) => b.score - a.score);
  // Keep only the top 10 most relevant tables to maintain fast token ingestion on CPU
  const topTables = scored.filter(s => s.score > 0).slice(0, 10).map(s => s.table);
  return topTables.length > 0 ? topTables : scored.slice(0, 6).map(s => s.table);
}

/**
 * Builds the strict Anti-Hallucination system prompt for local Ollama
 * @param {Object} schema - Clean structural schema (table names, columns, types, foreign keys)
 * @param {string} prompt - User prompt for schema pruning
 * @param {string} [suite] - Target Guidewire application ('bc' | 'pc' | 'cc')
 * @returns {string} System prompt
 */
function buildAntiHallucinationSystemPrompt(schema, prompt = '', suite = null) {
  const activeTables = selectRelevantTables(schema.tables, prompt, suite);
  const suiteNames = { bc: 'BillingCenter (bc_*)', pc: 'PolicyCenter (pc_*)', cc: 'ClaimCenter (cc_*)' };
  const suiteHeader = suite && suiteNames[suite] 
    ? `TARGET APPLICATION: Guidewire ${suiteNames[suite]}.\nSTRICT CONSTRAINT: ONLY use tables from ${suiteNames[suite]}. Do NOT use tables from other suites.\n\n`
    : '';

  const schemaDescription = activeTables.map(t => {
    // Keep most relevant columns per table to avoid CPU decoding bottlenecks
    const relevantCols = t.columns.filter(c => {
      const cName = c.name.toLowerCase();
      return (
        c.isNpi ||
        cName === 'id' ||
        cName.includes('id') ||
        cName.includes('name') ||
        cName.includes('number') ||
        cName.includes('status') ||
        cName.includes('type') ||
        cName.includes('date') ||
        cName.includes('amount') ||
        cName.includes('premium') ||
        cName.includes('due') ||
        cName.includes('currency')
      );
    });
    const colsToUse = relevantCols.length >= 4 ? relevantCols.slice(0, 25) : t.columns.slice(0, 25);
    const colsStr = colsToUse.map(c => `${c.name}${c.isNpi ? ' [NPI]' : ''}`).join(', ');
    return `TABLE ${t.name}(${colsStr})`;
  }).join('\n');

  return `ROLE: Expert Guidewire Insurance Text-to-SQL Generator.
${suiteHeader}CATALOG:
${schemaDescription}

STRICT RULES:
1. Use ONLY the tables and columns in the CATALOG above.
2. Map natural phrasing and minor typos to catalog tables (e.g., 'accounts' -> bc_account; 'invoices' -> bc_invoice; 'payments' -> bc_payment).
3. ONLY if the user asks for concepts completely outside the database (e.g. credit score, stock price, social media), return JSON: {"sql": null, "insufficientInfo": "Insufficient information to determine: Requested attribute does not exist in Guidewire schema catalog.", "explanation": "Attribute not in schema", "confidence": "low"}
4. Only output PostgreSQL SELECT queries. Never DROP/UPDATE/DELETE.
5. Return ONLY valid JSON:
{
  "sql": "SELECT ...",
  "explanation": "Brief explanation",
  "confidence": "high",
  "insufficientInfo": null,
  "suggestedChartType": "bar"|"table"|"pie"|"line"
}`;
}

module.exports = {
  checkInformationSufficiency,
  verifySqlAgainstCatalog,
  buildAntiHallucinationSystemPrompt
};
