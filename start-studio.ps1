# Guidewire AI Query Studio Launch Script
Write-Host "==========================================================" -ForegroundColor Cyan
Write-Host "🛡️  Starting Guidewire AI Query Studio" -ForegroundColor Green
Write-Host "🔒  NPI / PII Dynamic Data Masking: Active" -ForegroundColor Green
Write-Host "🧠  Local Ollama Text-to-SQL: Active (127.0.0.1:11434)" -ForegroundColor Green
Write-Host "📊  Product Lines: Residential & Commercial" -ForegroundColor Green
Write-Host "==========================================================" -ForegroundColor Cyan

# 1. Check & Auto-Install Backend Dependencies
if (-not (Test-Path "$PSScriptRoot\server\node_modules")) {
    Write-Host "[Setup] Installing backend dependencies (first-time setup)..." -ForegroundColor Yellow
    Push-Location "$PSScriptRoot\server"
    npm install
    Pop-Location
}

# 2. Check & Auto-Install Frontend Dependencies
if (-not (Test-Path "$PSScriptRoot\client\node_modules")) {
    Write-Host "[Setup] Installing frontend dependencies (first-time setup)..." -ForegroundColor Yellow
    Push-Location "$PSScriptRoot\client"
    npm install
    Pop-Location
}

# 3. Start backend server
Write-Host "Starting Backend API on port 5000..." -ForegroundColor Yellow
Start-Process -NoNewWindow -FilePath "node" -ArgumentList "src/index.js" -WorkingDirectory "$PSScriptRoot\server"

Start-Sleep -Seconds 2

# 4. Start frontend dev server
Write-Host "Starting Frontend Vite Dev Server on port 3000..." -ForegroundColor Yellow
Start-Process "http://localhost:3000"
Set-Location "$PSScriptRoot\client"
npm run dev
