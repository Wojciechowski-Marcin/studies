# znajdowanie maksimum w tablicy tablica
# wynik jest zwracany jako kod wyjściowy programu 
#   ( wynik jest wyświetlany po wpisaniu komendy $? w terminalu )
# rejestr %edi - indeks tablicy
# rejestr %ebx - aktualnie najwiekszy element
# rejestr %eax - biezacy element

.section .data
 tablica: # To są dane w tablicy zawierającej liczby long
.long 3,67,34,224,45,75,54,34,44,33,22,11,66,0

.section .text
.globl _start

_start:
movl $0, %edi 			        # przeslij 0 do rejestru indeksowego
movl tablica(,%edi,4), %eax 	# przeslij do eax kolejna liczbe z tablicy
movl %eax, %ebx 		        # pierwszy element jest na razie najwiekszy
start_loop: 			        # start petli
cmpl $0, %eax 			        # sprawdz czy koniec tablicy (jest tam 0)
je loop_exit			        # (jump equal)
incl %edi 			            # zwieksz licznik
movl tablica(,%edi,4), %eax
cmpl %ebx, %eax 		        # porownaj czy %eax wiekszy od maksimum
jle start_loop 			        # skocz do poczatku petli gdyz %eax jest mniejszy od max (jump less or equal)
movl %eax, %ebx 		        # w %eax jest aktualne maksimum
jmp start_loop 			        # skocz na oczatek petli
loop_exit:			            # %ebx zawiera kod powrotu funkcji exit
movl $1, %eax 			        # $1 jest kodem wywolania funkcji exit
int $0x80
