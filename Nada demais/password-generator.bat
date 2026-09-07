@echo off
setlocal EnableExtensions

title Local Password Generator

echo ===============================
echo      LOCAL PASSWORD GENERATOR
echo ===============================
echo.
echo Generates a password locally using PowerShell cryptographic randomness.
echo Nothing is sent over the network or saved to disk.
echo.

set /p "LENGTH=Password length [default 20]: "
if not defined LENGTH set "LENGTH=20"

powershell -NoProfile -Command "$raw=$env:LENGTH; if ($raw -notmatch '^\d{1,3}$') { exit 2 }; $len=[int]$raw; if ($len -lt 8 -or $len -gt 128) { exit 3 }; $chars='ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz23456789!@#$%%*-_=+'; $rng=[System.Security.Cryptography.RandomNumberGenerator]::Create(); try { $bytes=New-Object byte[] $len; $rng.GetBytes($bytes); -join ($bytes | ForEach-Object { $chars[$_ %% $chars.Length] }) } finally { $rng.Dispose() }"
if errorlevel 3 (
  echo Length must be between 8 and 128.
  exit /b 1
)
if errorlevel 2 (
  echo Invalid length. Use a whole number between 8 and 128.
  exit /b 1
)
if errorlevel 1 (
  echo Could not generate a password.
  exit /b 1
)

echo.
pause
endlocal
