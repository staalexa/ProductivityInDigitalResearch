# CIT Vorkurs Informatikteil - Vorlesung

## Kompilieren mit `make`
```sh
make
make slides # nur slides
make handout # nur handouts
```
Zum Kompilieren einer Datei:
```sh
make out/file-target.pdf
```
Zum Watchen einer Datei:
```sh
make watch-file-target
```
Wobei target entweder `slides` oder `handout` sein kann.

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

