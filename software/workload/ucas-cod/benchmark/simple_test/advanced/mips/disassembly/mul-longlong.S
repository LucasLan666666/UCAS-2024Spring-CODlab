
../mips/elf/mul-longlong:     file format elf32-littlemips


Disassembly of section .text:

00000000 <start>:
   0:	241d4000 	li	sp,16384
   4:	08000004 	j	10 <continued>
   8:	00000000 	nop

0000000c <global_result>:
   c:	ffffffff 	sdc3	$31,-1(ra)

00000010 <continued>:
  10:	0c00005a 	jal	168 <main>
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

00000064 <mul>:
  64:	18e0002a 	blez	a3,110 <mul+0xac>
  68:	00000000 	nop
  6c:	240d0001 	li	t5,1
  70:	00007025 	move	t6,zero
  74:	00e05825 	move	t3,a3
  78:	00c04825 	move	t1,a2
  7c:	04e0002e 	bltz	a3,138 <mul+0xd4>
  80:	00000000 	nop
  84:	00001025 	move	v0,zero
  88:	00001825 	move	v1,zero
  8c:	00004025 	move	t0,zero
  90:	0004c842 	srl	t9,a0,0x1
  94:	24180040 	li	t8,64
  98:	00085027 	nor	t2,zero,t0
  9c:	01053804 	sllv	a3,a1,t0
  a0:	01595006 	srlv	t2,t9,t2
  a4:	310c0020 	andi	t4,t0,0x20
  a8:	01043004 	sllv	a2,a0,t0
  ac:	01473825 	or	a3,t2,a3
  b0:	00cc380b 	movn	a3,a2,t4
  b4:	000c300b 	movn	a2,zero,t4
  b8:	00463021 	addu	a2,v0,a2
  bc:	312c0001 	andi	t4,t1,0x1
  c0:	000b57c0 	sll	t2,t3,0x1f
  c4:	00094842 	srl	t1,t1,0x1
  c8:	25080001 	addiu	t0,t0,1
  cc:	00c2782b 	sltu	t7,a2,v0
  d0:	00673821 	addu	a3,v1,a3
  d4:	11800003 	beqz	t4,e4 <mul+0x80>
  d8:	00000000 	nop
  dc:	00c01025 	move	v0,a2
  e0:	01e71821 	addu	v1,t7,a3
  e4:	01494825 	or	t1,t2,t1
  e8:	000b5843 	sra	t3,t3,0x1
  ec:	1518ffea 	bne	t0,t8,98 <mul+0x34>
  f0:	00000000 	nop
  f4:	24040001 	li	a0,1
  f8:	15a40015 	bne	t5,a0,150 <mul+0xec>
  fc:	00000000 	nop
 100:	15c00013 	bnez	t6,150 <mul+0xec>
 104:	00000000 	nop
 108:	03e00008 	jr	ra
 10c:	00000000 	nop
 110:	14e00003 	bnez	a3,120 <mul+0xbc>
 114:	00000000 	nop
 118:	14c0ffd4 	bnez	a2,6c <mul+0x8>
 11c:	00000000 	nop
 120:	240dffff 	li	t5,-1
 124:	240effff 	li	t6,-1
 128:	00e05825 	move	t3,a3
 12c:	00c04825 	move	t1,a2
 130:	04e1ffd4 	bgez	a3,84 <mul+0x20>
 134:	00000000 	nop
 138:	00064823 	negu	t1,a2
 13c:	0009102b 	sltu	v0,zero,t1
 140:	00075823 	negu	t3,a3
 144:	01625823 	subu	t3,t3,v0
 148:	1000ffce 	b	84 <mul+0x20>
 14c:	00000000 	nop
 150:	00021023 	negu	v0,v0
 154:	0002202b 	sltu	a0,zero,v0
 158:	00031823 	negu	v1,v1
 15c:	00641823 	subu	v1,v1,a0
 160:	03e00008 	jr	ra
 164:	00000000 	nop

Disassembly of section .text.startup:

00000168 <main>:
 168:	27bdffc8 	addiu	sp,sp,-56
 16c:	afb50024 	sw	s5,36(sp)
 170:	afb10014 	sw	s1,20(sp)
 174:	afb00010 	sw	s0,16(sp)
 178:	3c150000 	lui	s5,0x0
 17c:	3c100000 	lui	s0,0x0
 180:	3c110000 	lui	s1,0x0
 184:	afb40020 	sw	s4,32(sp)
 188:	afb3001c 	sw	s3,28(sp)
 18c:	afb20018 	sw	s2,24(sp)
 190:	afbf0034 	sw	ra,52(sp)
 194:	afbe0030 	sw	s8,48(sp)
 198:	afb7002c 	sw	s7,44(sp)
 19c:	afb60028 	sw	s6,40(sp)
 1a0:	261003b8 	addiu	s0,s0,952
 1a4:	00009825 	move	s3,zero
 1a8:	0000a025 	move	s4,zero
 1ac:	26b50368 	addiu	s5,s5,872
 1b0:	263103c8 	addiu	s1,s1,968
 1b4:	24120001 	li	s2,1
 1b8:	0013c8c0 	sll	t9,s3,0x3
 1bc:	02b9c821 	addu	t9,s5,t9
 1c0:	0200b025 	move	s6,s0
 1c4:	240f0040 	li	t7,64
 1c8:	8ec50000 	lw	a1,0(s6)
 1cc:	8e0c0000 	lw	t4,0(s0)
 1d0:	000537c3 	sra	a2,a1,0x1f
 1d4:	8f380000 	lw	t8,0(t9)
 1d8:	8f3f0004 	lw	ra,4(t9)
 1dc:	000c77c3 	sra	t6,t4,0x1f
 1e0:	14c00051 	bnez	a2,328 <main+0x1c0>
 1e4:	00000000 	nop
 1e8:	10a0004f 	beqz	a1,328 <main+0x1c0>
 1ec:	00000000 	nop
 1f0:	24170001 	li	s7,1
 1f4:	0000f025 	move	s8,zero
 1f8:	04c0004f 	bltz	a2,338 <main+0x1d0>
 1fc:	00000000 	nop
 200:	00003825 	move	a3,zero
 204:	00005025 	move	t2,zero
 208:	00002025 	move	a0,zero
 20c:	000c6842 	srl	t5,t4,0x1
 210:	00044027 	nor	t0,zero,a0
 214:	008e1004 	sllv	v0,t6,a0
 218:	010d4006 	srlv	t0,t5,t0
 21c:	30890020 	andi	t1,a0,0x20
 220:	008c1804 	sllv	v1,t4,a0
 224:	01021025 	or	v0,t0,v0
 228:	0069100b 	movn	v0,v1,t1
 22c:	0009180b 	movn	v1,zero,t1
 230:	00e31821 	addu	v1,a3,v1
 234:	30a90001 	andi	t1,a1,0x1
 238:	000647c0 	sll	t0,a2,0x1f
 23c:	00052842 	srl	a1,a1,0x1
 240:	24840001 	addiu	a0,a0,1
 244:	0067582b 	sltu	t3,v1,a3
 248:	01421021 	addu	v0,t2,v0
 24c:	11200003 	beqz	t1,25c <main+0xf4>
 250:	00000000 	nop
 254:	00603825 	move	a3,v1
 258:	01625021 	addu	t2,t3,v0
 25c:	01052825 	or	a1,t0,a1
 260:	00063043 	sra	a2,a2,0x1
 264:	148fffea 	bne	a0,t7,210 <main+0xa8>
 268:	00000000 	nop
 26c:	16f20028 	bne	s7,s2,310 <main+0x1a8>
 270:	00000000 	nop
 274:	17c00026 	bnez	s8,310 <main+0x1a8>
 278:	00000000 	nop
 27c:	03072026 	xor	a0,t8,a3
 280:	03ea5026 	xor	t2,ra,t2
 284:	008a2025 	or	a0,a0,t2
 288:	2c840001 	sltiu	a0,a0,1
 28c:	0c00000c 	jal	30 <nemu_assert>
 290:	00000000 	nop
 294:	26d60004 	addiu	s6,s6,4
 298:	27390008 	addiu	t9,t9,8
 29c:	1636ffca 	bne	s1,s6,1c8 <main+0x60>
 2a0:	00000000 	nop
 2a4:	26730004 	addiu	s3,s3,4
 2a8:	24040001 	li	a0,1
 2ac:	02749823 	subu	s3,s3,s4
 2b0:	0c00000c 	jal	30 <nemu_assert>
 2b4:	00000000 	nop
 2b8:	26940001 	addiu	s4,s4,1
 2bc:	24020004 	li	v0,4
 2c0:	26100004 	addiu	s0,s0,4
 2c4:	1682ffbc 	bne	s4,v0,1b8 <main+0x50>
 2c8:	00000000 	nop
 2cc:	24040001 	li	a0,1
 2d0:	0c00000c 	jal	30 <nemu_assert>
 2d4:	00000000 	nop
 2d8:	8fbf0034 	lw	ra,52(sp)
 2dc:	8fbe0030 	lw	s8,48(sp)
 2e0:	8fb7002c 	lw	s7,44(sp)
 2e4:	8fb60028 	lw	s6,40(sp)
 2e8:	8fb50024 	lw	s5,36(sp)
 2ec:	8fb40020 	lw	s4,32(sp)
 2f0:	8fb3001c 	lw	s3,28(sp)
 2f4:	8fb20018 	lw	s2,24(sp)
 2f8:	8fb10014 	lw	s1,20(sp)
 2fc:	8fb00010 	lw	s0,16(sp)
 300:	00001025 	move	v0,zero
 304:	27bd0038 	addiu	sp,sp,56
 308:	03e00008 	jr	ra
 30c:	00000000 	nop
 310:	00073823 	negu	a3,a3
 314:	0007102b 	sltu	v0,zero,a3
 318:	000a5023 	negu	t2,t2
 31c:	01425023 	subu	t2,t2,v0
 320:	1000ffd6 	b	27c <main+0x114>
 324:	00000000 	nop
 328:	2417ffff 	li	s7,-1
 32c:	241effff 	li	s8,-1
 330:	04c1ffb3 	bgez	a2,200 <main+0x98>
 334:	00000000 	nop
 338:	00052823 	negu	a1,a1
 33c:	0005102b 	sltu	v0,zero,a1
 340:	00063023 	negu	a2,a2
 344:	00c23023 	subu	a2,a2,v0
 348:	1000ffad 	b	200 <main+0x98>
 34c:	00000000 	nop

Disassembly of section .MIPS.abiflags:

00000350 <.MIPS.abiflags>:
 350:	01200000 	0x1200000
 354:	01000101 	0x1000101
	...
 360:	00000001 	movf	zero,zero,$fcc0
 364:	00000000 	nop

Disassembly of section .data:

00000368 <ans>:
 368:	db1a18e4 	ldc2	$26,6372(t8)
 36c:	19d29ab9 	0x19d29ab9
 370:	3ac3088e 	xori	v1,s6,0x88e
 374:	ea15986d 	swc2	$21,-26515(s0)
 378:	fc0db236 	sdc3	$13,-19914(zero)
 37c:	2649e980 	addiu	t1,s2,-5760
 380:	0a4a7d30 	j	929f4c0 <test_data+0x929f108>
 384:	fa4c43da 	sdc2	$12,17370(s2)
 388:	2c56b139 	sltiu	s6,v0,-20167
 38c:	1299898e 	beq	s4,t9,fffe29c8 <test_data+0xfffe2610>
 390:	0a319e65 	j	8c67994 <test_data+0x8c675dc>
 394:	df8123d5 	ldc3	$1,9173(gp)
 398:	4c15dd68 	0x4c15dd68
 39c:	04d6dfa8 	0x4d6dfa8
 3a0:	9e4357a1 	0x9e4357a1
 3a4:	38c5d79b 	xori	a1,a2,0xd79b
 3a8:	1efc4248 	0x1efc4248
 3ac:	f78b91cb 	sdc1	$f11,-28213(gp)
 3b0:	7fdfcc40 	0x7fdfcc40
 3b4:	014255a4 	0x14255a4

000003b8 <test_data>:
 3b8:	aeb1c2aa 	sw	s1,-15702(s5)
 3bc:	4500ff2b 	bc1f	6c <mul+0x8>
 3c0:	877190af 	lh	s1,-28497(k1)
 3c4:	11f42438 	beq	t7,s4,94a8 <test_data+0x90f0>

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
  80:	00000168 	0x168
  84:	c0ff0000 	ll	ra,0(a3)
  88:	fffffffc 	sdc3	$31,-4(ra)
	...
  94:	00000038 	0x38
  98:	0000001d 	0x1d
  9c:	0000001f 	0x1f

Disassembly of section .gnu.attributes:

00000000 <.gnu.attributes>:
   0:	00000f41 	0xf41
   4:	756e6700 	jalx	5b99c00 <test_data+0x5b99848>
   8:	00070100 	sll	zero,a3,0x4
   c:	01040000 	0x1040000

Disassembly of section .comment:

00000000 <.comment>:
   0:	3a434347 	xori	v1,s2,0x4347
   4:	4e472820 	c3	0x472820
   8:	36202955 	ori	zero,s1,0x2955
   c:	302e322e 	andi	t6,at,0x322e
	...
