
../mips/elf/bubble-sort:     file format elf32-littlemips


Disassembly of section .text:

00000000 <start>:
   0:	00000000 	nop
   4:	08000004 	j	10 <real_start>
   8:	00000000 	nop

0000000c <global_result>:
   c:	ffffffff 	sdc3	$31,-1(ra)

00000010 <real_start>:
  10:	241d0400 	li	sp,1024
  14:	0c000025 	jal	94 <main>
  18:	00000000 	nop
  1c:	3c010000 	lui	at,0x0
  20:	ac20000c 	sw	zero,12(at)

00000024 <end_loop>:
  24:	08000009 	j	24 <end_loop>
  28:	00000000 	nop

0000002c <bubble_sort>:
  2c:	3c080000 	lui	t0,0x0
  30:	24070013 	li	a3,19
  34:	25080228 	addiu	t0,t0,552
  38:	2409ffff 	li	t1,-1
  3c:	00001825 	move	v1,zero
  40:	0067202a 	slt	a0,v1,a3
  44:	01001025 	move	v0,t0
  48:	1080000d 	beqz	a0,80 <bubble_sort+0x54>
  4c:	00000000 	nop
  50:	8c440000 	lw	a0,0(v0)
  54:	8c450004 	lw	a1,4(v0)
  58:	24630001 	addiu	v1,v1,1
  5c:	00a4302a 	slt	a2,a1,a0
  60:	10c00003 	beqz	a2,70 <bubble_sort+0x44>
  64:	00000000 	nop
  68:	ac450000 	sw	a1,0(v0)
  6c:	ac440004 	sw	a0,4(v0)
  70:	0067202a 	slt	a0,v1,a3
  74:	24420004 	addiu	v0,v0,4
  78:	1480fff5 	bnez	a0,50 <bubble_sort+0x24>
  7c:	00000000 	nop
  80:	24e7ffff 	addiu	a3,a3,-1
  84:	14e9ffed 	bne	a3,t1,3c <bubble_sort+0x10>
  88:	00000000 	nop
  8c:	03e00008 	jr	ra
  90:	00000000 	nop

Disassembly of section .text.startup:

00000094 <main>:
  94:	3c090000 	lui	t1,0x0
  98:	24070013 	li	a3,19
  9c:	25290228 	addiu	t1,t1,552
  a0:	240affff 	li	t2,-1
  a4:	00001825 	move	v1,zero
  a8:	0067202a 	slt	a0,v1,a3
  ac:	01204025 	move	t0,t1
  b0:	01201025 	move	v0,t1
  b4:	1080000d 	beqz	a0,ec <main+0x58>
  b8:	00000000 	nop
  bc:	8c440000 	lw	a0,0(v0)
  c0:	8c450004 	lw	a1,4(v0)
  c4:	24630001 	addiu	v1,v1,1
  c8:	00a4302a 	slt	a2,a1,a0
  cc:	10c00003 	beqz	a2,dc <main+0x48>
  d0:	00000000 	nop
  d4:	ac450000 	sw	a1,0(v0)
  d8:	ac440004 	sw	a0,4(v0)
  dc:	0067202a 	slt	a0,v1,a3
  e0:	24420004 	addiu	v0,v0,4
  e4:	1480fff5 	bnez	a0,bc <main+0x28>
  e8:	00000000 	nop
  ec:	24e7ffff 	addiu	a3,a3,-1
  f0:	14eaffec 	bne	a3,t2,a4 <main+0x10>
  f4:	00000000 	nop
  f8:	3c0b0000 	lui	t3,0x0
  fc:	8d67000c 	lw	a3,12(t3)
 100:	01201825 	move	v1,t1
 104:	00003025 	move	a2,zero
 108:	00001025 	move	v0,zero
 10c:	24050014 	li	a1,20
 110:	8c640000 	lw	a0,0(v1)
 114:	10820005 	beq	a0,v0,12c <main+0x98>
 118:	00000000 	nop
 11c:	08000009 	j	24 <end_loop>
 120:	00000000 	nop
 124:	24060001 	li	a2,1
 128:	24070001 	li	a3,1
 12c:	24420001 	addiu	v0,v0,1
 130:	24630004 	addiu	v1,v1,4
 134:	1445fff6 	bne	v0,a1,110 <main+0x7c>
 138:	00000000 	nop
 13c:	14c0002b 	bnez	a2,1ec <main+0x158>
 140:	00000000 	nop
 144:	24070013 	li	a3,19
 148:	240affff 	li	t2,-1
 14c:	00001825 	move	v1,zero
 150:	0067202a 	slt	a0,v1,a3
 154:	01201025 	move	v0,t1
 158:	1080000d 	beqz	a0,190 <main+0xfc>
 15c:	00000000 	nop
 160:	8c440000 	lw	a0,0(v0)
 164:	8c450004 	lw	a1,4(v0)
 168:	24630001 	addiu	v1,v1,1
 16c:	00a4302a 	slt	a2,a1,a0
 170:	10c00003 	beqz	a2,180 <main+0xec>
 174:	00000000 	nop
 178:	ac450000 	sw	a1,0(v0)
 17c:	ac440004 	sw	a0,4(v0)
 180:	0067202a 	slt	a0,v1,a3
 184:	24420004 	addiu	v0,v0,4
 188:	1480fff5 	bnez	a0,160 <main+0xcc>
 18c:	00000000 	nop
 190:	24e7ffff 	addiu	a3,a3,-1
 194:	14eaffed 	bne	a3,t2,14c <main+0xb8>
 198:	00000000 	nop
 19c:	8d66000c 	lw	a2,12(t3)
 1a0:	00002825 	move	a1,zero
 1a4:	00001025 	move	v0,zero
 1a8:	24040014 	li	a0,20
 1ac:	8d030000 	lw	v1,0(t0)
 1b0:	10620005 	beq	v1,v0,1c8 <main+0x134>
 1b4:	00000000 	nop
 1b8:	08000009 	j	24 <end_loop>
 1bc:	00000000 	nop
 1c0:	24050001 	li	a1,1
 1c4:	24060001 	li	a2,1
 1c8:	24420001 	addiu	v0,v0,1
 1cc:	25080004 	addiu	t0,t0,4
 1d0:	1444fff6 	bne	v0,a0,1ac <main+0x118>
 1d4:	00000000 	nop
 1d8:	14a00009 	bnez	a1,200 <main+0x16c>
 1dc:	00000000 	nop
 1e0:	00001025 	move	v0,zero
 1e4:	03e00008 	jr	ra
 1e8:	00000000 	nop
 1ec:	ad67000c 	sw	a3,12(t3)
 1f0:	240affff 	li	t2,-1
 1f4:	24070013 	li	a3,19
 1f8:	1000ffd4 	b	14c <main+0xb8>
 1fc:	00000000 	nop
 200:	ad66000c 	sw	a2,12(t3)
 204:	1000fff6 	b	1e0 <main+0x14c>
 208:	00000000 	nop

Disassembly of section .MIPS.abiflags:

00000210 <.MIPS.abiflags>:
 210:	01200000 	0x1200000
 214:	01000101 	0x1000101
	...
 220:	00000001 	movf	zero,zero,$fcc0
 224:	00000000 	nop

Disassembly of section .data:

00000228 <a>:
 228:	00000002 	srl	zero,zero,0x0
 22c:	0000000c 	syscall
 230:	0000000e 	0xe
 234:	00000006 	srlv	zero,zero,zero
 238:	0000000d 	break
 23c:	0000000f 	sync
 240:	00000010 	mfhi	zero
 244:	0000000a 	movz	zero,zero,zero
 248:	00000000 	nop
 24c:	00000012 	mflo	zero
 250:	0000000b 	movn	zero,zero,zero
 254:	00000013 	mtlo	zero
 258:	00000009 	jalr	zero,zero
 25c:	00000001 	movf	zero,zero,$fcc0
 260:	00000007 	srav	zero,zero,zero
 264:	00000005 	0x5
 268:	00000004 	sllv	zero,zero,zero
 26c:	00000003 	sra	zero,zero,0x0
 270:	00000008 	jr	zero
 274:	00000011 	mthi	zero

Disassembly of section .reginfo:

00000000 <.reginfo>:
   0:	a0000002 	sb	zero,2(zero)
	...

Disassembly of section .pdr:

00000000 <.pdr>:
   0:	0000002c 	0x2c
	...
  18:	0000001d 	0x1d
  1c:	0000001f 	0x1f
  20:	00000094 	0x94
	...
  38:	0000001d 	0x1d
  3c:	0000001f 	0x1f

Disassembly of section .gnu.attributes:

00000000 <.gnu.attributes>:
   0:	00000f41 	0xf41
   4:	756e6700 	jalx	5b99c00 <a+0x5b999d8>
   8:	00070100 	sll	zero,a3,0x4
   c:	01040000 	0x1040000

Disassembly of section .comment:

00000000 <.comment>:
   0:	3a434347 	xori	v1,s2,0x4347
   4:	4e472820 	c3	0x472820
   8:	36202955 	ori	zero,s1,0x2955
   c:	302e322e 	andi	t6,at,0x322e
	...
