# Architektura komputerów 2

Ćwiczenia wykonywane podczas laboratoriów.

## Kompilacja programów asemblerowych

```bash
as --32 nazwa.s -g -o nazwa.o
ld -m elf_i386 nazwa.o -o nazwa
```

## Kompilacja programów łączących C z asemblerem

```bash
gcc plik.c plik.s -m32 -o plik
```

## Foldery

### Lab1

1. program znajdujący minimum w tablicy zapisanej jako zmienna, wynik jest zwracany jako kod wyjściowy programu

### Lab2

1. program wczytujący ciąg znaków podany przez użytkownika oraz zamieniający małe litery na wielkie, wynik jest wypisywany na ekranie

### Lab3

1. program konwertujący podane na wejściu znaki ASCII na liczbę w systemie heksadecymalnym (plik ascii.txt zawiera wszystkie znaki ascii w kolejności rosnącej)
2. program szyfrujący (oraz deszyfrujący) podany ciąg znaków szyfrem cezara

### Lab4

1. Łączenie plików assemblerowych
2. Program inkrementujący elementy tablicy
3. Program wypisujący licznik cykli procesora
4. Program sumujący dwie liczby

### Lab5

1. Program sumujący dwie liczby podane przez użytkownika
2. Program sumujący elementy tablicy (porównanie czasu działania funkcji w C i w Asemblerze)

### Lab6

1. Kalkulator zmiennoprzecinkowy w C, działania w asemblerze

### Inne

1. Funkcja licząca silnię
2. Funkcja podnosząca liczbę do potęgi - obliczenie ```n^m + o^p```