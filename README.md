# Registru de Casă

Aplicație desktop pentru evidența operațiunilor de casă (încasări / plăți), generare documente justificative și export PDF conform cerințelor uzuale din contabilitatea românească.

Proiect personal de software, dezvoltat incremental, cu accent pe stabilitatea datelor, fluxuri clare pentru utilizatorul final și posibilitatea de actualizare fără pierderea bazei existente.

## Ce face

- **Registru de casă**: înregistrări pe zile, sold rulant, filtrare pe perioadă, căutare
- **Documente**: borderouri bancă / cash / depuneri, pe baza de șabloane Word; stocare pe `an / tip / perioadă`
- **Export**: PDF registru (inclusiv o zi pe pagină), CSV, tipărire cu preview
- **Siguranță date**: backup local automat, rollback, backup opțional într-un folder sincronizat (ex. Google Drive / Digi Storage)
- **Utilizatori**: autentificare, rol admin / user, drepturi pe operații sensibile

## Stack

- Python 3, Tkinter / ttk
- SQLite (WAL)
- reportlab, python-docx, PyMuPDF, Pillow
- Packaging: PyInstaller (one-dir)

## Structura proiectului

```
registru_casa.py          # aplicația
documente_templates/      # machete Word
fonts/                    # DejaVu (diacritice în PDF)
RULEAZA_DEV.bat           # rulare fără rebuild
GENEREAZA_EXE_WINDOWS.bat # build EXE
CREAZA_SCURTATURA_DOCUMENTE.bat  # scurtătură Desktop → folder documente
version.json              # (pe GitHub) canal de update pentru clienți
```

## Rulare în dezvoltare

```bat
RULEAZA_DEV.bat
```

Dependențe (dacă lipsesc): `reportlab`, `tkcalendar`, `python-docx`, `pymupdf`, `pillow`, `pywin32`.

## Build Windows

```bat
GENEREAZA_EXE_WINDOWS.bat
```

Rezultat: `dist\RegistruCasa\`. Pentru distribuție, arhivezi folderul ca `RegistruCasa.zip` (fără o bază de test înăuntru).

## Cont implicit

La prima rulare se creează utilizatorul **admin** / **admin**. Schimbați parola din administrarea utilizatorilor.

## Decizii de design (pe scurt)

- Baza de date rămâne lângă EXE; update-ul nu o suprascrie.
- Documentele păstrează în SQLite datele de formular, astfel încât un Word/PDF pierdut poate fi regenerat.
- Backup-ul „cloud” e intenționat pe **folder sincronizat** de client — fără OAuth în aplicație, ca să rămână simplu de instalat pe mai multe posturi.

## Licență / uz

Proiect educațional / portofoliu. Nu înlocuiește consultanță contabilă; adaptați fluxurile la procedura firmei.

Versiune curentă: **2.9.0**
