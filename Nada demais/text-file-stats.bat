@echo off
setlocal
title Text File Stats

echo ========================================
echo           TEXT FILE STATS
echo ========================================
echo.
echo Read-only utility. No files are modified.
echo.

set "FILE="
set /p "FILE=Path to a text file: "

if not defined FILE (
    echo.
    echo No file provided.
    pause
    exit /b 1
)

if not exist "%FILE%" (
    echo.
    echo File not found.
    pause
    exit /b 1
)

echo.
powershell -NoProfile -Command "$p=$env:FILE; try { $m=Get-Content -LiteralPath $p -ErrorAction Stop | Measure-Object -Line -Word -Character; $bytes=(Get-Item -LiteralPath $p -ErrorAction Stop).Length; Write-Host ('Lines      : ' + $m.Lines); Write-Host ('Words      : ' + $m.Words); Write-Host ('Characters : ' + $m.Characters); Write-Host ('Bytes      : ' + $bytes) } catch { Write-Host ('Could not read file: ' + $_.Exception.Message); exit 1 }"

echo.
pause
endlocal
