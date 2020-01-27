.section .text
.globl sub
.type sub, @function
sub:
push %ebp
movl %esp, %ebp

# a do st(0)
fldl 8(%ebp)

# b do st(0), a w st(1)
fldl 16(%ebp)

# wykonaj dzialanie
fsubp
# wynik w st(0)

# przywracamy stos
mov %ebp, %esp
pop %ebp

ret
