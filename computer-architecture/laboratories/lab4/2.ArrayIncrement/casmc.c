// Program casmc.c wywolywanie funkcji w assemblerze z programu w C
// Program w assemblerze w pliku casma.s
// kompilacja:
// gcc casmc.c casma.s –m32 –o casm
// wykonaie:
// ./casm
#include <stdio.h>

/* prototype for asm function */
int *asm_mod_array(int *ptr, int size);

int main()
{
    int fren[5] = {1, 2, 3, 4, 5};
    printf("Tablica przed wywolaniem: %d %d %d %d %d\n", fren[0], fren[1], fren[2], fren[3], fren[4]);

    /* call the asm function */
    asm_mod_array(fren, 5);
    printf("Po wywolaniu: %d %d %d %d %d\n", fren[0], fren[1], fren[2], fren[3], fren[4]);
    return 0;
}
