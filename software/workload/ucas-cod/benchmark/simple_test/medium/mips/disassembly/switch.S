
../mips/elf/switch:     file format elf32-littlemips


Disassembly of section .text:

00000000 <start>:
   0:	00000000 	nop
   4:	08000004 	j	10 <real_start>
   8:	00000000 	nop

0000000c <global_result>:
   c:	ffffffff 	sdc3	$31,-1(ra)

00000010 <real_start>:
  10:	241d0400 	li	sp,1024
  14:	0c000018 	jal	60 <main>
  18:	00000000 	nop
  1c:	3c010000 	lui	at,0x0
  20:	ac20000c 	sw	zero,12(at)

00000024 <end_loop>:
  24:	08000009 	j	24 <end_loop>
  28:	00000000 	nop

0000002c <switch_case>:
  2c:	2c82000d 	sltiu	v0,a0,13
  30:	10400008 	beqz	v0,54 <switch_case+0x28>
  34:	00000000 	nop
  38:	3c020000 	lui	v0,0x0
  3c:	24420118 	addiu	v0,v0,280
  40:	00042080 	sll	a0,a0,0x2
  44:	00822021 	addu	a0,a0,v0
  48:	8c820000 	lw	v0,0(a0)
  4c:	03e00008 	jr	ra
  50:	00000000 	nop
  54:	2402ffff 	li	v0,-1
  58:	03e00008 	jr	ra
  5c:	00000000 	nop

Disassembly of section .text.startup:

00000060 <main>:
  60:	3c0a0000 	lui	t2,0x0
  64:	3c020000 	lui	v0,0x0
  68:	3c040000 	lui	a0,0x0
  6c:	3c070000 	lui	a3,0x0
  70:	8d49000c 	lw	t1,12(t2)
  74:	2442014c 	addiu	v0,v0,332
  78:	24840118 	addiu	a0,a0,280
  7c:	24e70184 	addiu	a3,a3,388
  80:	00001825 	move	v1,zero
  84:	00004025 	move	t0,zero
  88:	2405ffff 	li	a1,-1
  8c:	10000007 	b	ac <main+0x4c>
  90:	00000000 	nop
  94:	2405ffff 	li	a1,-1
  98:	14c00013 	bnez	a2,e8 <main+0x88>
  9c:	00000000 	nop
  a0:	24630001 	addiu	v1,v1,1
  a4:	24420004 	addiu	v0,v0,4
  a8:	24840004 	addiu	a0,a0,4
  ac:	8c460000 	lw	a2,0(v0)
  b0:	10c50005 	beq	a2,a1,c8 <main+0x68>
  b4:	00000000 	nop
  b8:	08000009 	j	24 <end_loop>
  bc:	00000000 	nop
  c0:	24080001 	li	t0,1
  c4:	24090001 	li	t1,1
  c8:	2c66000d 	sltiu	a2,v1,13
  cc:	1447fff1 	bne	v0,a3,94 <main+0x34>
  d0:	00000000 	nop
  d4:	15000007 	bnez	t0,f4 <main+0x94>
  d8:	00000000 	nop
  dc:	00001025 	move	v0,zero
  e0:	03e00008 	jr	ra
  e4:	00000000 	nop
  e8:	8c850000 	lw	a1,0(a0)
  ec:	1000ffec 	b	a0 <main+0x40>
  f0:	00000000 	nop
  f4:	ad49000c 	sw	t1,12(t2)
  f8:	1000fff8 	b	dc <main+0x7c>
  fc:	00000000 	nop

Disassembly of section .MIPS.abiflags:

00000100 <.MIPS.abiflags>:
 100:	01200000 	0x1200000
 104:	01000101 	0x1000101
	...
 110:	00000001 	movf	zero,zero,$fcc0
 114:	00000000 	nop

Disassembly of section .rodata:

00000118 <CSWTCH.1>:
 118:	00000000 	nop
 11c:	00000002 	srl	zero,zero,0x0
 120:	00000005 	0x5
 124:	00000005 	0x5
 128:	00000008 	jr	zero
 12c:	00000008 	jr	zero
 130:	00000008 	jr	zero
 134:	00000008 	jr	zero
 138:	0000000a 	movz	zero,zero,zero
 13c:	0000000a 	movz	zero,zero,zero
 140:	0000000a 	movz	zero,zero,zero
 144:	0000000a 	movz	zero,zero,zero
 148:	0000000f 	sync

Disassembly of section .data:

0000014c <ans>:
 14c:	ffffffff 	sdc3	$31,-1(ra)
 150:	00000000 	nop
 154:	00000002 	srl	zero,zero,0x0
 158:	00000005 	0x5
 15c:	00000005 	0x5
 160:	00000008 	jr	zero
 164:	00000008 	jr	zero
 168:	00000008 	jr	zero
 16c:	00000008 	jr	zero
 170:	0000000a 	movz	zero,zero,zero
 174:	0000000a 	movz	zero,zero,zero
 178:	0000000a 	movz	zero,zero,zero
 17c:	0000000a 	movz	zero,zero,zero
 180:	0000000f 	sync
 184:	ffffffff 	sdc3	$31,-1(ra)

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
  20:	00000060 	0x60
	...
  38:	0000001d 	0x1d
  3c:	0000001f 	0x1f

Disassembly of section .gnu.attributes:

00000000 <.gnu.attributes>:
   0:	00000f41 	0xf41
   4:	756e6700 	jalx	5b99c00 <ans+0x5b99ab4>
   8:	00070100 	sll	zero,a3,0x4
   c:	01040000 	0x1040000

Disassembly of section .comment:

00000000 <.comment>:
   0:	3a434347 	xori	v1,s2,0x4347
   4:	4e472820 	c3	0x472820
   8:	36202955 	ori	zero,s1,0x2955
   c:	302e322e 	andi	t6,at,0x322e
	...
