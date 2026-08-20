# Cod sursă & fișiere binare

## De ce nu e totul în git (încă)

- `registru_casa.py` (~150 KB) + fonturi TTF + template-uri DOCX se livrează în **Release zip** (`RegistruCasa.zip`), ca să poată fi descărcate de update-ul automat.
- Connectorul de push din asistent e optimizat pentru fișiere text; arhiva completă de client rămâne pe **Releases**.

## Cum pui totul pe GitHub de pe PC-ul tău (recomandat)

```bat
git clone https://github.com/cosminalex61/registru-casa.git
cd registru-casa
```

Copiază din folderul tău de proiect:
- registru_casa.py
- fonts\
- documente_templates\
- registru_casa.ico / .png

Apoi:

```bat
git add -A
git commit -m "Sync v2.8.5 sursa completa"
git push
```

## Dezvoltare zilnică (FĂRĂ rebuild EXE)

```bat
RULEAZA_DEV.bat
```

## Build client (doar la release)

```bat
GENEREAZA_EXE_WINDOWS.bat
```

Incremental = rapid. Rebuild total: `set CLEAN=1` apoi același bat.
