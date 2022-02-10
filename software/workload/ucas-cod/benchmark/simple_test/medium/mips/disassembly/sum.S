
../mips/elf/sum:     file format elf32-littlemips


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
  2c:	27bdfff8 	addiu	sp,sp,-8
  30:	24020001 	li	v0,1
  34:	24040065 	li	a0,101
  38:	afa00000 	sw	zero,0(sp)
  3c:	8fa30000 	lw	v1,0(sp)
  40:	00621821 	addu	v1,v1,v0
  44:	24420001 	addiu	v0,v0,1
  48:	afa30000 	sw	v1,0(sp)
  4c:	1444fffb 	bne	v0,a0,3c <main+0x10>
  50:	00000000 	nop
  54:	8fa30000 	lw	v1,0(sp)
  58:	240213ba 	li	v0,5050
  5c:	10620006 	beq	v1,v0,78 <main+0x4c>
  60:	00000000 	nop
  64:	24030001 	li	v1,1
  68:	3c020000 	lui	v0,0x0
  6c:	ac43000c 	sw	v1,12(v0)
  70:	08000009 	j	24 <end_loop>
  74:	00000000 	nop
  78:	00001025 	move	v0,zero
  7c:	27bd0008 	addiu	sp,sp,8
  80:	03e00008 	jr	ra
  84:	00000000 	nop

Disassembly of section .MIPS.abiflags:

00000088 <.MIPS.abiflags>:
  88:	01200000 	0x1200000
  8c:	01000101 	0x1000101
	...
  98:	00000001 	movf	zero,zero,$fcc0
  9c:	00000000 	nop

Disassembly of section .reginfo:

00000000 <.reginfo>:
   0:	a0000002 	sb	zero,2(zero)
	...

Disassembly of section .pdr:

00000000 <.pdr>:
   0:	0000002c 	0x2c
	...
  14:	00000008 	jr	zero
  18:	0000001d 	0x1d
  1c:	0000001f 	0x1f

Disassembly of section .gnu.attributes:

00000000 <.gnu.attributes>:
   0:	00000f41 	0xf41
   4:	756e6700 	jalx	5b99c00 <main+0x5b99bd4>
   8:	00070100 	sll	zero,a3,0x4
   c:	01040000 	0x1040000

Disassembly of section .comment:

00000000 <.comment>:
   0:	3a434347 	xori	v1,s2,0x4347
   4:	4e472820 	c3	0x472820
   8:	36202955 	ori	zero,s1,0x2955
   c:	302e322e 	andi	t6,at,0x322e
	...
