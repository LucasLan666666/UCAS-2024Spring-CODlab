
../riscv32/elf/if-else:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <start>:
   0:	00004137          	lui	sp,0x4
   4:	00c0006f          	j	10 <continued>
   8:	00000013          	nop

0000000c <global_result>:
   c:	ffff                	0xffff
   e:	ffff                	0xffff

00000010 <continued>:
  10:	114000ef          	jal	ra,124 <main>
  14:	05c000ef          	jal	ra,70 <hit_good_trap>

00000018 <_halt>:
  18:	fe010113          	addi	sp,sp,-32 # 3fe0 <ans+0x3dd0>
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

0000009c <if_else>:
  9c:	fd010113          	addi	sp,sp,-48
  a0:	02812623          	sw	s0,44(sp)
  a4:	03010413          	addi	s0,sp,48
  a8:	fca42e23          	sw	a0,-36(s0)
  ac:	fdc42703          	lw	a4,-36(s0)
  b0:	1f400793          	li	a5,500
  b4:	00e7d863          	bge	a5,a4,c4 <if_else+0x28>
  b8:	09600793          	li	a5,150
  bc:	fef42623          	sw	a5,-20(s0)
  c0:	0500006f          	j	110 <if_else+0x74>
  c4:	fdc42703          	lw	a4,-36(s0)
  c8:	12c00793          	li	a5,300
  cc:	00e7d863          	bge	a5,a4,dc <if_else+0x40>
  d0:	06400793          	li	a5,100
  d4:	fef42623          	sw	a5,-20(s0)
  d8:	0380006f          	j	110 <if_else+0x74>
  dc:	fdc42703          	lw	a4,-36(s0)
  e0:	06400793          	li	a5,100
  e4:	00e7d863          	bge	a5,a4,f4 <if_else+0x58>
  e8:	04b00793          	li	a5,75
  ec:	fef42623          	sw	a5,-20(s0)
  f0:	0200006f          	j	110 <if_else+0x74>
  f4:	fdc42703          	lw	a4,-36(s0)
  f8:	03200793          	li	a5,50
  fc:	00e7d863          	bge	a5,a4,10c <if_else+0x70>
 100:	03200793          	li	a5,50
 104:	fef42623          	sw	a5,-20(s0)
 108:	0080006f          	j	110 <if_else+0x74>
 10c:	fe042623          	sw	zero,-20(s0)
 110:	fec42783          	lw	a5,-20(s0)
 114:	00078513          	mv	a0,a5
 118:	02c12403          	lw	s0,44(sp)
 11c:	03010113          	addi	sp,sp,48
 120:	00008067          	ret

00000124 <main>:
 124:	fe010113          	addi	sp,sp,-32
 128:	00112e23          	sw	ra,28(sp)
 12c:	00812c23          	sw	s0,24(sp)
 130:	02010413          	addi	s0,sp,32
 134:	fe042423          	sw	zero,-24(s0)
 138:	fe042623          	sw	zero,-20(s0)
 13c:	0600006f          	j	19c <main+0x78>
 140:	fec42703          	lw	a4,-20(s0)
 144:	00271713          	slli	a4,a4,0x2
 148:	1d800793          	li	a5,472
 14c:	00f707b3          	add	a5,a4,a5
 150:	0007a783          	lw	a5,0(a5)
 154:	00078513          	mv	a0,a5
 158:	f45ff0ef          	jal	ra,9c <if_else>
 15c:	00050613          	mv	a2,a0
 160:	fe842783          	lw	a5,-24(s0)
 164:	00178713          	addi	a4,a5,1
 168:	fee42423          	sw	a4,-24(s0)
 16c:	00279713          	slli	a4,a5,0x2
 170:	21000793          	li	a5,528
 174:	00f707b3          	add	a5,a4,a5
 178:	0007a783          	lw	a5,0(a5)
 17c:	40f607b3          	sub	a5,a2,a5
 180:	0017b793          	seqz	a5,a5
 184:	0ff7f793          	andi	a5,a5,255
 188:	00078513          	mv	a0,a5
 18c:	eadff0ef          	jal	ra,38 <nemu_assert>
 190:	fec42783          	lw	a5,-20(s0)
 194:	00178793          	addi	a5,a5,1
 198:	fef42623          	sw	a5,-20(s0)
 19c:	fec42703          	lw	a4,-20(s0)
 1a0:	00d00793          	li	a5,13
 1a4:	f8e7fee3          	bgeu	a5,a4,140 <main+0x1c>
 1a8:	fec42783          	lw	a5,-20(s0)
 1ac:	ff278793          	addi	a5,a5,-14
 1b0:	0017b793          	seqz	a5,a5
 1b4:	0ff7f793          	andi	a5,a5,255
 1b8:	00078513          	mv	a0,a5
 1bc:	e7dff0ef          	jal	ra,38 <nemu_assert>
 1c0:	00000793          	li	a5,0
 1c4:	00078513          	mv	a0,a5
 1c8:	01c12083          	lw	ra,28(sp)
 1cc:	01812403          	lw	s0,24(sp)
 1d0:	02010113          	addi	sp,sp,32
 1d4:	00008067          	ret

Disassembly of section .data:

000001d8 <test_data>:
 1d8:	ffff                	0xffff
 1da:	ffff                	0xffff
 1dc:	0000                	unimp
 1de:	0000                	unimp
 1e0:	0031                	c.nop	12
 1e2:	0000                	unimp
 1e4:	0032                	c.slli	zero,0xc
 1e6:	0000                	unimp
 1e8:	00000033          	add	zero,zero,zero
 1ec:	00000063          	beqz	zero,1ec <test_data+0x14>
 1f0:	0064                	addi	s1,sp,12
 1f2:	0000                	unimp
 1f4:	0065                	c.nop	25
 1f6:	0000                	unimp
 1f8:	0000012b          	0x12b
 1fc:	012c                	addi	a1,sp,136
 1fe:	0000                	unimp
 200:	012d                	addi	sp,sp,11
 202:	0000                	unimp
 204:	000001f3          	0x1f3
 208:	01f4                	addi	a3,sp,204
 20a:	0000                	unimp
 20c:	01f5                	addi	gp,gp,29
	...

00000210 <ans>:
	...
 220:	0032                	c.slli	zero,0xc
 222:	0000                	unimp
 224:	0032                	c.slli	zero,0xc
 226:	0000                	unimp
 228:	0032                	c.slli	zero,0xc
 22a:	0000                	unimp
 22c:	0000004b          	fnmsub.s	ft0,ft0,ft0,ft0,rne
 230:	0000004b          	fnmsub.s	ft0,ft0,ft0,ft0,rne
 234:	0000004b          	fnmsub.s	ft0,ft0,ft0,ft0,rne
 238:	0064                	addi	s1,sp,12
 23a:	0000                	unimp
 23c:	0064                	addi	s1,sp,12
 23e:	0000                	unimp
 240:	0064                	addi	s1,sp,12
 242:	0000                	unimp
 244:	0096                	slli	ra,ra,0x5
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
