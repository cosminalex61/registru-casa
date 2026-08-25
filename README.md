# Registru de Casă

Aplicație desktop Windows pentru evidența operațiunilor de casă, documente justificative și export PDF, dezvoltată ca proiect personal de software.

![Interfața Registru de Casă](docs/registru-casa-v2.15.5.png)

## Problema pe care o rezolvă

În practică, registrul de casă și borderourile se țin adesea în Excel sau pe hârtie. Aplicația centralizează înregistrările, calculează soldul, generează documentele uzuale și păstrează un istoric care poate fi regăsit și regenerat, fără să piardă datele la actualizare.

## Funcționalități

- **Registru**: încasări / plăți pe zile, sold rulant, filtre pe perioadă, căutare
- **Documente**: borderouri bancă, cash, depuneri; PDF ca rezultat principal
- **Arhivă PDF**: numerotare, perioadă în nume, preview
- **Date**: SQLite (WAL), backup local, rollback, backup opțional pe folder sincronizat (Drive / Digi etc.)
- **Utilizatori**: autentificare, roluri, drepturi pe operații sensibile
- **Email**: draft Gmail cu atașamente (opțional)
- **Update**: canal `version.json` + GitHub Releases, fără a suprascrie baza clientului

## Tehnologii

| Zonă | Alegere |
|------|---------|
| UI | Python 3, Tkinter / ttk |
| Persistare | SQLite (mod WAL) |
| PDF / Office | ReportLab, python-docx, PyMuPDF |
| Distribuție | PyInstaller (one-dir, Windows) |
| Integrări | Gmail API (OAuth Desktop, draft) |

## Arhitectură (pe scurt)

- Logica de business și UI într-o aplicație desktop monolitică, ușor de instalat pe posturi de lucru.
- Datele rămân **lângă aplicație** (sau în foldere configurate); update-ul copiază binarele, nu baza.
- Documentele păstrează în SQLite câmpurile de formular, ca un PDF/Word pierdut să poată fi regenerat.

## Repository

Acest repo public conține **documentație**, **metadate de versiune** și canalul de **release** — nu codul sursă complet al aplicației.

Nu sunt publicate: baze SQLite, backup-uri, documente generate, token-uri OAuth.

## Licență / uz

Proiect educațional și de portofoliu. Nu înlocuiește consultanța contabilă; fluxurile trebuie adaptate procedurii firmei.

**Versiune curentă: 2.15.6**
