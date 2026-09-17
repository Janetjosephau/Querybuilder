# Guidewire AI Query Studio (PolicyCenter • BillingCenter • ClaimCenter)

An enterprise-grade, conversational query builder for PostgreSQL databases storing **Guidewire Insurance Suite** data. Features 100% offline, air-gapped local AI inference via **Ollama**, in-flight **Dynamic Data Masking (DDM)** to protect customer NPI/PII, and strict **Anti-Hallucination Guardrails**.

---

## 🚀 Quick Start

### 1. Prerequisites
* **Node.js** v18+ (verified on Node v24)
* **Ollama** running locally on `http://127.0.0.1:11434` with model `qwen2.5-coder:7b` (or `llama3`, `mistral`)

### 2. Launch the Application
Run the PowerShell launch script:
```powershell
.\start-studio.ps1
```
Or start manually:
```bash
# Terminal 1: Backend API (Port 5000)
cd server
npm start

# Terminal 2: Frontend Client (Port 3000)
cd client
npm run dev
```

Navigate to: `http://localhost:3000`

---

## 🛡️ Enterprise Security & Privacy Controls

### 1. 100% Air-Gapped / Zero Cloud Egress
* Runs solely on local **Ollama (`127.0.0.1:11434`)**.
* Zero prompts, database schemas, or customer records ever leave your workstation or enterprise network.

### 2. Zero-Data Prompt Isolation
* The LLM prompt receives **only structural metadata** (table definitions, column names, column data types, foreign keys).
* **Zero policyholder rows, claim records, or invoice values are ever sent to the AI.**

### 3. In-Flight Dynamic Data Masking (DDM)
All query results are automatically sanitized before delivery to the browser or export:
* **SSN / Tax ID**: `***-**-1234`
* **Bank / Credit Card Numbers**: `****-****-****-5678`
* **Email Addresses**: `j***@domain.com`
* **Phone Numbers**: `(***) ***-1234`
* **Date of Birth**: `****-**-**`

### 4. Strict Read-Only Guardrail
* AST parser rejects `DROP`, `DELETE`, `UPDATE`, `INSERT`, `ALTER`, `TRUNCATE`, `GRANT`, `REVOKE`.
* Live PostgreSQL connections execute within `SET TRANSACTION READ ONLY;` with a 10-second hard statement timeout.

### 5. Anti-Hallucination 4-Step Verification
Enforces `Anti-HalluconationRule - Querybuilder.md`:
* **Step 1 (Fact Extraction)**: Queries are grounded solely in verified catalog facts.
* **Step 2 (Gap Analysis)**: Prompts requesting missing attributes (e.g. credit score) immediately return:  
  `"Insufficient information to determine."` without hallucinating SQL.
* **Step 3 (Grounded Generation)**: Assumptions are labeled `"Inference (low confidence)"`.
* **Step 4 (Pre-Flight Catalog Check)**: SQL AST cross-references all tables against the live catalog before execution.

---

## 📊 Guidewire Data Model (Residential & Commercial)

The included preloaded demo database contains 11 relational tables:

| Suite | Table | Purpose |
| :--- | :--- | :--- |
| **PolicyCenter** | `pc_policy` | Residential & Commercial policies, terms, and status |
| **PolicyCenter** | `pc_policyperiod` | Premium amounts, effective dates, underwriting entities |
| **PolicyCenter** | `pc_coverage` | Dwelling, Personal Property, Commercial Building, Business Interruption |
| **PolicyCenter** | `pc_policyholder` | Customer records *(NPI Protected)* |
| **BillingCenter** | `bc_account` | Billing accounts, payment plans (Annual, Quarterly, Monthly 10-Pay) |
| **BillingCenter** | `bc_invoice` | Invoices, amounts, due dates, past-due statuses |
| **BillingCenter** | `bc_payment` | Payments, ACH / Card / Lockbox settlements *(NPI Protected)* |
| **ClaimCenter** | `cc_claim` | Claims across Residential & Commercial, loss causes |
| **ClaimCenter** | `cc_claimant` | Claimants and relationships *(NPI Protected)* |
| **ClaimCenter** | `cc_exposure` | Bodily Injury, Property Damage, Structure Damage |
| **ClaimCenter** | `cc_financials` | Incurred loss, open reserves, paid loss, recoveries |

---

## 🧪 Automated Testing

Run the test suite verifying safety, anti-hallucination rules, and masking:
```bash
cd server
npm test
```
*(9/9 deterministic tests covering positive, negative, boundary, edge, and anti-hallucination cases).*
