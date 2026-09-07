@echo off
setlocal

title File Hash Checker

echo =========================
echo       FILE HASH CHECKER
echo =========================
echo.
set /p "TARGET=File path: "

if not defined TARGET (
  echo No path provided.
  exit /b 1
)
if not exist "%TARGET%" (
  echo File not found.
  exit /b 1
)

powershell -NoProfile -Command "Get-FileHash -LiteralPath $env:TARGET -Algorithm SHA256 | Format-List Algorithm,Hash,Path" 2>nul
if errorlevel 1 (
  echo Could not calculate the hash.
  exit /b 1
)

echo.
pause
endlocal
