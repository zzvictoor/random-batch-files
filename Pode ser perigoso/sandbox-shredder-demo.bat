@echo off
setlocal EnableDelayedExpansion

rem =============================================================
rem WARNING: DESTRUCTIVE DEMO - SANDBOX ONLY
rem This script creates and deletes files ONLY inside:
rem   %TEMP%\batch-sandbox-demo
rem Do NOT modify SANDBOX to point at real data.
rem =============================================================

set "SANDBOX=%TEMP%\batch-sandbox-demo"

echo =============================================================
echo WARNING: DESTRUCTIVE DEMO - SANDBOX ONLY
echo This will create and then DELETE files only inside:
echo %SANDBOX%
echo Nothing outside that folder is intentionally touched.
echo =============================================================
echo.
choice /C YN /N /M "Continue? [Y/N] "
if errorlevel 2 goto :cancel

if not exist "%SANDBOX%" mkdir "%SANDBOX%"
for /L %%I in (1,1,8) do (
    >"%SANDBOX%\demo_%%I.txt" echo Temporary demo file %%I
)

echo.
echo Created demo files:
dir /B "%SANDBOX%"
echo.
choice /C YN /N /M "Delete the sandbox and its demo files now? [Y/N] "
if errorlevel 2 goto :keep

rmdir /S /Q "%SANDBOX%"
echo Sandbox deleted.
goto :end

:keep
echo Sandbox kept at: %SANDBOX%
goto :end

:cancel
echo Cancelled. No files were created.

:end
echo.
pause
endlocal
