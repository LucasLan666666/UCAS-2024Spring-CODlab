.globl global_result
.globl dma_buf_stat
.globl start 
.globl _SP_START_
.type start, @function
.section .start

start:
        li $sp, 0x4000
        j continued 
        # nop here

global_result:
        .word 0xffffffff

dma_buf_stat:
        .word 0x0

continued:
        la $sp, _SP_START_
        jal main
        jal hit_good_trap
