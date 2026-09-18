/**
 * Dynamic Data Masking (DDM) Engine
 * Protects Non-Public Personal Information (NPI / PII) in compliance with GLBA & HIPAA.
 */

// Regex patterns for sensitive field values
const SSN_REGEX = /^\d{3}-?\d{2}-?\d{4}$/;
const EMAIL_REGEX = /^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$/;
const PHONE_REGEX = /^\+?1?[-.\s]?\(?\d{3}\)?[-.\s]?\d{3}[-.\s]?\d{4}$/;
const CREDIT_CARD_REGEX = /^\d{4}[-\s]?\d{4}[-\s]?\d{4}[-\s]?\d{4}$/;

// Known NPI column identifiers (case-insensitive substring match)
const NPI_COLUMN_RULES = [
  { match: /ssn|social_security|tax_id|taxid|fein/i, type: 'SSN' },
  { match: /bank_account|account_num|routing|card_num|credit_card/i, type: 'FINANCIAL' },
  { match: /email/i, type: 'EMAIL' },
  { match: /phone|mobile|fax/i, type: 'PHONE' },
  { match: /dob|birth_date|date_of_birth|dateofbirth/i, type: 'DOB' },
  { match: /claimant_name/i, type: 'CLAIMANT' },
  { match: /street_address|home_address/i, type: 'ADDRESS' }
];

/**
 * Mask a single value based on classified type
 */
function maskValue(val, type) {
  if (val === null || val === undefined) return val;
  const str = String(val).trim();
  if (!str) return str;

  switch (type) {
    case 'SSN': {
      // Return ***-**-1234
      const digits = str.replace(/\D/g, '');
      const last4 = digits.length >= 4 ? digits.slice(-4) : '9999';
      return `***-**-${last4}`;
    }
    case 'FINANCIAL': {
      // Return ****-****-****-5678
      const digits = str.replace(/\D/g, '');
      const last4 = digits.length >= 4 ? digits.slice(-4) : '0000';
      return `****-****-****-${last4}`;
    }
    case 'EMAIL': {
      // Return j***@domain.com
      const parts = str.split('@');
      if (parts.length === 2) {
        const name = parts[0];
        const first = name.length > 0 ? name[0] : 'u';
        return `${first}***@${parts[1]}`;
      }
      return '***@masked.com';
    }
    case 'PHONE': {
      // Return (***) ***-1234
      const digits = str.replace(/\D/g, '');
      const last4 = digits.length >= 4 ? digits.slice(-4) : '0000';
      return `(***) ***-${last4}`;
    }
    case 'DOB': {
      // Redact day/month, preserve year or full mask
      if (str.length >= 4) {
        const year = str.slice(0, 4);
        return `${year}-**-**`;
      }
      return '****-**-**';
    }
    case 'ADDRESS': {
      // Return *** Main St, City
      const words = str.split(' ');
      if (words.length > 1) {
        return `*** ${words.slice(1).join(' ')}`;
      }
      return '*** [MASKED ADDRESS]';
    }
    case 'CLAIMANT': {
      // Return First L***
      const names = str.split(' ');
      if (names.length > 1) {
        return `${names[0]} ${names[1][0]}***`;
      }
      return `${str[0]}*** [RESTRICTED]`;
    }
    default:
      return str;
  }
}

/**
 * Inspects a column name to determine if it is an NPI field
 */
function classifyColumn(colName) {
  for (const rule of NPI_COLUMN_RULES) {
    if (rule.match.test(colName)) {
      return rule.type;
    }
  }
  return null;
}

/**
 * Apply Dynamic Data Masking to a list of row objects
 * @param {Array<Object>} rows - Array of database result rows
 * @returns {{ maskedRows: Array<Object>, maskedCount: number, maskedFields: Array<string> }}
 */
function applyDataMasking(rows) {
  if (!Array.isArray(rows) || rows.length === 0) {
    return { maskedRows: [], maskedCount: 0, maskedFields: [] };
  }

  const columns = Object.keys(rows[0] || {});
  const columnClassifications = {};
  const maskedFieldsSet = new Set();

  // Classify by column name first
  for (const col of columns) {
    const detectedType = classifyColumn(col);
    if (detectedType) {
      columnClassifications[col] = detectedType;
      maskedFieldsSet.add(col);
    }
  }

  let totalMaskedCells = 0;

  const maskedRows = rows.map(row => {
    const newRow = { ...row };
    for (const col of columns) {
      const val = row[col];
      if (val === null || val === undefined) continue;

      let type = columnClassifications[col];

      // If not classified by column name, test cell value regex
      if (!type && typeof val === 'string') {
        if (SSN_REGEX.test(val)) {
          type = 'SSN';
          maskedFieldsSet.add(col);
        } else if (EMAIL_REGEX.test(val)) {
          type = 'EMAIL';
          maskedFieldsSet.add(col);
        } else if (PHONE_REGEX.test(val)) {
          type = 'PHONE';
          maskedFieldsSet.add(col);
        } else if (CREDIT_CARD_REGEX.test(val)) {
          type = 'FINANCIAL';
          maskedFieldsSet.add(col);
        }
      }

      if (type) {
        newRow[col] = maskValue(val, type);
        totalMaskedCells++;
      }
    }
    return newRow;
  });

  return {
    maskedRows,
    maskedCount: totalMaskedCells,
    maskedFields: Array.from(maskedFieldsSet)
  };
}

module.exports = {
  applyDataMasking,
  classifyColumn,
  maskValue
};
