.section .data
.section .text

.globl _start

# program ma na celu obliczenie 3^0 + 2^5

_start:
pushl $3		# drugi argument
pushl $0		# pierwszy argument
call power		# wywołanie funkcji
addl $8, %esp		# powrót wskaźnika stosu
pushl %eax		# zapisanie pierwszej odpowiedzi


pushl $2		# drugi argument
pushl $5		# pierwszy argument
call power		# wywołanie funkcji
addl $8, %esp		# powrót wskaźnika stosu
popl %ebx		# przeniesienie pierwszej odpowiedzi do %ebx
			# (druga jest już w %eax)

addl %eax, %ebx		# dodanie odpowiedzi (wynik w %ebx)

movl $1, %eax		# wyjście (%ebx jest zwracane)
int $0x80


# CEL: ta funkcja oblicza wartości liczby podniesionej do potęgi
#
# WEJŚCIE: 
#	pierwszy argument - liczba bazowa
#	drugi argument - potęga
#
# WYJŚCIE:
# 	wynik jako wartość zwracana w %eax
#
# UWAGI:
#
# ZMIENNE:
#	%ebx przechowuje podstawę
#	%ecx przechowuje potęgę
#
#	-4(%ebp) przechowuje bieżący wynik
#
#	%eax jest użyty jako tymczasowe miejsce przechowywania
#
#
# STRUKTURA:
#	Parametr #N 	<- N*4+4(%ebp)
#	...
#	Parametr 2 	<- 12(%ebp)
#	Parametr 1 	<- 8(%ebp)
#	Adres powrotu 	<- 4(%ebp)
#	Stare %ebp	<- (%ebp)
#	Zmienna 1	<- -4(%ebp)
#	Zmienna 2	<- -8(%ebp)
#	...
#	Zmienna #N	<- -N*4(%ebp) i (%esp)


.type power,@function
power:

pushl %ebp		# zapisanie starego wskaźnika bazowego
movl %esp, %ebp		# wskaźnik stosu wskaźnikiem bazowym
subl $4, %esp		# robi miejsce dla lokalnej zmiennej

movl 8(%ebp), %ecx	# wkłada pierwszy argument do %ecx (potęga)

cmpl $0, %ecx
movl $1, -4(%ebp)	# cokolwiek ^0 = 1
je end_power		# jeśli potęga 0 to kończymy

movl 12(%ebp), %ebx	# wkłada drugi argument do %ebx (podstawa)
movl %ebx, -4(%ebp)	# nasza zmienna lokalna, przechowuje bieżący wynik

power_loop_start:
cmpl $1, %ecx
je end_power		# jeśli potęga 1 to kończymy

movl -4(%ebp), %eax	# bieżący wynik do %eax
imull %ebx, %eax	# mnoży bieżący wynik przez liczbę bazową
movl %eax, -4(%ebp)	# zachowuje bieżący wynik
decl %ecx		# zmniejsza potęgę o 1

jmp power_loop_start	# uruchamia pętlę dla następnej potęgi

end_power:
movl -4(%ebp), %eax	# wartość powrotu do %eax
movl %ebp, %esp		# odbudowa wskaźnika stosu
popl %ebp		# odbudowa wskaźnika bazowego
ret

