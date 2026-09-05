@echo off
setlocal

rem Safe read-only utility: searches currently running processes by name.
rem It does not terminate, modify, or start any process.

echo === Process Finder ===
set "query=%~1"
if not defined query set /p "query=Process name or part of it: "

if not defined query (
  echo No search term provided.
  exit /b 1
)

echo.
tasklist /FO TABLE /NH | findstr /I /C:"%query%"
if errorlevel 1 echo No matching processes found.

endlocal
