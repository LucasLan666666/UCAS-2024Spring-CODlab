
../riscv32/elf/sub-longlong:     file format elf32-littleriscv


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

00000048 <sub>:
  48:	00050793          	mv	a5,a0
  4c:	40c50533          	sub	a0,a0,a2
  50:	00a7b7b3          	sltu	a5,a5,a0
  54:	40d585b3          	sub	a1,a1,a3
  58:	40f585b3          	sub	a1,a1,a5
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
  9c:	000aa683          	lw	a3,0(s5)
  a0:	00442583          	lw	a1,4(s0)
  a4:	004aa783          	lw	a5,4(s5)
  a8:	40a68733          	sub	a4,a3,a0
  ac:	004a2603          	lw	a2,4(s4)
  b0:	000a2503          	lw	a0,0(s4)
  b4:	00e6b6b3          	sltu	a3,a3,a4
  b8:	40b787b3          	sub	a5,a5,a1
  bc:	40d787b3          	sub	a5,a5,a3
  c0:	00e54533          	xor	a0,a0,a4
  c4:	00f647b3          	xor	a5,a2,a5
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
 120:	ffff                	0xffff
 122:	ffff                	0xffff
 124:	ffff                	0xffff
 126:	ffff                	0xffff
 128:	fffe                	fsw	ft11,252(sp)
 12a:	ffff                	0xffff
 12c:	ffff                	0xffff
 12e:	ffff                	0xffff
 130:	0001                	nop
 132:	0000                	unimp
 134:	0000                	unimp
 136:	8000                	0x8000
 138:	0000                	unimp
 13a:	0000                	unimp
 13c:	0000                	unimp
 13e:	8000                	0x8000
 140:	ffff                	0xffff
 142:	ffff                	0xffff
 144:	ffff                	0xffff
 146:	7fff                	0x7fff
 148:	0002                	c.slli64	zero
 14a:	0000                	unimp
 14c:	0000                	unimp
 14e:	0000                	unimp
 150:	0001                	nop
 152:	0000                	unimp
 154:	0000                	unimp
 156:	0000                	unimp
 158:	0001                	nop
	...
 166:	0000                	unimp
 168:	ffff                	0xffff
 16a:	ffff                	0xffff
 16c:	ffff                	0xffff
 16e:	ffff                	0xffff
 170:	0002                	c.slli64	zero
 172:	0000                	unimp
 174:	0000                	unimp
 176:	8000                	0x8000
 178:	0001                	nop
 17a:	0000                	unimp
 17c:	0000                	unimp
 17e:	8000                	0x8000
 180:	0000                	unimp
 182:	0000                	unimp
 184:	0000                	unimp
 186:	8000                	0x8000
 188:	00000003          	lb	zero,0(zero) # 0 <start>
 18c:	0000                	unimp
 18e:	0000                	unimp
 190:	0002                	c.slli64	zero
 192:	0000                	unimp
 194:	0000                	unimp
 196:	0000                	unimp
 198:	0002                	c.slli64	zero
 19a:	0000                	unimp
 19c:	0000                	unimp
 19e:	0000                	unimp
 1a0:	0001                	nop
	...
 1ae:	0000                	unimp
 1b0:	00000003          	lb	zero,0(zero) # 0 <start>
 1b4:	0000                	unimp
 1b6:	8000                	0x8000
 1b8:	0002                	c.slli64	zero
 1ba:	0000                	unimp
 1bc:	0000                	unimp
 1be:	8000                	0x8000
 1c0:	0001                	nop
 1c2:	0000                	unimp
 1c4:	0000                	unimp
 1c6:	8000                	0x8000
 1c8:	0004                	0x4
 1ca:	0000                	unimp
 1cc:	0000                	unimp
 1ce:	0000                	unimp
 1d0:	00000003          	lb	zero,0(zero) # 0 <start>
 1d4:	0000                	unimp
 1d6:	0000                	unimp
 1d8:	ffff                	0xffff
 1da:	ffff                	0xffff
 1dc:	ffff                	0xffff
 1de:	7fff                	0x7fff
 1e0:	fffe                	fsw	ft11,252(sp)
 1e2:	ffff                	0xffff
 1e4:	ffff                	0xffff
 1e6:	7fff                	0x7fff
 1e8:	fffd                	bnez	a5,1e6 <ans+0xce>
 1ea:	ffff                	0xffff
 1ec:	ffff                	0xffff
 1ee:	7fff                	0x7fff
	...
 1f8:	ffff                	0xffff
 1fa:	ffff                	0xffff
 1fc:	ffff                	0xffff
 1fe:	ffff                	0xffff
 200:	fffe                	fsw	ft11,252(sp)
 202:	ffff                	0xffff
 204:	ffff                	0xffff
 206:	ffff                	0xffff
 208:	0001                	nop
 20a:	0000                	unimp
 20c:	0000                	unimp
 20e:	8000                	0x8000
 210:	0000                	unimp
 212:	0000                	unimp
 214:	0000                	unimp
 216:	8000                	0x8000
 218:	0000                	unimp
 21a:	0000                	unimp
 21c:	0000                	unimp
 21e:	8000                	0x8000
 220:	ffff                	0xffff
 222:	ffff                	0xffff
 224:	ffff                	0xffff
 226:	7fff                	0x7fff
 228:	fffe                	fsw	ft11,252(sp)
 22a:	ffff                	0xffff
 22c:	ffff                	0xffff
 22e:	7fff                	0x7fff
 230:	0001                	nop
	...
 23e:	0000                	unimp
 240:	ffff                	0xffff
 242:	ffff                	0xffff
 244:	ffff                	0xffff
 246:	ffff                	0xffff
 248:	0002                	c.slli64	zero
 24a:	0000                	unimp
 24c:	0000                	unimp
 24e:	8000                	0x8000
 250:	0001                	nop
 252:	0000                	unimp
 254:	0000                	unimp
 256:	8000                	0x8000
 258:	0001                	nop
 25a:	0000                	unimp
 25c:	0000                	unimp
 25e:	8000                	0x8000
 260:	0000                	unimp
 262:	0000                	unimp
 264:	0000                	unimp
 266:	8000                	0x8000
 268:	ffff                	0xffff
 26a:	ffff                	0xffff
 26c:	ffff                	0xffff
 26e:	7fff                	0x7fff
 270:	0002                	c.slli64	zero
 272:	0000                	unimp
 274:	0000                	unimp
 276:	0000                	unimp
 278:	0001                	nop
	...
 286:	0000                	unimp
 288:	00000003          	lb	zero,0(zero) # 0 <start>
 28c:	0000                	unimp
 28e:	8000                	0x8000
 290:	0002                	c.slli64	zero
 292:	0000                	unimp
 294:	0000                	unimp
 296:	8000                	0x8000
 298:	fffe                	fsw	ft11,252(sp)
 29a:	ffff                	0xffff
 29c:	ffff                	0xffff
 29e:	ffff                	0xffff
 2a0:	fffd                	bnez	a5,29e <ans+0x186>
 2a2:	ffff                	0xffff
 2a4:	ffff                	0xffff
 2a6:	ffff                	0xffff
 2a8:	fffc                	fsw	fa5,124(a5)
 2aa:	ffff                	0xffff
 2ac:	ffff                	0xffff
 2ae:	ffff                	0xffff
 2b0:	ffff                	0xffff
 2b2:	ffff                	0xffff
 2b4:	ffff                	0xffff
 2b6:	7fff                	0x7fff
 2b8:	fffe                	fsw	ft11,252(sp)
 2ba:	ffff                	0xffff
 2bc:	ffff                	0xffff
 2be:	7fff                	0x7fff
 2c0:	fffd                	bnez	a5,2be <ans+0x1a6>
 2c2:	ffff                	0xffff
 2c4:	ffff                	0xffff
 2c6:	7fff                	0x7fff
	...
 2d0:	ffff                	0xffff
 2d2:	ffff                	0xffff
 2d4:	ffff                	0xffff
 2d6:	ffff                	0xffff
 2d8:	ffff                	0xffff
 2da:	ffff                	0xffff
 2dc:	ffff                	0xffff
 2de:	ffff                	0xffff
 2e0:	fffe                	fsw	ft11,252(sp)
 2e2:	ffff                	0xffff
 2e4:	ffff                	0xffff
 2e6:	ffff                	0xffff
 2e8:	fffd                	bnez	a5,2e6 <ans+0x1ce>
 2ea:	ffff                	0xffff
 2ec:	ffff                	0xffff
 2ee:	ffff                	0xffff
 2f0:	0000                	unimp
 2f2:	0000                	unimp
 2f4:	0000                	unimp
 2f6:	8000                	0x8000
 2f8:	ffff                	0xffff
 2fa:	ffff                	0xffff
 2fc:	ffff                	0xffff
 2fe:	7fff                	0x7fff
 300:	fffe                	fsw	ft11,252(sp)
 302:	ffff                	0xffff
 304:	ffff                	0xffff
 306:	7fff                	0x7fff
 308:	0001                	nop
	...

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
