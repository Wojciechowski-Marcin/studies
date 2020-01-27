SYSEXIT = 1
SYSREAD = 3
SYSWRITE = 4
SYSOPEN = 5
STDIN = 0
STDOUT = 1
EXIT_SUCCESS = 0

.data
i1: .long 0
i2: .long 0
stringIn: .ascii "%d\0"
stringOut: .ascii "Wynik dodawania: %d\n\0"

.text
.globl main

main:

# wczytanie znakow
pushl $i1
pushl $stringIn
call scanf
pop %ebx
pop %ebx
pushl $i2
pushl $stringIn
call scanf
pop %ebx
pop %ebx

pushl i1	# drugi argument
pushl i2	# pierwszy argument
call dodaj
 
# wyswietlenie wyniku
pushl %eax
pushl $stringOut
call printf
pop %ebx
pop %ebx

movl %eax, %ebx
movl $SYSEXIT, %eax
int $0x80

.type dodaj, @function
dodaj:
pushl %ebp
movl %esp, %ebp
pushl %ebx
movl 8(%ebp), %eax	# pierwszy argument
movl 12(%ebp), %ebx	# drugi argument
add %ebx, %eax
popl %ebx
popl %ebp
ret
