# Guidewire AI Query Studio: Layman's System & Architecture Guide

This document explains in simple, plain English how this web application works, what programming languages and tools it uses, where its database lives, and how logging and security are handled.

---

## 1. The Big Picture: How Does the System Work?

Think of the application like a **high-security restaurant**:

```
+-------------------------------------------------------------------------+
|                                                                         |
|   1. YOU (The Customer)                                                 |
|      "Give me the top 10 policyholders"                                 |
|               |                                                         |
|               v                                                         |
|   2. FRONTEND (The Menu & Table - React UI in Browser)                  |
|      Takes your question and sends it to the kitchen                    |
|               |                                                         |
|               v                                                         |
|   3. BACKEND (The Waiter - Node.js Express Server)                      |
|      Coordinates the request and enforces safety rules                  |
|               |                                                         |
|               v                                                         |
|   4. LOCAL AI (The Master Chef - Ollama / Qwen Model)                   |
|      Translates English into database language (SQL)                    |
|               |                                                         |
|               v                                                         |
|   5. SAFETY GUARD (The Quality Inspector)                               |
|      Blocks dangerous commands (DROP, DELETE, UPDATE)                   |
|               |                                                         |
|               v                                                         |
|   6. DATABASE (The Pantry / Storage)                                    |
|      Fetches the raw policyholder records                               |
|               |                                                         |
|               v                                                         |
|   7. DATA MASKING SHIELD (The Privacy Filter)                           |
|      Replaces SSNs and phone numbers with '***-**-1234'                 |
|               |                                                         |
|               v                                                         |
|   8. AUDIT LOG (The Register Receipt)                                   |
|      Permanently notes who asked what, what SQL ran, and what was masked|
|               |                                                         |
|               v                                                         |
|   9. BACK TO YOU                                                        |
|      Displays clean SQL preview and masked, interactive data table      |
|                                                                         |
+-------------------------------------------------------------------------+
```

---

## 2. Technologies & Programming Languages

| Layer | Language / Tool | What It Does |
| :--- | :--- | :--- |
| **Frontend (User Interface)** | **JavaScript (React 18)** | Creates interactive buttons, forms, tables, and live updates in the browser. |
| **Styling** | **Tailwind CSS** | Styles the layout with a modern, high-contrast white theme and responsive design. |
| **Frontend Build Tool** | **Vite** | Packages the frontend and runs the local web server at `http://localhost:3000`. |
| **Backend (API Server)** | **JavaScript (Node.js + Express)** | The central engine that receives queries, speaks to the AI, queries the database, and masks data (`http://localhost:5000`). |
| **Local AI Engine** | **Ollama (`qwen2.5-coder:7b`)** | A private, 100% offline AI running on your machine at `http://localhost:11434`. No data ever leaves your computer. |
| **Database Query Language** | **SQL (PostgreSQL dialect)** | The standard language used to ask databases for information. |

---

## 3. Where is the Database Located?

The application supports **two database modes**:

### Mode A: Demo Database (Default)
* **Where it lives**: Directly in your computer's **RAM memory** (powered by an in-memory SQL engine called `AlaSQL`).
* **Source file**: `d:\QueryBuilder\server\src\guidewireSeed.js`
* **Contents**: 11 realistic Guidewire tables across 3 core insurance suites:
  * **PolicyCenter (`pc_*`)**: `pc_policy`, `pc_policyperiod`, `pc_coverage`, `pc_policyholder`
  * **BillingCenter (`bc_*`)**: `bc_account`, `bc_invoice`, `bc_payment`
  * **ClaimCenter (`cc_*`)**: `cc_claim`, `cc_claimant`, `cc_exposure`, `cc_financials`
* **Benefit**: Zero installation required; it is ready to run immediately and resets to pristine state on startup.

### Mode B: Live PostgreSQL Connection
* **Where it lives**: An external, live PostgreSQL database server running either locally (`localhost:5432`) or on an enterprise network.
* **How to connect**: Click **"Connect DB"** in the top-right header, select **Live PostgreSQL**, and enter your server credentials.
* **Security**: All live queries are strictly read-only and enforce a 10-second statement timeout to protect production databases.

---

## 4. How Do Logs Work & Where Are They Stored?

Compliance, security, and traceability are built into every single query.

### 1. The Audit Log File
* **File Location**: `d:\QueryBuilder\server\audit_log.jsonl`
* **Format**: **JSONL (JSON Lines)** — every query adds one immutable, timestamped record on a new line.

### 2. What Gets Recorded in Every Log Entry?
Each time a query is run, the backend records:
```json
{
  "timestamp": "2026-09-16T22:20:06.123Z",
  "session": "local-session",
  "prompt": "give top 10 from pc policy holder table",
  "sql": "SELECT p.policynumber, ph.firstname, ph.ssn... FROM pc_policyholder ph...",
  "mode": "demo",
  "tablesAccessed": ["pc_policyholder", "pc_policyperiod", "pc_policy"],
  "maskedCount": 21,
  "maskedFields": ["ssn", "phone", "email"],
  "rowCount": 7,
  "executionTimeMs": 9,
  "status": "SUCCESS",
  "error": null
}
```

### 3. How to View the Logs
* **In the UI**: Click the **"Audit Log"** button in the top-right navigation bar to view an interactive, searchable compliance modal.
* **On Disk**: Open `d:\QueryBuilder\server\audit_log.jsonl` with VS Code, Notepad, or any text editor.

---

## 5. Security & Guardrails (How You Are Protected)

1. **Air-Gapped Local AI**:
   * Uses local Ollama inference. Prompts, schemas, and policy records **never leave your local machine or network**.
2. **Anti-Hallucination Engine**:
   * Inspects user prompts against the actual database schema. If someone asks for non-existent columns (like "credit score" or "Instagram handle"), the query is safely halted before generating SQL.
3. **Read-Only AST Parser**:
   * Every SQL query is parsed into an Abstract Syntax Tree (AST). It mathematically guarantees that only `SELECT` operations run. Commands like `DROP`, `DELETE`, `UPDATE`, `INSERT`, or multi-statement injections (`;`) are rejected with an error.
4. **Dynamic Data Masking (DDM)**:
   * Real-time redaction rules automatically replace Non-Public Personal Information (NPI):
     * **Social Security Numbers**: `458-22-9182` ➔ `***-**-9182`
     * **Phone Numbers**: `512-555-0149` ➔ `(***) ***-0149`
     * **Email Addresses**: `mvance@example.com` ➔ `m***@example.com`

---

## 6. Summary of Project Files

```
d:\QueryBuilder\
│
├── client\                  # FRONTEND APPLICATION (React + Vite)
│   ├── src\
│   │   ├── App.jsx          # Main page layout & coordination
│   │   ├── components\
│   │   │   ├── ChatBox.jsx      # 'Describe your data request' prompt box
│   │   │   ├── SqlPreview.jsx   # 'Generated PostgreSQL Query' white viewer
│   │   │   ├── DataGrid.jsx     # Result table with pagination & CSV export
│   │   │   ├── SchemaSidebar.jsx# Left-hand table & column explorer
│   │   │   ├── Header.jsx       # Top navigation & system status
│   │   │   ├── AuditModal.jsx   # Live compliance log viewer
│   │   │   └── ConnectionModal.jsx # Live PostgreSQL connection dialog
│   │   └── index.css        # Tailwind design system & styling
│   └── package.json         # Frontend dependencies
│
└── server\                  # BACKEND SERVER (Node.js + Express)
    ├── audit_log.jsonl      # PERMANENT COMPLIANCE AUDIT LOG
    ├── src\
    │   ├── index.js         # Starts backend server on port 5000
    │   ├── routes.js        # API endpoints (/api/chat, /api/execute, etc.)
    │   ├── ollama.js        # AI Text-to-SQL engine + deterministic logic
    │   ├── antiHallucination.js # Schema validation & guardrail rules
    │   ├── safety.js        # Read-only SQL validator (AST parser)
    │   ├── masking.js       # Dynamic Data Masking (DDM) for PII/NPI
    │   ├── db.js            # Database manager (Demo AlaSQL + PostgreSQL)
    │   └── guidewireSeed.js # Seed data for the 11 Guidewire tables
    └── package.json         # Backend dependencies
```
