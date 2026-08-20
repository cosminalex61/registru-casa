# Cum publici un update (pentru tine)

1. Crește `APP_VERSION` în `registru_casa.py` și în `VERSION.txt`.
2. Rulează `GENEREAZA_EXE_WINDOWS.bat`.
3. Zip-uiește **întregul** folder `dist\\RegistruCasa` ca `RegistruCasa.zip`.
4. Creează un **Release** pe GitHub: tag `vX.Y.Z`, atașează `RegistruCasa.zip`.
5. Actualizează `version.json` (versiune + notes).

## Cum actualizează clientul

La deschiderea aplicației, dacă există versiune nouă:
- apare un dialog
- apasă **Actualizează acum**
- aplicația descarcă zip-ul, pregătește update-ul și se închide
- rulează automat `APPLY_UPDATE.bat` (înlocuiește fișierele, **nu șterge** baza de date)
- repornește aplicația

Nu ștergeți manual `registru_casa.db` sau `backup_registru_casa`.
