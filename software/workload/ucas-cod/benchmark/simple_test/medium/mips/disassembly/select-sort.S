
../mips/elf/select-sort:     file format elf32-littlemips


Disassembly of section .text:

00000000 <start>:
   0:	00000000 	nop
   4:	08000004 	j	10 <real_start>
   8:	00000000 	nop

0000000c <global_result>:
   c:	ffffffff 	sdc3	$31,-1(ra)

00000010 <real_start>:
  10:	241d0400 	li	sp,1024
  14:	0c000057 	jal	15c <main>
  18:	00000000 	nop
  1c:	3c010000 	lui	at,0x0
  20:	ac20000c 	sw	zero,12(at)

00000024 <end_loop>:
  24:	08000009 	j	24 <end_loop>
  28:	00000000 	nop

0000002c <select_sort>:
  2c:	27bdffe8 	addiu	sp,sp,-24
  30:	afbe0014 	sw	s8,20(sp)
  34:	03a0f025 	move	s8,sp
  38:	afc00000 	sw	zero,0(s8)
  3c:	1000003d 	b	134 <select_sort+0x108>
  40:	00000000 	nop
  44:	8fc20000 	lw	v0,0(s8)
  48:	afc20008 	sw	v0,8(s8)
  4c:	8fc20000 	lw	v0,0(s8)
  50:	24420001 	addiu	v0,v0,1
  54:	afc20004 	sw	v0,4(s8)
  58:	10000015 	b	b0 <select_sort+0x84>
  5c:	00000000 	nop
  60:	3c020000 	lui	v0,0x0
  64:	8fc30004 	lw	v1,4(s8)
  68:	00031880 	sll	v1,v1,0x2
  6c:	244202b8 	addiu	v0,v0,696
  70:	00621021 	addu	v0,v1,v0
  74:	8c430000 	lw	v1,0(v0)
  78:	3c020000 	lui	v0,0x0
  7c:	8fc40008 	lw	a0,8(s8)
  80:	00042080 	sll	a0,a0,0x2
  84:	244202b8 	addiu	v0,v0,696
  88:	00821021 	addu	v0,a0,v0
  8c:	8c420000 	lw	v0,0(v0)
  90:	0062102a 	slt	v0,v1,v0
  94:	10400003 	beqz	v0,a4 <select_sort+0x78>
  98:	00000000 	nop
  9c:	8fc20004 	lw	v0,4(s8)
  a0:	afc20008 	sw	v0,8(s8)
  a4:	8fc20004 	lw	v0,4(s8)
  a8:	24420001 	addiu	v0,v0,1
  ac:	afc20004 	sw	v0,4(s8)
  b0:	8fc20004 	lw	v0,4(s8)
  b4:	28420014 	slti	v0,v0,20
  b8:	1440ffe9 	bnez	v0,60 <select_sort+0x34>
  bc:	00000000 	nop
  c0:	3c020000 	lui	v0,0x0
  c4:	8fc30000 	lw	v1,0(s8)
  c8:	00031880 	sll	v1,v1,0x2
  cc:	244202b8 	addiu	v0,v0,696
  d0:	00621021 	addu	v0,v1,v0
  d4:	8c420000 	lw	v0,0(v0)
  d8:	afc2000c 	sw	v0,12(s8)
  dc:	3c020000 	lui	v0,0x0
  e0:	8fc30008 	lw	v1,8(s8)
  e4:	00031880 	sll	v1,v1,0x2
  e8:	244202b8 	addiu	v0,v0,696
  ec:	00621021 	addu	v0,v1,v0
  f0:	8c430000 	lw	v1,0(v0)
  f4:	3c020000 	lui	v0,0x0
  f8:	8fc40000 	lw	a0,0(s8)
  fc:	00042080 	sll	a0,a0,0x2
 100:	244202b8 	addiu	v0,v0,696
 104:	00821021 	addu	v0,a0,v0
 108:	ac430000 	sw	v1,0(v0)
 10c:	3c020000 	lui	v0,0x0
 110:	8fc30008 	lw	v1,8(s8)
 114:	00031880 	sll	v1,v1,0x2
 118:	244202b8 	addiu	v0,v0,696
 11c:	00621021 	addu	v0,v1,v0
 120:	8fc3000c 	lw	v1,12(s8)
 124:	ac430000 	sw	v1,0(v0)
 128:	8fc20000 	lw	v0,0(s8)
 12c:	24420001 	addiu	v0,v0,1
 130:	afc20000 	sw	v0,0(s8)
 134:	8fc20000 	lw	v0,0(s8)
 138:	28420013 	slti	v0,v0,19
 13c:	1440ffc1 	bnez	v0,44 <select_sort+0x18>
 140:	00000000 	nop
 144:	00000000 	nop
 148:	03c0e825 	move	sp,s8
 14c:	8fbe0014 	lw	s8,20(sp)
 150:	27bd0018 	addiu	sp,sp,24
 154:	03e00008 	jr	ra
 158:	00000000 	nop

0000015c <main>:
 15c:	27bdffe0 	addiu	sp,sp,-32
 160:	afbf001c 	sw	ra,28(sp)
 164:	afbe0018 	sw	s8,24(sp)
 168:	03a0f025 	move	s8,sp
 16c:	0c00000b 	jal	2c <select_sort>
 170:	00000000 	nop
 174:	afc00010 	sw	zero,16(s8)
 178:	10000012 	b	1c4 <main+0x68>
 17c:	00000000 	nop
 180:	3c020000 	lui	v0,0x0
 184:	8fc30010 	lw	v1,16(s8)
 188:	00031880 	sll	v1,v1,0x2
 18c:	244202b8 	addiu	v0,v0,696
 190:	00621021 	addu	v0,v1,v0
 194:	8c430000 	lw	v1,0(v0)
 198:	8fc20010 	lw	v0,16(s8)
 19c:	10620006 	beq	v1,v0,1b8 <main+0x5c>
 1a0:	00000000 	nop
 1a4:	3c020000 	lui	v0,0x0
 1a8:	24030001 	li	v1,1
 1ac:	ac43000c 	sw	v1,12(v0)
 1b0:	08000009 	j	24 <end_loop>
 1b4:	00000000 	nop
 1b8:	8fc20010 	lw	v0,16(s8)
 1bc:	24420001 	addiu	v0,v0,1
 1c0:	afc20010 	sw	v0,16(s8)
 1c4:	8fc20010 	lw	v0,16(s8)
 1c8:	28420014 	slti	v0,v0,20
 1cc:	1440ffec 	bnez	v0,180 <main+0x24>
 1d0:	00000000 	nop
 1d4:	8fc30010 	lw	v1,16(s8)
 1d8:	24020014 	li	v0,20
 1dc:	10620006 	beq	v1,v0,1f8 <main+0x9c>
 1e0:	00000000 	nop
 1e4:	3c020000 	lui	v0,0x0
 1e8:	24030001 	li	v1,1
 1ec:	ac43000c 	sw	v1,12(v0)
 1f0:	08000009 	j	24 <end_loop>
 1f4:	00000000 	nop
 1f8:	0c00000b 	jal	2c <select_sort>
 1fc:	00000000 	nop
 200:	afc00010 	sw	zero,16(s8)
 204:	10000012 	b	250 <main+0xf4>
 208:	00000000 	nop
 20c:	3c020000 	lui	v0,0x0
 210:	8fc30010 	lw	v1,16(s8)
 214:	00031880 	sll	v1,v1,0x2
 218:	244202b8 	addiu	v0,v0,696
 21c:	00621021 	addu	v0,v1,v0
 220:	8c430000 	lw	v1,0(v0)
 224:	8fc20010 	lw	v0,16(s8)
 228:	10620006 	beq	v1,v0,244 <main+0xe8>
 22c:	00000000 	nop
 230:	3c020000 	lui	v0,0x0
 234:	24030001 	li	v1,1
 238:	ac43000c 	sw	v1,12(v0)
 23c:	08000009 	j	24 <end_loop>
 240:	00000000 	nop
 244:	8fc20010 	lw	v0,16(s8)
 248:	24420001 	addiu	v0,v0,1
 24c:	afc20010 	sw	v0,16(s8)
 250:	8fc20010 	lw	v0,16(s8)
 254:	28420014 	slti	v0,v0,20
 258:	1440ffec 	bnez	v0,20c <main+0xb0>
 25c:	00000000 	nop
 260:	8fc30010 	lw	v1,16(s8)
 264:	24020014 	li	v0,20
 268:	10620006 	beq	v1,v0,284 <main+0x128>
 26c:	00000000 	nop
 270:	3c020000 	lui	v0,0x0
 274:	24030001 	li	v1,1
 278:	ac43000c 	sw	v1,12(v0)
 27c:	08000009 	j	24 <end_loop>
 280:	00000000 	nop
 284:	00001025 	move	v0,zero
 288:	03c0e825 	move	sp,s8
 28c:	8fbf001c 	lw	ra,28(sp)
 290:	8fbe0018 	lw	s8,24(sp)
 294:	27bd0020 	addiu	sp,sp,32
 298:	03e00008 	jr	ra
 29c:	00000000 	nop

Disassembly of section .MIPS.abiflags:

000002a0 <.MIPS.abiflags>:
 2a0:	01200000 	0x1200000
 2a4:	01000101 	0x1000101
	...
 2b0:	00000001 	movf	zero,zero,$fcc0
 2b4:	00000000 	nop

Disassembly of section .data:

000002b8 <a>:
 2b8:	00000002 	srl	zero,zero,0x0
 2bc:	0000000c 	syscall
 2c0:	0000000e 	0xe
 2c4:	00000006 	srlv	zero,zero,zero
 2c8:	0000000d 	break
 2cc:	0000000f 	sync
 2d0:	00000010 	mfhi	zero
 2d4:	0000000a 	movz	zero,zero,zero
 2d8:	00000000 	nop
 2dc:	00000012 	mflo	zero
 2e0:	0000000b 	movn	zero,zero,zero
 2e4:	00000013 	mtlo	zero
 2e8:	00000009 	jalr	zero,zero
 2ec:	00000001 	movf	zero,zero,$fcc0
 2f0:	00000007 	srav	zero,zero,zero
 2f4:	00000005 	0x5
 2f8:	00000004 	sllv	zero,zero,zero
 2fc:	00000003 	sra	zero,zero,0x0
 300:	00000008 	jr	zero
 304:	00000011 	mthi	zero

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
  14:	00000018 	mult	zero,zero
  18:	0000001e 	0x1e
  1c:	0000001f 	0x1f
  20:	0000015c 	0x15c
  24:	c0000000 	ll	zero,0(zero)
  28:	fffffffc 	sdc3	$31,-4(ra)
	...
  34:	00000020 	add	zero,zero,zero
  38:	0000001e 	0x1e
  3c:	0000001f 	0x1f

Disassembly of section .gnu.attributes:

00000000 <.gnu.attributes>:
   0:	00000f41 	0xf41
   4:	756e6700 	jalx	5b99c00 <a+0x5b99948>
   8:	00070100 	sll	zero,a3,0x4
   c:	01040000 	0x1040000

Disassembly of section .comment:

00000000 <.comment>:
   0:	3a434347 	xori	v1,s2,0x4347
   4:	4e472820 	c3	0x472820
   8:	36202955 	ori	zero,s1,0x2955
   c:	302e322e 	andi	t6,at,0x322e
	...
