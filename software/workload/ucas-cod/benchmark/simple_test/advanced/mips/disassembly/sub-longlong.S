
../mips/elf/sub-longlong:     file format elf32-littlemips


Disassembly of section .text:

00000000 <start>:
   0:	241d4000 	li	sp,16384
   4:	08000004 	j	10 <continued>
   8:	00000000 	nop

0000000c <global_result>:
   c:	ffffffff 	sdc3	$31,-1(ra)

00000010 <continued>:
  10:	0c00001f 	jal	7c <main>
  14:	00000000 	nop
  18:	0c000015 	jal	54 <hit_good_trap>
  1c:	00000000 	nop

00000020 <_halt>:
  20:	3c020000 	lui	v0,0x0
  24:	ac44000c 	sw	a0,12(v0)
  28:	1000ffff 	b	28 <_halt+0x8>
  2c:	00000000 	nop

00000030 <nemu_assert>:
  30:	14800006 	bnez	a0,4c <nemu_assert+0x1c>
  34:	00000000 	nop
  38:	24030001 	li	v1,1
  3c:	3c020000 	lui	v0,0x0
  40:	ac43000c 	sw	v1,12(v0)
  44:	1000ffff 	b	44 <nemu_assert+0x14>
  48:	00000000 	nop
  4c:	03e00008 	jr	ra
  50:	00000000 	nop

00000054 <hit_good_trap>:
  54:	3c020000 	lui	v0,0x0
  58:	ac40000c 	sw	zero,12(v0)
  5c:	1000ffff 	b	5c <hit_good_trap+0x8>
  60:	00000000 	nop

00000064 <sub>:
  64:	00861023 	subu	v0,a0,a2
  68:	0082202b 	sltu	a0,a0,v0
  6c:	00a71823 	subu	v1,a1,a3
  70:	00641823 	subu	v1,v1,a0
  74:	03e00008 	jr	ra
  78:	00000000 	nop

Disassembly of section .text.startup:

0000007c <main>:
  7c:	3c0d0000 	lui	t5,0x0
  80:	27bdffe8 	addiu	sp,sp,-24
  84:	25ad0338 	addiu	t5,t5,824
  88:	3c0c0000 	lui	t4,0x0
  8c:	3c0b0000 	lui	t3,0x0
  90:	258c0138 	addiu	t4,t4,312
  94:	afbf0014 	sw	ra,20(sp)
  98:	256b0378 	addiu	t3,t3,888
  9c:	01a04825 	move	t1,t5
  a0:	01803825 	move	a3,t4
  a4:	01a02825 	move	a1,t5
  a8:	8ca40000 	lw	a0,0(a1)
  ac:	8d260000 	lw	a2,0(t1)
  b0:	8caa0004 	lw	t2,4(a1)
  b4:	8d220004 	lw	v0,4(t1)
  b8:	00c41823 	subu	v1,a2,a0
  bc:	8ce80004 	lw	t0,4(a3)
  c0:	8ce40000 	lw	a0,0(a3)
  c4:	00c3302b 	sltu	a2,a2,v1
  c8:	004a1023 	subu	v0,v0,t2
  cc:	00461023 	subu	v0,v0,a2
  d0:	00832026 	xor	a0,a0,v1
  d4:	01021026 	xor	v0,t0,v0
  d8:	00822025 	or	a0,a0,v0
  dc:	2c840001 	sltiu	a0,a0,1
  e0:	24a50008 	addiu	a1,a1,8
  e4:	0c00000c 	jal	30 <nemu_assert>
  e8:	00000000 	nop
  ec:	24e70008 	addiu	a3,a3,8
  f0:	14abffed 	bne	a1,t3,a8 <main+0x2c>
  f4:	00000000 	nop
  f8:	25290008 	addiu	t1,t1,8
  fc:	258c0040 	addiu	t4,t4,64
 100:	14a9ffe7 	bne	a1,t1,a0 <main+0x24>
 104:	00000000 	nop
 108:	8fbf0014 	lw	ra,20(sp)
 10c:	00001025 	move	v0,zero
 110:	27bd0018 	addiu	sp,sp,24
 114:	03e00008 	jr	ra
 118:	00000000 	nop

Disassembly of section .MIPS.abiflags:

00000120 <.MIPS.abiflags>:
 120:	01200000 	0x1200000
 124:	01000101 	0x1000101
	...
 130:	00000001 	movf	zero,zero,$fcc0
 134:	00000000 	nop

Disassembly of section .data:

00000138 <ans>:
	...
 140:	ffffffff 	sdc3	$31,-1(ra)
 144:	ffffffff 	sdc3	$31,-1(ra)
 148:	fffffffe 	sdc3	$31,-2(ra)
 14c:	ffffffff 	sdc3	$31,-1(ra)
 150:	00000001 	movf	zero,zero,$fcc0
 154:	80000000 	lb	zero,0(zero)
 158:	00000000 	nop
 15c:	80000000 	lb	zero,0(zero)
 160:	ffffffff 	sdc3	$31,-1(ra)
 164:	7fffffff 	0x7fffffff
 168:	00000002 	srl	zero,zero,0x0
 16c:	00000000 	nop
 170:	00000001 	movf	zero,zero,$fcc0
 174:	00000000 	nop
 178:	00000001 	movf	zero,zero,$fcc0
	...
 188:	ffffffff 	sdc3	$31,-1(ra)
 18c:	ffffffff 	sdc3	$31,-1(ra)
 190:	00000002 	srl	zero,zero,0x0
 194:	80000000 	lb	zero,0(zero)
 198:	00000001 	movf	zero,zero,$fcc0
 19c:	80000000 	lb	zero,0(zero)
 1a0:	00000000 	nop
 1a4:	80000000 	lb	zero,0(zero)
 1a8:	00000003 	sra	zero,zero,0x0
 1ac:	00000000 	nop
 1b0:	00000002 	srl	zero,zero,0x0
 1b4:	00000000 	nop
 1b8:	00000002 	srl	zero,zero,0x0
 1bc:	00000000 	nop
 1c0:	00000001 	movf	zero,zero,$fcc0
	...
 1d0:	00000003 	sra	zero,zero,0x0
 1d4:	80000000 	lb	zero,0(zero)
 1d8:	00000002 	srl	zero,zero,0x0
 1dc:	80000000 	lb	zero,0(zero)
 1e0:	00000001 	movf	zero,zero,$fcc0
 1e4:	80000000 	lb	zero,0(zero)
 1e8:	00000004 	sllv	zero,zero,zero
 1ec:	00000000 	nop
 1f0:	00000003 	sra	zero,zero,0x0
 1f4:	00000000 	nop
 1f8:	ffffffff 	sdc3	$31,-1(ra)
 1fc:	7fffffff 	0x7fffffff
 200:	fffffffe 	sdc3	$31,-2(ra)
 204:	7fffffff 	0x7fffffff
 208:	fffffffd 	sdc3	$31,-3(ra)
 20c:	7fffffff 	0x7fffffff
	...
 218:	ffffffff 	sdc3	$31,-1(ra)
 21c:	ffffffff 	sdc3	$31,-1(ra)
 220:	fffffffe 	sdc3	$31,-2(ra)
 224:	ffffffff 	sdc3	$31,-1(ra)
 228:	00000001 	movf	zero,zero,$fcc0
 22c:	80000000 	lb	zero,0(zero)
 230:	00000000 	nop
 234:	80000000 	lb	zero,0(zero)
 238:	00000000 	nop
 23c:	80000000 	lb	zero,0(zero)
 240:	ffffffff 	sdc3	$31,-1(ra)
 244:	7fffffff 	0x7fffffff
 248:	fffffffe 	sdc3	$31,-2(ra)
 24c:	7fffffff 	0x7fffffff
 250:	00000001 	movf	zero,zero,$fcc0
	...
 260:	ffffffff 	sdc3	$31,-1(ra)
 264:	ffffffff 	sdc3	$31,-1(ra)
 268:	00000002 	srl	zero,zero,0x0
 26c:	80000000 	lb	zero,0(zero)
 270:	00000001 	movf	zero,zero,$fcc0
 274:	80000000 	lb	zero,0(zero)
 278:	00000001 	movf	zero,zero,$fcc0
 27c:	80000000 	lb	zero,0(zero)
 280:	00000000 	nop
 284:	80000000 	lb	zero,0(zero)
 288:	ffffffff 	sdc3	$31,-1(ra)
 28c:	7fffffff 	0x7fffffff
 290:	00000002 	srl	zero,zero,0x0
 294:	00000000 	nop
 298:	00000001 	movf	zero,zero,$fcc0
	...
 2a8:	00000003 	sra	zero,zero,0x0
 2ac:	80000000 	lb	zero,0(zero)
 2b0:	00000002 	srl	zero,zero,0x0
 2b4:	80000000 	lb	zero,0(zero)
 2b8:	fffffffe 	sdc3	$31,-2(ra)
 2bc:	ffffffff 	sdc3	$31,-1(ra)
 2c0:	fffffffd 	sdc3	$31,-3(ra)
 2c4:	ffffffff 	sdc3	$31,-1(ra)
 2c8:	fffffffc 	sdc3	$31,-4(ra)
 2cc:	ffffffff 	sdc3	$31,-1(ra)
 2d0:	ffffffff 	sdc3	$31,-1(ra)
 2d4:	7fffffff 	0x7fffffff
 2d8:	fffffffe 	sdc3	$31,-2(ra)
 2dc:	7fffffff 	0x7fffffff
 2e0:	fffffffd 	sdc3	$31,-3(ra)
 2e4:	7fffffff 	0x7fffffff
	...
 2f0:	ffffffff 	sdc3	$31,-1(ra)
 2f4:	ffffffff 	sdc3	$31,-1(ra)
 2f8:	ffffffff 	sdc3	$31,-1(ra)
 2fc:	ffffffff 	sdc3	$31,-1(ra)
 300:	fffffffe 	sdc3	$31,-2(ra)
 304:	ffffffff 	sdc3	$31,-1(ra)
 308:	fffffffd 	sdc3	$31,-3(ra)
 30c:	ffffffff 	sdc3	$31,-1(ra)
 310:	00000000 	nop
 314:	80000000 	lb	zero,0(zero)
 318:	ffffffff 	sdc3	$31,-1(ra)
 31c:	7fffffff 	0x7fffffff
 320:	fffffffe 	sdc3	$31,-2(ra)
 324:	7fffffff 	0x7fffffff
 328:	00000001 	movf	zero,zero,$fcc0
	...

00000338 <test_data>:
	...
 340:	00000001 	movf	zero,zero,$fcc0
 344:	00000000 	nop
 348:	00000002 	srl	zero,zero,0x0
 34c:	00000000 	nop
 350:	ffffffff 	sdc3	$31,-1(ra)
 354:	7fffffff 	0x7fffffff
 358:	00000000 	nop
 35c:	80000000 	lb	zero,0(zero)
 360:	00000001 	movf	zero,zero,$fcc0
 364:	80000000 	lb	zero,0(zero)
 368:	fffffffe 	sdc3	$31,-2(ra)
 36c:	ffffffff 	sdc3	$31,-1(ra)
 370:	ffffffff 	sdc3	$31,-1(ra)
 374:	ffffffff 	sdc3	$31,-1(ra)

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
  20:	00000030 	tge	zero,zero
	...
  38:	0000001d 	0x1d
  3c:	0000001f 	0x1f
  40:	00000054 	0x54
	...
  58:	0000001d 	0x1d
  5c:	0000001f 	0x1f
  60:	00000064 	0x64
	...
  78:	0000001d 	0x1d
  7c:	0000001f 	0x1f
  80:	0000007c 	0x7c
  84:	80000000 	lb	zero,0(zero)
  88:	fffffffc 	sdc3	$31,-4(ra)
	...
  94:	00000018 	mult	zero,zero
  98:	0000001d 	0x1d
  9c:	0000001f 	0x1f

Disassembly of section .gnu.attributes:

00000000 <.gnu.attributes>:
   0:	00000f41 	0xf41
   4:	756e6700 	jalx	5b99c00 <test_data+0x5b998c8>
   8:	00070100 	sll	zero,a3,0x4
   c:	01040000 	0x1040000

Disassembly of section .comment:

00000000 <.comment>:
   0:	3a434347 	xori	v1,s2,0x4347
   4:	4e472820 	c3	0x472820
   8:	36202955 	ori	zero,s1,0x2955
   c:	302e322e 	andi	t6,at,0x322e
	...
