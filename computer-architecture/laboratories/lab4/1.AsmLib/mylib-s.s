STD_IN = 0
STD_OUT = 1

.include "mylib.s"
.data
hello_world:
.ascii "           "
hello_world_len = . - hello_world

.text
.globl _start

_start:

pushl $hello_world_len
pushl $hello_world
pushl $STD_IN
call read

pushl $hello_world_len
pushl $hello_world
pushl $STD_OUT
call write
call exit
