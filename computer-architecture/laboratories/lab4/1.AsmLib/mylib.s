SYS_EXIT = 1
SYS_READ = 3
SYS_WRITE = 4
SYS_OPEN = 5
EXIT_SUCCESS = 0

.text

.type read, @function
read:
pushl %ebp
movl %esp, %ebp
movl $SYS_READ, %eax
movl 8(%ebp), %ebx
movl 12(%ebp), %ecx
movl 16(%ebp), %edx
int $0x80
movl %ebp, %esp
popl %ebp
ret

.type write, @function
write:
pushl %ebp
movl %esp, %ebp
movl $SYS_WRITE, %eax
movl 8(%ebp), %ebx
movl 12(%ebp), %ecx
movl 16(%ebp), %edx
int $0x80
movl %ebp, %esp
popl %ebp
ret


.type exit, @function
exit:
pushl %ebp
movl %esp, %ebp
movl $SYS_EXIT, %eax
movl $EXIT_SUCCESS, %ebx
int $0x80
movl %ebp, %esp
popl %ebp
ret
