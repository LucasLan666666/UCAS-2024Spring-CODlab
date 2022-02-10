
../mips/elf/fib:     file format elf32-littlemips


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
  2c:	3c0a0000 	lui	t2,0x0
  30:	3c020000 	lui	v0,0x0
  34:	3c040000 	lui	a0,0x0
  38:	3c070000 	lui	a3,0x0
  3c:	8d49000c 	lw	t1,12(t2)
  40:	24420168 	addiu	v0,v0,360
  44:	248400d0 	addiu	a0,a0,208
  48:	24e70200 	addiu	a3,a3,512
  4c:	00004025 	move	t0,zero
  50:	8c430004 	lw	v1,4(v0)
  54:	8c460000 	lw	a2,0(v0)
  58:	8c850000 	lw	a1,0(a0)
  5c:	00661821 	addu	v1,v1,a2
  60:	ac430008 	sw	v1,8(v0)
  64:	10650005 	beq	v1,a1,7c <main+0x50>
  68:	00000000 	nop
  6c:	08000009 	j	24 <end_loop>
  70:	00000000 	nop
  74:	24080001 	li	t0,1
  78:	24090001 	li	t1,1
  7c:	24420004 	addiu	v0,v0,4
  80:	24840004 	addiu	a0,a0,4
  84:	1447fff2 	bne	v0,a3,50 <main+0x24>
  88:	00000000 	nop
  8c:	15000004 	bnez	t0,a0 <main+0x74>
  90:	00000000 	nop
  94:	00001025 	move	v0,zero
  98:	03e00008 	jr	ra
  9c:	00000000 	nop
  a0:	ad49000c 	sw	t1,12(t2)
  a4:	1000fffb 	b	94 <main+0x68>
  a8:	00000000 	nop

Disassembly of section .MIPS.abiflags:

000000b0 <.MIPS.abiflags>:
  b0:	01200000 	0x1200000
  b4:	01000101 	0x1000101
	...
  c0:	00000001 	movf	zero,zero,$fcc0
  c4:	00000000 	nop

Disassembly of section .data:

000000c8 <ans>:
  c8:	00000001 	movf	zero,zero,$fcc0
  cc:	00000001 	movf	zero,zero,$fcc0
  d0:	00000002 	srl	zero,zero,0x0
  d4:	00000003 	sra	zero,zero,0x0
  d8:	00000005 	0x5
  dc:	00000008 	jr	zero
  e0:	0000000d 	break
  e4:	00000015 	0x15
  e8:	00000022 	neg	zero,zero
  ec:	00000037 	0x37
  f0:	00000059 	0x59
  f4:	00000090 	0x90
  f8:	000000e9 	0xe9
  fc:	00000179 	0x179
 100:	00000262 	0x262
 104:	000003db 	0x3db
 108:	0000063d 	0x63d
 10c:	00000a18 	0xa18
 110:	00001055 	0x1055
 114:	00001a6d 	0x1a6d
 118:	00002ac2 	srl	a1,zero,0xb
 11c:	0000452f 	0x452f
 120:	00006ff1 	tgeu	zero,zero,0x1bf
 124:	0000b520 	0xb520
 128:	00012511 	0x12511
 12c:	0001da31 	tgeu	zero,at,0x368
 130:	0002ff42 	srl	ra,v0,0x1d
 134:	0004d973 	tltu	zero,a0,0x365
 138:	0007d8b5 	0x7d8b5
 13c:	000cb228 	0xcb228
 140:	00148add 	0x148add
 144:	00213d05 	0x213d05
 148:	0035c7e2 	0x35c7e2
 14c:	005704e7 	0x5704e7
 150:	008cccc9 	0x8cccc9
 154:	00e3d1b0 	tge	a3,v1,0x346
 158:	01709e79 	0x1709e79
 15c:	02547029 	0x2547029
 160:	03c50ea2 	0x3c50ea2
 164:	06197ecb 	0x6197ecb

00000168 <fib>:
 168:	00000001 	movf	zero,zero,$fcc0
 16c:	00000001 	movf	zero,zero,$fcc0
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
   4:	756e6700 	jalx	5b99c00 <fib+0x5b99a98>
   8:	00070100 	sll	zero,a3,0x4
   c:	01040000 	0x1040000

Disassembly of section .comment:

00000000 <.comment>:
   0:	3a434347 	xori	v1,s2,0x4347
   4:	4e472820 	c3	0x472820
   8:	36202955 	ori	zero,s1,0x2955
   c:	302e322e 	andi	t6,at,0x322e
	...
