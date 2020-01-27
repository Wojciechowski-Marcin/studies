#include <stdio.h>

int dodaj(int a, int b);

int a = 123;
int b = 432;
int wynik;

int main(){
	scanf("%d", &a);
	scanf("%d", &b);
	wynik = dodaj(a,b);
	printf("%d + %d = %d\n", a, b, wynik);
	return 0;
}

