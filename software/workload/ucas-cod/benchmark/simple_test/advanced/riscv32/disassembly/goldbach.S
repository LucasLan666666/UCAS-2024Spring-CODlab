
../riscv32/elf/goldbach:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <start>:
   0:	00004137          	lui	sp,0x4
   4:	00c0006f          	j	10 <continued>
   8:	00000013          	nop

0000000c <global_result>:
   c:	ffff                	0xffff
   e:	ffff                	0xffff

00000010 <continued>:
  10:	10c000ef          	jal	ra,11c <main>
  14:	058000ef          	jal	ra,6c <hit_good_trap>

00000018 <is_prime.part.0>:
  18:	00200793          	li	a5,2
  1c:	02a7d063          	bge	a5,a0,3c <is_prime.part.0+0x24>
  20:	00200713          	li	a4,2
  24:	00050793          	mv	a5,a0
  28:	40e787b3          	sub	a5,a5,a4
  2c:	fee7dee3          	bge	a5,a4,28 <is_prime.part.0+0x10>
  30:	00078863          	beqz	a5,40 <is_prime.part.0+0x28>
  34:	00170713          	addi	a4,a4,1
  38:	fea716e3          	bne	a4,a0,24 <is_prime.part.0+0xc>
  3c:	00100793          	li	a5,1
  40:	00078513          	mv	a0,a5
  44:	00008067          	ret

00000048 <_halt>:
  48:	000007b7          	lui	a5,0x0
  4c:	00a7a623          	sw	a0,12(a5) # c <global_result>
  50:	0000006f          	j	50 <_halt+0x8>

00000054 <nemu_assert>:
  54:	00051a63          	bnez	a0,68 <nemu_assert+0x14>
  58:	000007b7          	lui	a5,0x0
  5c:	00100713          	li	a4,1
  60:	00e7a623          	sw	a4,12(a5) # c <global_result>
  64:	0000006f          	j	64 <nemu_assert+0x10>
  68:	00008067          	ret

0000006c <hit_good_trap>:
  6c:	000007b7          	lui	a5,0x0
  70:	0007a623          	sw	zero,12(a5) # c <global_result>
  74:	0000006f          	j	74 <hit_good_trap+0x8>

00000078 <is_prime>:
  78:	00100793          	li	a5,1
  7c:	00a7d463          	bge	a5,a0,84 <is_prime+0xc>
  80:	f99ff06f          	j	18 <is_prime.part.0>
  84:	00000513          	li	a0,0
  88:	00008067          	ret

0000008c <goldbach>:
  8c:	00200793          	li	a5,2
  90:	08a7d263          	bge	a5,a0,114 <goldbach+0x88>
  94:	ff010113          	addi	sp,sp,-16 # 3ff0 <main+0x3ed4>
  98:	00812423          	sw	s0,8(sp)
  9c:	00912223          	sw	s1,4(sp)
  a0:	01212023          	sw	s2,0(sp)
  a4:	00112623          	sw	ra,12(sp)
  a8:	00050493          	mv	s1,a0
  ac:	00200413          	li	s0,2
  b0:	00100913          	li	s2,1
  b4:	00040513          	mv	a0,s0
  b8:	f61ff0ef          	jal	ra,18 <is_prime.part.0>
  bc:	408487b3          	sub	a5,s1,s0
  c0:	00140413          	addi	s0,s0,1
  c4:	00050a63          	beqz	a0,d8 <goldbach+0x4c>
  c8:	00078513          	mv	a0,a5
  cc:	00f95663          	bge	s2,a5,d8 <goldbach+0x4c>
  d0:	f49ff0ef          	jal	ra,18 <is_prime.part.0>
  d4:	02051263          	bnez	a0,f8 <goldbach+0x6c>
  d8:	fc849ee3          	bne	s1,s0,b4 <goldbach+0x28>
  dc:	00c12083          	lw	ra,12(sp)
  e0:	00812403          	lw	s0,8(sp)
  e4:	00412483          	lw	s1,4(sp)
  e8:	00012903          	lw	s2,0(sp)
  ec:	00000513          	li	a0,0
  f0:	01010113          	addi	sp,sp,16
  f4:	00008067          	ret
  f8:	00c12083          	lw	ra,12(sp)
  fc:	00812403          	lw	s0,8(sp)
 100:	00412483          	lw	s1,4(sp)
 104:	00012903          	lw	s2,0(sp)
 108:	00100513          	li	a0,1
 10c:	01010113          	addi	sp,sp,16
 110:	00008067          	ret
 114:	00000513          	li	a0,0
 118:	00008067          	ret

Disassembly of section .text.startup:

0000011c <main>:
 11c:	ff010113          	addi	sp,sp,-16
 120:	00812423          	sw	s0,8(sp)
 124:	00912223          	sw	s1,4(sp)
 128:	00112623          	sw	ra,12(sp)
 12c:	00400413          	li	s0,4
 130:	02000493          	li	s1,32
 134:	00040513          	mv	a0,s0
 138:	f55ff0ef          	jal	ra,8c <goldbach>
 13c:	fff50513          	addi	a0,a0,-1
 140:	00240413          	addi	s0,s0,2
 144:	00153513          	seqz	a0,a0
 148:	f0dff0ef          	jal	ra,54 <nemu_assert>
 14c:	fe9414e3          	bne	s0,s1,134 <main+0x18>
 150:	00c12083          	lw	ra,12(sp)
 154:	00812403          	lw	s0,8(sp)
 158:	00412483          	lw	s1,4(sp)
 15c:	00000513          	li	a0,0
 160:	01010113          	addi	sp,sp,16
 164:	00008067          	ret

Disassembly of section .comment:

00000000 <.comment>:
   0:	3a434347          	fmsub.d	ft6,ft6,ft4,ft7,rmm
   4:	2820                	fld	fs0,80(s0)
   6:	29554e47          	fmsub.s	ft8,fa0,fs5,ft5,rmm
   a:	3820                	fld	fs0,112(s0)
   c:	322e                	fld	ft4,232(sp)
   e:	302e                	fld	ft0,232(sp)
	...
