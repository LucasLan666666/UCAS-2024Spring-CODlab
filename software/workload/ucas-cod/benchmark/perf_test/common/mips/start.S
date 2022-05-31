.globl global_result
.globl start 
.type start, @function

start:
  li $sp, 0x100000
  j continued 
  # nop here
global_result:
  .word 0xffffffff

continued:
  jal main
  jal hit_good_trap
