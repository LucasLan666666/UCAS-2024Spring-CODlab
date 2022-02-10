
../mips/elf/min3:     file format elf32-littlemips


Disassembly of section .text:

00000000 <start>:
   0:	00000000 	nop
   4:	08000004 	j	10 <real_start>
   8:	00000000 	nop

0000000c <global_result>:
   c:	ffffffff 	sdc3	$31,-1(ra)

00000010 <real_start>:
  10:	241d0400 	li	sp,1024
  14:	0c000029 	jal	a4 <main>
  18:	00000000 	nop
  1c:	3c010000 	lui	at,0x0
  20:	ac20000c 	sw	zero,12(at)

00000024 <end_loop>:
  24:	08000009 	j	24 <end_loop>
  28:	00000000 	nop

0000002c <min3>:
  2c:	27bdfff0 	addiu	sp,sp,-16
  30:	afbe000c 	sw	s8,12(sp)
  34:	03a0f025 	move	s8,sp
  38:	afc40010 	sw	a0,16(s8)
  3c:	afc50014 	sw	a1,20(s8)
  40:	afc60018 	sw	a2,24(s8)
  44:	8fc30010 	lw	v1,16(s8)
  48:	8fc20014 	lw	v0,20(s8)
  4c:	0062102a 	slt	v0,v1,v0
  50:	10400005 	beqz	v0,68 <min3+0x3c>
  54:	00000000 	nop
  58:	8fc20010 	lw	v0,16(s8)
  5c:	afc20000 	sw	v0,0(s8)
  60:	10000003 	b	70 <min3+0x44>
  64:	00000000 	nop
  68:	8fc20014 	lw	v0,20(s8)
  6c:	afc20000 	sw	v0,0(s8)
  70:	8fc30018 	lw	v1,24(s8)
  74:	8fc20000 	lw	v0,0(s8)
  78:	0062102a 	slt	v0,v1,v0
  7c:	10400003 	beqz	v0,8c <min3+0x60>
  80:	00000000 	nop
  84:	8fc20018 	lw	v0,24(s8)
  88:	afc20000 	sw	v0,0(s8)
  8c:	8fc20000 	lw	v0,0(s8)
  90:	03c0e825 	move	sp,s8
  94:	8fbe000c 	lw	s8,12(sp)
  98:	27bd0010 	addiu	sp,sp,16
  9c:	03e00008 	jr	ra
  a0:	00000000 	nop

000000a4 <main>:
  a4:	27bdffd8 	addiu	sp,sp,-40
  a8:	afbf0024 	sw	ra,36(sp)
  ac:	afbe0020 	sw	s8,32(sp)
  b0:	03a0f025 	move	s8,sp
  b4:	afc0001c 	sw	zero,28(s8)
  b8:	afc00010 	sw	zero,16(s8)
  bc:	1000004f 	b	1fc <main+0x158>
  c0:	00000000 	nop
  c4:	afc00014 	sw	zero,20(s8)
  c8:	1000003c 	b	1bc <main+0x118>
  cc:	00000000 	nop
  d0:	afc00018 	sw	zero,24(s8)
  d4:	10000029 	b	17c <main+0xd8>
  d8:	00000000 	nop
  dc:	3c020000 	lui	v0,0x0
  e0:	8fc30010 	lw	v1,16(s8)
  e4:	00031880 	sll	v1,v1,0x2
  e8:	24420268 	addiu	v0,v0,616
  ec:	00621021 	addu	v0,v1,v0
  f0:	8c440000 	lw	a0,0(v0)
  f4:	3c020000 	lui	v0,0x0
  f8:	8fc30014 	lw	v1,20(s8)
  fc:	00031880 	sll	v1,v1,0x2
 100:	24420268 	addiu	v0,v0,616
 104:	00621021 	addu	v0,v1,v0
 108:	8c450000 	lw	a1,0(v0)
 10c:	3c020000 	lui	v0,0x0
 110:	8fc30018 	lw	v1,24(s8)
 114:	00031880 	sll	v1,v1,0x2
 118:	24420268 	addiu	v0,v0,616
 11c:	00621021 	addu	v0,v1,v0
 120:	8c420000 	lw	v0,0(v0)
 124:	00403025 	move	a2,v0
 128:	0c00000b 	jal	2c <min3>
 12c:	00000000 	nop
 130:	00402825 	move	a1,v0
 134:	8fc2001c 	lw	v0,28(s8)
 138:	24430001 	addiu	v1,v0,1
 13c:	afc3001c 	sw	v1,28(s8)
 140:	3c040000 	lui	a0,0x0
 144:	00021880 	sll	v1,v0,0x2
 148:	24820278 	addiu	v0,a0,632
 14c:	00621021 	addu	v0,v1,v0
 150:	8c420000 	lw	v0,0(v0)
 154:	10a20006 	beq	a1,v0,170 <main+0xcc>
 158:	00000000 	nop
 15c:	3c020000 	lui	v0,0x0
 160:	24030001 	li	v1,1
 164:	ac43000c 	sw	v1,12(v0)
 168:	08000009 	j	24 <end_loop>
 16c:	00000000 	nop
 170:	8fc20018 	lw	v0,24(s8)
 174:	24420001 	addiu	v0,v0,1
 178:	afc20018 	sw	v0,24(s8)
 17c:	8fc20018 	lw	v0,24(s8)
 180:	2c420004 	sltiu	v0,v0,4
 184:	1440ffd5 	bnez	v0,dc <main+0x38>
 188:	00000000 	nop
 18c:	8fc30018 	lw	v1,24(s8)
 190:	24020004 	li	v0,4
 194:	10620006 	beq	v1,v0,1b0 <main+0x10c>
 198:	00000000 	nop
 19c:	3c020000 	lui	v0,0x0
 1a0:	24030001 	li	v1,1
 1a4:	ac43000c 	sw	v1,12(v0)
 1a8:	08000009 	j	24 <end_loop>
 1ac:	00000000 	nop
 1b0:	8fc20014 	lw	v0,20(s8)
 1b4:	24420001 	addiu	v0,v0,1
 1b8:	afc20014 	sw	v0,20(s8)
 1bc:	8fc20014 	lw	v0,20(s8)
 1c0:	2c420004 	sltiu	v0,v0,4
 1c4:	1440ffc2 	bnez	v0,d0 <main+0x2c>
 1c8:	00000000 	nop
 1cc:	8fc30014 	lw	v1,20(s8)
 1d0:	24020004 	li	v0,4
 1d4:	10620006 	beq	v1,v0,1f0 <main+0x14c>
 1d8:	00000000 	nop
 1dc:	3c020000 	lui	v0,0x0
 1e0:	24030001 	li	v1,1
 1e4:	ac43000c 	sw	v1,12(v0)
 1e8:	08000009 	j	24 <end_loop>
 1ec:	00000000 	nop
 1f0:	8fc20010 	lw	v0,16(s8)
 1f4:	24420001 	addiu	v0,v0,1
 1f8:	afc20010 	sw	v0,16(s8)
 1fc:	8fc20010 	lw	v0,16(s8)
 200:	2c420004 	sltiu	v0,v0,4
 204:	1440ffaf 	bnez	v0,c4 <main+0x20>
 208:	00000000 	nop
 20c:	8fc30010 	lw	v1,16(s8)
 210:	24020004 	li	v0,4
 214:	10620006 	beq	v1,v0,230 <main+0x18c>
 218:	00000000 	nop
 21c:	3c020000 	lui	v0,0x0
 220:	24030001 	li	v1,1
 224:	ac43000c 	sw	v1,12(v0)
 228:	08000009 	j	24 <end_loop>
 22c:	00000000 	nop
 230:	00001025 	move	v0,zero
 234:	03c0e825 	move	sp,s8
 238:	8fbf0024 	lw	ra,36(sp)
 23c:	8fbe0020 	lw	s8,32(sp)
 240:	27bd0028 	addiu	sp,sp,40
 244:	03e00008 	jr	ra
 248:	00000000 	nop

Disassembly of section .MIPS.abiflags:

00000250 <.MIPS.abiflags>:
 250:	01200000 	0x1200000
 254:	01000101 	0x1000101
	...
 260:	00000001 	movf	zero,zero,$fcc0
 264:	00000000 	nop

Disassembly of section .data:

00000268 <test_data>:
 268:	00000000 	nop
 26c:	7fffffff 	0x7fffffff
 270:	80000000 	lb	zero,0(zero)
 274:	ffffffff 	sdc3	$31,-1(ra)

00000278 <ans>:
	...
 280:	80000000 	lb	zero,0(zero)
 284:	ffffffff 	sdc3	$31,-1(ra)
	...
 290:	80000000 	lb	zero,0(zero)
 294:	ffffffff 	sdc3	$31,-1(ra)
 298:	80000000 	lb	zero,0(zero)
 29c:	80000000 	lb	zero,0(zero)
 2a0:	80000000 	lb	zero,0(zero)
 2a4:	80000000 	lb	zero,0(zero)
 2a8:	ffffffff 	sdc3	$31,-1(ra)
 2ac:	ffffffff 	sdc3	$31,-1(ra)
 2b0:	80000000 	lb	zero,0(zero)
 2b4:	ffffffff 	sdc3	$31,-1(ra)
	...
 2c0:	80000000 	lb	zero,0(zero)
 2c4:	ffffffff 	sdc3	$31,-1(ra)
 2c8:	00000000 	nop
 2cc:	7fffffff 	0x7fffffff
 2d0:	80000000 	lb	zero,0(zero)
 2d4:	ffffffff 	sdc3	$31,-1(ra)
 2d8:	80000000 	lb	zero,0(zero)
 2dc:	80000000 	lb	zero,0(zero)
 2e0:	80000000 	lb	zero,0(zero)
 2e4:	80000000 	lb	zero,0(zero)
 2e8:	ffffffff 	sdc3	$31,-1(ra)
 2ec:	ffffffff 	sdc3	$31,-1(ra)
 2f0:	80000000 	lb	zero,0(zero)
 2f4:	ffffffff 	sdc3	$31,-1(ra)
 2f8:	80000000 	lb	zero,0(zero)
 2fc:	80000000 	lb	zero,0(zero)
 300:	80000000 	lb	zero,0(zero)
 304:	80000000 	lb	zero,0(zero)
 308:	80000000 	lb	zero,0(zero)
 30c:	80000000 	lb	zero,0(zero)
 310:	80000000 	lb	zero,0(zero)
 314:	80000000 	lb	zero,0(zero)
 318:	80000000 	lb	zero,0(zero)
 31c:	80000000 	lb	zero,0(zero)
 320:	80000000 	lb	zero,0(zero)
 324:	80000000 	lb	zero,0(zero)
 328:	80000000 	lb	zero,0(zero)
 32c:	80000000 	lb	zero,0(zero)
 330:	80000000 	lb	zero,0(zero)
 334:	80000000 	lb	zero,0(zero)
 338:	ffffffff 	sdc3	$31,-1(ra)
 33c:	ffffffff 	sdc3	$31,-1(ra)
 340:	80000000 	lb	zero,0(zero)
 344:	ffffffff 	sdc3	$31,-1(ra)
 348:	ffffffff 	sdc3	$31,-1(ra)
 34c:	ffffffff 	sdc3	$31,-1(ra)
 350:	80000000 	lb	zero,0(zero)
 354:	ffffffff 	sdc3	$31,-1(ra)
 358:	80000000 	lb	zero,0(zero)
 35c:	80000000 	lb	zero,0(zero)
 360:	80000000 	lb	zero,0(zero)
 364:	80000000 	lb	zero,0(zero)
 368:	ffffffff 	sdc3	$31,-1(ra)
 36c:	ffffffff 	sdc3	$31,-1(ra)
 370:	80000000 	lb	zero,0(zero)
 374:	ffffffff 	sdc3	$31,-1(ra)

Disassembly of section .reginfo:

00000000 <.reginfo>:
   0:	a0000002 	sb	zero,2(zero)
	...

Disassembly of section .pdr:

00000000 <.pdr>:
   0:	0000002c 	0x2c
   4:	40000000 	mfc0	zero,c0_index
   8:	fffffffc 	sdc3	$31,-4(ra)
	...
  14:	00000010 	mfhi	zero
  18:	0000001e 	0x1e
  1c:	0000001f 	0x1f
  20:	000000a4 	0xa4
  24:	c0000000 	ll	zero,0(zero)
  28:	fffffffc 	sdc3	$31,-4(ra)
	...
  34:	00000028 	0x28
  38:	0000001e 	0x1e
  3c:	0000001f 	0x1f

Disassembly of section .gnu.attributes:

00000000 <.gnu.attributes>:
   0:	00000f41 	0xf41
   4:	756e6700 	jalx	5b99c00 <ans+0x5b99988>
   8:	00070100 	sll	zero,a3,0x4
   c:	01040000 	0x1040000

Disassembly of section .comment:

00000000 <.comment>:
   0:	3a434347 	xori	v1,s2,0x4347
   4:	4e472820 	c3	0x472820
   8:	36202955 	ori	zero,s1,0x2955
   c:	302e322e 	andi	t6,at,0x322e
	...
