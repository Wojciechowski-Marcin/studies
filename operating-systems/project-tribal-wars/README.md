# Systemy operacyjne 2 - Projekt

Program wielowątkowy w oparciu o bibliotekę thread w języku C++

## Kompilacja

Aby ułatwić kompilację programu, do projektu dołączony jest plik Makefile.
Aby skompilować, należy wpisać polecenie
```bash
$ make
```
w folderze z programem

## Wymogi projektu

### Opis zadania

Celem projektu jest napisanie konsolowego programu wielowątkowego w języku C++, wykorzystując bibliotekę `ncurses`.

Napisany program ma rysować piłeczki wyrzucane ze środka terminala w jedną z pięciu stron (W, NW, N, NE, E). Mają one się poruszać zgodnie z zasadami grawitacji (zderzenia mają być niesprężyste). Po wystarczającej utracie energii (piłeczki przestają się ruszać) ruch piłki powinien zostać uśpiony. Gdy 4 piłki będą w bezruchu, należy je wybić w górę.

### Uwagi implementacyjne

* Program w języku C++
* Wykorzystanie biblioteki `ncurses`
* Każda piłka ma mieć różny interwał odświeżania - każda piłka musi mieć osobny wątek
* Piłki nie kolidują ze sobą
* Ponieważ `ncurses` nie wspiera wielowątkowości należy zapewnić, że w jednej chwili będzie z niej korzystał tylko jeden wątek

## Opis programu

Program jest zbudowany z trzech klas - w podpunktach wymienione są tworzone w nich wątki

* `Window` - klasa odpowiedzialna za inicjalizację okna ncurses, uruchomienie generacji piłek oraz zakończenie działania okna
    * wątek `scene_` wyświetla piłki na ekranie
    * wątek `wait_for_key_press_` oczekuje na wciśnięcie klawisza `q` w celu zamknięcia okna
* `BallManager` - klasa odpowiedzialna za generowanie piłek, kontrolę ilości uśpionych piłek, oraz ich wyświetlanie
    * wątek `create_balls_` tworzy nową piłkę w 5 sekundowych odstępach
    * wątek `check_sleeping_` sprawdza ilość uśpionych piłek
* `Ball` - klasa odpowiedzialna za ruch piłek
    * wątek `move_thread_` porusza piłką

W pliku `utils` znajduje się funkcja generująca całkowitą liczbę pseudolosową z zadanego przedziału.

## Autor

Marcin Wojciechowski