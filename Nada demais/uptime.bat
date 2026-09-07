@echo off
setlocal

title System Uptime

echo =========================
echo        SYSTEM UPTIME
echo =========================
echo.

powershell -NoProfile -Command "$boot=(Get-CimInstance Win32_OperatingSystem).LastBootUpTime; $up=(Get-Date)-$boot; Write-Host ('Last boot : ' + $boot.ToString('yyyy-MM-dd HH:mm:ss')); Write-Host ('Uptime    : {0}d {1}h {2}m {3}s' -f $up.Days,$up.Hours,$up.Minutes,$up.Seconds)"
if errorlevel 1 (
  echo Could not read system uptime.
  exit /b 1
)

echo.
pause
endlocal
