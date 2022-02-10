
../riscv32/elf/memcpy:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <start>:
   0:	00100293          	li	t0,1
   4:	00029663          	bnez	t0,10 <real_start>
   8:	00000013          	nop

0000000c <global_result>:
   c:	ffff                	0xffff
   e:	ffff                	0xffff

00000010 <real_start>:
  10:	00000513          	li	a0,0
  14:	06400593          	li	a1,100

00000018 <loop1>:
  18:	0ca52423          	sw	a0,200(a0)
  1c:	00450513          	addi	a0,a0,4
  20:	feb51ce3          	bne	a0,a1,18 <loop1>
  24:	00000513          	li	a0,0

00000028 <loop2>:
  28:	0c852603          	lw	a2,200(a0)
  2c:	12c52623          	sw	a2,300(a0)
  30:	00450513          	addi	a0,a0,4
  34:	feb51ae3          	bne	a0,a1,28 <loop2>
  38:	00000513          	li	a0,0

0000003c <check>:
  3c:	12c52603          	lw	a2,300(a0)
  40:	00a61a63          	bne	a2,a0,54 <bad_trap>
  44:	00450513          	addi	a0,a0,4
  48:	feb51ae3          	bne	a0,a1,3c <check>
  4c:	00100293          	li	t0,1
  50:	00029863          	bnez	t0,60 <good_trap>

00000054 <bad_trap>:
  54:	00100513          	li	a0,1
  58:	00100293          	li	t0,1
  5c:	00029463          	bnez	t0,64 <exit>

00000060 <good_trap>:
  60:	00000513          	li	a0,0

00000064 <exit>:
  64:	00a02623          	sw	a0,12(zero) # c <global_result>

00000068 <spin>:
  68:	00100293          	li	t0,1
  6c:	fe029ee3          	bnez	t0,68 <spin>
