# Funkcja pobiera licznik cykli procesora do rejestrow %edx:%eax
# unsigned long long rdtsc()
# Kompilacja: gcc program.c rdtsc32.s –m32 –o program
.text
.globl rdtsc
rdtsc:
push %ebx
xor %eax, %eax
cpuid
rdtsc
pop %ebx
ret 
