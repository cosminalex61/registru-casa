# Registru de Casă

Aplicație desktop Windows pentru evidența operațiunilor de casă, documente justificative și export PDF.

Proiect personal de software, dezvoltat incremental, cu accent pe **protecția datelor**, controlul asupra documentelor generate și fluxuri care reduc munca repetitivă a casierului / contabilului. Prezentat ca proiect de portofoliu (admitere / facultate).

## Capturi de ecran

<p align="center">
  <img src="docs/registru-casa-v2.15.5.png" alt="Interfața principală" width="520" />
</p>

<p align="center">
  <img src="docs/preview-tiparire.png" alt="Preview tipărire" width="460" />
  &nbsp;
  <img src="docs/backup-rollback.png" alt="Backup și rollback" width="340" />
</p>

## Problema pe care o rezolvă

În practică, registrul de casă și borderourile se țin adesea în Excel sau pe hârtie: sold greșit, fișiere risipite, greu de refăcut un document după o greșeală. Aplicația adună într-un singur loc înregistrările, calculează soldul, generează documentele uzuale și ține un istoric din care se poate reveni sau regenera un PDF, fără să se piardă munca la o actualizare de program.

## Ce face aplicația

- **Registru de casă**: încasări și plăți pe zile, sold rulant, filtre pe interval, preset-uri rapide (zi / lună / an), căutare
- **Documente**: borderouri bancă, cash, depuneri; PDF ca rezultat principal; datele de formular rămân în bază ca documentul să poată fi regenerat
- **Arhivă PDF**: numerotare incrementală, perioadă în nume, preview, locație cunoscută și gestionată din aplicație
- **Preview și tipărire**: același conținut ca la tipărire, export și arhivare controlate
- **Utilizatori**: autentificare, roluri, drepturi pe operații sensibile
- **Email**: selecție de PDF-uri, preview, draft Gmail cu atașamente (fără trimitere automată)
- **Update**: verificare versiune prin `version.json` + GitHub Releases, fără a șterge baza sau documentele clientului

## Siguranța datelor (punct central)

Proiectul a fost gândit în jurul ideii că **datele utilizatorului contează mai mult decât binarele aplicației**:

- **Backup la fiecare modificare** relevantă (adăugare, editare, ștergere, setări, documente)
- **Backup zilnic** la pornirea aplicației
- **Backup cloud** pe un folder sincronizat ales de client (ex. Drive / Digi Storage), la închiderea aplicației și după un interval configurabil — fără a ține parole de cloud în aplicație
- **Păstrarea ultimelor backup-uri** (limită configurată), ca discul să nu se umple la nesfârșit
- **Rollback** la un backup selectat din listă
- **Restaurare automată** dacă baza pare coruptă, din ultimul backup bun
- La **update**, baza, backup-urile, documentele și exporturile **nu sunt șterse** din pachetul de actualizare

SQLite rulează în mod **WAL**, cu setări orientate spre scriere sigură pe disc.

## Documente, arhive și controlul fișierelor

- Utilizatorul știe **unde** se salvează documentele și exporturile; structura e predictibilă (tip, perioadă, denumiri clare)
- **Arhiva PDF** ține evidența fișierelor generate din aplicație: numerotare, perioadă, deschidere, management din UI
- Generarea, regenerarea și arhivarea rămân sub controlul aplicației, nu „fișiere uitate pe Desktop”
- **Scurtătură pe Desktop** către folderul de documente / hub-ul de path-uri, creată din tool-urile proiectului, ca accesul rapid să nu însemne haos în fișiere
- Preview, draft email și arhivă lucrează pe aceleași PDF-uri logice, ca fluxul să fie coerent de la generare până la trimitere sau tipărire

## Securitate și acces

- Conturi cu **roluri** (admin / user) și drepturi pe operații riscante (ștergere, restore, setări etc.)
- Integrarea Gmail folosește **OAuth Desktop**: aplicația nu stochează parola de Google; tokenul rămâne local, iar acțiunea implicită este **crearea unui draft**, nu trimiterea automată a emailului
- Credențialele OAuth și bazele de date **nu** fac parte din repository-ul public și nici din pachetul standard de update

## Automatizări și cum ușurează munca

- Sold calculat automat pe fluxul de operațiuni
- Filtre rapide pe perioadă, fără a reintroduce de fiecare dată intervalul
- Generare documente din șabloane + date deja din registru / formular
- Backup-uri care rulează în fundal la evenimente, nu doar „când își aduce aminte utilizatorul”
- Update cu un click din aplicație, cu mesaje despre ce s-a schimbat în versiunea nouă
- Draft de email cu documentele deja selectate din arhivă / generare

Ideea e ca utilizatorul să petreacă timpul pe **conținutul** operațiunilor și documentelor, nu pe copy-paste între Excel, Word și foldere.

## Tehnologii

| Zonă | Alegere |
|------|---------|
| UI | Python 3, Tkinter / ttk |
| Persistare | SQLite (mod WAL) |
| PDF / Office | ReportLab, python-docx, PyMuPDF |
| Distribuție | PyInstaller (one-dir, Windows) |
| Integrări | Gmail API (OAuth Desktop, draft) |
| Update | `version.json` + GitHub Releases |

## Arhitectură (pe scurt)

- Aplicație desktop monolitică, ușor de instalat pe posturi de lucru, fără server obligatoriu.
- Datele stau **lângă aplicație** sau în foldere configurate de utilizator; update-ul înlocuiește programul, nu evidența.
- Documentele păstrează în SQLite câmpurile de formular, astfel încât un PDF sau Word pierdut poate fi regenerat.
- Dependențele de calendar (tkcalendar / babel / pytz) sunt tratate explicit la build, ca EXE-ul să pornească predictibil pe Windows.

## Ce demonstrează proiectul (portofoliu)

- Gândire pe **ciclul de viață al datelor**: creare, modificare, backup, restore, update
- Atenție la **UX contabil**: preview înainte de tipărire, denumiri și arhive clare, mai puțin haos de fișiere
- Integrare externă **cu limite clare** (OAuth, draft, nu trimitere oarbă)
- Distribuție reală pe Windows (build, release, canal de actualizare)
- Evoluție pe versiuni, cu note de schimbare și protecția instalărilor existente

## Repository

Acest repo public conține **documentație**, **metadate de versiune** și canalul de **release** — nu codul sursă complet al aplicației.

Nu sunt publicate: baze SQLite, backup-uri, documente generate, token-uri OAuth.

## Licență / uz

Proiect educațional și de portofoliu. Nu înlocuiește consultanța contabilă; fluxurile trebuie adaptate procedurii firmei.

**Versiune curentă: 2.15.6**
