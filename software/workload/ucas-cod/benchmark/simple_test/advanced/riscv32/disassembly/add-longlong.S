
../riscv32/elf/add-longlong:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <start>:
   0:	00004137          	lui	sp,0x4
   4:	00c0006f          	j	10 <continued>
   8:	00000013          	nop

0000000c <global_result>:
   c:	ffff                	0xffff
   e:	ffff                	0xffff

00000010 <continued>:
  10:	050000ef          	jal	ra,60 <main>
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

00000048 <add>:
  48:	00050793          	mv	a5,a0
  4c:	00c50533          	add	a0,a0,a2
  50:	00f537b3          	sltu	a5,a0,a5
  54:	00d585b3          	add	a1,a1,a3
  58:	00b785b3          	add	a1,a5,a1
  5c:	00008067          	ret

Disassembly of section .text.startup:

00000060 <main>:
  60:	fe010113          	addi	sp,sp,-32 # 3fe0 <test_data+0x3cc8>
  64:	01212823          	sw	s2,16(sp)
  68:	11800913          	li	s2,280
  6c:	01312623          	sw	s3,12(sp)
  70:	20090993          	addi	s3,s2,512
  74:	00912a23          	sw	s1,20(sp)
  78:	01512223          	sw	s5,4(sp)
  7c:	00112e23          	sw	ra,28(sp)
  80:	00812c23          	sw	s0,24(sp)
  84:	01412423          	sw	s4,8(sp)
  88:	24090493          	addi	s1,s2,576
  8c:	00098a93          	mv	s5,s3
  90:	00090a13          	mv	s4,s2
  94:	00098413          	mv	s0,s3
  98:	00042503          	lw	a0,0(s0)
  9c:	000aa783          	lw	a5,0(s5)
  a0:	00442583          	lw	a1,4(s0)
  a4:	004aa603          	lw	a2,4(s5)
  a8:	00a78733          	add	a4,a5,a0
  ac:	004a2683          	lw	a3,4(s4)
  b0:	000a2503          	lw	a0,0(s4)
  b4:	00f737b3          	sltu	a5,a4,a5
  b8:	00b60633          	add	a2,a2,a1
  bc:	00c787b3          	add	a5,a5,a2
  c0:	00e54533          	xor	a0,a0,a4
  c4:	00f6c7b3          	xor	a5,a3,a5
  c8:	00f56533          	or	a0,a0,a5
  cc:	00153513          	seqz	a0,a0
  d0:	00840413          	addi	s0,s0,8
  d4:	f51ff0ef          	jal	ra,24 <nemu_assert>
  d8:	008a0a13          	addi	s4,s4,8
  dc:	fa941ee3          	bne	s0,s1,98 <main+0x38>
  e0:	008a8a93          	addi	s5,s5,8
  e4:	04090913          	addi	s2,s2,64
  e8:	fa8a94e3          	bne	s5,s0,90 <main+0x30>
  ec:	01c12083          	lw	ra,28(sp)
  f0:	01812403          	lw	s0,24(sp)
  f4:	01412483          	lw	s1,20(sp)
  f8:	01012903          	lw	s2,16(sp)
  fc:	00c12983          	lw	s3,12(sp)
 100:	00812a03          	lw	s4,8(sp)
 104:	00412a83          	lw	s5,4(sp)
 108:	00000513          	li	a0,0
 10c:	02010113          	addi	sp,sp,32
 110:	00008067          	ret

Disassembly of section .data:

00000118 <ans>:
	...
 120:	0001                	nop
 122:	0000                	unimp
 124:	0000                	unimp
 126:	0000                	unimp
 128:	0002                	c.slli64	zero
 12a:	0000                	unimp
 12c:	0000                	unimp
 12e:	0000                	unimp
 130:	ffff                	0xffff
 132:	ffff                	0xffff
 134:	ffff                	0xffff
 136:	7fff                	0x7fff
 138:	0000                	unimp
 13a:	0000                	unimp
 13c:	0000                	unimp
 13e:	8000                	0x8000
 140:	0001                	nop
 142:	0000                	unimp
 144:	0000                	unimp
 146:	8000                	0x8000
 148:	fffe                	fsw	ft11,252(sp)
 14a:	ffff                	0xffff
 14c:	ffff                	0xffff
 14e:	ffff                	0xffff
 150:	ffff                	0xffff
 152:	ffff                	0xffff
 154:	ffff                	0xffff
 156:	ffff                	0xffff
 158:	0001                	nop
 15a:	0000                	unimp
 15c:	0000                	unimp
 15e:	0000                	unimp
 160:	0002                	c.slli64	zero
 162:	0000                	unimp
 164:	0000                	unimp
 166:	0000                	unimp
 168:	00000003          	lb	zero,0(zero) # 0 <start>
	...
 174:	0000                	unimp
 176:	8000                	0x8000
 178:	0001                	nop
 17a:	0000                	unimp
 17c:	0000                	unimp
 17e:	8000                	0x8000
 180:	0002                	c.slli64	zero
 182:	0000                	unimp
 184:	0000                	unimp
 186:	8000                	0x8000
 188:	ffff                	0xffff
 18a:	ffff                	0xffff
 18c:	ffff                	0xffff
 18e:	ffff                	0xffff
	...
 198:	0002                	c.slli64	zero
 19a:	0000                	unimp
 19c:	0000                	unimp
 19e:	0000                	unimp
 1a0:	00000003          	lb	zero,0(zero) # 0 <start>
 1a4:	0000                	unimp
 1a6:	0000                	unimp
 1a8:	0004                	0x4
 1aa:	0000                	unimp
 1ac:	0000                	unimp
 1ae:	0000                	unimp
 1b0:	0001                	nop
 1b2:	0000                	unimp
 1b4:	0000                	unimp
 1b6:	8000                	0x8000
 1b8:	0002                	c.slli64	zero
 1ba:	0000                	unimp
 1bc:	0000                	unimp
 1be:	8000                	0x8000
 1c0:	00000003          	lb	zero,0(zero) # 0 <start>
 1c4:	0000                	unimp
 1c6:	8000                	0x8000
	...
 1d0:	0001                	nop
 1d2:	0000                	unimp
 1d4:	0000                	unimp
 1d6:	0000                	unimp
 1d8:	ffff                	0xffff
 1da:	ffff                	0xffff
 1dc:	ffff                	0xffff
 1de:	7fff                	0x7fff
 1e0:	0000                	unimp
 1e2:	0000                	unimp
 1e4:	0000                	unimp
 1e6:	8000                	0x8000
 1e8:	0001                	nop
 1ea:	0000                	unimp
 1ec:	0000                	unimp
 1ee:	8000                	0x8000
 1f0:	fffe                	fsw	ft11,252(sp)
 1f2:	ffff                	0xffff
 1f4:	ffff                	0xffff
 1f6:	ffff                	0xffff
 1f8:	ffff                	0xffff
 1fa:	ffff                	0xffff
 1fc:	ffff                	0xffff
 1fe:	ffff                	0xffff
	...
 208:	fffd                	bnez	a5,206 <ans+0xee>
 20a:	ffff                	0xffff
 20c:	ffff                	0xffff
 20e:	7fff                	0x7fff
 210:	fffe                	fsw	ft11,252(sp)
 212:	ffff                	0xffff
 214:	ffff                	0xffff
 216:	7fff                	0x7fff
 218:	0000                	unimp
 21a:	0000                	unimp
 21c:	0000                	unimp
 21e:	8000                	0x8000
 220:	0001                	nop
 222:	0000                	unimp
 224:	0000                	unimp
 226:	8000                	0x8000
 228:	0002                	c.slli64	zero
 22a:	0000                	unimp
 22c:	0000                	unimp
 22e:	8000                	0x8000
 230:	ffff                	0xffff
 232:	ffff                	0xffff
 234:	ffff                	0xffff
 236:	ffff                	0xffff
	...
 240:	0001                	nop
 242:	0000                	unimp
 244:	0000                	unimp
 246:	0000                	unimp
 248:	fffe                	fsw	ft11,252(sp)
 24a:	ffff                	0xffff
 24c:	ffff                	0xffff
 24e:	7fff                	0x7fff
 250:	ffff                	0xffff
 252:	ffff                	0xffff
 254:	ffff                	0xffff
 256:	7fff                	0x7fff
 258:	0001                	nop
 25a:	0000                	unimp
 25c:	0000                	unimp
 25e:	8000                	0x8000
 260:	0002                	c.slli64	zero
 262:	0000                	unimp
 264:	0000                	unimp
 266:	8000                	0x8000
 268:	00000003          	lb	zero,0(zero) # 0 <start>
 26c:	0000                	unimp
 26e:	8000                	0x8000
	...
 278:	0001                	nop
 27a:	0000                	unimp
 27c:	0000                	unimp
 27e:	0000                	unimp
 280:	0002                	c.slli64	zero
 282:	0000                	unimp
 284:	0000                	unimp
 286:	0000                	unimp
 288:	ffff                	0xffff
 28a:	ffff                	0xffff
 28c:	ffff                	0xffff
 28e:	7fff                	0x7fff
 290:	0000                	unimp
 292:	0000                	unimp
 294:	0000                	unimp
 296:	8000                	0x8000
 298:	fffe                	fsw	ft11,252(sp)
 29a:	ffff                	0xffff
 29c:	ffff                	0xffff
 29e:	ffff                	0xffff
 2a0:	ffff                	0xffff
 2a2:	ffff                	0xffff
 2a4:	ffff                	0xffff
 2a6:	ffff                	0xffff
	...
 2b0:	fffd                	bnez	a5,2ae <ans+0x196>
 2b2:	ffff                	0xffff
 2b4:	ffff                	0xffff
 2b6:	7fff                	0x7fff
 2b8:	fffe                	fsw	ft11,252(sp)
 2ba:	ffff                	0xffff
 2bc:	ffff                	0xffff
 2be:	7fff                	0x7fff
 2c0:	ffff                	0xffff
 2c2:	ffff                	0xffff
 2c4:	ffff                	0xffff
 2c6:	7fff                	0x7fff
 2c8:	fffc                	fsw	fa5,124(a5)
 2ca:	ffff                	0xffff
 2cc:	ffff                	0xffff
 2ce:	ffff                	0xffff
 2d0:	fffd                	bnez	a5,2ce <ans+0x1b6>
 2d2:	ffff                	0xffff
 2d4:	ffff                	0xffff
 2d6:	ffff                	0xffff
 2d8:	ffff                	0xffff
 2da:	ffff                	0xffff
 2dc:	ffff                	0xffff
 2de:	ffff                	0xffff
	...
 2e8:	0001                	nop
 2ea:	0000                	unimp
 2ec:	0000                	unimp
 2ee:	0000                	unimp
 2f0:	fffe                	fsw	ft11,252(sp)
 2f2:	ffff                	0xffff
 2f4:	ffff                	0xffff
 2f6:	7fff                	0x7fff
 2f8:	ffff                	0xffff
 2fa:	ffff                	0xffff
 2fc:	ffff                	0xffff
 2fe:	7fff                	0x7fff
 300:	0000                	unimp
 302:	0000                	unimp
 304:	0000                	unimp
 306:	8000                	0x8000
 308:	fffd                	bnez	a5,306 <ans+0x1ee>
 30a:	ffff                	0xffff
 30c:	ffff                	0xffff
 30e:	ffff                	0xffff
 310:	fffe                	fsw	ft11,252(sp)
 312:	ffff                	0xffff
 314:	ffff                	0xffff
 316:	ffff                	0xffff

00000318 <test_data>:
	...
 320:	0001                	nop
 322:	0000                	unimp
 324:	0000                	unimp
 326:	0000                	unimp
 328:	0002                	c.slli64	zero
 32a:	0000                	unimp
 32c:	0000                	unimp
 32e:	0000                	unimp
 330:	ffff                	0xffff
 332:	ffff                	0xffff
 334:	ffff                	0xffff
 336:	7fff                	0x7fff
 338:	0000                	unimp
 33a:	0000                	unimp
 33c:	0000                	unimp
 33e:	8000                	0x8000
 340:	0001                	nop
 342:	0000                	unimp
 344:	0000                	unimp
 346:	8000                	0x8000
 348:	fffe                	fsw	ft11,252(sp)
 34a:	ffff                	0xffff
 34c:	ffff                	0xffff
 34e:	ffff                	0xffff
 350:	ffff                	0xffff
 352:	ffff                	0xffff
 354:	ffff                	0xffff
 356:	ffff                	0xffff

Disassembly of section .comment:

00000000 <.comment>:
   0:	3a434347          	fmsub.d	ft6,ft6,ft4,ft7,rmm
   4:	2820                	fld	fs0,80(s0)
   6:	29554e47          	fmsub.s	ft8,fa0,fs5,ft5,rmm
   a:	3820                	fld	fs0,112(s0)
   c:	322e                	fld	ft4,232(sp)
   e:	302e                	fld	ft0,232(sp)
	...
