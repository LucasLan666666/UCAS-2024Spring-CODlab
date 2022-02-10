.globl global_result
.globl start 
.type start, @function

start:
#ifdef MICROBENCH
  li sp, 0x10000000
#else
  li sp, 0x4000
#endif
  j continued 
  nop

global_result:
  .word 0xffffffff

continued:
  jal main
  jal hit_good_trap
