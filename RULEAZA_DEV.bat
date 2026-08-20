@echo off
chcp 65001 >nul
cd /d "%~dp0"
echo ============================================
echo   MOD DEZVOLTARE - fara rebuild EXE
echo   Modifici .py -> salvezi -> rulezi din nou
echo ============================================
echo.

where python >nul 2>&1
if errorlevel 1 (
    echo [EROARE] Python lipsa din PATH.
    pause
    exit /b 1
)

python -c "import reportlab, tkcalendar, docx" >nul 2>&1
if errorlevel 1 (
    python -m pip install -q reportlab tkcalendar python-docx pymupdf pillow pywin32
)

python registru_casa.py
if errorlevel 1 pause
