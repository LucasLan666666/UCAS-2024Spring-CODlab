
../mips/elf/mov-c:     file format elf32-littlemips


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
  2c:	3c040000 	lui	a0,0x0
  30:	24820088 	addiu	v0,a0,136
  34:	ac800088 	sw	zero,136(a0)
  38:	24040001 	li	a0,1
  3c:	ac440004 	sw	a0,4(v0)
  40:	24040002 	li	a0,2
  44:	ac440008 	sw	a0,8(v0)
  48:	24040004 	li	a0,4
  4c:	24030003 	li	v1,3
  50:	ac440010 	sw	a0,16(v0)
  54:	3c040000 	lui	a0,0x0
  58:	ac43000c 	sw	v1,12(v0)
  5c:	ac430014 	sw	v1,20(v0)
  60:	ac8300b0 	sw	v1,176(a0)
  64:	00001025 	move	v0,zero
  68:	03e00008 	jr	ra
  6c:	00000000 	nop

Disassembly of section .MIPS.abiflags:

00000070 <.MIPS.abiflags>:
  70:	01200000 	0x1200000
  74:	01000101 	0x1000101
	...
  80:	00000001 	movf	zero,zero,$fcc0
  84:	00000000 	nop

Disassembly of section .bss:

00000088 <A>:
	...

Disassembly of section .scommon:

000000b0 <b>:
  b0:	00000000 	nop

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
   4:	756e6700 	jalx	5b99c00 <b+0x5b99b50>
   8:	00070100 	sll	zero,a3,0x4
   c:	01040000 	0x1040000

Disassembly of section .comment:

00000000 <.comment>:
   0:	3a434347 	xori	v1,s2,0x4347
   4:	4e472820 	c3	0x472820
   8:	36202955 	ori	zero,s1,0x2955
   c:	302e322e 	andi	t6,at,0x322e
	...
