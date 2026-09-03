@echo off
setlocal

title Countdown

echo ==========================
echo        COUNTDOWN
echo ==========================
echo.
set /p seconds=Segundos para contar: 

echo %seconds%| findstr /r "^[0-9][0-9]*$" >nul
if errorlevel 1 (
    echo Valor invalido. Usa apenas numeros inteiros positivos.
    pause
    exit /b 1
)

if %seconds% LEQ 0 (
    echo O valor deve ser maior que zero.
    pause
    exit /b 1
)

:loop
cls
echo ==========================
echo        COUNTDOWN
echo ==========================
echo.
echo Restam %seconds% segundos...
if %seconds% LEQ 0 goto done
ping 127.0.0.1 -n 2 >nul
set /a seconds-=1
goto loop

:done
echo.
echo Tempo terminado!
echo ^G
pause
