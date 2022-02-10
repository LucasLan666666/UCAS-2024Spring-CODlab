
../riscv32/elf/mov-c:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <start>:
   0:	00004137          	lui	sp,0x4
   4:	00c0006f          	j	10 <continued>
   8:	00000013          	nop

0000000c <global_result>:
   c:	ffff                	0xffff
   e:	ffff                	0xffff

00000010 <continued>:
  10:	038000ef          	jal	ra,48 <main>
  14:	028000ef          	jal	ra,3c <hit_good_trap>

00000018 <_halt>:
  18:	000007b7          	lui	a5,0x0
  1c:	00a7a623          	sw	a0,12(a5) # c <global_result>
  20:	0000006f          	j	20 <_halt+0x8>

00000024 <nemu_assert>:
  24:	00051a63          	bnez	a0,38 <nemu_assert+0x14>
  28:	000007b7          	lui	a5,0x0
  2c:	00100713          	li	a4,1
  30:	00e7a623          	sw	a4,12(a5) # c <global_result>
  34:	0000006f          	j	34 <nemu_assert+0x10>
  38:	00008067          	ret

0000003c <hit_good_trap>:
  3c:	000007b7          	lui	a5,0x0
  40:	0007a623          	sw	zero,12(a5) # c <global_result>
  44:	0000006f          	j	44 <hit_good_trap+0x8>

Disassembly of section .text.startup:

00000048 <main>:
  48:	ff010113          	addi	sp,sp,-16 # 3ff0 <A+0x3ee4>
  4c:	00812423          	sw	s0,8(sp)
  50:	10002623          	sw	zero,268(zero) # 10c <A>
  54:	10c00413          	li	s0,268
  58:	00100713          	li	a4,1
  5c:	00e42223          	sw	a4,4(s0)
  60:	00200713          	li	a4,2
  64:	00300793          	li	a5,3
  68:	00912223          	sw	s1,4(sp)
  6c:	00e42423          	sw	a4,8(s0)
  70:	00400713          	li	a4,4
  74:	00100513          	li	a0,1
  78:	00112623          	sw	ra,12(sp)
  7c:	00f42623          	sw	a5,12(s0)
  80:	00e42823          	sw	a4,16(s0)
  84:	10f02423          	sw	a5,264(zero) # 108 <b>
  88:	00f42a23          	sw	a5,20(s0)
  8c:	f99ff0ef          	jal	ra,24 <nemu_assert>
  90:	00442503          	lw	a0,4(s0)
  94:	fff50513          	addi	a0,a0,-1
  98:	00153513          	seqz	a0,a0
  9c:	f89ff0ef          	jal	ra,24 <nemu_assert>
  a0:	00842503          	lw	a0,8(s0)
  a4:	ffe50513          	addi	a0,a0,-2
  a8:	00153513          	seqz	a0,a0
  ac:	f79ff0ef          	jal	ra,24 <nemu_assert>
  b0:	00c42503          	lw	a0,12(s0)
  b4:	ffd50513          	addi	a0,a0,-3
  b8:	00153513          	seqz	a0,a0
  bc:	f69ff0ef          	jal	ra,24 <nemu_assert>
  c0:	01042503          	lw	a0,16(s0)
  c4:	ffc50513          	addi	a0,a0,-4
  c8:	00153513          	seqz	a0,a0
  cc:	f59ff0ef          	jal	ra,24 <nemu_assert>
  d0:	10802503          	lw	a0,264(zero) # 108 <b>
  d4:	ffd50513          	addi	a0,a0,-3
  d8:	00153513          	seqz	a0,a0
  dc:	f49ff0ef          	jal	ra,24 <nemu_assert>
  e0:	01442503          	lw	a0,20(s0)
  e4:	ffd50513          	addi	a0,a0,-3
  e8:	00153513          	seqz	a0,a0
  ec:	f39ff0ef          	jal	ra,24 <nemu_assert>
  f0:	00c12083          	lw	ra,12(sp)
  f4:	00812403          	lw	s0,8(sp)
  f8:	00412483          	lw	s1,4(sp)
  fc:	00000513          	li	a0,0
 100:	01010113          	addi	sp,sp,16
 104:	00008067          	ret

Disassembly of section .bss:

00000108 <b>:
 108:	0000                	unimp
	...

0000010c <A>:
	...

Disassembly of section .comment:

00000000 <.comment>:
   0:	3a434347          	fmsub.d	ft6,ft6,ft4,ft7,rmm
   4:	2820                	fld	fs0,80(s0)
   6:	29554e47          	fmsub.s	ft8,fa0,fs5,ft5,rmm
   a:	3820                	fld	fs0,112(s0)
   c:	322e                	fld	ft4,232(sp)
   e:	302e                	fld	ft0,232(sp)
	...
