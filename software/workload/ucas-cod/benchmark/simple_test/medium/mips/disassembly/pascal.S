
../mips/elf/pascal:     file format elf32-littlemips


Disassembly of section .text:

00000000 <start>:
   0:	00000000 	nop
   4:	08000004 	j	10 <real_start>
   8:	00000000 	nop

0000000c <global_result>:
   c:	ffffffff 	sdc3	$31,-1(ra)

00000010 <real_start>:
  10:	241d0400 	li	sp,1024
  14:	0c00000b 	jal	2c <main>
  18:	00000000 	nop
  1c:	3c010000 	lui	at,0x0
  20:	ac20000c 	sw	zero,12(at)

00000024 <end_loop>:
  24:	08000009 	j	24 <end_loop>
  28:	00000000 	nop

Disassembly of section .text.startup:

0000002c <main>:
  2c:	3c020000 	lui	v0,0x0
  30:	24030001 	li	v1,1
  34:	244601a4 	addiu	a2,v0,420
  38:	3c050000 	lui	a1,0x0
  3c:	3c080000 	lui	t0,0x0
  40:	3c070000 	lui	a3,0x0
  44:	acc30004 	sw	v1,4(a2)
  48:	ac4301a4 	sw	v1,420(v0)
  4c:	24a501ac 	addiu	a1,a1,428
  50:	25080220 	addiu	t0,t0,544
  54:	24040001 	li	a0,1
  58:	24e701a8 	addiu	a3,a3,424
  5c:	24090001 	li	t1,1
  60:	00e01025 	move	v0,a3
  64:	24030001 	li	v1,1
  68:	10000002 	b	74 <main+0x48>
  6c:	00000000 	nop
  70:	8c440000 	lw	a0,0(v0)
  74:	00831821 	addu	v1,a0,v1
  78:	ac430000 	sw	v1,0(v0)
  7c:	24420004 	addiu	v0,v0,4
  80:	00801825 	move	v1,a0
  84:	1445fffa 	bne	v0,a1,70 <main+0x44>
  88:	00000000 	nop
  8c:	aca90000 	sw	t1,0(a1)
  90:	24a50004 	addiu	a1,a1,4
  94:	10a80004 	beq	a1,t0,a8 <main+0x7c>
  98:	00000000 	nop
  9c:	8cc40004 	lw	a0,4(a2)
  a0:	1000ffef 	b	60 <main+0x34>
  a4:	00000000 	nop
  a8:	3c090000 	lui	t1,0x0
  ac:	3c030000 	lui	v1,0x0
  b0:	8d27000c 	lw	a3,12(t1)
  b4:	00c01025 	move	v0,a2
  b8:	24630128 	addiu	v1,v1,296
  bc:	00004025 	move	t0,zero
  c0:	8c460000 	lw	a2,0(v0)
  c4:	8c640000 	lw	a0,0(v1)
  c8:	10c40005 	beq	a2,a0,e0 <main+0xb4>
  cc:	00000000 	nop
  d0:	08000009 	j	24 <end_loop>
  d4:	00000000 	nop
  d8:	24080001 	li	t0,1
  dc:	24070001 	li	a3,1
  e0:	24420004 	addiu	v0,v0,4
  e4:	24630004 	addiu	v1,v1,4
  e8:	1445fff5 	bne	v0,a1,c0 <main+0x94>
  ec:	00000000 	nop
  f0:	15000004 	bnez	t0,104 <main+0xd8>
  f4:	00000000 	nop
  f8:	00001025 	move	v0,zero
  fc:	03e00008 	jr	ra
 100:	00000000 	nop
 104:	ad27000c 	sw	a3,12(t1)
 108:	1000fffb 	b	f8 <main+0xcc>
 10c:	00000000 	nop

Disassembly of section .MIPS.abiflags:

00000110 <.MIPS.abiflags>:
 110:	01200000 	0x1200000
 114:	01000101 	0x1000101
	...
 120:	00000001 	movf	zero,zero,$fcc0
 124:	00000000 	nop

Disassembly of section .data:

00000128 <ans>:
 128:	00000001 	movf	zero,zero,$fcc0
 12c:	0000001e 	0x1e
 130:	000001b3 	tltu	zero,zero,0x6
 134:	00000fdc 	0xfdc
 138:	00006b0d 	break	0x0,0x1ac
 13c:	00022caa 	0x22caa
 140:	00090f6f 	0x90f6f
 144:	001f1058 	0x1f1058
 148:	00594efd 	0x594efd
 14c:	00da4f4e 	0xda4f4e
 150:	01ca7357 	0x1ca7357
 154:	03418be4 	0x3418be4
 158:	0527c829 	0x527c829
 15c:	072363ea 	bgezl	t9,19108 <a+0x18f64>
 160:	08aaf953 	j	2abe54c <a+0x2abe3a8>
 164:	093ee7d0 	j	4fb9f40 <a+0x4fb9d9c>
 168:	08aaf953 	j	2abe54c <a+0x2abe3a8>
 16c:	072363ea 	bgezl	t9,19118 <a+0x18f74>
 170:	0527c829 	0x527c829
 174:	03418be4 	0x3418be4
 178:	01ca7357 	0x1ca7357
 17c:	00da4f4e 	0xda4f4e
 180:	00594efd 	0x594efd
 184:	001f1058 	0x1f1058
 188:	00090f6f 	0x90f6f
 18c:	00022caa 	0x22caa
 190:	00006b0d 	break	0x0,0x1ac
 194:	00000fdc 	0xfdc
 198:	000001b3 	tltu	zero,zero,0x6
 19c:	0000001e 	0x1e
 1a0:	00000001 	movf	zero,zero,$fcc0

Disassembly of section .bss:

000001a4 <a>:
	...

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

Disassembly of section .gnu.attributes:

00000000 <.gnu.attributes>:
   0:	00000f41 	0xf41
   4:	756e6700 	jalx	5b99c00 <a+0x5b99a5c>
   8:	00070100 	sll	zero,a3,0x4
   c:	01040000 	0x1040000

Disassembly of section .comment:

00000000 <.comment>:
   0:	3a434347 	xori	v1,s2,0x4347
   4:	4e472820 	c3	0x472820
   8:	36202955 	ori	zero,s1,0x2955
   c:	302e322e 	andi	t6,at,0x322e
	...
