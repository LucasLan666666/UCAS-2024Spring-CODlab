
../mips/elf/if-else:     file format elf32-littlemips


Disassembly of section .text:

00000000 <start>:
   0:	00000000 	nop
   4:	08000004 	j	10 <real_start>
   8:	00000000 	nop

0000000c <global_result>:
   c:	ffffffff 	sdc3	$31,-1(ra)

00000010 <real_start>:
  10:	241d0400 	li	sp,1024
  14:	0c000036 	jal	d8 <main>
  18:	00000000 	nop
  1c:	3c010000 	lui	at,0x0
  20:	ac20000c 	sw	zero,12(at)

00000024 <end_loop>:
  24:	08000009 	j	24 <end_loop>
  28:	00000000 	nop

0000002c <if_else>:
  2c:	27bdfff0 	addiu	sp,sp,-16
  30:	afbe000c 	sw	s8,12(sp)
  34:	03a0f025 	move	s8,sp
  38:	afc40010 	sw	a0,16(s8)
  3c:	8fc20010 	lw	v0,16(s8)
  40:	284201f5 	slti	v0,v0,501
  44:	14400005 	bnez	v0,5c <if_else+0x30>
  48:	00000000 	nop
  4c:	24020096 	li	v0,150
  50:	afc20000 	sw	v0,0(s8)
  54:	1000001a 	b	c0 <if_else+0x94>
  58:	00000000 	nop
  5c:	8fc20010 	lw	v0,16(s8)
  60:	2842012d 	slti	v0,v0,301
  64:	14400005 	bnez	v0,7c <if_else+0x50>
  68:	00000000 	nop
  6c:	24020064 	li	v0,100
  70:	afc20000 	sw	v0,0(s8)
  74:	10000012 	b	c0 <if_else+0x94>
  78:	00000000 	nop
  7c:	8fc20010 	lw	v0,16(s8)
  80:	28420065 	slti	v0,v0,101
  84:	14400005 	bnez	v0,9c <if_else+0x70>
  88:	00000000 	nop
  8c:	2402004b 	li	v0,75
  90:	afc20000 	sw	v0,0(s8)
  94:	1000000a 	b	c0 <if_else+0x94>
  98:	00000000 	nop
  9c:	8fc20010 	lw	v0,16(s8)
  a0:	28420033 	slti	v0,v0,51
  a4:	14400005 	bnez	v0,bc <if_else+0x90>
  a8:	00000000 	nop
  ac:	24020032 	li	v0,50
  b0:	afc20000 	sw	v0,0(s8)
  b4:	10000002 	b	c0 <if_else+0x94>
  b8:	00000000 	nop
  bc:	afc00000 	sw	zero,0(s8)
  c0:	8fc20000 	lw	v0,0(s8)
  c4:	03c0e825 	move	sp,s8
  c8:	8fbe000c 	lw	s8,12(sp)
  cc:	27bd0010 	addiu	sp,sp,16
  d0:	03e00008 	jr	ra
  d4:	00000000 	nop

000000d8 <main>:
  d8:	27bdffe0 	addiu	sp,sp,-32
  dc:	afbf001c 	sw	ra,28(sp)
  e0:	afbe0018 	sw	s8,24(sp)
  e4:	03a0f025 	move	s8,sp
  e8:	afc00014 	sw	zero,20(s8)
  ec:	afc00010 	sw	zero,16(s8)
  f0:	1000001d 	b	168 <main+0x90>
  f4:	00000000 	nop
  f8:	3c020000 	lui	v0,0x0
  fc:	8fc30010 	lw	v1,16(s8)
 100:	00031880 	sll	v1,v1,0x2
 104:	244201d0 	addiu	v0,v0,464
 108:	00621021 	addu	v0,v1,v0
 10c:	8c420000 	lw	v0,0(v0)
 110:	00402025 	move	a0,v0
 114:	0c00000b 	jal	2c <if_else>
 118:	00000000 	nop
 11c:	00402825 	move	a1,v0
 120:	8fc20014 	lw	v0,20(s8)
 124:	24430001 	addiu	v1,v0,1
 128:	afc30014 	sw	v1,20(s8)
 12c:	3c040000 	lui	a0,0x0
 130:	00021880 	sll	v1,v0,0x2
 134:	24820208 	addiu	v0,a0,520
 138:	00621021 	addu	v0,v1,v0
 13c:	8c420000 	lw	v0,0(v0)
 140:	10a20006 	beq	a1,v0,15c <main+0x84>
 144:	00000000 	nop
 148:	3c020000 	lui	v0,0x0
 14c:	24030001 	li	v1,1
 150:	ac43000c 	sw	v1,12(v0)
 154:	08000009 	j	24 <end_loop>
 158:	00000000 	nop
 15c:	8fc20010 	lw	v0,16(s8)
 160:	24420001 	addiu	v0,v0,1
 164:	afc20010 	sw	v0,16(s8)
 168:	8fc20010 	lw	v0,16(s8)
 16c:	2c42000e 	sltiu	v0,v0,14
 170:	1440ffe1 	bnez	v0,f8 <main+0x20>
 174:	00000000 	nop
 178:	8fc30010 	lw	v1,16(s8)
 17c:	2402000e 	li	v0,14
 180:	10620006 	beq	v1,v0,19c <main+0xc4>
 184:	00000000 	nop
 188:	3c020000 	lui	v0,0x0
 18c:	24030001 	li	v1,1
 190:	ac43000c 	sw	v1,12(v0)
 194:	08000009 	j	24 <end_loop>
 198:	00000000 	nop
 19c:	00001025 	move	v0,zero
 1a0:	03c0e825 	move	sp,s8
 1a4:	8fbf001c 	lw	ra,28(sp)
 1a8:	8fbe0018 	lw	s8,24(sp)
 1ac:	27bd0020 	addiu	sp,sp,32
 1b0:	03e00008 	jr	ra
 1b4:	00000000 	nop

Disassembly of section .MIPS.abiflags:

000001b8 <.MIPS.abiflags>:
 1b8:	01200000 	0x1200000
 1bc:	01000101 	0x1000101
	...
 1c8:	00000001 	movf	zero,zero,$fcc0
 1cc:	00000000 	nop

Disassembly of section .data:

000001d0 <test_data>:
 1d0:	ffffffff 	sdc3	$31,-1(ra)
 1d4:	00000000 	nop
 1d8:	00000031 	tgeu	zero,zero
 1dc:	00000032 	tlt	zero,zero
 1e0:	00000033 	tltu	zero,zero
 1e4:	00000063 	0x63
 1e8:	00000064 	0x64
 1ec:	00000065 	0x65
 1f0:	0000012b 	0x12b
 1f4:	0000012c 	0x12c
 1f8:	0000012d 	0x12d
 1fc:	000001f3 	tltu	zero,zero,0x7
 200:	000001f4 	teq	zero,zero,0x7
 204:	000001f5 	0x1f5

00000208 <ans>:
	...
 218:	00000032 	tlt	zero,zero
 21c:	00000032 	tlt	zero,zero
 220:	00000032 	tlt	zero,zero
 224:	0000004b 	0x4b
 228:	0000004b 	0x4b
 22c:	0000004b 	0x4b
 230:	00000064 	0x64
 234:	00000064 	0x64
 238:	00000064 	0x64
 23c:	00000096 	0x96

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
  20:	000000d8 	0xd8
  24:	c0000000 	ll	zero,0(zero)
  28:	fffffffc 	sdc3	$31,-4(ra)
	...
  34:	00000020 	add	zero,zero,zero
  38:	0000001e 	0x1e
  3c:	0000001f 	0x1f

Disassembly of section .gnu.attributes:

00000000 <.gnu.attributes>:
   0:	00000f41 	0xf41
   4:	756e6700 	jalx	5b99c00 <ans+0x5b999f8>
   8:	00070100 	sll	zero,a3,0x4
   c:	01040000 	0x1040000

Disassembly of section .comment:

00000000 <.comment>:
   0:	3a434347 	xori	v1,s2,0x4347
   4:	4e472820 	c3	0x472820
   8:	36202955 	ori	zero,s1,0x2955
   c:	302e322e 	andi	t6,at,0x322e
	...
