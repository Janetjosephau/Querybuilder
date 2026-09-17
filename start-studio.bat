@echo off
title Guidewire AI Query Studio Launcher
echo ==========================================================
echo   Starting Guidewire AI Query Studio
echo   NPI / PII Dynamic Data Masking: Active
echo   Local Ollama Text-to-SQL: Active (127.0.0.1:11434)
echo ==========================================================

echo Starting Backend Server on port 5000...
start "Guidewire Studio - Backend (Port 5000)" cmd /k "cd /d %~dp0server && npm start"

timeout /t 2 /nobreak >nul

echo Starting Frontend Server on port 3000...
start "Guidewire Studio - Frontend (Port 3000)" cmd /k "cd /d %~dp0client && npm run dev"

timeout /t 3 /nobreak >nul

echo Opening browser at http://localhost:3000...
start http://localhost:3000

echo Studio launched successfully!
