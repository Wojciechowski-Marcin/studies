.section .text
.globl divd
.type divd, @function
divd:
push %ebp
movl %esp, %ebp

# a do st(0)
fldl 8(%ebp)

# b do st(0), a w st(1)
fldl 16(%ebp)

# wykonaj dzialanie
fdivrp
# wynik w st(0)

mov %ebp, %esp
pop %ebp

ret
