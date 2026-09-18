@echo off
setlocal

title Network Info

echo =========================
echo        NETWORK INFO
echo =========================
echo.
echo Computer: %COMPUTERNAME%
echo.

powershell -NoProfile -Command "Get-NetIPConfiguration | Where-Object { $_.IPv4Address -or $_.IPv6DefaultGateway } | ForEach-Object { Write-Host ('Adapter : ' + $_.InterfaceAlias); if ($_.IPv4Address) { Write-Host ('IPv4    : ' + (($_.IPv4Address | ForEach-Object IPAddress) -join ', ')) }; if ($_.IPv4DefaultGateway) { Write-Host ('Gateway : ' + $_.IPv4DefaultGateway.NextHop) }; if ($_.DNSServer -and $_.DNSServer.ServerAddresses) { Write-Host ('DNS     : ' + ($_.DNSServer.ServerAddresses -join ', ')) }; Write-Host '' }"
if errorlevel 1 (
  echo Could not read network information.
  exit /b 1
)

echo Read-only local information. No network settings were changed.
echo.
pause
endlocal
