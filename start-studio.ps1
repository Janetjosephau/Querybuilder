# Guidewire AI Query Studio Launch Script
Write-Host "==========================================================" -ForegroundColor Cyan
Write-Host "🛡️  Starting Guidewire AI Query Studio" -ForegroundColor Green
Write-Host "🔒  NPI / PII Dynamic Data Masking: Active" -ForegroundColor Green
Write-Host "🧠  Local Ollama Text-to-SQL: Active (127.0.0.1:11434)" -ForegroundColor Green
Write-Host "📊  Product Lines: Residential & Commercial" -ForegroundColor Green
Write-Host "==========================================================" -ForegroundColor Cyan

# 1. Start backend server
Write-Host "Starting Backend API on port 5000..." -ForegroundColor Yellow
Start-Process -NoNewWindow -FilePath "node" -ArgumentList "src/index.js" -WorkingDirectory "$PSScriptRoot\server"

Start-Sleep -Seconds 2

# 2. Start frontend dev server
Write-Host "Starting Frontend Vite Dev Server on port 3000..." -ForegroundColor Yellow
Start-Process "http://localhost:3000"
Set-Location "$PSScriptRoot\client"
npm run dev
