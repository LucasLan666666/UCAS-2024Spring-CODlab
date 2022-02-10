
../mips/elf/recursion:     file format elf32-littlemips


Disassembly of section .text:

00000000 <start>:
   0:	241d4000 	li	sp,16384
   4:	08000004 	j	10 <continued>
   8:	00000000 	nop

0000000c <global_result>:
   c:	ffffffff 	sdc3	$31,-1(ra)

00000010 <continued>:
  10:	0c0000b6 	jal	2d8 <main>
  14:	00000000 	nop
  18:	0c0000b2 	jal	2c8 <hit_good_trap>
  1c:	00000000 	nop

00000020 <f0>:
  20:	3c030000 	lui	v1,0x0
  24:	8c620394 	lw	v0,916(v1)
  28:	0045102a 	slt	v0,v0,a1
  2c:	10400002 	beqz	v0,38 <f0+0x18>
  30:	00000000 	nop
  34:	ac650394 	sw	a1,916(v1)
  38:	3c030000 	lui	v1,0x0
  3c:	8c620398 	lw	v0,920(v1)
  40:	24420001 	addiu	v0,v0,1
  44:	ac620398 	sw	v0,920(v1)
  48:	18800010 	blez	a0,8c <f0+0x6c>
  4c:	00000000 	nop
  50:	3c030000 	lui	v1,0x0
  54:	28820003 	slti	v0,a0,3
  58:	8c790390 	lw	t9,912(v1)
  5c:	1440000e 	bnez	v0,98 <f0+0x78>
  60:	00000000 	nop
  64:	00001025 	move	v0,zero
  68:	2484fffd 	addiu	a0,a0,-3
  6c:	28830003 	slti	v1,a0,3
  70:	24420001 	addiu	v0,v0,1
  74:	1060fffc 	beqz	v1,68 <f0+0x48>
  78:	00000000 	nop
  7c:	24a50001 	addiu	a1,a1,1
  80:	00402025 	move	a0,v0
  84:	03200008 	jr	t9
  88:	00000000 	nop
  8c:	24020001 	li	v0,1
  90:	03e00008 	jr	ra
  94:	00000000 	nop
  98:	00001025 	move	v0,zero
  9c:	1000fff7 	b	7c <f0+0x5c>
  a0:	00000000 	nop

000000a4 <f1>:
  a4:	3c030000 	lui	v1,0x0
  a8:	8c620394 	lw	v0,916(v1)
  ac:	0045102a 	slt	v0,v0,a1
  b0:	10400002 	beqz	v0,bc <f1+0x18>
  b4:	00000000 	nop
  b8:	ac650394 	sw	a1,916(v1)
  bc:	3c030000 	lui	v1,0x0
  c0:	8c620398 	lw	v0,920(v1)
  c4:	24420001 	addiu	v0,v0,1
  c8:	ac620398 	sw	v0,920(v1)
  cc:	18800007 	blez	a0,ec <f1+0x48>
  d0:	00000000 	nop
  d4:	3c020000 	lui	v0,0x0
  d8:	8c590384 	lw	t9,900(v0)
  dc:	24a50001 	addiu	a1,a1,1
  e0:	2484ffff 	addiu	a0,a0,-1
  e4:	03200008 	jr	t9
  e8:	00000000 	nop
  ec:	24020001 	li	v0,1
  f0:	03e00008 	jr	ra
  f4:	00000000 	nop

000000f8 <f2>:
  f8:	3c030000 	lui	v1,0x0
  fc:	8c620394 	lw	v0,916(v1)
 100:	0045102a 	slt	v0,v0,a1
 104:	10400002 	beqz	v0,110 <f2+0x18>
 108:	00000000 	nop
 10c:	ac650394 	sw	a1,916(v1)
 110:	3c030000 	lui	v1,0x0
 114:	8c620398 	lw	v0,920(v1)
 118:	24420001 	addiu	v0,v0,1
 11c:	ac620398 	sw	v0,920(v1)
 120:	1880000d 	blez	a0,158 <f2+0x60>
 124:	00000000 	nop
 128:	3c020000 	lui	v0,0x0
 12c:	27bdffe8 	addiu	sp,sp,-24
 130:	8c420388 	lw	v0,904(v0)
 134:	24a50001 	addiu	a1,a1,1
 138:	afbf0014 	sw	ra,20(sp)
 13c:	0040f809 	jalr	v0
 140:	00000000 	nop
 144:	8fbf0014 	lw	ra,20(sp)
 148:	24420009 	addiu	v0,v0,9
 14c:	27bd0018 	addiu	sp,sp,24
 150:	03e00008 	jr	ra
 154:	00000000 	nop
 158:	24020001 	li	v0,1
 15c:	03e00008 	jr	ra
 160:	00000000 	nop

00000164 <f3>:
 164:	3c030000 	lui	v1,0x0
 168:	8c620394 	lw	v0,916(v1)
 16c:	0045102a 	slt	v0,v0,a1
 170:	10400002 	beqz	v0,17c <f3+0x18>
 174:	00000000 	nop
 178:	ac650394 	sw	a1,916(v1)
 17c:	3c030000 	lui	v1,0x0
 180:	8c620398 	lw	v0,920(v1)
 184:	24420001 	addiu	v0,v0,1
 188:	ac620398 	sw	v0,920(v1)
 18c:	1880003e 	blez	a0,288 <f3+0x124>
 190:	00000000 	nop
 194:	27bdffd8 	addiu	sp,sp,-40
 198:	afb30020 	sw	s3,32(sp)
 19c:	3c130000 	lui	s3,0x0
 1a0:	26730384 	addiu	s3,s3,900
 1a4:	afb2001c 	sw	s2,28(sp)
 1a8:	afb10018 	sw	s1,24(sp)
 1ac:	00049043 	sra	s2,a0,0x1
 1b0:	24b10001 	addiu	s1,a1,1
 1b4:	8e620008 	lw	v0,8(s3)
 1b8:	afb00014 	sw	s0,20(sp)
 1bc:	02202825 	move	a1,s1
 1c0:	afbf0024 	sw	ra,36(sp)
 1c4:	02402025 	move	a0,s2
 1c8:	0040f809 	jalr	v0
 1cc:	00000000 	nop
 1d0:	00008025 	move	s0,zero
 1d4:	00001825 	move	v1,zero
 1d8:	24050003 	li	a1,3
 1dc:	24070020 	li	a3,32
 1e0:	30a40001 	andi	a0,a1,0x1
 1e4:	00623004 	sllv	a2,v0,v1
 1e8:	24630001 	addiu	v1,v1,1
 1ec:	10800002 	beqz	a0,1f8 <f3+0x94>
 1f0:	00000000 	nop
 1f4:	02068021 	addu	s0,s0,a2
 1f8:	00052843 	sra	a1,a1,0x1
 1fc:	1467fff8 	bne	v1,a3,1e0 <f3+0x7c>
 200:	00000000 	nop
 204:	8e620008 	lw	v0,8(s3)
 208:	02402025 	move	a0,s2
 20c:	02202825 	move	a1,s1
 210:	0040f809 	jalr	v0
 214:	00000000 	nop
 218:	00001825 	move	v1,zero
 21c:	24040002 	li	a0,2
 220:	00003825 	move	a3,zero
 224:	24080020 	li	t0,32
 228:	24630001 	addiu	v1,v1,1
 22c:	00042043 	sra	a0,a0,0x1
 230:	00623004 	sllv	a2,v0,v1
 234:	30850001 	andi	a1,a0,0x1
 238:	1068000a 	beq	v1,t0,264 <f3+0x100>
 23c:	00000000 	nop
 240:	10a0fff9 	beqz	a1,228 <f3+0xc4>
 244:	00000000 	nop
 248:	24630001 	addiu	v1,v1,1
 24c:	00042043 	sra	a0,a0,0x1
 250:	00e63821 	addu	a3,a3,a2
 254:	30850001 	andi	a1,a0,0x1
 258:	00623004 	sllv	a2,v0,v1
 25c:	1468fff8 	bne	v1,t0,240 <f3+0xdc>
 260:	00000000 	nop
 264:	8fbf0024 	lw	ra,36(sp)
 268:	02071021 	addu	v0,s0,a3
 26c:	8fb30020 	lw	s3,32(sp)
 270:	8fb2001c 	lw	s2,28(sp)
 274:	8fb10018 	lw	s1,24(sp)
 278:	8fb00014 	lw	s0,20(sp)
 27c:	27bd0028 	addiu	sp,sp,40
 280:	03e00008 	jr	ra
 284:	00000000 	nop
 288:	24020001 	li	v0,1
 28c:	03e00008 	jr	ra
 290:	00000000 	nop

00000294 <_halt>:
 294:	3c020000 	lui	v0,0x0
 298:	ac44000c 	sw	a0,12(v0)
 29c:	1000ffff 	b	29c <_halt+0x8>
 2a0:	00000000 	nop

000002a4 <nemu_assert>:
 2a4:	14800006 	bnez	a0,2c0 <nemu_assert+0x1c>
 2a8:	00000000 	nop
 2ac:	24030001 	li	v1,1
 2b0:	3c020000 	lui	v0,0x0
 2b4:	ac43000c 	sw	v1,12(v0)
 2b8:	1000ffff 	b	2b8 <nemu_assert+0x14>
 2bc:	00000000 	nop
 2c0:	03e00008 	jr	ra
 2c4:	00000000 	nop

000002c8 <hit_good_trap>:
 2c8:	3c020000 	lui	v0,0x0
 2cc:	ac40000c 	sw	zero,12(v0)
 2d0:	1000ffff 	b	2d0 <hit_good_trap+0x8>
 2d4:	00000000 	nop

Disassembly of section .text.startup:

000002d8 <main>:
 2d8:	3c020000 	lui	v0,0x0
 2dc:	27bdffe8 	addiu	sp,sp,-24
 2e0:	8c420384 	lw	v0,900(v0)
 2e4:	00002825 	move	a1,zero
 2e8:	afbf0014 	sw	ra,20(sp)
 2ec:	24043823 	li	a0,14371
 2f0:	0040f809 	jalr	v0
 2f4:	00000000 	nop
 2f8:	3c050000 	lui	a1,0x0
 2fc:	8ca40378 	lw	a0,888(a1)
 300:	24a50378 	addiu	a1,a1,888
 304:	00822026 	xor	a0,a0,v0
 308:	2c840001 	sltiu	a0,a0,1
 30c:	0c0000a9 	jal	2a4 <nemu_assert>
 310:	00000000 	nop
 314:	3c020000 	lui	v0,0x0
 318:	8ca40004 	lw	a0,4(a1)
 31c:	8c420398 	lw	v0,920(v0)
 320:	00822026 	xor	a0,a0,v0
 324:	2c840001 	sltiu	a0,a0,1
 328:	0c0000a9 	jal	2a4 <nemu_assert>
 32c:	00000000 	nop
 330:	3c020000 	lui	v0,0x0
 334:	8c420394 	lw	v0,916(v0)
 338:	8ca40008 	lw	a0,8(a1)
 33c:	00822026 	xor	a0,a0,v0
 340:	2c840001 	sltiu	a0,a0,1
 344:	0c0000a9 	jal	2a4 <nemu_assert>
 348:	00000000 	nop
 34c:	8fbf0014 	lw	ra,20(sp)
 350:	00001025 	move	v0,zero
 354:	27bd0018 	addiu	sp,sp,24
 358:	03e00008 	jr	ra
 35c:	00000000 	nop

Disassembly of section .MIPS.abiflags:

00000360 <.MIPS.abiflags>:
 360:	01200000 	0x1200000
 364:	01000101 	0x1000101
	...
 370:	00000001 	movf	zero,zero,$fcc0
 374:	00000000 	nop

Disassembly of section .data:

00000378 <ans>:
 378:	0000957e 	0x957e
 37c:	000000da 	0xda
 380:	00000014 	0x14

00000384 <func>:
 384:	00000020 	add	zero,zero,zero
 388:	000000a4 	0xa4
 38c:	000000f8 	0xf8
 390:	00000164 	0x164

Disassembly of section .bss:

00000394 <lvl>:
 394:	00000000 	nop

00000398 <rec>:
 398:	00000000 	nop

Disassembly of section .reginfo:

00000000 <.reginfo>:
   0:	a0000000 	sb	zero,0(zero)
	...

Disassembly of section .pdr:

00000000 <.pdr>:
   0:	00000020 	add	zero,zero,zero
	...
  18:	0000001d 	0x1d
  1c:	0000001f 	0x1f
  20:	000000a4 	0xa4
	...
  38:	0000001d 	0x1d
  3c:	0000001f 	0x1f
  40:	000000f8 	0xf8
  44:	80000000 	lb	zero,0(zero)
  48:	fffffffc 	sdc3	$31,-4(ra)
	...
  54:	00000018 	mult	zero,zero
  58:	0000001d 	0x1d
  5c:	0000001f 	0x1f
  60:	00000164 	0x164
  64:	800f0000 	lb	t7,0(zero)
  68:	fffffffc 	sdc3	$31,-4(ra)
	...
  74:	00000028 	0x28
  78:	0000001d 	0x1d
  7c:	0000001f 	0x1f
  80:	00000294 	0x294
	...
  98:	0000001d 	0x1d
  9c:	0000001f 	0x1f
  a0:	000002a4 	0x2a4
	...
  b8:	0000001d 	0x1d
  bc:	0000001f 	0x1f
  c0:	000002c8 	0x2c8
	...
  d8:	0000001d 	0x1d
  dc:	0000001f 	0x1f
  e0:	000002d8 	0x2d8
  e4:	80000000 	lb	zero,0(zero)
  e8:	fffffffc 	sdc3	$31,-4(ra)
	...
  f4:	00000018 	mult	zero,zero
  f8:	0000001d 	0x1d
  fc:	0000001f 	0x1f

Disassembly of section .gnu.attributes:

00000000 <.gnu.attributes>:
   0:	00000f41 	0xf41
   4:	756e6700 	jalx	5b99c00 <rec+0x5b99868>
   8:	00070100 	sll	zero,a3,0x4
   c:	01040000 	0x1040000

Disassembly of section .comment:

00000000 <.comment>:
   0:	3a434347 	xori	v1,s2,0x4347
   4:	4e472820 	c3	0x472820
   8:	36202955 	ori	zero,s1,0x2955
   c:	302e322e 	andi	t6,at,0x322e
	...
