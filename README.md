# Registru de Casă

Aplicație desktop (Windows) pentru registru de casă.

## Pentru clienți

Update automat: aplicația citește [`version.json`](version.json) la pornire și descarcă zip-ul din **Releases**.

## Pentru dezvoltare

| Ce vrei | Comandă |
|---------|---------|
| Test rapid după modificare .py | `RULEAZA_DEV.bat` |
| Build EXE pentru client | `GENEREAZA_EXE_WINDOWS.bat` |
| Rebuild de la zero | `set CLEAN=1` + build bat |

Vezi [DEVELOPMENT.md](DEVELOPMENT.md) și [SOURCE.md](SOURCE.md).

## Publicare update

1. Build → zip folder `dist\RegistruCasa` ca **RegistruCasa.zip**
2. GitHub → Releases → tag `vX.Y.Z` → atașezi zip-ul
3. Actualizezi `version.json` (version + notes)
