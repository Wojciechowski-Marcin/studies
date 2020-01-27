.section .text
.globl absd
.type absd, @function
absd:
push %ebp
movl %esp, %ebp

fldl 8(%ebp)
fabs

mov %ebp, %esp
pop %ebp

ret
