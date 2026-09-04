# Registru de Casă

Aplicație desktop Windows pentru evidența operațiunilor de casă, generarea documentelor justificative și organizarea PDF-urilor. Proiect personal, construit incremental: de la un registru local la o aplicație modulară cu backup, actualizare sigură și flux de documente.

**Interfața curentă este PySide6 / Qt.** Pachetul Windows este separat de datele locale; baza, documentele și configurările rămân protejate la actualizare.

<p align="center">
  <img src="docs/main.png" alt="Registru de Casă — interfața principală" width="920" />
</p>

## Ce rezolvă aplicația

- registru de casă cu încasări, plăți, sold rulant și filtrare pe perioadă;
- documente pe șabloane (borderouri bancă, cash, depuneri), exportabile ca PDF și pregătite pentru semnare;
- arhivă unificată pentru PDF-uri, cu preview, localizare și selecție pentru email;
- situație și rapoarte pe interval: flux de numerar și totaluri;
- backup, rollback și migrare automată pentru baze SQLite mai vechi;
- draft Gmail cu OAuth Desktop: se atașează fișierele selectate, trimiterea se confirmă în Gmail.

## Arhitectură

Responsabilitățile sunt separate, ca o schimbare de interfață să nu afecteze evidența:

```text
ui/          pagini, dialoguri, temă și componente Qt
services/    documente, PDF, email, update și fluxuri de lucru
data/        SQLite, migrații și persistență
core/        configurare, căi, formatare, versiuni și bootstrap
tests/       verificări pentru fluxurile critice
```

## Tehnologii

| Zonă | Tehnologie | Rol |
|---|---|---|
| Limbaj | Python 3 | ecosistem desktop și documente |
| UI | PySide6 / Qt | ferestre, tabele, calendare, temă light/dark |
| Bază locală | SQLite + WAL | fără server, scrieri consistente |
| PDF | ReportLab, PyMuPDF | generare și preview |
| Documente | python-docx | șabloane Word și regenerare din date salvate |
| Email | Gmail API + OAuth Desktop | draft cu atașamente, fără parole Google în aplicație |
| Distribuție | PyInstaller | pachet Windows fără Python instalat |
| Actualizare | GitHub Releases + `version.json` | update fără înlocuirea datelor locale |

## Fluxuri

1. Se înregistrează o operațiune; soldul se recalculează în SQLite.
2. Documentele se completează în UI și devin PDF din șablon.
3. Câmpurile rămân în bază, deci PDF-ul poate fi regenerat dacă dispare fișierul.
4. Fișierul ajunge în arhivă: preview, semnare externă sau draft Gmail.
5. Update-ul exclude baza `.db`, WAL/SHM, backup-urile, documentele și OAuth-ul.

## Confidențialitate

Repository-ul public prezintă arhitectura, deciziile de proiectare, o captură și release-uri Windows. Nu include baza de date, backup-uri, documente generate, token-uri OAuth sau sursa completă a produsului.

## Licență / uz

Proiect personal demonstrativ. Nu înlocuiește consultanța contabilă; utilizarea concretă trebuie adaptată procedurilor firmei.
