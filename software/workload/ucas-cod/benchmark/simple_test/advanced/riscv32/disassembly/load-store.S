
../riscv32/elf/load-store:     file format elf32-littleriscv


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
  48:	fe010113          	addi	sp,sp,-32 # 3fe0 <sh_ans+0x3d78>
  4c:	00812c23          	sw	s0,24(sp)
  50:	00912a23          	sw	s1,20(sp)
  54:	20400493          	li	s1,516
  58:	01212823          	sw	s2,16(sp)
  5c:	01312623          	sw	s3,12(sp)
  60:	01412423          	sw	s4,8(sp)
  64:	20400913          	li	s2,516
  68:	00112e23          	sw	ra,28(sp)
  6c:	01448993          	addi	s3,s1,20
  70:	01048a13          	addi	s4,s1,16
  74:	20400413          	li	s0,516
  78:	00041503          	lh	a0,0(s0)
  7c:	0009a783          	lw	a5,0(s3)
  80:	00240413          	addi	s0,s0,2
  84:	00498993          	addi	s3,s3,4
  88:	40f50533          	sub	a0,a0,a5
  8c:	00153513          	seqz	a0,a0
  90:	f95ff0ef          	jal	ra,24 <nemu_assert>
  94:	ff4412e3          	bne	s0,s4,78 <main+0x30>
  98:	03490413          	addi	s0,s2,52
  9c:	0004d503          	lhu	a0,0(s1)
  a0:	00042783          	lw	a5,0(s0)
  a4:	00248493          	addi	s1,s1,2
  a8:	00440413          	addi	s0,s0,4
  ac:	40f50533          	sub	a0,a0,a5
  b0:	00153513          	seqz	a0,a0
  b4:	f71ff0ef          	jal	ra,24 <nemu_assert>
  b8:	ff4492e3          	bne	s1,s4,9c <main+0x54>
  bc:	00294703          	lbu	a4,2(s2)
  c0:	00194683          	lbu	a3,1(s2)
  c4:	00394783          	lbu	a5,3(s2)
  c8:	00494503          	lbu	a0,4(s2)
  cc:	00871713          	slli	a4,a4,0x8
  d0:	00d76733          	or	a4,a4,a3
  d4:	01079793          	slli	a5,a5,0x10
  d8:	05492683          	lw	a3,84(s2)
  dc:	00e7e7b3          	or	a5,a5,a4
  e0:	01851513          	slli	a0,a0,0x18
  e4:	00f56533          	or	a0,a0,a5
  e8:	40a68533          	sub	a0,a3,a0
  ec:	00153513          	seqz	a0,a0
  f0:	f35ff0ef          	jal	ra,24 <nemu_assert>
  f4:	00694703          	lbu	a4,6(s2)
  f8:	00594683          	lbu	a3,5(s2)
  fc:	00794783          	lbu	a5,7(s2)
 100:	00894503          	lbu	a0,8(s2)
 104:	00871713          	slli	a4,a4,0x8
 108:	00d76733          	or	a4,a4,a3
 10c:	01079793          	slli	a5,a5,0x10
 110:	05892683          	lw	a3,88(s2)
 114:	00e7e7b3          	or	a5,a5,a4
 118:	01851513          	slli	a0,a0,0x18
 11c:	00f56533          	or	a0,a0,a5
 120:	40a68533          	sub	a0,a3,a0
 124:	00153513          	seqz	a0,a0
 128:	efdff0ef          	jal	ra,24 <nemu_assert>
 12c:	00a94703          	lbu	a4,10(s2)
 130:	00994683          	lbu	a3,9(s2)
 134:	00b94783          	lbu	a5,11(s2)
 138:	00c94503          	lbu	a0,12(s2)
 13c:	00871713          	slli	a4,a4,0x8
 140:	00d76733          	or	a4,a4,a3
 144:	01079793          	slli	a5,a5,0x10
 148:	05c92683          	lw	a3,92(s2)
 14c:	00e7e7b3          	or	a5,a5,a4
 150:	01851513          	slli	a0,a0,0x18
 154:	00f56533          	or	a0,a0,a5
 158:	40d50533          	sub	a0,a0,a3
 15c:	00153513          	seqz	a0,a0
 160:	ec5ff0ef          	jal	ra,24 <nemu_assert>
 164:	00e94703          	lbu	a4,14(s2)
 168:	00d94683          	lbu	a3,13(s2)
 16c:	00f94783          	lbu	a5,15(s2)
 170:	01094503          	lbu	a0,16(s2)
 174:	00871713          	slli	a4,a4,0x8
 178:	00d76733          	or	a4,a4,a3
 17c:	01079793          	slli	a5,a5,0x10
 180:	06092683          	lw	a3,96(s2)
 184:	00e7e7b3          	or	a5,a5,a4
 188:	01851513          	slli	a0,a0,0x18
 18c:	00f56533          	or	a0,a0,a5
 190:	40a68533          	sub	a0,a3,a0
 194:	00153513          	seqz	a0,a0
 198:	e8dff0ef          	jal	ra,24 <nemu_assert>
 19c:	06490493          	addi	s1,s2,100
 1a0:	00100413          	li	s0,1
 1a4:	00100a13          	li	s4,1
 1a8:	01100993          	li	s3,17
 1ac:	008a17b3          	sll	a5,s4,s0
 1b0:	0004a503          	lw	a0,0(s1)
 1b4:	fff7c793          	not	a5,a5
 1b8:	01079793          	slli	a5,a5,0x10
 1bc:	0107d793          	srli	a5,a5,0x10
 1c0:	00890733          	add	a4,s2,s0
 1c4:	40f50533          	sub	a0,a0,a5
 1c8:	00240413          	addi	s0,s0,2
 1cc:	00153513          	seqz	a0,a0
 1d0:	fef71fa3          	sh	a5,-1(a4)
 1d4:	00448493          	addi	s1,s1,4
 1d8:	e4dff0ef          	jal	ra,24 <nemu_assert>
 1dc:	fd3418e3          	bne	s0,s3,1ac <main+0x164>
 1e0:	01c12083          	lw	ra,28(sp)
 1e4:	01812403          	lw	s0,24(sp)
 1e8:	01412483          	lw	s1,20(sp)
 1ec:	01012903          	lw	s2,16(sp)
 1f0:	00c12983          	lw	s3,12(sp)
 1f4:	00812a03          	lw	s4,8(sp)
 1f8:	00000513          	li	a0,0
 1fc:	02010113          	addi	sp,sp,32
 200:	00008067          	ret

Disassembly of section .data:

00000204 <mem>:
 204:	0000                	unimp
 206:	0258                	addi	a4,sp,260
 208:	4abc                	lw	a5,80(a3)
 20a:	7fff                	0x7fff
 20c:	8000                	0x8000
 20e:	8100                	0x8100
 210:	abcd                	j	802 <sh_ans+0x59a>
 212:	ffff                	0xffff
 214:	0000                	unimp
	...

00000218 <lh_ans>:
 218:	0000                	unimp
 21a:	0000                	unimp
 21c:	0258                	addi	a4,sp,260
 21e:	0000                	unimp
 220:	4abc                	lw	a5,80(a3)
 222:	0000                	unimp
 224:	7fff                	0x7fff
 226:	0000                	unimp
 228:	8000                	0x8000
 22a:	ffff                	0xffff
 22c:	8100                	0x8100
 22e:	ffff                	0xffff
 230:	abcd                	j	822 <sh_ans+0x5ba>
 232:	ffff                	0xffff
 234:	ffff                	0xffff
 236:	ffff                	0xffff

00000238 <lhu_ans>:
 238:	0000                	unimp
 23a:	0000                	unimp
 23c:	0258                	addi	a4,sp,260
 23e:	0000                	unimp
 240:	4abc                	lw	a5,80(a3)
 242:	0000                	unimp
 244:	7fff                	0x7fff
 246:	0000                	unimp
 248:	8000                	0x8000
 24a:	0000                	unimp
 24c:	8100                	0x8100
 24e:	0000                	unimp
 250:	abcd                	j	842 <sh_ans+0x5da>
 252:	0000                	unimp
 254:	ffff                	0xffff
	...

00000258 <lwlr_ans>:
 258:	5800                	lw	s0,48(s0)
 25a:	bc02                	fsd	ft0,56(sp)
 25c:	ff4a                	fsw	fs2,188(sp)
 25e:	007f                	0x7f
 260:	0080                	addi	s0,sp,64
 262:	cd81                	beqz	a1,27a <sh_ans+0x12>
 264:	00ffffab          	0xffffab

00000268 <sh_ans>:
 268:	fffd                	bnez	a5,266 <lwlr_ans+0xe>
 26a:	0000                	unimp
 26c:	0000fff7          	0xfff7
 270:	ffdf 0000 ff7f      	0xff7f0000ffdf
 276:	0000                	unimp
 278:	fdff                	0xfdff
 27a:	0000                	unimp
 27c:	f7ff                	0xf7ff
 27e:	0000                	unimp
 280:	dfff                	0xdfff
 282:	0000                	unimp
 284:	7fff                	0x7fff
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
