// Kompilacja:
// gcc sum-tab.c rdtsc32.s –m32 –O 0 –o sum-tab
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
double add(double a, double b);  // a + b
double sub(double a, double b);  // a - b
double mul(double a, double b);  // a * b
double divd(double a, double b); // a / b
double sqrt(double a);           // sqrt(a)
double absd(double a);           // abs(a)
double sind(double a);           // sin(a)
double cosd(double a);           // cos(a)

int main()
{
    double a, b, c;
    int wybor;
    while (1)
    {
        printf("\nWybierz dzialanie: ");
        printf("\n1. Dodawanie");
        printf("\n2. Odejmowanie");
        printf("\n3. Mnozenie");
        printf("\n4. Dzielenie");
        printf("\n5. Pierwiastek");
        printf("\n6. Wartosc bezwzgledna");
        printf("\n7. Sinus");
        printf("\n8. Cosinus");
        printf("\n9. Zakoncz\n");
        scanf("%d", &wybor);
        switch (wybor)
        {
        case 1:
            printf("Wprowadz liczbe a: ");
            scanf("%le", &a);
            printf("\nWprowadz liczbe b: ");
            scanf("%le", &b);
            c = add(a, b);
            printf("\nWynik: %lg + %lg = %lg\n", a, b, c);
            break;
        case 2:
            printf("Wprowadz liczbe a: ");
            scanf("%le", &a);
            printf("\nWprowadz liczbe b: ");
            scanf("%le", &b);
            c = sub(b, a);
            printf("\nWynik: %lg - %lg = %lg\n", a, b, c);
            break;
        case 3:
            printf("Wprowadz liczbe a: ");
            scanf("%le", &a);
            printf("\nWprowadz liczbe b: ");
            scanf("%le", &b);
            c = mul(a, b);
            printf("\nWynik: %lg * %lg = %lg\n", a, b, c);
            break;
        case 4:
            printf("Wprowadz liczbe a: ");
            scanf("%le", &a);
            printf("\nWprowadz liczbe b: ");
            scanf("%le", &b);
            c = divd(a, b);
            printf("\nWynik: %lg / %lg = %lg\n", a, b, c);
            break;
        case 5:
            printf("Wprowadz liczbe: ");
            scanf("%le", &a);
            c = sqrt(a);
            printf("\nWynik: Pierwiastek z %lg = %lg\n", a, c);
            break;
        case 6:
            printf("Wprowadz liczbe: ");
            scanf("%le", &a);
            c = absd(a);
            printf("\nWynik: Wartosc bezwzgledna z %lg = %lg\n", a, c);
            break;
        case 7:
            printf("Wprowadz liczbe (w radianach): ");
            scanf("%le", &a);
            c = sind(a);
            printf("\nWynik: Sinus %lg = %lg\n", a, c);
            break;
        case 8:
            printf("Wprowadz liczbe (w radianach): ");
            scanf("%le", &a);
            c = cosd(a);
            printf("\nWynik: Cosinus %lg = %lg\n", a, c);
            break;
        case 9:
            return 0;
        }
    }
}
