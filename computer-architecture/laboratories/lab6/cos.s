.section .text
.globl cosd
.type cosd, @function
cosd:
push %ebp
movl %esp, %ebp

fldl 8(%ebp)
fcos

mov %ebp, %esp
pop %ebp

ret
