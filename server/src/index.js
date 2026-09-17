/**
 * Server Entry Point
 * Guidewire Insurance AI Query Studio Backend
 */

require('dotenv').config();
const express = require('express');
const cors = require('cors');
const routes = require('./routes');

const app = express();
const PORT = process.env.PORT || 5000;

// Middleware
app.use(cors());
app.use(express.json());

// Routes
app.use('/api', routes);

// Global Error Handler
app.use((err, req, res, next) => {
  console.error('[SERVER ERROR]', err);
  res.status(500).json({
    success: false,
    error: 'Internal Server Error',
    message: err.message
  });
});

app.listen(PORT, () => {
  console.log(`====================================================`);
  console.log(`🛡️  Guidewire AI Query Studio Server running on port ${PORT}`);
  console.log(`🔒  NPI / PII Dynamic Data Masking: ACTIVE`);
  console.log(`🧠  Local Ollama Endpoint: http://127.0.0.1:11434`);
  console.log(`📊  Ready for queries on Residential & Commercial lines`);
  console.log(`====================================================`);
});
