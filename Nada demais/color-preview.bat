@echo off
setlocal EnableDelayedExpansion

title CMD Color Preview

echo ==================================
echo        CMD COLOR PREVIEW
echo ==================================
echo.
echo Mostra combinacoes de cores do comando COLOR sem guardar nem alterar ficheiros.
echo Fecha a janela ou prime Ctrl+C para sair.
echo.
pause

for %%B in (0 1 2 3 4 5 6 7 8 9 A B C D E F) do (
    for %%F in (0 1 2 3 4 5 6 7 8 9 A B C D E F) do (
        if /I not "%%B"=="%%F" (
            color %%B%%F
            cls
            echo ==================================
            echo        CMD COLOR PREVIEW
            echo ==================================
            echo.
            echo Background: %%B
            echo Foreground: %%F
            echo Codigo: COLOR %%B%%F
            echo.
            echo Prima qualquer tecla para a proxima combinacao...
            pause >nul
        )
    )
)

color 07
cls
echo Preview concluido. Cor restaurada para 07.
pause
