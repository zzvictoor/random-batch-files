@echo off
setlocal

echo ========================================
echo        QUICK SYSTEM SNAPSHOT
echo ========================================
echo.

echo Computer: %COMPUTERNAME%
echo User:     %USERNAME%
echo Date:     %DATE%
echo Time:     %TIME%
echo.

echo [Windows]
ver
echo.

echo [IP configuration - summary]
ipconfig | findstr /I "IPv4 IPv6 Gateway"
echo.

echo [Disk space]
wmic logicaldisk get caption,freespace,size 2>nul

echo.
pause
endlocal
