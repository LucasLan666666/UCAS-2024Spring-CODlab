
../riscv32/elf/select-sort:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <start>:
   0:	00004137          	lui	sp,0x4
   4:	00c0006f          	j	10 <continued>
   8:	00000013          	nop

0000000c <global_result>:
   c:	ffff                	0xffff
   e:	ffff                	0xffff

00000010 <continued>:
  10:	184000ef          	jal	ra,194 <main>
  14:	05c000ef          	jal	ra,70 <hit_good_trap>

00000018 <_halt>:
  18:	fe010113          	addi	sp,sp,-32 # 3fe0 <a+0x3d54>
  1c:	00812e23          	sw	s0,28(sp)
  20:	02010413          	addi	s0,sp,32
  24:	fea42623          	sw	a0,-20(s0)
  28:	000007b7          	lui	a5,0x0
  2c:	fec42703          	lw	a4,-20(s0)
  30:	00e7a623          	sw	a4,12(a5) # c <global_result>
  34:	0000006f          	j	34 <_halt+0x1c>

00000038 <nemu_assert>:
  38:	fe010113          	addi	sp,sp,-32
  3c:	00112e23          	sw	ra,28(sp)
  40:	00812c23          	sw	s0,24(sp)
  44:	02010413          	addi	s0,sp,32
  48:	fea42623          	sw	a0,-20(s0)
  4c:	fec42783          	lw	a5,-20(s0)
  50:	00079663          	bnez	a5,5c <nemu_assert+0x24>
  54:	00100513          	li	a0,1
  58:	fc1ff0ef          	jal	ra,18 <_halt>
  5c:	00000013          	nop
  60:	01c12083          	lw	ra,28(sp)
  64:	01812403          	lw	s0,24(sp)
  68:	02010113          	addi	sp,sp,32
  6c:	00008067          	ret

00000070 <hit_good_trap>:
  70:	ff010113          	addi	sp,sp,-16
  74:	00112623          	sw	ra,12(sp)
  78:	00812423          	sw	s0,8(sp)
  7c:	01010413          	addi	s0,sp,16
  80:	00000513          	li	a0,0
  84:	f95ff0ef          	jal	ra,18 <_halt>
  88:	00000013          	nop
  8c:	00c12083          	lw	ra,12(sp)
  90:	00812403          	lw	s0,8(sp)
  94:	01010113          	addi	sp,sp,16
  98:	00008067          	ret

0000009c <select_sort>:
  9c:	fe010113          	addi	sp,sp,-32
  a0:	00812e23          	sw	s0,28(sp)
  a4:	02010413          	addi	s0,sp,32
  a8:	fe042623          	sw	zero,-20(s0)
  ac:	0cc0006f          	j	178 <select_sort+0xdc>
  b0:	fec42783          	lw	a5,-20(s0)
  b4:	fef42223          	sw	a5,-28(s0)
  b8:	fec42783          	lw	a5,-20(s0)
  bc:	00178793          	addi	a5,a5,1
  c0:	fef42423          	sw	a5,-24(s0)
  c4:	0440006f          	j	108 <select_sort+0x6c>
  c8:	fe842703          	lw	a4,-24(s0)
  cc:	00271713          	slli	a4,a4,0x2
  d0:	28c00793          	li	a5,652
  d4:	00f707b3          	add	a5,a4,a5
  d8:	0007a703          	lw	a4,0(a5)
  dc:	fe442683          	lw	a3,-28(s0)
  e0:	00269693          	slli	a3,a3,0x2
  e4:	28c00793          	li	a5,652
  e8:	00f687b3          	add	a5,a3,a5
  ec:	0007a783          	lw	a5,0(a5)
  f0:	00f75663          	bge	a4,a5,fc <select_sort+0x60>
  f4:	fe842783          	lw	a5,-24(s0)
  f8:	fef42223          	sw	a5,-28(s0)
  fc:	fe842783          	lw	a5,-24(s0)
 100:	00178793          	addi	a5,a5,1
 104:	fef42423          	sw	a5,-24(s0)
 108:	fe842703          	lw	a4,-24(s0)
 10c:	01300793          	li	a5,19
 110:	fae7dce3          	bge	a5,a4,c8 <select_sort+0x2c>
 114:	fec42703          	lw	a4,-20(s0)
 118:	00271713          	slli	a4,a4,0x2
 11c:	28c00793          	li	a5,652
 120:	00f707b3          	add	a5,a4,a5
 124:	0007a783          	lw	a5,0(a5)
 128:	fef42023          	sw	a5,-32(s0)
 12c:	fe442703          	lw	a4,-28(s0)
 130:	00271713          	slli	a4,a4,0x2
 134:	28c00793          	li	a5,652
 138:	00f707b3          	add	a5,a4,a5
 13c:	0007a703          	lw	a4,0(a5)
 140:	fec42683          	lw	a3,-20(s0)
 144:	00269693          	slli	a3,a3,0x2
 148:	28c00793          	li	a5,652
 14c:	00f687b3          	add	a5,a3,a5
 150:	00e7a023          	sw	a4,0(a5)
 154:	fe442703          	lw	a4,-28(s0)
 158:	00271713          	slli	a4,a4,0x2
 15c:	28c00793          	li	a5,652
 160:	00f707b3          	add	a5,a4,a5
 164:	fe042703          	lw	a4,-32(s0)
 168:	00e7a023          	sw	a4,0(a5)
 16c:	fec42783          	lw	a5,-20(s0)
 170:	00178793          	addi	a5,a5,1
 174:	fef42623          	sw	a5,-20(s0)
 178:	fec42703          	lw	a4,-20(s0)
 17c:	01200793          	li	a5,18
 180:	f2e7d8e3          	bge	a5,a4,b0 <select_sort+0x14>
 184:	00000013          	nop
 188:	01c12403          	lw	s0,28(sp)
 18c:	02010113          	addi	sp,sp,32
 190:	00008067          	ret

00000194 <main>:
 194:	fe010113          	addi	sp,sp,-32
 198:	00112e23          	sw	ra,28(sp)
 19c:	00812c23          	sw	s0,24(sp)
 1a0:	02010413          	addi	s0,sp,32
 1a4:	ef9ff0ef          	jal	ra,9c <select_sort>
 1a8:	fe042623          	sw	zero,-20(s0)
 1ac:	03c0006f          	j	1e8 <main+0x54>
 1b0:	fec42703          	lw	a4,-20(s0)
 1b4:	00271713          	slli	a4,a4,0x2
 1b8:	28c00793          	li	a5,652
 1bc:	00f707b3          	add	a5,a4,a5
 1c0:	0007a783          	lw	a5,0(a5)
 1c4:	fec42703          	lw	a4,-20(s0)
 1c8:	40f707b3          	sub	a5,a4,a5
 1cc:	0017b793          	seqz	a5,a5
 1d0:	0ff7f793          	andi	a5,a5,255
 1d4:	00078513          	mv	a0,a5
 1d8:	e61ff0ef          	jal	ra,38 <nemu_assert>
 1dc:	fec42783          	lw	a5,-20(s0)
 1e0:	00178793          	addi	a5,a5,1
 1e4:	fef42623          	sw	a5,-20(s0)
 1e8:	fec42703          	lw	a4,-20(s0)
 1ec:	01300793          	li	a5,19
 1f0:	fce7d0e3          	bge	a5,a4,1b0 <main+0x1c>
 1f4:	fec42783          	lw	a5,-20(s0)
 1f8:	fec78793          	addi	a5,a5,-20
 1fc:	0017b793          	seqz	a5,a5
 200:	0ff7f793          	andi	a5,a5,255
 204:	00078513          	mv	a0,a5
 208:	e31ff0ef          	jal	ra,38 <nemu_assert>
 20c:	e91ff0ef          	jal	ra,9c <select_sort>
 210:	fe042623          	sw	zero,-20(s0)
 214:	03c0006f          	j	250 <main+0xbc>
 218:	fec42703          	lw	a4,-20(s0)
 21c:	00271713          	slli	a4,a4,0x2
 220:	28c00793          	li	a5,652
 224:	00f707b3          	add	a5,a4,a5
 228:	0007a783          	lw	a5,0(a5)
 22c:	fec42703          	lw	a4,-20(s0)
 230:	40f707b3          	sub	a5,a4,a5
 234:	0017b793          	seqz	a5,a5
 238:	0ff7f793          	andi	a5,a5,255
 23c:	00078513          	mv	a0,a5
 240:	df9ff0ef          	jal	ra,38 <nemu_assert>
 244:	fec42783          	lw	a5,-20(s0)
 248:	00178793          	addi	a5,a5,1
 24c:	fef42623          	sw	a5,-20(s0)
 250:	fec42703          	lw	a4,-20(s0)
 254:	01300793          	li	a5,19
 258:	fce7d0e3          	bge	a5,a4,218 <main+0x84>
 25c:	fec42783          	lw	a5,-20(s0)
 260:	fec78793          	addi	a5,a5,-20
 264:	0017b793          	seqz	a5,a5
 268:	0ff7f793          	andi	a5,a5,255
 26c:	00078513          	mv	a0,a5
 270:	dc9ff0ef          	jal	ra,38 <nemu_assert>
 274:	00000793          	li	a5,0
 278:	00078513          	mv	a0,a5
 27c:	01c12083          	lw	ra,28(sp)
 280:	01812403          	lw	s0,24(sp)
 284:	02010113          	addi	sp,sp,32
 288:	00008067          	ret

Disassembly of section .data:

0000028c <a>:
 28c:	0002                	c.slli64	zero
 28e:	0000                	unimp
 290:	000c                	0xc
 292:	0000                	unimp
 294:	000e                	c.slli	zero,0x3
 296:	0000                	unimp
 298:	0006                	c.slli	zero,0x1
 29a:	0000                	unimp
 29c:	000d                	c.nop	3
 29e:	0000                	unimp
 2a0:	0000000f          	fence	unknown,unknown
 2a4:	0010                	0x10
 2a6:	0000                	unimp
 2a8:	000a                	c.slli	zero,0x2
 2aa:	0000                	unimp
 2ac:	0000                	unimp
 2ae:	0000                	unimp
 2b0:	0012                	c.slli	zero,0x4
 2b2:	0000                	unimp
 2b4:	0000000b          	0xb
 2b8:	00000013          	nop
 2bc:	0009                	c.nop	2
 2be:	0000                	unimp
 2c0:	0001                	nop
 2c2:	0000                	unimp
 2c4:	00000007          	0x7
 2c8:	0005                	c.nop	1
 2ca:	0000                	unimp
 2cc:	0004                	0x4
 2ce:	0000                	unimp
 2d0:	00000003          	lb	zero,0(zero) # 0 <start>
 2d4:	0008                	0x8
 2d6:	0000                	unimp
 2d8:	0011                	c.nop	4
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
