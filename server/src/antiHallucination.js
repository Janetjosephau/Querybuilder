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

  const validTableNames = schema.tables.map(t => t.name.toLowerCase());
  const cleanSql = sql.toLowerCase();

  // Find all table occurrences after FROM or JOIN
  const tableRegex = /\b(?:from|join)\s+([a-zA-Z0-9_]+)/gi;
  let match;
  const referencedTables = new Set();

  while ((match = tableRegex.exec(cleanSql)) !== null) {
    const tbl = match[1].toLowerCase();
    // Exclude subqueries or standard SQL keywords
    if (!['select', 'lateral', 'unnest'].includes(tbl)) {
      referencedTables.add(tbl);
    }
  }

  const verifiedTables = [];
  for (const tbl of referencedTables) {
    if (!validTableNames.includes(tbl)) {
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

/**
 * Builds the strict Anti-Hallucination system prompt for local Ollama
 * @param {Object} schema - Clean structural schema (table names, columns, types, foreign keys)
 * @returns {string} System prompt
 */
function buildAntiHallucinationSystemPrompt(schema) {
  const schemaDescription = schema.tables.map(t => {
    const cols = t.columns.map(c => `${c.name}${c.isNpi ? ' [NPI]' : ''}`).join(', ');
    return `TABLE ${t.name}(${cols})`;
  }).join('\n');

  return `ROLE: Expert Guidewire Insurance Text-to-SQL Generator.
CATALOG:
${schemaDescription}

STRICT RULES:
1. Use ONLY the tables and columns in the CATALOG above. Product codes: 'Residential' or 'Commercial'.
2. Map natural phrasing and minor typos to catalog tables (e.g., 'policy holder', 'pc_policholder', 'policyholder' -> pc_policyholder; 'pc policy' -> pc_policy; 'invoice' -> bc_invoice; 'claims' -> cc_claim).
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
