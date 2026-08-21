# Update Registru Casa

Versiune curentă: **2.8.24** (înlocuiește 3.0.0)

1. Clienții verifică `version.json` la pornire / buton Actualizare.
2. Descarcă `RegistruCasa.zip` din **Releases → latest**.
3. `APPLY_UPDATE.bat` din zip păstrează baza de date și backup-urile.

Pentru release nou:
- Build EXE cu `GENEREAZA_EXE_WINDOWS.bat`
- Creează Release pe GitHub cu tag `v2.8.24`
- Atașează zip-ul ca **RegistruCasa.zip** (același nume ca în download_url)
