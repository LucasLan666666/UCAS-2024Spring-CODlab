
../mips/elf/add:     file format elf32-littlemips


Disassembly of section .text:

00000000 <start>:
   0:	00000000 	nop
   4:	08000004 	j	10 <real_start>
   8:	00000000 	nop

0000000c <global_result>:
   c:	ffffffff 	sdc3	$31,-1(ra)

00000010 <real_start>:
  10:	241d0400 	li	sp,1024
  14:	0c00000e 	jal	38 <main>
  18:	00000000 	nop
  1c:	3c010000 	lui	at,0x0
  20:	ac20000c 	sw	zero,12(at)

00000024 <end_loop>:
  24:	08000009 	j	24 <end_loop>
  28:	00000000 	nop

0000002c <add>:
  2c:	00851021 	addu	v0,a0,a1
  30:	03e00008 	jr	ra
  34:	00000000 	nop

Disassembly of section .text.startup:

00000038 <main>:
  38:	3c0d0000 	lui	t5,0x0
  3c:	3c0c0000 	lui	t4,0x0
  40:	258c01e8 	addiu	t4,t4,488
  44:	3c0b0000 	lui	t3,0x0
  48:	3c070000 	lui	a3,0x0
  4c:	8da9000c 	lw	t1,12(t5)
  50:	256b00e8 	addiu	t3,t3,232
  54:	24e70208 	addiu	a3,a3,520
  58:	01805025 	move	t2,t4
  5c:	00004025 	move	t0,zero
  60:	8d460000 	lw	a2,0(t2)
  64:	01602025 	move	a0,t3
  68:	01801025 	move	v0,t4
  6c:	8c430000 	lw	v1,0(v0)
  70:	8c850000 	lw	a1,0(a0)
  74:	00c31821 	addu	v1,a2,v1
  78:	10650005 	beq	v1,a1,90 <main+0x58>
  7c:	00000000 	nop
  80:	08000009 	j	24 <end_loop>
  84:	00000000 	nop
  88:	24080001 	li	t0,1
  8c:	24090001 	li	t1,1
  90:	24420004 	addiu	v0,v0,4
  94:	24840004 	addiu	a0,a0,4
  98:	1447fff4 	bne	v0,a3,6c <main+0x34>
  9c:	00000000 	nop
  a0:	254a0004 	addiu	t2,t2,4
  a4:	256b0020 	addiu	t3,t3,32
  a8:	144affed 	bne	v0,t2,60 <main+0x28>
  ac:	00000000 	nop
  b0:	15000004 	bnez	t0,c4 <main+0x8c>
  b4:	00000000 	nop
  b8:	00001025 	move	v0,zero
  bc:	03e00008 	jr	ra
  c0:	00000000 	nop
  c4:	ada9000c 	sw	t1,12(t5)
  c8:	1000fffb 	b	b8 <main+0x80>
  cc:	00000000 	nop

Disassembly of section .MIPS.abiflags:

000000d0 <.MIPS.abiflags>:
  d0:	01200000 	0x1200000
  d4:	01000101 	0x1000101
	...
  e0:	00000001 	movf	zero,zero,$fcc0
  e4:	00000000 	nop

Disassembly of section .data:

000000e8 <ans>:
  e8:	00000000 	nop
  ec:	00000001 	movf	zero,zero,$fcc0
  f0:	00000002 	srl	zero,zero,0x0
  f4:	7fffffff 	0x7fffffff
  f8:	80000000 	lb	zero,0(zero)
  fc:	80000001 	lb	zero,1(zero)
 100:	fffffffe 	sdc3	$31,-2(ra)
 104:	ffffffff 	sdc3	$31,-1(ra)
 108:	00000001 	movf	zero,zero,$fcc0
 10c:	00000002 	srl	zero,zero,0x0
 110:	00000003 	sra	zero,zero,0x0
 114:	80000000 	lb	zero,0(zero)
 118:	80000001 	lb	zero,1(zero)
 11c:	80000002 	lb	zero,2(zero)
 120:	ffffffff 	sdc3	$31,-1(ra)
 124:	00000000 	nop
 128:	00000002 	srl	zero,zero,0x0
 12c:	00000003 	sra	zero,zero,0x0
 130:	00000004 	sllv	zero,zero,zero
 134:	80000001 	lb	zero,1(zero)
 138:	80000002 	lb	zero,2(zero)
 13c:	80000003 	lb	zero,3(zero)
 140:	00000000 	nop
 144:	00000001 	movf	zero,zero,$fcc0
 148:	7fffffff 	0x7fffffff
 14c:	80000000 	lb	zero,0(zero)
 150:	80000001 	lb	zero,1(zero)
 154:	fffffffe 	sdc3	$31,-2(ra)
 158:	ffffffff 	sdc3	$31,-1(ra)
 15c:	00000000 	nop
 160:	7ffffffd 	0x7ffffffd
 164:	7ffffffe 	0x7ffffffe
 168:	80000000 	lb	zero,0(zero)
 16c:	80000001 	lb	zero,1(zero)
 170:	80000002 	lb	zero,2(zero)
 174:	ffffffff 	sdc3	$31,-1(ra)
 178:	00000000 	nop
 17c:	00000001 	movf	zero,zero,$fcc0
 180:	7ffffffe 	0x7ffffffe
 184:	7fffffff 	0x7fffffff
 188:	80000001 	lb	zero,1(zero)
 18c:	80000002 	lb	zero,2(zero)
 190:	80000003 	lb	zero,3(zero)
 194:	00000000 	nop
 198:	00000001 	movf	zero,zero,$fcc0
 19c:	00000002 	srl	zero,zero,0x0
 1a0:	7fffffff 	0x7fffffff
 1a4:	80000000 	lb	zero,0(zero)
 1a8:	fffffffe 	sdc3	$31,-2(ra)
 1ac:	ffffffff 	sdc3	$31,-1(ra)
 1b0:	00000000 	nop
 1b4:	7ffffffd 	0x7ffffffd
 1b8:	7ffffffe 	0x7ffffffe
 1bc:	7fffffff 	0x7fffffff
 1c0:	fffffffc 	sdc3	$31,-4(ra)
 1c4:	fffffffd 	sdc3	$31,-3(ra)
 1c8:	ffffffff 	sdc3	$31,-1(ra)
 1cc:	00000000 	nop
 1d0:	00000001 	movf	zero,zero,$fcc0
 1d4:	7ffffffe 	0x7ffffffe
 1d8:	7fffffff 	0x7fffffff
 1dc:	80000000 	lb	zero,0(zero)
 1e0:	fffffffd 	sdc3	$31,-3(ra)
 1e4:	fffffffe 	sdc3	$31,-2(ra)

000001e8 <test_data>:
 1e8:	00000000 	nop
 1ec:	00000001 	movf	zero,zero,$fcc0
 1f0:	00000002 	srl	zero,zero,0x0
 1f4:	7fffffff 	0x7fffffff
 1f8:	80000000 	lb	zero,0(zero)
 1fc:	80000001 	lb	zero,1(zero)
 200:	fffffffe 	sdc3	$31,-2(ra)
 204:	ffffffff 	sdc3	$31,-1(ra)

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
  20:	00000038 	0x38
	...
  38:	0000001d 	0x1d
  3c:	0000001f 	0x1f

Disassembly of section .gnu.attributes:

00000000 <.gnu.attributes>:
   0:	00000f41 	0xf41
   4:	756e6700 	jalx	5b99c00 <test_data+0x5b99a18>
   8:	00070100 	sll	zero,a3,0x4
   c:	01040000 	0x1040000

Disassembly of section .comment:

00000000 <.comment>:
   0:	3a434347 	xori	v1,s2,0x4347
   4:	4e472820 	c3	0x472820
   8:	36202955 	ori	zero,s1,0x2955
   c:	302e322e 	andi	t6,at,0x322e
	...
