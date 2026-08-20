# Dezvoltare rapidă

## În timpul dezvoltării (FĂRĂ rebuild EXE)

```bat
RULEAZA_DEV.bat
```

Modifici `registru_casa.py` → salvezi → rulezi din nou `RULEAZA_DEV.bat`.
Nu e nevoie de PyInstaller la fiecare schimbare.

## Build pentru client (doar când dai release)

```bat
GENEREAZA_EXE_WINDOWS.bat
```

Build **incremental** (păstrează cache) = mult mai rapid.

Rebuild complet doar când e nevoie:
```bat
set CLEAN=1
GENEREAZA_EXE_WINDOWS.bat
```

## Publicare update

1. Zip `dist\RegistruCasa` → `RegistruCasa.zip`
2. GitHub Release + atașament zip
3. Actualizează `version.json`
