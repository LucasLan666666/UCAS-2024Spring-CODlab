
../riscv32/elf/min3:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <start>:
   0:	00004137          	lui	sp,0x4
   4:	00c0006f          	j	10 <continued>
   8:	00000013          	nop

0000000c <global_result>:
   c:	ffff                	0xffff
   e:	ffff                	0xffff

00000010 <continued>:
  10:	0ec000ef          	jal	ra,fc <main>
  14:	05c000ef          	jal	ra,70 <hit_good_trap>

00000018 <_halt>:
  18:	fe010113          	addi	sp,sp,-32 # 3fe0 <ans+0x3d84>
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

0000009c <min3>:
  9c:	fd010113          	addi	sp,sp,-48
  a0:	02812623          	sw	s0,44(sp)
  a4:	03010413          	addi	s0,sp,48
  a8:	fca42e23          	sw	a0,-36(s0)
  ac:	fcb42c23          	sw	a1,-40(s0)
  b0:	fcc42a23          	sw	a2,-44(s0)
  b4:	fdc42703          	lw	a4,-36(s0)
  b8:	fd842783          	lw	a5,-40(s0)
  bc:	00f75863          	bge	a4,a5,cc <min3+0x30>
  c0:	fdc42783          	lw	a5,-36(s0)
  c4:	fef42623          	sw	a5,-20(s0)
  c8:	00c0006f          	j	d4 <min3+0x38>
  cc:	fd842783          	lw	a5,-40(s0)
  d0:	fef42623          	sw	a5,-20(s0)
  d4:	fd442703          	lw	a4,-44(s0)
  d8:	fec42783          	lw	a5,-20(s0)
  dc:	00f75663          	bge	a4,a5,e8 <min3+0x4c>
  e0:	fd442783          	lw	a5,-44(s0)
  e4:	fef42623          	sw	a5,-20(s0)
  e8:	fec42783          	lw	a5,-20(s0)
  ec:	00078513          	mv	a0,a5
  f0:	02c12403          	lw	s0,44(sp)
  f4:	03010113          	addi	sp,sp,48
  f8:	00008067          	ret

000000fc <main>:
  fc:	fe010113          	addi	sp,sp,-32
 100:	00112e23          	sw	ra,28(sp)
 104:	00812c23          	sw	s0,24(sp)
 108:	02010413          	addi	s0,sp,32
 10c:	fe042023          	sw	zero,-32(s0)
 110:	fe042623          	sw	zero,-20(s0)
 114:	0fc0006f          	j	210 <main+0x114>
 118:	fe042423          	sw	zero,-24(s0)
 11c:	0c40006f          	j	1e0 <main+0xe4>
 120:	fe042223          	sw	zero,-28(s0)
 124:	08c0006f          	j	1b0 <main+0xb4>
 128:	fec42703          	lw	a4,-20(s0)
 12c:	00271713          	slli	a4,a4,0x2
 130:	24c00793          	li	a5,588
 134:	00f707b3          	add	a5,a4,a5
 138:	0007a683          	lw	a3,0(a5)
 13c:	fe842703          	lw	a4,-24(s0)
 140:	00271713          	slli	a4,a4,0x2
 144:	24c00793          	li	a5,588
 148:	00f707b3          	add	a5,a4,a5
 14c:	0007a583          	lw	a1,0(a5)
 150:	fe442703          	lw	a4,-28(s0)
 154:	00271713          	slli	a4,a4,0x2
 158:	24c00793          	li	a5,588
 15c:	00f707b3          	add	a5,a4,a5
 160:	0007a783          	lw	a5,0(a5)
 164:	00078613          	mv	a2,a5
 168:	00068513          	mv	a0,a3
 16c:	f31ff0ef          	jal	ra,9c <min3>
 170:	00050613          	mv	a2,a0
 174:	fe042783          	lw	a5,-32(s0)
 178:	00178713          	addi	a4,a5,1
 17c:	fee42023          	sw	a4,-32(s0)
 180:	00279713          	slli	a4,a5,0x2
 184:	25c00793          	li	a5,604
 188:	00f707b3          	add	a5,a4,a5
 18c:	0007a783          	lw	a5,0(a5)
 190:	40f607b3          	sub	a5,a2,a5
 194:	0017b793          	seqz	a5,a5
 198:	0ff7f793          	andi	a5,a5,255
 19c:	00078513          	mv	a0,a5
 1a0:	e99ff0ef          	jal	ra,38 <nemu_assert>
 1a4:	fe442783          	lw	a5,-28(s0)
 1a8:	00178793          	addi	a5,a5,1
 1ac:	fef42223          	sw	a5,-28(s0)
 1b0:	fe442703          	lw	a4,-28(s0)
 1b4:	00300793          	li	a5,3
 1b8:	f6e7f8e3          	bgeu	a5,a4,128 <main+0x2c>
 1bc:	fe442783          	lw	a5,-28(s0)
 1c0:	ffc78793          	addi	a5,a5,-4
 1c4:	0017b793          	seqz	a5,a5
 1c8:	0ff7f793          	andi	a5,a5,255
 1cc:	00078513          	mv	a0,a5
 1d0:	e69ff0ef          	jal	ra,38 <nemu_assert>
 1d4:	fe842783          	lw	a5,-24(s0)
 1d8:	00178793          	addi	a5,a5,1
 1dc:	fef42423          	sw	a5,-24(s0)
 1e0:	fe842703          	lw	a4,-24(s0)
 1e4:	00300793          	li	a5,3
 1e8:	f2e7fce3          	bgeu	a5,a4,120 <main+0x24>
 1ec:	fe842783          	lw	a5,-24(s0)
 1f0:	ffc78793          	addi	a5,a5,-4
 1f4:	0017b793          	seqz	a5,a5
 1f8:	0ff7f793          	andi	a5,a5,255
 1fc:	00078513          	mv	a0,a5
 200:	e39ff0ef          	jal	ra,38 <nemu_assert>
 204:	fec42783          	lw	a5,-20(s0)
 208:	00178793          	addi	a5,a5,1
 20c:	fef42623          	sw	a5,-20(s0)
 210:	fec42703          	lw	a4,-20(s0)
 214:	00300793          	li	a5,3
 218:	f0e7f0e3          	bgeu	a5,a4,118 <main+0x1c>
 21c:	fec42783          	lw	a5,-20(s0)
 220:	ffc78793          	addi	a5,a5,-4
 224:	0017b793          	seqz	a5,a5
 228:	0ff7f793          	andi	a5,a5,255
 22c:	00078513          	mv	a0,a5
 230:	e09ff0ef          	jal	ra,38 <nemu_assert>
 234:	00000793          	li	a5,0
 238:	00078513          	mv	a0,a5
 23c:	01c12083          	lw	ra,28(sp)
 240:	01812403          	lw	s0,24(sp)
 244:	02010113          	addi	sp,sp,32
 248:	00008067          	ret

Disassembly of section .data:

0000024c <test_data>:
 24c:	0000                	unimp
 24e:	0000                	unimp
 250:	ffff                	0xffff
 252:	7fff                	0x7fff
 254:	0000                	unimp
 256:	8000                	0x8000
 258:	ffff                	0xffff
 25a:	ffff                	0xffff

0000025c <ans>:
	...
 264:	0000                	unimp
 266:	8000                	0x8000
 268:	ffff                	0xffff
 26a:	ffff                	0xffff
	...
 274:	0000                	unimp
 276:	8000                	0x8000
 278:	ffff                	0xffff
 27a:	ffff                	0xffff
 27c:	0000                	unimp
 27e:	8000                	0x8000
 280:	0000                	unimp
 282:	8000                	0x8000
 284:	0000                	unimp
 286:	8000                	0x8000
 288:	0000                	unimp
 28a:	8000                	0x8000
 28c:	ffff                	0xffff
 28e:	ffff                	0xffff
 290:	ffff                	0xffff
 292:	ffff                	0xffff
 294:	0000                	unimp
 296:	8000                	0x8000
 298:	ffff                	0xffff
 29a:	ffff                	0xffff
	...
 2a4:	0000                	unimp
 2a6:	8000                	0x8000
 2a8:	ffff                	0xffff
 2aa:	ffff                	0xffff
 2ac:	0000                	unimp
 2ae:	0000                	unimp
 2b0:	ffff                	0xffff
 2b2:	7fff                	0x7fff
 2b4:	0000                	unimp
 2b6:	8000                	0x8000
 2b8:	ffff                	0xffff
 2ba:	ffff                	0xffff
 2bc:	0000                	unimp
 2be:	8000                	0x8000
 2c0:	0000                	unimp
 2c2:	8000                	0x8000
 2c4:	0000                	unimp
 2c6:	8000                	0x8000
 2c8:	0000                	unimp
 2ca:	8000                	0x8000
 2cc:	ffff                	0xffff
 2ce:	ffff                	0xffff
 2d0:	ffff                	0xffff
 2d2:	ffff                	0xffff
 2d4:	0000                	unimp
 2d6:	8000                	0x8000
 2d8:	ffff                	0xffff
 2da:	ffff                	0xffff
 2dc:	0000                	unimp
 2de:	8000                	0x8000
 2e0:	0000                	unimp
 2e2:	8000                	0x8000
 2e4:	0000                	unimp
 2e6:	8000                	0x8000
 2e8:	0000                	unimp
 2ea:	8000                	0x8000
 2ec:	0000                	unimp
 2ee:	8000                	0x8000
 2f0:	0000                	unimp
 2f2:	8000                	0x8000
 2f4:	0000                	unimp
 2f6:	8000                	0x8000
 2f8:	0000                	unimp
 2fa:	8000                	0x8000
 2fc:	0000                	unimp
 2fe:	8000                	0x8000
 300:	0000                	unimp
 302:	8000                	0x8000
 304:	0000                	unimp
 306:	8000                	0x8000
 308:	0000                	unimp
 30a:	8000                	0x8000
 30c:	0000                	unimp
 30e:	8000                	0x8000
 310:	0000                	unimp
 312:	8000                	0x8000
 314:	0000                	unimp
 316:	8000                	0x8000
 318:	0000                	unimp
 31a:	8000                	0x8000
 31c:	ffff                	0xffff
 31e:	ffff                	0xffff
 320:	ffff                	0xffff
 322:	ffff                	0xffff
 324:	0000                	unimp
 326:	8000                	0x8000
 328:	ffff                	0xffff
 32a:	ffff                	0xffff
 32c:	ffff                	0xffff
 32e:	ffff                	0xffff
 330:	ffff                	0xffff
 332:	ffff                	0xffff
 334:	0000                	unimp
 336:	8000                	0x8000
 338:	ffff                	0xffff
 33a:	ffff                	0xffff
 33c:	0000                	unimp
 33e:	8000                	0x8000
 340:	0000                	unimp
 342:	8000                	0x8000
 344:	0000                	unimp
 346:	8000                	0x8000
 348:	0000                	unimp
 34a:	8000                	0x8000
 34c:	ffff                	0xffff
 34e:	ffff                	0xffff
 350:	ffff                	0xffff
 352:	ffff                	0xffff
 354:	0000                	unimp
 356:	8000                	0x8000
 358:	ffff                	0xffff
 35a:	ffff                	0xffff

Disassembly of section .comment:

00000000 <.comment>:
   0:	3a434347          	fmsub.d	ft6,ft6,ft4,ft7,rmm
   4:	2820                	fld	fs0,80(s0)
   6:	29554e47          	fmsub.s	ft8,fa0,fs5,ft5,rmm
   a:	3820                	fld	fs0,112(s0)
   c:	322e                	fld	ft4,232(sp)
   e:	302e                	fld	ft0,232(sp)
	...
