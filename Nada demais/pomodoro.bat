@echo off
setlocal

title Pomodoro Timer

:menu
cls
echo ==========================
echo       POMODORO TIMER
echo ==========================
echo.
echo [1] Focus - 25 minutes
echo [2] Short break - 5 minutes
echo [3] Long break - 15 minutes
echo [Q] Quit
echo.
choice /c 123Q /n /m "Choose an option: "

if errorlevel 4 goto :eof
if errorlevel 3 goto longbreak
if errorlevel 2 goto shortbreak
if errorlevel 1 goto focus

:focus
call :run_timer "Focus session" 1500
goto menu

:shortbreak
call :run_timer "Short break" 300
goto menu

:longbreak
call :run_timer "Long break" 900
goto menu

:run_timer
cls
echo %~1 started.
echo Press Ctrl+C if you want to stop the timer early.
echo.
timeout /t %~2 /nobreak >nul

echo.
echo %~1 finished!
echo ^G
pause
exit /b
