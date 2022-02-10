
../mips/elf/max:     file format elf32-littlemips


Disassembly of section .text:

00000000 <start>:
   0:	00000000 	nop
   4:	08000004 	j	10 <real_start>
   8:	00000000 	nop

0000000c <global_result>:
   c:	ffffffff 	sdc3	$31,-1(ra)

00000010 <real_start>:
  10:	241d0400 	li	sp,1024
  14:	0c000021 	jal	84 <main>
  18:	00000000 	nop
  1c:	3c010000 	lui	at,0x0
  20:	ac20000c 	sw	zero,12(at)

00000024 <end_loop>:
  24:	08000009 	j	24 <end_loop>
  28:	00000000 	nop

0000002c <max>:
  2c:	27bdfff0 	addiu	sp,sp,-16
  30:	afbe000c 	sw	s8,12(sp)
  34:	03a0f025 	move	s8,sp
  38:	afc40010 	sw	a0,16(s8)
  3c:	afc50014 	sw	a1,20(s8)
  40:	8fc30010 	lw	v1,16(s8)
  44:	8fc20014 	lw	v0,20(s8)
  48:	0043102a 	slt	v0,v0,v1
  4c:	10400005 	beqz	v0,64 <max+0x38>
  50:	00000000 	nop
  54:	8fc20010 	lw	v0,16(s8)
  58:	afc20000 	sw	v0,0(s8)
  5c:	10000003 	b	6c <max+0x40>
  60:	00000000 	nop
  64:	8fc20014 	lw	v0,20(s8)
  68:	afc20000 	sw	v0,0(s8)
  6c:	8fc20000 	lw	v0,0(s8)
  70:	03c0e825 	move	sp,s8
  74:	8fbe000c 	lw	s8,12(sp)
  78:	27bd0010 	addiu	sp,sp,16
  7c:	03e00008 	jr	ra
  80:	00000000 	nop

00000084 <main>:
  84:	27bdffd8 	addiu	sp,sp,-40
  88:	afbf0024 	sw	ra,36(sp)
  8c:	afbe0020 	sw	s8,32(sp)
  90:	03a0f025 	move	s8,sp
  94:	afc00018 	sw	zero,24(s8)
  98:	afc00010 	sw	zero,16(s8)
  9c:	10000036 	b	178 <main+0xf4>
  a0:	00000000 	nop
  a4:	afc00014 	sw	zero,20(s8)
  a8:	10000023 	b	138 <main+0xb4>
  ac:	00000000 	nop
  b0:	3c020000 	lui	v0,0x0
  b4:	8fc30010 	lw	v1,16(s8)
  b8:	00031880 	sll	v1,v1,0x2
  bc:	244201e0 	addiu	v0,v0,480
  c0:	00621021 	addu	v0,v1,v0
  c4:	8c440000 	lw	a0,0(v0)
  c8:	3c020000 	lui	v0,0x0
  cc:	8fc30014 	lw	v1,20(s8)
  d0:	00031880 	sll	v1,v1,0x2
  d4:	244201e0 	addiu	v0,v0,480
  d8:	00621021 	addu	v0,v1,v0
  dc:	8c420000 	lw	v0,0(v0)
  e0:	00402825 	move	a1,v0
  e4:	0c00000b 	jal	2c <max>
  e8:	00000000 	nop
  ec:	00402825 	move	a1,v0
  f0:	8fc20018 	lw	v0,24(s8)
  f4:	24430001 	addiu	v1,v0,1
  f8:	afc30018 	sw	v1,24(s8)
  fc:	3c040000 	lui	a0,0x0
 100:	00021880 	sll	v1,v0,0x2
 104:	24820200 	addiu	v0,a0,512
 108:	00621021 	addu	v0,v1,v0
 10c:	8c420000 	lw	v0,0(v0)
 110:	10a20006 	beq	a1,v0,12c <main+0xa8>
 114:	00000000 	nop
 118:	3c020000 	lui	v0,0x0
 11c:	24030001 	li	v1,1
 120:	ac43000c 	sw	v1,12(v0)
 124:	08000009 	j	24 <end_loop>
 128:	00000000 	nop
 12c:	8fc20014 	lw	v0,20(s8)
 130:	24420001 	addiu	v0,v0,1
 134:	afc20014 	sw	v0,20(s8)
 138:	8fc20014 	lw	v0,20(s8)
 13c:	2c420008 	sltiu	v0,v0,8
 140:	1440ffdb 	bnez	v0,b0 <main+0x2c>
 144:	00000000 	nop
 148:	8fc30014 	lw	v1,20(s8)
 14c:	24020008 	li	v0,8
 150:	10620006 	beq	v1,v0,16c <main+0xe8>
 154:	00000000 	nop
 158:	3c020000 	lui	v0,0x0
 15c:	24030001 	li	v1,1
 160:	ac43000c 	sw	v1,12(v0)
 164:	08000009 	j	24 <end_loop>
 168:	00000000 	nop
 16c:	8fc20010 	lw	v0,16(s8)
 170:	24420001 	addiu	v0,v0,1
 174:	afc20010 	sw	v0,16(s8)
 178:	8fc20010 	lw	v0,16(s8)
 17c:	2c420008 	sltiu	v0,v0,8
 180:	1440ffc8 	bnez	v0,a4 <main+0x20>
 184:	00000000 	nop
 188:	8fc30010 	lw	v1,16(s8)
 18c:	24020008 	li	v0,8
 190:	10620006 	beq	v1,v0,1ac <main+0x128>
 194:	00000000 	nop
 198:	3c020000 	lui	v0,0x0
 19c:	24030001 	li	v1,1
 1a0:	ac43000c 	sw	v1,12(v0)
 1a4:	08000009 	j	24 <end_loop>
 1a8:	00000000 	nop
 1ac:	00001025 	move	v0,zero
 1b0:	03c0e825 	move	sp,s8
 1b4:	8fbf0024 	lw	ra,36(sp)
 1b8:	8fbe0020 	lw	s8,32(sp)
 1bc:	27bd0028 	addiu	sp,sp,40
 1c0:	03e00008 	jr	ra
 1c4:	00000000 	nop

Disassembly of section .MIPS.abiflags:

000001c8 <.MIPS.abiflags>:
 1c8:	01200000 	0x1200000
 1cc:	01000101 	0x1000101
	...
 1d8:	00000001 	movf	zero,zero,$fcc0
 1dc:	00000000 	nop

Disassembly of section .data:

000001e0 <test_data>:
 1e0:	00000000 	nop
 1e4:	00000001 	movf	zero,zero,$fcc0
 1e8:	00000002 	srl	zero,zero,0x0
 1ec:	7fffffff 	0x7fffffff
 1f0:	80000000 	lb	zero,0(zero)
 1f4:	80000001 	lb	zero,1(zero)
 1f8:	fffffffe 	sdc3	$31,-2(ra)
 1fc:	ffffffff 	sdc3	$31,-1(ra)

00000200 <ans>:
 200:	00000000 	nop
 204:	00000001 	movf	zero,zero,$fcc0
 208:	00000002 	srl	zero,zero,0x0
 20c:	7fffffff 	0x7fffffff
	...
 220:	00000001 	movf	zero,zero,$fcc0
 224:	00000001 	movf	zero,zero,$fcc0
 228:	00000002 	srl	zero,zero,0x0
 22c:	7fffffff 	0x7fffffff
 230:	00000001 	movf	zero,zero,$fcc0
 234:	00000001 	movf	zero,zero,$fcc0
 238:	00000001 	movf	zero,zero,$fcc0
 23c:	00000001 	movf	zero,zero,$fcc0
 240:	00000002 	srl	zero,zero,0x0
 244:	00000002 	srl	zero,zero,0x0
 248:	00000002 	srl	zero,zero,0x0
 24c:	7fffffff 	0x7fffffff
 250:	00000002 	srl	zero,zero,0x0
 254:	00000002 	srl	zero,zero,0x0
 258:	00000002 	srl	zero,zero,0x0
 25c:	00000002 	srl	zero,zero,0x0
 260:	7fffffff 	0x7fffffff
 264:	7fffffff 	0x7fffffff
 268:	7fffffff 	0x7fffffff
 26c:	7fffffff 	0x7fffffff
 270:	7fffffff 	0x7fffffff
 274:	7fffffff 	0x7fffffff
 278:	7fffffff 	0x7fffffff
 27c:	7fffffff 	0x7fffffff
 280:	00000000 	nop
 284:	00000001 	movf	zero,zero,$fcc0
 288:	00000002 	srl	zero,zero,0x0
 28c:	7fffffff 	0x7fffffff
 290:	80000000 	lb	zero,0(zero)
 294:	80000001 	lb	zero,1(zero)
 298:	fffffffe 	sdc3	$31,-2(ra)
 29c:	ffffffff 	sdc3	$31,-1(ra)
 2a0:	00000000 	nop
 2a4:	00000001 	movf	zero,zero,$fcc0
 2a8:	00000002 	srl	zero,zero,0x0
 2ac:	7fffffff 	0x7fffffff
 2b0:	80000001 	lb	zero,1(zero)
 2b4:	80000001 	lb	zero,1(zero)
 2b8:	fffffffe 	sdc3	$31,-2(ra)
 2bc:	ffffffff 	sdc3	$31,-1(ra)
 2c0:	00000000 	nop
 2c4:	00000001 	movf	zero,zero,$fcc0
 2c8:	00000002 	srl	zero,zero,0x0
 2cc:	7fffffff 	0x7fffffff
 2d0:	fffffffe 	sdc3	$31,-2(ra)
 2d4:	fffffffe 	sdc3	$31,-2(ra)
 2d8:	fffffffe 	sdc3	$31,-2(ra)
 2dc:	ffffffff 	sdc3	$31,-1(ra)
 2e0:	00000000 	nop
 2e4:	00000001 	movf	zero,zero,$fcc0
 2e8:	00000002 	srl	zero,zero,0x0
 2ec:	7fffffff 	0x7fffffff
 2f0:	ffffffff 	sdc3	$31,-1(ra)
 2f4:	ffffffff 	sdc3	$31,-1(ra)
 2f8:	ffffffff 	sdc3	$31,-1(ra)
 2fc:	ffffffff 	sdc3	$31,-1(ra)

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
  20:	00000084 	0x84
  24:	c0000000 	ll	zero,0(zero)
  28:	fffffffc 	sdc3	$31,-4(ra)
	...
  34:	00000028 	0x28
  38:	0000001e 	0x1e
  3c:	0000001f 	0x1f

Disassembly of section .gnu.attributes:

00000000 <.gnu.attributes>:
   0:	00000f41 	0xf41
   4:	756e6700 	jalx	5b99c00 <ans+0x5b99a00>
   8:	00070100 	sll	zero,a3,0x4
   c:	01040000 	0x1040000

Disassembly of section .comment:

00000000 <.comment>:
   0:	3a434347 	xori	v1,s2,0x4347
   4:	4e472820 	c3	0x472820
   8:	36202955 	ori	zero,s1,0x2955
   c:	302e322e 	andi	t6,at,0x322e
	...
