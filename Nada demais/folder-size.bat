@echo off
setlocal

rem Safe read-only utility: estimates the total size of a folder.
rem It does not create, modify, move, or delete files.

echo === Folder Size ===
set "target=%~1"
if not defined target set /p "target=Folder path: "

if not defined target (
  echo No folder provided.
  exit /b 1
)

if not exist "%target%\" (
  echo Folder not found: "%target%"
  exit /b 1
)

set "FOLDER_SIZE_TARGET=%target%"
powershell -NoProfile -Command "$p = [IO.Path]::GetFullPath($env:FOLDER_SIZE_TARGET); $s = (Get-ChildItem -LiteralPath $p -File -Recurse -Force -ErrorAction SilentlyContinue | Measure-Object Length -Sum).Sum; if ($null -eq $s) { $s = 0 }; '{0:N2} MB ({1:N0} bytes)' -f ($s / 1MB), $s"
set "FOLDER_SIZE_TARGET="

endlocal
