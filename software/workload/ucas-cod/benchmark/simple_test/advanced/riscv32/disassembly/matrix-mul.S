
../riscv32/elf/matrix-mul:     file format elf32-littleriscv


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
  48:	fd010113          	addi	sp,sp,-48 # 3fd0 <c+0x3990>
  4c:	02812423          	sw	s0,40(sp)
  50:	19000413          	li	s0,400
  54:	03212023          	sw	s2,32(sp)
  58:	01312e23          	sw	s3,28(sp)
  5c:	01512a23          	sw	s5,20(sp)
  60:	02912223          	sw	s1,36(sp)
  64:	01412c23          	sw	s4,24(sp)
  68:	01612823          	sw	s6,16(sp)
  6c:	01912223          	sw	s9,4(sp)
  70:	32040493          	addi	s1,s0,800
  74:	02112623          	sw	ra,44(sp)
  78:	01712623          	sw	s7,12(sp)
  7c:	01812423          	sw	s8,8(sp)
  80:	19000a13          	li	s4,400
  84:	64000993          	li	s3,1600
  88:	4b040413          	addi	s0,s0,1200
  8c:	32000a93          	li	s5,800
  90:	34800913          	li	s2,840
  94:	00100c93          	li	s9,1
  98:	02000b13          	li	s6,32
  9c:	000a8e13          	mv	t3,s5
  a0:	00098c13          	mv	s8,s3
  a4:	e70e0b93          	addi	s7,t3,-400
  a8:	00048893          	mv	a7,s1
  ac:	00000813          	li	a6,0
  b0:	000ba683          	lw	a3,0(s7)
  b4:	0008a503          	lw	a0,0(a7)
  b8:	00100313          	li	t1,1
  bc:	00d04463          	bgtz	a3,c4 <main+0x7c>
  c0:	fff00313          	li	t1,-1
  c4:	41f6d793          	srai	a5,a3,0x1f
  c8:	00d7c6b3          	xor	a3,a5,a3
  cc:	40f686b3          	sub	a3,a3,a5
  d0:	00000593          	li	a1,0
  d4:	00000793          	li	a5,0
  d8:	0016f713          	andi	a4,a3,1
  dc:	00f51633          	sll	a2,a0,a5
  e0:	00178793          	addi	a5,a5,1
  e4:	00070463          	beqz	a4,ec <main+0xa4>
  e8:	00c585b3          	add	a1,a1,a2
  ec:	4016d693          	srai	a3,a3,0x1
  f0:	ff6794e3          	bne	a5,s6,d8 <main+0x90>
  f4:	01930463          	beq	t1,s9,fc <main+0xb4>
  f8:	40b005b3          	neg	a1,a1
  fc:	00b80833          	add	a6,a6,a1
 100:	010c2023          	sw	a6,0(s8)
 104:	028b8b93          	addi	s7,s7,40
 108:	00488893          	addi	a7,a7,4
 10c:	fbcb92e3          	bne	s7,t3,b0 <main+0x68>
 110:	017a07b3          	add	a5,s4,s7
 114:	e707a503          	lw	a0,-400(a5)
 118:	004c0c13          	addi	s8,s8,4
 11c:	41050533          	sub	a0,a0,a6
 120:	00153513          	seqz	a0,a0
 124:	f01ff0ef          	jal	ra,24 <nemu_assert>
 128:	00100513          	li	a0,1
 12c:	ef9ff0ef          	jal	ra,24 <nemu_assert>
 130:	004b8e13          	addi	t3,s7,4
 134:	f7c918e3          	bne	s2,t3,a4 <main+0x5c>
 138:	00100513          	li	a0,1
 13c:	02848493          	addi	s1,s1,40
 140:	ee5ff0ef          	jal	ra,24 <nemu_assert>
 144:	028a0a13          	addi	s4,s4,40
 148:	02898993          	addi	s3,s3,40
 14c:	f48498e3          	bne	s1,s0,9c <main+0x54>
 150:	00100513          	li	a0,1
 154:	ed1ff0ef          	jal	ra,24 <nemu_assert>
 158:	02c12083          	lw	ra,44(sp)
 15c:	02812403          	lw	s0,40(sp)
 160:	02412483          	lw	s1,36(sp)
 164:	02012903          	lw	s2,32(sp)
 168:	01c12983          	lw	s3,28(sp)
 16c:	01812a03          	lw	s4,24(sp)
 170:	01412a83          	lw	s5,20(sp)
 174:	01012b03          	lw	s6,16(sp)
 178:	00c12b83          	lw	s7,12(sp)
 17c:	00812c03          	lw	s8,8(sp)
 180:	00412c83          	lw	s9,4(sp)
 184:	00000513          	li	a0,0
 188:	03010113          	addi	sp,sp,48
 18c:	00008067          	ret

Disassembly of section .data:

00000190 <b>:
 190:	ffd0                	fsw	fa2,60(a5)
 192:	ffff                	0xffff
 194:	ffba                	fsw	fa4,252(sp)
 196:	ffff                	0xffff
 198:	ffd8                	fsw	fa4,60(a5)
 19a:	ffff                	0xffff
 19c:	ffae                	fsw	fa1,252(sp)
 19e:	ffff                	0xffff
 1a0:	ffb6                	fsw	fa3,252(sp)
 1a2:	ffff                	0xffff
 1a4:	ffc1                	bnez	a5,13c <main+0xf4>
 1a6:	ffff                	0xffff
 1a8:	ffc5                	bnez	a5,160 <main+0x118>
 1aa:	ffff                	0xffff
 1ac:	ffb8                	fsw	fa4,120(a5)
 1ae:	ffff                	0xffff
 1b0:	ff9c                	fsw	fa5,56(a5)
 1b2:	ffff                	0xffff
 1b4:	ffb8                	fsw	fa4,120(a5)
 1b6:	ffff                	0xffff
 1b8:	0005                	c.nop	1
 1ba:	0000                	unimp
 1bc:	ffac                	fsw	fa1,120(a5)
 1be:	ffff                	0xffff
 1c0:	001c                	0x1c
 1c2:	0000                	unimp
 1c4:	0038                	addi	a4,sp,8
 1c6:	0000                	unimp
 1c8:	003c                	addi	a5,sp,8
 1ca:	0000                	unimp
 1cc:	ffdf ffff ffd6      	0xffd6ffffffdf
 1d2:	ffff                	0xffff
 1d4:	ffce                	fsw	fs3,252(sp)
 1d6:	ffff                	0xffff
 1d8:	ffad                	bnez	a5,152 <main+0x10a>
 1da:	ffff                	0xffff
 1dc:	ffad                	bnez	a5,156 <main+0x10e>
 1de:	ffff                	0xffff
 1e0:	fffffffb          	0xfffffffb
 1e4:	0005                	c.nop	1
 1e6:	0000                	unimp
 1e8:	0030                	addi	a2,sp,8
 1ea:	0000                	unimp
 1ec:	0000004b          	fnmsub.s	ft0,ft0,ft0,ft0,rne
 1f0:	ffb2                	fsw	fa2,252(sp)
 1f2:	ffff                	0xffff
 1f4:	fffffff7          	0xfffffff7
 1f8:	0009                	c.nop	2
 1fa:	0000                	unimp
 1fc:	0002                	c.slli64	zero
 1fe:	0000                	unimp
 200:	0058                	addi	a4,sp,4
 202:	0000                	unimp
 204:	0046                	c.slli	zero,0x11
 206:	0000                	unimp
 208:	0045                	c.nop	17
 20a:	0000                	unimp
 20c:	00000017          	auipc	zero,0x0
 210:	0042                	c.slli	zero,0x10
 212:	0000                	unimp
 214:	0042                	c.slli	zero,0x10
 216:	0000                	unimp
 218:	fff5                	bnez	a5,214 <b+0x84>
 21a:	ffff                	0xffff
 21c:	0032                	c.slli	zero,0xc
 21e:	0000                	unimp
 220:	00000043          	fmadd.s	ft0,ft0,ft0,ft0,rne
 224:	0012                	c.slli	zero,0x4
 226:	0000                	unimp
 228:	ffc6                	fsw	fa7,252(sp)
 22a:	ffff                	0xffff
 22c:	004c                	addi	a1,sp,4
 22e:	0000                	unimp
 230:	001e                	c.slli	zero,0x7
 232:	0000                	unimp
 234:	002d                	c.nop	11
 236:	0000                	unimp
 238:	0020                	addi	s0,sp,8
 23a:	0000                	unimp
 23c:	0019                	c.nop	6
 23e:	0000                	unimp
 240:	ffffffb7          	lui	t6,0xfffff
 244:	0039                	c.nop	14
 246:	0000                	unimp
 248:	ffbd                	bnez	a5,1c6 <b+0x36>
 24a:	ffff                	0xffff
 24c:	fff2                	fsw	ft8,252(sp)
 24e:	ffff                	0xffff
 250:	0035                	c.nop	13
 252:	0000                	unimp
 254:	ffdf ffff 0062      	0x62ffffffdf
 25a:	0000                	unimp
 25c:	ffaa                	fsw	fa0,252(sp)
 25e:	ffff                	0xffff
 260:	ffc1                	bnez	a5,1f8 <b+0x68>
 262:	ffff                	0xffff
 264:	0050                	addi	a2,sp,4
 266:	0000                	unimp
 268:	ffffffd3          	0xffffffd3
 26c:	ffa8                	fsw	fa0,120(a5)
 26e:	ffff                	0xffff
 270:	0050                	addi	a2,sp,4
 272:	0000                	unimp
 274:	ffc0                	fsw	fs0,60(a5)
 276:	ffff                	0xffff
 278:	003a                	c.slli	zero,0xe
 27a:	0000                	unimp
 27c:	ffac                	fsw	fa1,120(a5)
 27e:	ffff                	0xffff
 280:	ffc9                	bnez	a5,21a <b+0x8a>
 282:	ffff                	0xffff
 284:	ffd9                	bnez	a5,222 <b+0x92>
 286:	ffff                	0xffff
 288:	fffffff3          	csrrci	t6,0xfff,31
 28c:	ffe5                	bnez	a5,284 <b+0xf4>
 28e:	ffff                	0xffff
 290:	ffffffdb          	0xffffffdb
 294:	0008                	0x8
 296:	0000                	unimp
 298:	ffa0                	fsw	fs0,120(a5)
 29a:	ffff                	0xffff
 29c:	0054                	addi	a3,sp,4
 29e:	0000                	unimp
 2a0:	ffffffa7          	0xffffffa7
 2a4:	001f 0000 ffae      	0xffae0000001f
 2aa:	ffff                	0xffff
 2ac:	003a                	c.slli	zero,0xe
 2ae:	0000                	unimp
 2b0:	0051                	c.nop	20
 2b2:	0000                	unimp
 2b4:	ffffffd7          	0xffffffd7
 2b8:	ffc6                	fsw	fa7,252(sp)
 2ba:	ffff                	0xffff
 2bc:	0024                	addi	s1,sp,8
 2be:	0000                	unimp
 2c0:	004c                	addi	a1,sp,4
 2c2:	0000                	unimp
 2c4:	ffb1                	bnez	a5,220 <b+0x90>
 2c6:	ffff                	0xffff
 2c8:	ffffffe3          	bgeu	t6,t6,2c6 <b+0x136>
 2cc:	00000017          	auipc	zero,0x0
 2d0:	0056                	c.slli	zero,0x15
 2d2:	0000                	unimp
 2d4:	ffd2                	fsw	fs4,252(sp)
 2d6:	ffff                	0xffff
 2d8:	0010                	0x10
 2da:	0000                	unimp
 2dc:	ffee                	fsw	fs11,252(sp)
 2de:	ffff                	0xffff
 2e0:	0051                	c.nop	20
 2e2:	0000                	unimp
 2e4:	005a                	c.slli	zero,0x16
 2e6:	0000                	unimp
 2e8:	00000023          	sb	zero,0(zero) # 0 <start>
 2ec:	ffa6                	fsw	fs1,252(sp)
 2ee:	ffff                	0xffff
 2f0:	0000002b          	0x2b
 2f4:	00000037          	lui	zero,0x0
 2f8:	ffda                	fsw	fs6,252(sp)
 2fa:	ffff                	0xffff
 2fc:	ffed                	bnez	a5,2f6 <b+0x166>
 2fe:	ffff                	0xffff
 300:	ffd8                	fsw	fa4,60(a5)
 302:	ffff                	0xffff
 304:	0052                	c.slli	zero,0x14
 306:	0000                	unimp
 308:	ffb4                	fsw	fa3,120(a5)
 30a:	ffff                	0xffff
 30c:	0039                	c.nop	14
 30e:	0000                	unimp
 310:	ffffffe3          	bgeu	t6,t6,30e <b+0x17e>
 314:	fffe                	fsw	ft11,252(sp)
 316:	ffff                	0xffff
 318:	0000004f          	fnmadd.s	ft0,ft0,ft0,ft0,rne
 31c:	ffd0                	fsw	fa2,60(a5)
 31e:	ffff                	0xffff

00000320 <ans>:
 320:	fffffadb          	0xfffffadb
 324:	0000288b          	0x288b
 328:	ffffe943          	fmadd.q	fs2,ft11,ft11,ft11,unknown
 32c:	c80e                	sw	gp,16(sp)
 32e:	ffff                	0xffff
 330:	ef16                	fsw	ft5,156(sp)
 332:	ffff                	0xffff
 334:	f3d6                	fsw	fs5,228(sp)
 336:	ffff                	0xffff
 338:	d92c                	sw	a1,112(a0)
 33a:	ffff                	0xffff
 33c:	1b79                	addi	s6,s6,-2
 33e:	0000                	unimp
 340:	f8a5                	bnez	s1,2b0 <b+0x120>
 342:	ffff                	0xffff
 344:	e875                	bnez	s0,438 <ans+0x118>
 346:	ffff                	0xffff
 348:	a136                	fsd	fa3,128(sp)
 34a:	ffff                	0xffff
 34c:	fffffca3          	0xfffffca3
 350:	0fcc                	addi	a1,sp,980
 352:	0000                	unimp
 354:	b290                	fsd	fa2,32(a3)
 356:	ffff                	0xffff
 358:	ff21                	bnez	a4,2b0 <b+0x120>
 35a:	ffff                	0xffff
 35c:	0376                	slli	t1,t1,0x1d
 35e:	0000                	unimp
 360:	d12c                	sw	a1,96(a0)
 362:	ffff                	0xffff
 364:	e6d6                	fsw	fs5,76(sp)
 366:	ffff                	0xffff
 368:	c9ea                	sw	s10,208(sp)
 36a:	ffff                	0xffff
 36c:	fbe2                	fsw	fs8,244(sp)
 36e:	ffff                	0xffff
 370:	00002637          	lui	a2,0x2
 374:	e45f ffff fc6a      	0xfc6affffe45f
 37a:	ffff                	0xffff
 37c:	e8e9                	bnez	s1,44e <ans+0x12e>
 37e:	ffff                	0xffff
 380:	fc39                	bnez	s0,2de <b+0x14e>
 382:	ffff                	0xffff
 384:	e444                	fsw	fs1,12(s0)
 386:	ffff                	0xffff
 388:	390d                	jal	ffffffba <c+0xfffff97a>
 38a:	0000                	unimp
 38c:	e27c                	fsw	fa5,68(a2)
 38e:	ffff                	0xffff
 390:	f291                	bnez	a3,294 <b+0x104>
 392:	ffff                	0xffff
 394:	00002587          	flw	fa1,0(zero) # 0 <start>
 398:	3e6c                	fld	fa1,248(a2)
 39a:	0000                	unimp
 39c:	fdf8                	fsw	fa4,124(a1)
 39e:	ffff                	0xffff
 3a0:	ffffcc0f          	0xffffcc0f
 3a4:	00003ac3          	fmadd.s	fs5,ft0,ft0,ft0,rup
 3a8:	1829                	addi	a6,a6,-22
 3aa:	0000                	unimp
 3ac:	f1ba                	fsw	fa4,224(sp)
 3ae:	ffff                	0xffff
 3b0:	052d                	addi	a0,a0,11
 3b2:	0000                	unimp
 3b4:	1061                	c.nop	-8
 3b6:	0000                	unimp
 3b8:	421d                	li	tp,7
 3ba:	0000                	unimp
 3bc:	ba9f ffff 0a06      	0xa06ffffba9f
 3c2:	0000                	unimp
 3c4:	00000c73          	0xc73
 3c8:	2808                	fld	fa0,16(s0)
 3ca:	0000                	unimp
 3cc:	1ef5                	addi	t4,t4,-3
 3ce:	0000                	unimp
 3d0:	18ae                	slli	a7,a7,0x2b
 3d2:	0000                	unimp
 3d4:	058d                	addi	a1,a1,3
 3d6:	0000                	unimp
 3d8:	3938                	fld	fa4,112(a0)
 3da:	0000                	unimp
 3dc:	02bc                	addi	a5,sp,328
 3de:	0000                	unimp
 3e0:	d05f ffff 043b      	0x43bffffd05f
 3e6:	0000                	unimp
 3e8:	cec5                	beqz	a3,4a0 <ans+0x180>
 3ea:	ffff                	0xffff
 3ec:	4a3e                	lw	s4,204(sp)
 3ee:	0000                	unimp
 3f0:	51d8                	lw	a4,36(a1)
 3f2:	0000                	unimp
 3f4:	000048a7          	fsq	ft0,17(zero) # 11 <continued+0x1>
 3f8:	f9fd                	bnez	a1,3ee <ans+0xce>
 3fa:	ffff                	0xffff
 3fc:	1440                	addi	s0,sp,548
 3fe:	0000                	unimp
 400:	4400                	lw	s0,8(s0)
 402:	0000                	unimp
 404:	1a54                	addi	a3,sp,308
 406:	0000                	unimp
 408:	1878                	addi	a4,sp,60
 40a:	0000                	unimp
 40c:	3b0a                	fld	fs6,160(sp)
 40e:	0000                	unimp
 410:	ce55                	beqz	a2,4cc <a+0x1c>
 412:	ffff                	0xffff
 414:	3b11                	jal	128 <main+0xe0>
 416:	0000                	unimp
 418:	000026eb          	0x26eb
 41c:	ffffca6b          	0xffffca6b
 420:	0000096b          	0x96b
 424:	f76c                	fsw	fa1,108(a4)
 426:	ffff                	0xffff
 428:	00001803          	lh	a6,0(zero) # 0 <start>
 42c:	f95e                	fsw	fs7,176(sp)
 42e:	ffff                	0xffff
 430:	fffff2c3          	fmadd.q	ft5,ft11,ft11,ft11
 434:	2008                	fld	fa0,0(s0)
 436:	0000                	unimp
 438:	b5c1                	j	2f8 <b+0x168>
 43a:	ffff                	0xffff
 43c:	3081                	jal	fffffc7c <c+0xfffff63c>
 43e:	0000                	unimp
 440:	0000165b          	0x165b
 444:	ffffd3d3          	0xffffd3d3
 448:	b4d6                	fsd	fs5,104(sp)
 44a:	ffff                	0xffff
 44c:	3d7c                	fld	fa5,248(a0)
 44e:	0000                	unimp
 450:	f131                	bnez	a0,394 <ans+0x74>
 452:	ffff                	0xffff
 454:	fffff093          	andi	ra,t6,-1
 458:	ccb6                	sw	a3,88(sp)
 45a:	ffff                	0xffff
 45c:	ffffffeb          	0xffffffeb
 460:	ffffcef3          	0xffffcef3
 464:	e8ae                	fsw	fa1,80(sp)
 466:	ffff                	0xffff
 468:	d2ce                	sw	s3,100(sp)
 46a:	ffff                	0xffff
 46c:	ffffdd37          	lui	s10,0xffffd
 470:	00002fc3          	fmadd.s	ft11,ft0,ft0,ft0,rdn
 474:	1e86                	slli	t4,t4,0x21
 476:	0000                	unimp
 478:	ec1a                	fsw	ft6,24(sp)
 47a:	ffff                	0xffff
 47c:	11b4                	addi	a3,sp,232
 47e:	0000                	unimp
 480:	0000042f          	0x42f
 484:	fffffae3          	bgeu	t6,t6,478 <ans+0x158>
 488:	f475                	bnez	s0,474 <ans+0x154>
 48a:	ffff                	0xffff
 48c:	24a5                	jal	6f4 <c+0xb4>
 48e:	0000                	unimp
 490:	18e4                	addi	s1,sp,124
 492:	0000                	unimp
 494:	e50e                	fsw	ft3,136(sp)
 496:	ffff                	0xffff
 498:	239d                	jal	9fe <c+0x3be>
 49a:	0000                	unimp
 49c:	1679                	addi	a2,a2,-2
 49e:	0000                	unimp
 4a0:	512a                	lw	sp,168(sp)
 4a2:	0000                	unimp
 4a4:	ffffec4b          	fnmsub.q	fs8,ft11,ft11,ft11,unknown
 4a8:	00000417          	auipc	s0,0x0
 4ac:	2f52                	fld	ft10,272(sp)
	...

000004b0 <a>:
 4b0:	001f 0000 ffb7      	0xffb70000001f
 4b6:	ffff                	0xffff
 4b8:	ffbd                	bnez	a5,436 <ans+0x116>
 4ba:	ffff                	0xffff
 4bc:	ffe4                	fsw	fs1,124(a5)
 4be:	ffff                	0xffff
 4c0:	00000057          	0x57
 4c4:	ffffffef          	jal	t6,4c2 <a+0x12>
 4c8:	fff1                	bnez	a5,4a4 <ans+0x184>
 4ca:	ffff                	0xffff
 4cc:	ffdd                	bnez	a5,48a <ans+0x16a>
 4ce:	ffff                	0xffff
 4d0:	ffffffcb          	fnmsub.q	ft11,ft11,ft11,ft11
 4d4:	ffca                	fsw	fs2,252(sp)
 4d6:	ffff                	0xffff
 4d8:	0034                	addi	a3,sp,8
 4da:	0000                	unimp
 4dc:	0024                	addi	s1,sp,8
 4de:	0000                	unimp
 4e0:	0009                	c.nop	2
 4e2:	0000                	unimp
 4e4:	ffa5                	bnez	a5,45c <ans+0x13c>
 4e6:	ffff                	0xffff
 4e8:	ffe5                	bnez	a5,4e0 <a+0x30>
 4ea:	ffff                	0xffff
 4ec:	ffb2                	fsw	fa2,252(sp)
 4ee:	ffff                	0xffff
 4f0:	002a                	c.slli	zero,0xa
 4f2:	0000                	unimp
 4f4:	0052                	c.slli	zero,0x14
 4f6:	0000                	unimp
 4f8:	00000013          	nop
 4fc:	fffa                	fsw	ft10,252(sp)
 4fe:	ffff                	0xffff
 500:	0029                	c.nop	10
 502:	0000                	unimp
 504:	ffc8                	fsw	fa0,60(a5)
 506:	ffff                	0xffff
 508:	001f 0000 0020      	0x200000001f
 50e:	0000                	unimp
 510:	ffcc                	fsw	fa1,60(a5)
 512:	ffff                	0xffff
 514:	004a                	c.slli	zero,0x12
 516:	0000                	unimp
 518:	001c                	0x1c
 51a:	0000                	unimp
 51c:	0014                	0x14
 51e:	0000                	unimp
 520:	00000037          	lui	zero,0x0
 524:	ffb8                	fsw	fa4,120(a5)
 526:	ffff                	0xffff
 528:	ffc5                	bnez	a5,4e0 <a+0x30>
 52a:	ffff                	0xffff
 52c:	0002                	c.slli64	zero
 52e:	0000                	unimp
 530:	ffb1                	bnez	a5,48c <ans+0x16c>
 532:	ffff                	0xffff
 534:	fff8                	fsw	fa4,124(a5)
 536:	ffff                	0xffff
 538:	002c                	addi	a1,sp,8
 53a:	0000                	unimp
 53c:	00000037          	lui	zero,0x0
 540:	ffad                	bnez	a5,4ba <a+0xa>
 542:	ffff                	0xffff
 544:	ffa1                	bnez	a5,49c <ans+0x17c>
 546:	ffff                	0xffff
 548:	ffffffd3          	0xffffffd3
 54c:	0032                	c.slli	zero,0xc
 54e:	0000                	unimp
 550:	ffa1                	bnez	a5,4a8 <ans+0x188>
 552:	ffff                	0xffff
 554:	003d                	c.nop	15
 556:	0000                	unimp
 558:	ffc1                	bnez	a5,4f0 <a+0x40>
 55a:	ffff                	0xffff
 55c:	003e                	c.slli	zero,0xf
 55e:	0000                	unimp
 560:	fff0                	fsw	fa2,124(a5)
 562:	ffff                	0xffff
 564:	0034                	addi	a3,sp,8
 566:	0000                	unimp
 568:	0028                	addi	a0,sp,8
 56a:	0000                	unimp
 56c:	005c                	addi	a5,sp,4
 56e:	0000                	unimp
 570:	ffe0                	fsw	fs0,124(a5)
 572:	ffff                	0xffff
 574:	ffe6                	fsw	fs9,252(sp)
 576:	ffff                	0xffff
 578:	ff9d                	bnez	a5,4b6 <a+0x6>
 57a:	ffff                	0xffff
 57c:	0034                	addi	a3,sp,8
 57e:	0000                	unimp
 580:	0060                	addi	s0,sp,12
 582:	0000                	unimp
 584:	0000003f ffffffb5 	0xffffffb50000003f
 58c:	ffb6                	fsw	fa3,252(sp)
 58e:	ffff                	0xffff
 590:	ffae                	fsw	fa1,252(sp)
 592:	ffff                	0xffff
 594:	0052                	c.slli	zero,0x14
 596:	0000                	unimp
 598:	ffa1                	bnez	a5,4f0 <a+0x40>
 59a:	ffff                	0xffff
 59c:	002a                	c.slli	zero,0xa
 59e:	0000                	unimp
 5a0:	0000000b          	0xb
 5a4:	ffea                	fsw	fs10,252(sp)
 5a6:	ffff                	0xffff
 5a8:	0000001b          	0x1b
 5ac:	ffe5                	bnez	a5,5a4 <a+0xf4>
 5ae:	ffff                	0xffff
 5b0:	ffe5                	bnez	a5,5a8 <a+0xf8>
 5b2:	ffff                	0xffff
 5b4:	ffb4                	fsw	fa3,120(a5)
 5b6:	ffff                	0xffff
 5b8:	ffb9                	bnez	a5,516 <a+0x66>
 5ba:	ffff                	0xffff
 5bc:	003a                	c.slli	zero,0xe
 5be:	0000                	unimp
 5c0:	ffd8                	fsw	fa4,60(a5)
 5c2:	ffff                	0xffff
 5c4:	ffffffbf 0000005b 	0x5bffffffbf
 5cc:	ffffffcb          	fnmsub.q	ft11,ft11,ft11,ft11
 5d0:	ffbd                	bnez	a5,54e <a+0x9e>
 5d2:	ffff                	0xffff
 5d4:	0048                	addi	a0,sp,4
 5d6:	0000                	unimp
 5d8:	0024                	addi	s1,sp,8
 5da:	0000                	unimp
 5dc:	ffffffb3          	0xffffffb3
 5e0:	fffd                	bnez	a5,5de <a+0x12e>
 5e2:	ffff                	0xffff
 5e4:	005d                	c.nop	23
 5e6:	0000                	unimp
 5e8:	ffe8                	fsw	fa0,124(a5)
 5ea:	ffff                	0xffff
 5ec:	0061                	c.nop	24
 5ee:	0000                	unimp
 5f0:	ffcc                	fsw	fa1,60(a5)
 5f2:	ffff                	0xffff
 5f4:	fff5                	bnez	a5,5f0 <a+0x140>
 5f6:	ffff                	0xffff
 5f8:	ffffffb3          	0xffffffb3
 5fc:	ffffffa3          	0xffffffa3
 600:	ffa4                	fsw	fs1,120(a5)
 602:	ffff                	0xffff
 604:	ffe8                	fsw	fa0,124(a5)
 606:	ffff                	0xffff
 608:	0046                	c.slli	zero,0x11
 60a:	0000                	unimp
 60c:	0012                	c.slli	zero,0x4
 60e:	0000                	unimp
 610:	0038                	addi	a4,sp,8
 612:	0000                	unimp
 614:	0058                	addi	a4,sp,4
 616:	0000                	unimp
 618:	ffd5                	bnez	a5,5d4 <a+0x124>
 61a:	ffff                	0xffff
 61c:	ffffffd7          	0xffffffd7
 620:	ffe6                	fsw	fs9,252(sp)
 622:	ffff                	0xffff
 624:	0000000b          	0xb
 628:	ffac                	fsw	fa1,120(a5)
 62a:	ffff                	0xffff
 62c:	fff2                	fsw	ft8,252(sp)
 62e:	ffff                	0xffff
 630:	ffffffd7          	0xffffffd7
 634:	00000053          	fadd.s	ft0,ft0,ft0,rne
 638:	0000001b          	0x1b
 63c:	fff5                	bnez	a5,638 <a+0x188>
 63e:	ffff                	0xffff

Disassembly of section .bss:

00000640 <c>:
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
