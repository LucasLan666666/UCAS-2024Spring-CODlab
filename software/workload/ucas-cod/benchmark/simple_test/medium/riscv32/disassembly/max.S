
../riscv32/elf/max:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <start>:
   0:	00004137          	lui	sp,0x4
   4:	00c0006f          	j	10 <continued>
   8:	00000013          	nop

0000000c <global_result>:
   c:	ffff                	0xffff
   e:	ffff                	0xffff

00000010 <continued>:
  10:	0d4000ef          	jal	ra,e4 <main>
  14:	05c000ef          	jal	ra,70 <hit_good_trap>

00000018 <_halt>:
  18:	fe010113          	addi	sp,sp,-32 # 3fe0 <ans+0x3dd8>
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

0000009c <max>:
  9c:	fd010113          	addi	sp,sp,-48
  a0:	02812623          	sw	s0,44(sp)
  a4:	03010413          	addi	s0,sp,48
  a8:	fca42e23          	sw	a0,-36(s0)
  ac:	fcb42c23          	sw	a1,-40(s0)
  b0:	fdc42703          	lw	a4,-36(s0)
  b4:	fd842783          	lw	a5,-40(s0)
  b8:	00e7d863          	bge	a5,a4,c8 <max+0x2c>
  bc:	fdc42783          	lw	a5,-36(s0)
  c0:	fef42623          	sw	a5,-20(s0)
  c4:	00c0006f          	j	d0 <max+0x34>
  c8:	fd842783          	lw	a5,-40(s0)
  cc:	fef42623          	sw	a5,-20(s0)
  d0:	fec42783          	lw	a5,-20(s0)
  d4:	00078513          	mv	a0,a5
  d8:	02c12403          	lw	s0,44(sp)
  dc:	03010113          	addi	sp,sp,48
  e0:	00008067          	ret

000000e4 <main>:
  e4:	fe010113          	addi	sp,sp,-32
  e8:	00112e23          	sw	ra,28(sp)
  ec:	00812c23          	sw	s0,24(sp)
  f0:	02010413          	addi	s0,sp,32
  f4:	fe042223          	sw	zero,-28(s0)
  f8:	fe042623          	sw	zero,-20(s0)
  fc:	0b00006f          	j	1ac <main+0xc8>
 100:	fe042423          	sw	zero,-24(s0)
 104:	0780006f          	j	17c <main+0x98>
 108:	fec42703          	lw	a4,-20(s0)
 10c:	00271713          	slli	a4,a4,0x2
 110:	1e800793          	li	a5,488
 114:	00f707b3          	add	a5,a4,a5
 118:	0007a683          	lw	a3,0(a5)
 11c:	fe842703          	lw	a4,-24(s0)
 120:	00271713          	slli	a4,a4,0x2
 124:	1e800793          	li	a5,488
 128:	00f707b3          	add	a5,a4,a5
 12c:	0007a783          	lw	a5,0(a5)
 130:	00078593          	mv	a1,a5
 134:	00068513          	mv	a0,a3
 138:	f65ff0ef          	jal	ra,9c <max>
 13c:	00050613          	mv	a2,a0
 140:	fe442783          	lw	a5,-28(s0)
 144:	00178713          	addi	a4,a5,1
 148:	fee42223          	sw	a4,-28(s0)
 14c:	00279713          	slli	a4,a5,0x2
 150:	20800793          	li	a5,520
 154:	00f707b3          	add	a5,a4,a5
 158:	0007a783          	lw	a5,0(a5)
 15c:	40f607b3          	sub	a5,a2,a5
 160:	0017b793          	seqz	a5,a5
 164:	0ff7f793          	andi	a5,a5,255
 168:	00078513          	mv	a0,a5
 16c:	ecdff0ef          	jal	ra,38 <nemu_assert>
 170:	fe842783          	lw	a5,-24(s0)
 174:	00178793          	addi	a5,a5,1
 178:	fef42423          	sw	a5,-24(s0)
 17c:	fe842703          	lw	a4,-24(s0)
 180:	00700793          	li	a5,7
 184:	f8e7f2e3          	bgeu	a5,a4,108 <main+0x24>
 188:	fe842783          	lw	a5,-24(s0)
 18c:	ff878793          	addi	a5,a5,-8
 190:	0017b793          	seqz	a5,a5
 194:	0ff7f793          	andi	a5,a5,255
 198:	00078513          	mv	a0,a5
 19c:	e9dff0ef          	jal	ra,38 <nemu_assert>
 1a0:	fec42783          	lw	a5,-20(s0)
 1a4:	00178793          	addi	a5,a5,1
 1a8:	fef42623          	sw	a5,-20(s0)
 1ac:	fec42703          	lw	a4,-20(s0)
 1b0:	00700793          	li	a5,7
 1b4:	f4e7f6e3          	bgeu	a5,a4,100 <main+0x1c>
 1b8:	fec42783          	lw	a5,-20(s0)
 1bc:	ff878793          	addi	a5,a5,-8
 1c0:	0017b793          	seqz	a5,a5
 1c4:	0ff7f793          	andi	a5,a5,255
 1c8:	00078513          	mv	a0,a5
 1cc:	e6dff0ef          	jal	ra,38 <nemu_assert>
 1d0:	00000793          	li	a5,0
 1d4:	00078513          	mv	a0,a5
 1d8:	01c12083          	lw	ra,28(sp)
 1dc:	01812403          	lw	s0,24(sp)
 1e0:	02010113          	addi	sp,sp,32
 1e4:	00008067          	ret

Disassembly of section .data:

000001e8 <test_data>:
 1e8:	0000                	unimp
 1ea:	0000                	unimp
 1ec:	0001                	nop
 1ee:	0000                	unimp
 1f0:	0002                	c.slli64	zero
 1f2:	0000                	unimp
 1f4:	ffff                	0xffff
 1f6:	7fff                	0x7fff
 1f8:	0000                	unimp
 1fa:	8000                	0x8000
 1fc:	0001                	nop
 1fe:	8000                	0x8000
 200:	fffe                	fsw	ft11,252(sp)
 202:	ffff                	0xffff
 204:	ffff                	0xffff
 206:	ffff                	0xffff

00000208 <ans>:
 208:	0000                	unimp
 20a:	0000                	unimp
 20c:	0001                	nop
 20e:	0000                	unimp
 210:	0002                	c.slli64	zero
 212:	0000                	unimp
 214:	ffff                	0xffff
 216:	7fff                	0x7fff
	...
 228:	0001                	nop
 22a:	0000                	unimp
 22c:	0001                	nop
 22e:	0000                	unimp
 230:	0002                	c.slli64	zero
 232:	0000                	unimp
 234:	ffff                	0xffff
 236:	7fff                	0x7fff
 238:	0001                	nop
 23a:	0000                	unimp
 23c:	0001                	nop
 23e:	0000                	unimp
 240:	0001                	nop
 242:	0000                	unimp
 244:	0001                	nop
 246:	0000                	unimp
 248:	0002                	c.slli64	zero
 24a:	0000                	unimp
 24c:	0002                	c.slli64	zero
 24e:	0000                	unimp
 250:	0002                	c.slli64	zero
 252:	0000                	unimp
 254:	ffff                	0xffff
 256:	7fff                	0x7fff
 258:	0002                	c.slli64	zero
 25a:	0000                	unimp
 25c:	0002                	c.slli64	zero
 25e:	0000                	unimp
 260:	0002                	c.slli64	zero
 262:	0000                	unimp
 264:	0002                	c.slli64	zero
 266:	0000                	unimp
 268:	ffff                	0xffff
 26a:	7fff                	0x7fff
 26c:	ffff                	0xffff
 26e:	7fff                	0x7fff
 270:	ffff                	0xffff
 272:	7fff                	0x7fff
 274:	ffff                	0xffff
 276:	7fff                	0x7fff
 278:	ffff                	0xffff
 27a:	7fff                	0x7fff
 27c:	ffff                	0xffff
 27e:	7fff                	0x7fff
 280:	ffff                	0xffff
 282:	7fff                	0x7fff
 284:	ffff                	0xffff
 286:	7fff                	0x7fff
 288:	0000                	unimp
 28a:	0000                	unimp
 28c:	0001                	nop
 28e:	0000                	unimp
 290:	0002                	c.slli64	zero
 292:	0000                	unimp
 294:	ffff                	0xffff
 296:	7fff                	0x7fff
 298:	0000                	unimp
 29a:	8000                	0x8000
 29c:	0001                	nop
 29e:	8000                	0x8000
 2a0:	fffe                	fsw	ft11,252(sp)
 2a2:	ffff                	0xffff
 2a4:	ffff                	0xffff
 2a6:	ffff                	0xffff
 2a8:	0000                	unimp
 2aa:	0000                	unimp
 2ac:	0001                	nop
 2ae:	0000                	unimp
 2b0:	0002                	c.slli64	zero
 2b2:	0000                	unimp
 2b4:	ffff                	0xffff
 2b6:	7fff                	0x7fff
 2b8:	0001                	nop
 2ba:	8000                	0x8000
 2bc:	0001                	nop
 2be:	8000                	0x8000
 2c0:	fffe                	fsw	ft11,252(sp)
 2c2:	ffff                	0xffff
 2c4:	ffff                	0xffff
 2c6:	ffff                	0xffff
 2c8:	0000                	unimp
 2ca:	0000                	unimp
 2cc:	0001                	nop
 2ce:	0000                	unimp
 2d0:	0002                	c.slli64	zero
 2d2:	0000                	unimp
 2d4:	ffff                	0xffff
 2d6:	7fff                	0x7fff
 2d8:	fffe                	fsw	ft11,252(sp)
 2da:	ffff                	0xffff
 2dc:	fffe                	fsw	ft11,252(sp)
 2de:	ffff                	0xffff
 2e0:	fffe                	fsw	ft11,252(sp)
 2e2:	ffff                	0xffff
 2e4:	ffff                	0xffff
 2e6:	ffff                	0xffff
 2e8:	0000                	unimp
 2ea:	0000                	unimp
 2ec:	0001                	nop
 2ee:	0000                	unimp
 2f0:	0002                	c.slli64	zero
 2f2:	0000                	unimp
 2f4:	ffff                	0xffff
 2f6:	7fff                	0x7fff
 2f8:	ffff                	0xffff
 2fa:	ffff                	0xffff
 2fc:	ffff                	0xffff
 2fe:	ffff                	0xffff
 300:	ffff                	0xffff
 302:	ffff                	0xffff
 304:	ffff                	0xffff
 306:	ffff                	0xffff

Disassembly of section .comment:

00000000 <.comment>:
   0:	3a434347          	fmsub.d	ft6,ft6,ft4,ft7,rmm
   4:	2820                	fld	fs0,80(s0)
   6:	29554e47          	fmsub.s	ft8,fa0,fs5,ft5,rmm
   a:	3820                	fld	fs0,112(s0)
   c:	322e                	fld	ft4,232(sp)
   e:	302e                	fld	ft0,232(sp)
	...
