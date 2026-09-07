@echo off
setlocal

title UUID Generator

echo =========================
echo       UUID GENERATOR
echo =========================
echo.

for /f %%G in ('powershell -NoProfile -Command "[guid]::NewGuid().ToString()"') do set "UUID=%%G"

echo %UUID%
echo.
echo Generated locally. Nothing is saved or transmitted.
echo.
pause
endlocal
