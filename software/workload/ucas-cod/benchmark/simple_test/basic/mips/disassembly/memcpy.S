
../mips/elf/memcpy:     file format elf32-littlemips


Disassembly of section .text:

00000000 <start>:
   0:	241a0001 	li	k0,1
   4:	17400002 	bnez	k0,10 <real_start>
   8:	00000000 	nop

0000000c <global_result>:
   c:	ffffffff 	sdc3	$31,-1(ra)

00000010 <real_start>:
  10:	24040000 	li	a0,0
  14:	24050064 	li	a1,100

00000018 <loop1>:
  18:	ac8400c8 	sw	a0,200(a0)
  1c:	24840004 	addiu	a0,a0,4
  20:	1485fffd 	bne	a0,a1,18 <loop1>
  24:	00000000 	nop
  28:	24040000 	li	a0,0

0000002c <loop2>:
  2c:	8c8600c8 	lw	a2,200(a0)
  30:	ac86012c 	sw	a2,300(a0)
  34:	24840004 	addiu	a0,a0,4
  38:	1485fffc 	bne	a0,a1,2c <loop2>
  3c:	00000000 	nop
  40:	24040000 	li	a0,0

00000044 <check>:
  44:	8c86012c 	lw	a2,300(a0)
  48:	14c40007 	bne	a2,a0,68 <bad_trap>
  4c:	00000000 	nop
  50:	24840004 	addiu	a0,a0,4
  54:	1485fffb 	bne	a0,a1,44 <check>
  58:	00000000 	nop
  5c:	241a0001 	li	k0,1
  60:	17400005 	bnez	k0,78 <good_trap>
  64:	00000000 	nop

00000068 <bad_trap>:
  68:	24040001 	li	a0,1
  6c:	241a0001 	li	k0,1
  70:	17400002 	bnez	k0,7c <exit>
  74:	00000000 	nop

00000078 <good_trap>:
  78:	24040000 	li	a0,0

0000007c <exit>:
  7c:	ac04000c 	sw	a0,12(zero)

00000080 <spin>:
  80:	241a0001 	li	k0,1
  84:	1740fffe 	bnez	k0,80 <spin>
  88:	00000000 	nop
