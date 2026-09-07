@echo off
setlocal EnableExtensions EnableDelayedExpansion

title Local Password Generator

echo ===============================
echo      LOCAL PASSWORD GENERATOR
echo ===============================
echo.
echo Generates a password locally using PowerShell cryptographic randomness.
echo Nothing is sent over the network or saved to disk.
echo.

set /p LENGTH=Password length [default 20]: 
if not defined LENGTH set "LENGTH=20"

for /f "delims=0123456789" %%A in ("%LENGTH%") do (
  echo Invalid length. Use a whole number between 8 and 128.
  exit /b 1
)
if %LENGTH% LSS 8 (
  echo Length must be at least 8.
  exit /b 1
)
if %LENGTH% GTR 128 (
  echo Length must be at most 128.
  exit /b 1
)

powershell -NoProfile -Command "$chars='ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz23456789!@#$%%*-_=+'; $rng=[System.Security.Cryptography.RandomNumberGenerator]::Create(); $bytes=New-Object byte[] %LENGTH%; $rng.GetBytes($bytes); -join ($bytes ^| ForEach-Object { $chars[$_ %% $chars.Length] })"

echo.
pause
endlocal
