# Funkcja pobiera licznik cykli procesora do rejestrow %edx:%eax
# unsigned long long rdtsc()
.text
.globl rdtsc
rdtsc:
pushl %ebx
xor %eax, %eax
cpuid
rdtsc
popl %ebx
ret
