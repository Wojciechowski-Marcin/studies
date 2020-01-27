SYSEXIT = 1
SYSREAD = 3
SYSWRITE = 4
SYSOPEN = 5
STDIN = 0
STDOUT = 1
EXIT_SUCCESS = 0

.data
threeBytes: .ascii "   "

.bss
.lcomm oneByte, 1

.text
.global _start
_start:
movl $SYSREAD, %eax
movl $STDIN, %ebx
movl $oneByte, %ecx
movl $1, %edx
int $0x80
cmpl $1, %eax
jne end

mov $1, %edi
movb oneByte, %al
andb $15, %al
cmpb $10, %al
jge greater1
addb $48, %al
movb %al, threeBytes(,%edi) 
jmp second
greater1:
addb $55, %al
movb %al, threeBytes(,%edi) 

second:
decl %edi
movb oneByte, %al
shrb $4, %al
cmpb $10, %al
jge greater2
addb $48, %al
movb %al, threeBytes(,%edi)
jmp read
greater2:
addb $55, %al
movb %al, threeBytes(,%edi)

read:
movl $SYSWRITE, %eax
movl $STDOUT, %ebx
movl $threeBytes, %ecx
movl $3, %edx
int $0x80
jmp _start

end:
movl $SYSEXIT, %eax
movl $EXIT_SUCCESS, %ebx
int $0x80
