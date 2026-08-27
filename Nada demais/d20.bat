@echo off
setlocal EnableDelayedExpansion

:roll
set /a result=(%RANDOM% %% 20)+1
echo.
echo =====================
echo      D20 ROLL: !result!
echo =====================

if !result! EQU 20 echo NATURAL 20! Lucky bastard.
if !result! EQU 1 echo NATURAL 1... tragic.

choice /C RN /N /M "[R]oll again or [N]ope? "
if errorlevel 2 goto :eof
goto roll
