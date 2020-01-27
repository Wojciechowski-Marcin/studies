# Struktury danych i złożoność obliczeniowa - zadanie projektowe nr 1

Badanie efektywności operacji dodawania, usuwania oraz wyszukiwania elementów w różnych strukturach danych

## Opis zadania projektowego

### Cel projektu

Celem zadania jest implementacja następujących struktur danych: 

* tablicy
* listy
* kopca binarnego
* drzewa czerwono-czarnego

oraz dokonanie pomiaru czasu działania operacji dodawania, usuwania oraz wyszukiwania elementu w zaimplementowanych strukturach.

### Wymogi implementacji

* Podstawowym elementem struktur jest 4 bajtowa liczba całkowita
* Wszystkie struktury powinny być alokowane dynamicznie
* Pomiary należy powtórzyć kilkukrotnie, a wynik uśrednić
* Dla tablicy i listy należy rozpatrzeć przypadki dodawania i usuwania elementu w zależności od pozycji w danej strukturze (początek, środek, koniec)

### Pomiar czasu

Do pomiaru czasu wykorzystana została biblioteka <time.h>, zawarta w zbiorze standardowych bibliotek języka C++. Biblioteka ta operuje na liczbie cykli procesora, co pozwala na bardzo dokładny pomiar czasu.
Program pobiera czas przed i po wykonaniu funkcji, a następnie oblicza różnicę czasu bazując na ilości okresów przebiegu procesora.

### Przebieg pomiaru

Będziemy mierzyć czas wykonywania operacji w funkcji rozmiaru struktury (liczymy średni czas wykonania pojedynczej operacji). Jako że wynik zależy od rozkładu danych (generacja liczb pseudolosowych) pomiar zostanie powtórzony kilkudziesięciokrotnie, a następnie zostanie uśredniony.

## Działanie poszczególnych funkcji

Program zawiera również proste menu, które umożliwia sprawdzenie poprawności wykonywania operacji na strukturach.

## Autor

Marcin Wojciechowski
