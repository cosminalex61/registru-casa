@echo off
chcp 65001 >nul
setlocal
cd /d "%~dp0"
echo ============================================
echo   RegistruCasa - BUILD EXE (mereu curat)
echo ============================================
echo.
echo ATENTIE: sterge doar folderele build\ si dist\ din PROIECT.
echo Nu sterge baza de date a clientului (registru_casa.db) din
echo folderul unde ruleaza aplicatia instalata.
echo.

where python >nul 2>&1
if errorlevel 1 (
    echo [EROARE] Nu gasesc python.exe in PATH.
    pause
    exit /b 1
)

python -c "import PyInstaller, reportlab, tkcalendar, docx, pymupdf, PIL" >nul 2>&1
if errorlevel 1 (
    echo Instalare dependinte...
    python -m pip install -q pyinstaller reportlab tkcalendar python-docx pymupdf pillow pywin32
)

echo Sterg build/dist vechi (doar aici in proiect)...
if exist build rmdir /s /q build
if exist dist rmdir /s /q dist

echo.
pyinstaller --onedir --windowed --name "RegistruCasa" --noconfirm --clean ^
  --icon "registru_casa.ico" ^
  --hidden-import=tkcalendar ^
  --hidden-import=babel.numbers ^
  --hidden-import=reportlab ^
  --hidden-import=docx ^
  --hidden-import=pymupdf ^
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
    echo.
    echo Pentru client: zip INTREGUL folder dist\RegistruCasa
    echo ca RegistruCasa.zip - FARA a include un registru_casa.db de test.
    explorer "dist\RegistruCasa"
) else (
    echo [EROARE] Build esuat.
)
echo.
pause
