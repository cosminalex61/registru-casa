# Registru de Casă

Aplicație desktop Windows pentru evidența operațiunilor de casă, documente justificative și export PDF.

**Proiect personal** de software, dezvoltat incremental: a început ca un registru simplu și a crescut cu module folosite în practică într-o societate comercială.

<p align="center">
  <img src="docs/registru-casa-v2.15.5.png" alt="Interfața principală" width="560" />
</p>

## Ce am vrut să ating cu acest software

La început era un **registru de casă simplu**: înregistrări pe zile, sold, export de bază. Pe parcurs am adăugat funcții și module pe care le folosește efectiv o firmă — documente justificative, arhivă PDF, backup și rollback, utilizatori cu drepturi, draft de email — ca evidența să nu rămână doar un tabel, ci un **flux de lucru complet**.

Interfața și automatizările sunt adaptate persoanei care stă zilnic în program: mai puțin copy-paste între Excel, Word și foldere, mai mult control asupra datelor și a fișierelor generate.

## Problema pe care o rezolvă

Registrul și borderourile se țin adesea în Excel sau pe hârtie: sold greșit, fișiere risipite, greu de refăcut un document după o greșeală. Aplicația adună înregistrările într-un singur loc, calculează soldul, generează documentele uzuale și ține un istoric din care se poate reveni sau regenera un PDF, fără să se piardă munca la o actualizare de program.

## Registru de casă

- Încasări și plăți pe zile, sold rulant
- Filtre pe interval și preset-uri rapide (zi / lună / an)
- Căutare, adăugare / editare / ștergere cu confirmare
- Utilizatori, roluri și drepturi pe operații sensibile

<p align="center">
  <img src="docs/registru-casa-v2.15.5.png" alt="Registru — interfața principală" width="480" />
</p>

## Preview, tipărire și documente

- Preview al registrului **identic** cu ce se tipărește
- Export și arhivare controlate din aplicație
- Borderouri (bancă, cash, depuneri); PDF ca rezultat principal
- Datele de formular rămân în bază, ca un document să poată fi regenerat
- Arhivă PDF cu numerotare, perioadă în nume, locație clară
- Scurtătură pe Desktop către folderul de documente, fără haos de fișiere

<p align="center">
  <img src="docs/preview-tiparire.png" alt="Preview tipărire" width="500" />
</p>

## Siguranța datelor

Ideea de bază: **datele utilizatorului contează mai mult decât programul**.

- Backup la modificări relevante (operațiuni, setări, documente)
- Backup zilnic la pornire
- Backup pe folder sincronizat (Drive, Digi Storage etc.), la închidere / interval — fără parole de cloud în aplicație
- Păstrarea unui număr limitat de backup-uri
- Rollback la un moment ales din listă
- Restaurare automată dacă baza pare coruptă
- La update: baza, backup-urile, documentele și exporturile **nu se șterg**

SQLite în mod WAL, cu scriere orientată spre siguranță pe disc.

<p align="center">
  <img src="docs/backup-rollback.png" alt="Backup și rollback" width="420" />
</p>

## Email (Gmail)

- Selecție de PDF-uri din fluxul aplicației
- Preview înainte de a compune mesajul
- **OAuth Desktop**: nu se stochează parola Google; token local
- Se creează un **draft**, nu se trimite emailul automat

<p align="center">
  <img src="docs/draft_email.png" alt="Draft email" width="440" />
</p>

## Automatizări

- Sold calculat pe fluxul de operațiuni
- Backup în fundal, la evenimente, nu doar „când își aduce aminte utilizatorul”
- Update din aplicație, cu note despre versiunea nouă
- Draft de email cu documentele deja alese din generare / arhivă

## Tehnologii

| Zonă | Alegere |
|------|---------|
| UI | Python 3, Tkinter / ttk |
| Persistare | SQLite (WAL) |
| PDF / Office | ReportLab, python-docx, PyMuPDF |
| Distribuție | PyInstaller (Windows, one-dir) |
| Integrări | Gmail API (OAuth, draft) |
| Update | `version.json` + GitHub Releases |

## Repository

Documentație, metadate de versiune și release-uri Windows. **Codul sursă complet nu este public** în acest repository.

Nu sunt incluse: baze SQLite, backup-uri, documente generate, token-uri OAuth.

## Licență / uz

Proiect personal. Nu înlocuiește consultanța contabilă; fluxurile trebuie adaptate procedurii firmei.

**Versiune curentă: 2.15.6**
