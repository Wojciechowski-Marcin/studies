.section data
.section text

.globl _start
.globl factorial		# potrzebne jeśli chcemy dzielić funkcję z innymi programami

_start:
pushl $4			# argument silni
call factorial
addl $4, %esp			# zdjęcie argumentu ze stosu
movl %eax, %ebx			# funkcja zwraca odpowiedź w %eax
# ale chcemy jej użyć jako status wyjścia
movl $1, %eax			#  wywołanie funkcji wyjścia
int $0x80

.type factorial,@function
factorial:
pushl %ebp			# odłożenie %ebp na stos (chcemy go potem przywrocic)
movl %esp, %ebp			# nie chcemy zmieniać wskaźnika stosu
movl 8(%ebp), %eax		# przenosi argument do %eax
cmpl $1, %eax
je end_factorial		# jeśli 1 to koniec
decl %eax			# jeśli nie to zmiejsz argument
pushl %eax			# włożenie jako argument kolejnej funkcji
call factorial
movl 8(%ebp), %ebx		# %eax ma wartość powrotu, więc parametr do %ebx
imull %ebx, %eax		# mnożenie przez wynik ostatniego wywołania funkcji

end_factorial:
movl %ebp, %esp
popl %ebp
ret
