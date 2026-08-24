@echo off
chcp 65001 >nul
setlocal
cd /d "%~dp0"

set "DOC_DIR=%~dp0documente_borderou"
if not exist "%DOC_DIR%" mkdir "%DOC_DIR%"

set "DESKTOP=%USERPROFILE%\Desktop"
if not exist "%DESKTOP%" set "DESKTOP=%USERPROFILE%\Desktop"

powershell -NoProfile -Command ^
  "$s=(New-Object -ComObject WScript.Shell).CreateShortcut('%DESKTOP%\RegistruCasa - Documente.lnk');" ^
  "$s.TargetPath='%DOC_DIR%';" ^
  "$s.WorkingDirectory='%DOC_DIR%';" ^
  "$s.Description='Folder documente Registru de Casa';" ^
  "$s.Save()"

echo.
echo Scurtatura creata pe Desktop: "RegistruCasa - Documente"
echo Tinta: %DOC_DIR%
echo.
pause
