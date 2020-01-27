.section .text
.globl sind
.type sind, @function
sind:
push %ebp
movl %esp, %ebp

fldl 8(%ebp)
fsin

mov %ebp, %esp
pop %ebp

ret
