# Project Proposal: Guidewire AI Query Studio (Executive Brief)

**To:** Engineering Manager & Chief Information Security Officer (CISO)  
**Project:** Natural Language Query Builder for Guidewire (PolicyCenter, BillingCenter, ClaimCenter)  
**Status:** Request for POC Approval  

---

## 1. The Goal
Enable business users, underwriters, and claim teams to ask questions in plain English (e.g., *"What is our loss ratio for Residential vs Commercial?"*, *"Show top 10 open Commercial claims with reserves over $50,000"*, or *"List past-due Residential invoices"*) and get immediate answers and charts from PostgreSQL without waiting for DBA tickets.

---

## 2. Top 4 Security & Privacy Guarantees

```
┌────────────────────────────────────────────────────────────────────────┐
│                        100% LOCAL & AIR-GAPPED                         │
│   • Runs on Local Ollama (127.0.0.1)                                   │
│   • ZERO data sent to OpenAI, Google, or any external cloud             │
└────────────────────────────────────────────────────────────────────────┘
```

1. **Zero Customer Data Sent to AI:**
   * The AI model **only sees table and column names** (e.g. `policynumber`, `lossdate`).
   * **Zero policyholder rows, claim notes, or payment records** are ever sent to the AI.
2. **Automatic NPI / PII Masking (GLBA & HIPAA Compliant):**
   * Any sensitive customer data returned by queries is automatically masked before display:
     * **SSN / Tax ID:** `***-**-1234`
     * **Bank / Credit Card:** `****-****-****-5678`
     * **Email:** `j***@domain.com`
     * **Phone:** `(***) ***-1234`
     * **DOB:** `****-**-**`
3. **Strict Read-Only Protection:**
   * System only executes `SELECT` queries.
   * `DROP`, `DELETE`, `UPDATE`, and `INSERT` commands are blocked by both software rules and PostgreSQL read-only database transactions.
4. **Anti-Hallucination Guardrails:**
   * The AI is strictly forbidden from guessing non-existent tables or columns.
   * If a user asks for data not in the database, the system cleanly replies:  
     `"Insufficient information to determine."`

---

## 3. Proof of Concept (POC) Plan — Zero Risk
* **Test Database:** We will use a **100% synthetic Guidewire demo database** (fake policyholders, fake claims, fake invoices).
* **No Real Customer Data Used for POC:** We only validate the AI accuracy and NPI masking rules with fake data first.
* **Review Gate:** Management and InfoSec can test the working tool and inspect audit logs before connecting to any real internal database.

---

## 4. Approval & Sign-Off

| Role | Name | Decision | Date |
| :--- | :--- | :--- | :--- |
| **Manager** | ____________________ | [ ] Approved [ ] Denied | ____________ |
| **Security Officer** | ____________________ | [ ] Approved [ ] Denied | ____________ |

---
*Questions? POC demo available on local workstation with synthetic data.*
