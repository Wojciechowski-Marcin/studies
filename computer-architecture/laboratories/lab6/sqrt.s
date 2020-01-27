.section .text
.globl sqrt
.type sqrt, @function
sqrt:
push %ebp
movl %esp, %ebp

fldl 8(%ebp)
fsqrt

mov %ebp, %esp
pop %ebp

ret
