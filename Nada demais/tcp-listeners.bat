@echo off
setlocal EnableExtensions

title TCP Listening Ports

echo =========================================
echo          TCP LISTENING PORTS
echo =========================================
echo.
echo Read-only utility. It does not change firewall, services, or network settings.
echo.

set "PORT=%~1"
if not defined PORT set /p "PORT=Port to filter (blank = all): "

powershell -NoProfile -Command "$raw=$env:PORT; if (-not (Get-Command Get-NetTCPConnection -ErrorAction SilentlyContinue)) { Write-Host 'Get-NetTCPConnection is not available on this Windows version.'; exit 3 }; if ($raw) { if ($raw -notmatch '^\d{1,5}$') { Write-Host 'Invalid port. Use a number from 1 to 65535.'; exit 2 }; $p=[int]$raw; if ($p -lt 1 -or $p -gt 65535) { Write-Host 'Invalid port. Use a number from 1 to 65535.'; exit 2 } }; $items=Get-NetTCPConnection -State Listen -ErrorAction SilentlyContinue; if ($raw) { $items=$items | Where-Object { $_.LocalPort -eq $p } }; $rows=@($items | Sort-Object LocalPort,LocalAddress | ForEach-Object { $proc=try { (Get-Process -Id $_.OwningProcess -ErrorAction Stop).ProcessName } catch { '<unavailable>' }; [pscustomobject]@{ Address=$_.LocalAddress; Port=$_.LocalPort; PID=$_.OwningProcess; Process=$proc } }); if ($rows.Count -eq 0) { if ($raw) { Write-Host ('No listening TCP entries found for port ' + $raw + '.') } else { Write-Host 'No listening TCP entries found.' }; exit 0 }; $rows | Format-Table -AutoSize"

if errorlevel 3 (
  echo.
  echo This utility needs a Windows version with Get-NetTCPConnection.
  exit /b 1
)
if errorlevel 2 exit /b 1
if errorlevel 1 (
  echo Could not read TCP listeners.
  exit /b 1
)

echo.
pause
endlocal
