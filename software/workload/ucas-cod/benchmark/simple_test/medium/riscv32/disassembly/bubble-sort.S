
../riscv32/elf/bubble-sort:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <start>:
   0:	00004137          	lui	sp,0x4
   4:	00c0006f          	j	10 <continued>
   8:	00000013          	nop

0000000c <global_result>:
   c:	ffff                	0xffff
   e:	ffff                	0xffff

00000010 <continued>:
  10:	07c000ef          	jal	ra,8c <main>
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

00000048 <bubble_sort>:
  48:	01300593          	li	a1,19
  4c:	1a800513          	li	a0,424
  50:	fff00813          	li	a6,-1
  54:	00000713          	li	a4,0
  58:	00050793          	mv	a5,a0
  5c:	02b75263          	bge	a4,a1,80 <bubble_sort+0x38>
  60:	0007a683          	lw	a3,0(a5)
  64:	0047a603          	lw	a2,4(a5)
  68:	00170713          	addi	a4,a4,1
  6c:	00d65663          	bge	a2,a3,78 <bubble_sort+0x30>
  70:	00c7a023          	sw	a2,0(a5)
  74:	00d7a223          	sw	a3,4(a5)
  78:	00478793          	addi	a5,a5,4
  7c:	feb742e3          	blt	a4,a1,60 <bubble_sort+0x18>
  80:	fff58593          	addi	a1,a1,-1
  84:	fd0598e3          	bne	a1,a6,54 <bubble_sort+0xc>
  88:	00008067          	ret

Disassembly of section .text.startup:

0000008c <main>:
  8c:	fe010113          	addi	sp,sp,-32 # 3fe0 <a+0x3e38>
  90:	01212823          	sw	s2,16(sp)
  94:	00112e23          	sw	ra,28(sp)
  98:	00812c23          	sw	s0,24(sp)
  9c:	00912a23          	sw	s1,20(sp)
  a0:	01312623          	sw	s3,12(sp)
  a4:	01412423          	sw	s4,8(sp)
  a8:	01300593          	li	a1,19
  ac:	1a800913          	li	s2,424
  b0:	fff00513          	li	a0,-1
  b4:	00000713          	li	a4,0
  b8:	00090493          	mv	s1,s2
  bc:	00090793          	mv	a5,s2
  c0:	02b75263          	bge	a4,a1,e4 <main+0x58>
  c4:	0007a683          	lw	a3,0(a5)
  c8:	0047a603          	lw	a2,4(a5)
  cc:	00170713          	addi	a4,a4,1
  d0:	00d65663          	bge	a2,a3,dc <main+0x50>
  d4:	00c7a023          	sw	a2,0(a5)
  d8:	00d7a223          	sw	a3,4(a5)
  dc:	00478793          	addi	a5,a5,4
  e0:	feb742e3          	blt	a4,a1,c4 <main+0x38>
  e4:	fff58593          	addi	a1,a1,-1
  e8:	fca596e3          	bne	a1,a0,b4 <main+0x28>
  ec:	00090993          	mv	s3,s2
  f0:	00000413          	li	s0,0
  f4:	01400a13          	li	s4,20
  f8:	0009a503          	lw	a0,0(s3)
  fc:	00498993          	addi	s3,s3,4
 100:	40850533          	sub	a0,a0,s0
 104:	00153513          	seqz	a0,a0
 108:	00140413          	addi	s0,s0,1
 10c:	f19ff0ef          	jal	ra,24 <nemu_assert>
 110:	ff4414e3          	bne	s0,s4,f8 <main+0x6c>
 114:	00100513          	li	a0,1
 118:	f0dff0ef          	jal	ra,24 <nemu_assert>
 11c:	01300593          	li	a1,19
 120:	fff00513          	li	a0,-1
 124:	00000713          	li	a4,0
 128:	00090793          	mv	a5,s2
 12c:	02b75263          	bge	a4,a1,150 <main+0xc4>
 130:	0007a683          	lw	a3,0(a5)
 134:	0047a603          	lw	a2,4(a5)
 138:	00170713          	addi	a4,a4,1
 13c:	00d65663          	bge	a2,a3,148 <main+0xbc>
 140:	00c7a023          	sw	a2,0(a5)
 144:	00d7a223          	sw	a3,4(a5)
 148:	00478793          	addi	a5,a5,4
 14c:	feb742e3          	blt	a4,a1,130 <main+0xa4>
 150:	fff58593          	addi	a1,a1,-1
 154:	fca598e3          	bne	a1,a0,124 <main+0x98>
 158:	00000413          	li	s0,0
 15c:	01400913          	li	s2,20
 160:	0004a503          	lw	a0,0(s1)
 164:	00448493          	addi	s1,s1,4
 168:	40850533          	sub	a0,a0,s0
 16c:	00153513          	seqz	a0,a0
 170:	00140413          	addi	s0,s0,1
 174:	eb1ff0ef          	jal	ra,24 <nemu_assert>
 178:	ff2414e3          	bne	s0,s2,160 <main+0xd4>
 17c:	00100513          	li	a0,1
 180:	ea5ff0ef          	jal	ra,24 <nemu_assert>
 184:	01c12083          	lw	ra,28(sp)
 188:	01812403          	lw	s0,24(sp)
 18c:	01412483          	lw	s1,20(sp)
 190:	01012903          	lw	s2,16(sp)
 194:	00c12983          	lw	s3,12(sp)
 198:	00812a03          	lw	s4,8(sp)
 19c:	00000513          	li	a0,0
 1a0:	02010113          	addi	sp,sp,32
 1a4:	00008067          	ret

Disassembly of section .data:

000001a8 <a>:
 1a8:	0002                	c.slli64	zero
 1aa:	0000                	unimp
 1ac:	000c                	0xc
 1ae:	0000                	unimp
 1b0:	000e                	c.slli	zero,0x3
 1b2:	0000                	unimp
 1b4:	0006                	c.slli	zero,0x1
 1b6:	0000                	unimp
 1b8:	000d                	c.nop	3
 1ba:	0000                	unimp
 1bc:	0000000f          	fence	unknown,unknown
 1c0:	0010                	0x10
 1c2:	0000                	unimp
 1c4:	000a                	c.slli	zero,0x2
 1c6:	0000                	unimp
 1c8:	0000                	unimp
 1ca:	0000                	unimp
 1cc:	0012                	c.slli	zero,0x4
 1ce:	0000                	unimp
 1d0:	0000000b          	0xb
 1d4:	00000013          	nop
 1d8:	0009                	c.nop	2
 1da:	0000                	unimp
 1dc:	0001                	nop
 1de:	0000                	unimp
 1e0:	00000007          	0x7
 1e4:	0005                	c.nop	1
 1e6:	0000                	unimp
 1e8:	0004                	0x4
 1ea:	0000                	unimp
 1ec:	00000003          	lb	zero,0(zero) # 0 <start>
 1f0:	0008                	0x8
 1f2:	0000                	unimp
 1f4:	0011                	c.nop	4
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
