
../riscv32/elf/recursion:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <start>:
   0:	00004137          	lui	sp,0x4
   4:	00c0006f          	j	10 <continued>
   8:	00000013          	nop

0000000c <global_result>:
   c:	ffff                	0xffff
   e:	ffff                	0xffff

00000010 <continued>:
  10:	200000ef          	jal	ra,210 <main>
  14:	1f0000ef          	jal	ra,204 <hit_good_trap>

00000018 <f0>:
  18:	29c02703          	lw	a4,668(zero) # 29c <lvl>
  1c:	00b75463          	bge	a4,a1,24 <f0+0xc>
  20:	28b02e23          	sw	a1,668(zero) # 29c <lvl>
  24:	2a002783          	lw	a5,672(zero) # 2a0 <rec>
  28:	00178793          	addi	a5,a5,1
  2c:	2af02023          	sw	a5,672(zero) # 2a0 <rec>
  30:	02a05863          	blez	a0,60 <f0+0x48>
  34:	00200793          	li	a5,2
  38:	28c02303          	lw	t1,652(zero) # 28c <func+0xc>
  3c:	02a7d663          	bge	a5,a0,68 <f0+0x50>
  40:	00000793          	li	a5,0
  44:	00200713          	li	a4,2
  48:	ffd50513          	addi	a0,a0,-3
  4c:	00178793          	addi	a5,a5,1
  50:	fea74ce3          	blt	a4,a0,48 <f0+0x30>
  54:	00158593          	addi	a1,a1,1
  58:	00078513          	mv	a0,a5
  5c:	00030067          	jr	t1
  60:	00100513          	li	a0,1
  64:	00008067          	ret
  68:	00000793          	li	a5,0
  6c:	fe9ff06f          	j	54 <f0+0x3c>

00000070 <f1>:
  70:	29c02703          	lw	a4,668(zero) # 29c <lvl>
  74:	00b75463          	bge	a4,a1,7c <f1+0xc>
  78:	28b02e23          	sw	a1,668(zero) # 29c <lvl>
  7c:	2a002783          	lw	a5,672(zero) # 2a0 <rec>
  80:	00178793          	addi	a5,a5,1
  84:	2af02023          	sw	a5,672(zero) # 2a0 <rec>
  88:	00a05a63          	blez	a0,9c <f1+0x2c>
  8c:	28002303          	lw	t1,640(zero) # 280 <func>
  90:	00158593          	addi	a1,a1,1
  94:	fff50513          	addi	a0,a0,-1
  98:	00030067          	jr	t1
  9c:	00100513          	li	a0,1
  a0:	00008067          	ret

000000a4 <f2>:
  a4:	29c02703          	lw	a4,668(zero) # 29c <lvl>
  a8:	00b75463          	bge	a4,a1,b0 <f2+0xc>
  ac:	28b02e23          	sw	a1,668(zero) # 29c <lvl>
  b0:	2a002783          	lw	a5,672(zero) # 2a0 <rec>
  b4:	00100693          	li	a3,1
  b8:	00178793          	addi	a5,a5,1
  bc:	2af02023          	sw	a5,672(zero) # 2a0 <rec>
  c0:	02a05663          	blez	a0,ec <f2+0x48>
  c4:	28402783          	lw	a5,644(zero) # 284 <func+0x4>
  c8:	ff010113          	addi	sp,sp,-16 # 3ff0 <rec+0x3d50>
  cc:	00112623          	sw	ra,12(sp)
  d0:	00158593          	addi	a1,a1,1
  d4:	000780e7          	jalr	a5
  d8:	00c12083          	lw	ra,12(sp)
  dc:	00950693          	addi	a3,a0,9
  e0:	00068513          	mv	a0,a3
  e4:	01010113          	addi	sp,sp,16
  e8:	00008067          	ret
  ec:	00068513          	mv	a0,a3
  f0:	00008067          	ret

000000f4 <f3>:
  f4:	29c02703          	lw	a4,668(zero) # 29c <lvl>
  f8:	fe010113          	addi	sp,sp,-32
  fc:	00112e23          	sw	ra,28(sp)
 100:	00812c23          	sw	s0,24(sp)
 104:	00912a23          	sw	s1,20(sp)
 108:	01212823          	sw	s2,16(sp)
 10c:	01312623          	sw	s3,12(sp)
 110:	00b75463          	bge	a4,a1,118 <f3+0x24>
 114:	28b02e23          	sw	a1,668(zero) # 29c <lvl>
 118:	2a002783          	lw	a5,672(zero) # 2a0 <rec>
 11c:	00100413          	li	s0,1
 120:	00178793          	addi	a5,a5,1
 124:	2af02023          	sw	a5,672(zero) # 2a0 <rec>
 128:	08a05c63          	blez	a0,1c0 <f3+0xcc>
 12c:	28000993          	li	s3,640
 130:	0089a783          	lw	a5,8(s3)
 134:	40155913          	srai	s2,a0,0x1
 138:	00158493          	addi	s1,a1,1
 13c:	00048593          	mv	a1,s1
 140:	00090513          	mv	a0,s2
 144:	000780e7          	jalr	a5
 148:	00000413          	li	s0,0
 14c:	00000793          	li	a5,0
 150:	00300693          	li	a3,3
 154:	02000593          	li	a1,32
 158:	0016f713          	andi	a4,a3,1
 15c:	00f51633          	sll	a2,a0,a5
 160:	00178793          	addi	a5,a5,1
 164:	00070463          	beqz	a4,16c <f3+0x78>
 168:	00c40433          	add	s0,s0,a2
 16c:	4016d693          	srai	a3,a3,0x1
 170:	feb794e3          	bne	a5,a1,158 <f3+0x64>
 174:	0089a783          	lw	a5,8(s3)
 178:	00048593          	mv	a1,s1
 17c:	00090513          	mv	a0,s2
 180:	000780e7          	jalr	a5
 184:	00000793          	li	a5,0
 188:	00200713          	li	a4,2
 18c:	00000613          	li	a2,0
 190:	02000593          	li	a1,32
 194:	00178793          	addi	a5,a5,1
 198:	00f516b3          	sll	a3,a0,a5
 19c:	40175713          	srai	a4,a4,0x1
 1a0:	00b78e63          	beq	a5,a1,1bc <f3+0xc8>
 1a4:	fe0708e3          	beqz	a4,194 <f3+0xa0>
 1a8:	00178793          	addi	a5,a5,1
 1ac:	00d60633          	add	a2,a2,a3
 1b0:	40175713          	srai	a4,a4,0x1
 1b4:	00f516b3          	sll	a3,a0,a5
 1b8:	feb796e3          	bne	a5,a1,1a4 <f3+0xb0>
 1bc:	00c40433          	add	s0,s0,a2
 1c0:	00040513          	mv	a0,s0
 1c4:	01c12083          	lw	ra,28(sp)
 1c8:	01812403          	lw	s0,24(sp)
 1cc:	01412483          	lw	s1,20(sp)
 1d0:	01012903          	lw	s2,16(sp)
 1d4:	00c12983          	lw	s3,12(sp)
 1d8:	02010113          	addi	sp,sp,32
 1dc:	00008067          	ret

000001e0 <_halt>:
 1e0:	000007b7          	lui	a5,0x0
 1e4:	00a7a623          	sw	a0,12(a5) # c <global_result>
 1e8:	0000006f          	j	1e8 <_halt+0x8>

000001ec <nemu_assert>:
 1ec:	00051a63          	bnez	a0,200 <nemu_assert+0x14>
 1f0:	000007b7          	lui	a5,0x0
 1f4:	00100713          	li	a4,1
 1f8:	00e7a623          	sw	a4,12(a5) # c <global_result>
 1fc:	0000006f          	j	1fc <nemu_assert+0x10>
 200:	00008067          	ret

00000204 <hit_good_trap>:
 204:	000007b7          	lui	a5,0x0
 208:	0007a623          	sw	zero,12(a5) # c <global_result>
 20c:	0000006f          	j	20c <hit_good_trap+0x8>

Disassembly of section .text.startup:

00000210 <main>:
 210:	ff010113          	addi	sp,sp,-16
 214:	00812423          	sw	s0,8(sp)
 218:	28000413          	li	s0,640
 21c:	00042783          	lw	a5,0(s0)
 220:	00004537          	lui	a0,0x4
 224:	00112623          	sw	ra,12(sp)
 228:	00000593          	li	a1,0
 22c:	82350513          	addi	a0,a0,-2013 # 3823 <rec+0x3583>
 230:	000780e7          	jalr	a5
 234:	01042783          	lw	a5,16(s0)
 238:	40a78533          	sub	a0,a5,a0
 23c:	00153513          	seqz	a0,a0
 240:	fadff0ef          	jal	ra,1ec <nemu_assert>
 244:	01442503          	lw	a0,20(s0)
 248:	2a002783          	lw	a5,672(zero) # 2a0 <rec>
 24c:	40f50533          	sub	a0,a0,a5
 250:	00153513          	seqz	a0,a0
 254:	f99ff0ef          	jal	ra,1ec <nemu_assert>
 258:	01842503          	lw	a0,24(s0)
 25c:	29c02783          	lw	a5,668(zero) # 29c <lvl>
 260:	40f50533          	sub	a0,a0,a5
 264:	00153513          	seqz	a0,a0
 268:	f85ff0ef          	jal	ra,1ec <nemu_assert>
 26c:	00c12083          	lw	ra,12(sp)
 270:	00812403          	lw	s0,8(sp)
 274:	00000513          	li	a0,0
 278:	01010113          	addi	sp,sp,16
 27c:	00008067          	ret

Disassembly of section .data:

00000280 <func>:
 280:	0018                	0x18
 282:	0000                	unimp
 284:	0070                	addi	a2,sp,12
 286:	0000                	unimp
 288:	00a4                	addi	s1,sp,72
 28a:	0000                	unimp
 28c:	00f4                	addi	a3,sp,76
	...

00000290 <ans>:
 290:	957e                	add	a0,a0,t6
 292:	0000                	unimp
 294:	00da                	slli	ra,ra,0x16
 296:	0000                	unimp
 298:	0014                	0x14
	...

Disassembly of section .sbss:

0000029c <lvl>:
 29c:	0000                	unimp
	...

000002a0 <rec>:
 2a0:	0000                	unimp
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
