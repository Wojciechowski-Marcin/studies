// Kompilacja:
// gcc arr_sum.c arr_sum.s rdtsc32.s –m32 –O 0 –o sum-tab
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#define MAX 512
int TESTNR = 20;

int tab[MAX];
extern unsigned long long rdtsc();
extern int arr_sum(int *tab, int size);
int arr_sum_C(int *tab, int size);

int main(int argc, char **argv)
{
    if (argv[1])
        TESTNR = atoi(argv[1]);
    srand(time(NULL));
    printf("Tablica %d elementowa\n", MAX);
    printf("Ilosc testow: %d\n\n", TESTNR);
    for (int i = 0; i < MAX; i++)
        tab[i] = rand() % 10;

    // Test szybkosci w C
    printf("Test szybkosci w C\n");
    long long ctest = 0, t1 = 0;
    int sumaC = 0;
    for (int i = 0; i < TESTNR; i++)
    {
        sumaC = 0;
        t1 = rdtsc();
        sumaC = arr_sum_C(tab, MAX);
        ctest += rdtsc() - t1;
    }
    ctest /= TESTNR;
    printf("suma: %d czas: %llu cykli\n\n", sumaC, ctest);

    // Test szybkosci w asm
    printf("Test szybkosci w asm\n");
    long long asmtest = 0, t2 = 0;
    int sumaA = 0;
    for (int i = 0; i < TESTNR; i++)
    {
        sumaA = 0;
        t2 = rdtsc();
        sumaA = arr_sum(tab, MAX);
        asmtest += rdtsc() - t2;
    }
    asmtest /= TESTNR;
    printf("suma: %d czas: %llu cykli\n", sumaA, asmtest);
    return 0;
}

int arr_sum_C(int *tab, int size)
{
    int suma = 0;
    for (int i = 0; i < size; i++)
        suma += tab[i];
    return suma;
}