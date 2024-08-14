# CIT Vorkurs Informatikteil - Aufgaben

## Kompilieren mit `make`
```sh
make
make sheet # nur sheets
make solution # nur solutions
```
Zum Kompilieren einer Datei:
```sh
make out/file-target.pdf
```
Zum Watchen einer Datei:
```sh
make watch-file-target
```
Wobei target entweder `sheet` oder `solution` sein kann.

## Kompilieren mit [`just`](https://just.systems)
```sh
just
```
Zum Kompilieren einer Datei:
```sh
just build-all file
# bzw
just build file target
```
Zum Watchen einer Datei:
```sh
just watch file target
```

Siehe auch:
```sh
just --list
```

