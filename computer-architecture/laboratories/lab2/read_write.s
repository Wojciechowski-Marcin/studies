SYSEXIT = 1
SYSREAD = 3
SYSWRITE = 4
SYSOPEN = 5
STDIN = 0
STDOUT = 1
EXIT_SUCCESS = 0

.data
msg_echo: .ascii "         "
msg_echo_len = . - msg_echo

.text
.global _start
_start:
movl $SYSREAD, %eax
movl $STDIN, %ebx
movl $msg_echo, %ecx
movl $msg_echo_len, %edx
int $0x80

movl $0, %edi
start_loop:
movb msg_echo(,%edi), %al
incl %edi
cmpl $msg_echo_len, %edi
je end_loop
cmpb $97, %al
jl start_loop
cmpb $122, %al
jg start_loop

decl %edi
movb msg_echo(,%edi,1), %al
subb $32, %al
movb %al, msg_echo(,%edi,1)
incl %edi
jmp start_loop
end_loop:

movl $SYSWRITE, %eax
movl $STDOUT, %ebx
movl $msg_echo, %ecx
movl $msg_echo_len, %edx
int $0x80

movl $SYSEXIT, %eax
movl $EXIT_SUCCESS, %ebx
int $0x80
