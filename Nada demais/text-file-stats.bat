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
powershell -NoProfile -Command "$p=$env:FILE; try { $c=Get-Content -LiteralPath $p -Raw -ErrorAction Stop; $lines=if($c.Length -eq 0){0}else{($c -split '?
').Count}; $words=([regex]::Matches($c,'S+')).Count; $chars=$c.Length; Write-Host ('Lines      : ' + $lines); Write-Host ('Words      : ' + $words); Write-Host ('Characters : ' + $chars); Write-Host ('Bytes      : ' + (Get-Item -LiteralPath $p).Length) } catch { Write-Host ('Could not read file: ' + $_.Exception.Message); exit 1 }"

echo.
pause
endlocal
