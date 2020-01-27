SYSEXIT = 1
SYSREAD = 3
SYSWRITE = 4
SYSOPEN = 5
STDIN = 0
STDOUT = 1
EXIT_SUCCESS = 0

.text
.globl dodaj
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
