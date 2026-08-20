@echo off
chcp 65001 >nul
setlocal
cd /d "%~dp0"
echo ============================================
echo   RegistruCasa - BUILD (rapid / incremental)
echo ============================================
echo.

where python >nul 2>&1
if errorlevel 1 (
    echo [EROARE] Nu gasesc python.exe in PATH.
    pause
    exit /b 1
)

python -c "import PyInstaller, reportlab, tkcalendar, docx, fitz, PIL" >nul 2>&1
if errorlevel 1 (
    echo Instalare dependinte o singura data...
    python -m pip install -q pyinstaller reportlab tkcalendar python-docx pymupdf pillow pywin32
)

set CLEAN_FLAG=
if "%CLEAN%"=="1" (
    echo Rebuild COMPLET (--clean)...
    if exist build rmdir /s /q build
    if exist dist rmdir /s /q dist
    set CLEAN_FLAG=--clean
) else (
    echo Build INCREMENTAL (pastraza cache PyInstaller)...
    echo Pentru rebuild complet: set CLEAN=1 ^&^& GENEREAZA_EXE_WINDOWS.bat
)

echo.
pyinstaller --onedir --windowed --name "RegistruCasa" --noconfirm %CLEAN_FLAG% ^
  --icon "registru_casa.ico" ^
  --hidden-import=tkcalendar ^
  --hidden-import=babel.numbers ^
  --hidden-import=reportlab ^
  --hidden-import=docx ^
  --hidden-import=fitz ^
  --hidden-import=PIL ^
  --hidden-import=win32com.client ^
  --exclude-module=matplotlib ^
  --exclude-module=numpy ^
  --exclude-module=scipy ^
  --exclude-module=pandas ^
  --exclude-module=pytest ^
  --add-data "fonts/DejaVuSans.ttf;fonts" ^
  --add-data "fonts/DejaVuSans-Bold.ttf;fonts" ^
  --add-data "registru_casa.png;." ^
  --add-data "registru_casa.ico;." ^
  --add-data "documente_templates;documente_templates" ^
  registru_casa.py

if exist "dist\RegistruCasa\RegistruCasa.exe" (
    echo.
    echo SUCCES: dist\RegistruCasa\RegistruCasa.exe
    echo Pentru client: zip INTREGUL folder dist\RegistruCasa ca RegistruCasa.zip
) else (
    echo [EROARE] Build esuat.
)
echo.
pause
