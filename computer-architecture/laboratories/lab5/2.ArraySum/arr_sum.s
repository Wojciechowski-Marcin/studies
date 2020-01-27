# Znaczenie rejestrow:
#
# %edi - indeks kolejnego elementu tablicy: 0,1,2,...,n
# %ecx - ilosc elementow tablicy
# %ebx - wskaznik na poczatek tablicy
# %edx - biezacy element tablicy
# %eax - suma

.section .text
.globl arr_sum
.type arr_sum, @function
arr_sum:
push %ebp
movl %esp, %ebp
movl 8(%ebp), %edx 	        # array ptr
movl 12(%ebp), %ecx 	    # array size
xorl %edi, %edi
movl $0, %eax

start_loop:
cmpl %edi, %ecx 	
je loop_exit 		        # czy koniec tablicy
addl (%edx,%edi,4), %eax 	# dodaj do elementu 1
incl %edi 		            # zwieksz indeks
jmp start_loop 		        # skocz na poczatek petli

loop_exit:
movl %ebp, %esp
pop %ebp
ret
