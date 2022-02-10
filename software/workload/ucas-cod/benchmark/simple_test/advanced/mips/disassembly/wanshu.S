
../mips/elf/wanshu:     file format elf32-littlemips


Disassembly of section .text:

00000000 <start>:
   0:	241d4000 	li	sp,16384
   4:	08000004 	j	10 <continued>
   8:	00000000 	nop

0000000c <global_result>:
   c:	ffffffff 	sdc3	$31,-1(ra)

00000010 <continued>:
  10:	0c000019 	jal	64 <main>
  14:	00000000 	nop
  18:	0c000015 	jal	54 <hit_good_trap>
  1c:	00000000 	nop

00000020 <_halt>:
  20:	3c020000 	lui	v0,0x0
  24:	ac44000c 	sw	a0,12(v0)
  28:	1000ffff 	b	28 <_halt+0x8>
  2c:	00000000 	nop

00000030 <nemu_assert>:
  30:	14800006 	bnez	a0,4c <nemu_assert+0x1c>
  34:	00000000 	nop
  38:	24030001 	li	v1,1
  3c:	3c020000 	lui	v0,0x0
  40:	ac43000c 	sw	v1,12(v0)
  44:	1000ffff 	b	44 <nemu_assert+0x14>
  48:	00000000 	nop
  4c:	03e00008 	jr	ra
  50:	00000000 	nop

00000054 <hit_good_trap>:
  54:	3c020000 	lui	v0,0x0
  58:	ac40000c 	sw	zero,12(v0)
  5c:	1000ffff 	b	5c <hit_good_trap+0x8>
  60:	00000000 	nop

Disassembly of section .text.startup:

00000064 <main>:
  64:	27bdffe8 	addiu	sp,sp,-24
  68:	3c090000 	lui	t1,0x0
  6c:	24050001 	li	a1,1
  70:	afbf0014 	sw	ra,20(sp)
  74:	00004025 	move	t0,zero
  78:	2407001e 	li	a3,30
  7c:	25290138 	addiu	t1,t1,312
  80:	24a50001 	addiu	a1,a1,1
  84:	10a7001d 	beq	a1,a3,fc <main+0x98>
  88:	00000000 	nop
  8c:	24030001 	li	v1,1
  90:	00003025 	move	a2,zero
  94:	00a3202a 	slt	a0,a1,v1
  98:	00a01025 	move	v0,a1
  9c:	14800007 	bnez	a0,bc <main+0x58>
  a0:	00000000 	nop
  a4:	00431023 	subu	v0,v0,v1
  a8:	0043202a 	slt	a0,v0,v1
  ac:	1080fffd 	beqz	a0,a4 <main+0x40>
  b0:	00000000 	nop
  b4:	00c32021 	addu	a0,a2,v1
  b8:	0082300a 	movz	a2,a0,v0
  bc:	24630001 	addiu	v1,v1,1
  c0:	1465fff4 	bne	v1,a1,94 <main+0x30>
  c4:	00000000 	nop
  c8:	14c5ffed 	bne	a2,a1,80 <main+0x1c>
  cc:	00000000 	nop
  d0:	00081080 	sll	v0,t0,0x2
  d4:	00491021 	addu	v0,v0,t1
  d8:	8c440000 	lw	a0,0(v0)
  dc:	25080001 	addiu	t0,t0,1
  e0:	00852026 	xor	a0,a0,a1
  e4:	2c840001 	sltiu	a0,a0,1
  e8:	0c00000c 	jal	30 <nemu_assert>
  ec:	00000000 	nop
  f0:	24a50001 	addiu	a1,a1,1
  f4:	14a7ffe5 	bne	a1,a3,8c <main+0x28>
  f8:	00000000 	nop
  fc:	39040002 	xori	a0,t0,0x2
 100:	2c840001 	sltiu	a0,a0,1
 104:	0c00000c 	jal	30 <nemu_assert>
 108:	00000000 	nop
 10c:	8fbf0014 	lw	ra,20(sp)
 110:	00001025 	move	v0,zero
 114:	27bd0018 	addiu	sp,sp,24
 118:	03e00008 	jr	ra
 11c:	00000000 	nop

Disassembly of section .MIPS.abiflags:

00000120 <.MIPS.abiflags>:
 120:	01200000 	0x1200000
 124:	01000101 	0x1000101
	...
 130:	00000001 	movf	zero,zero,$fcc0
 134:	00000000 	nop

Disassembly of section .data:

00000138 <ans>:
 138:	00000006 	srlv	zero,zero,zero
 13c:	0000001c 	0x1c

Disassembly of section .reginfo:

00000000 <.reginfo>:
   0:	a0000000 	sb	zero,0(zero)
	...

Disassembly of section .pdr:

00000000 <.pdr>:
   0:	00000020 	add	zero,zero,zero
	...
  18:	0000001d 	0x1d
  1c:	0000001f 	0x1f
  20:	00000030 	tge	zero,zero
	...
  38:	0000001d 	0x1d
  3c:	0000001f 	0x1f
  40:	00000054 	0x54
	...
  58:	0000001d 	0x1d
  5c:	0000001f 	0x1f
  60:	00000064 	0x64
  64:	80000000 	lb	zero,0(zero)
  68:	fffffffc 	sdc3	$31,-4(ra)
	...
  74:	00000018 	mult	zero,zero
  78:	0000001d 	0x1d
  7c:	0000001f 	0x1f

Disassembly of section .gnu.attributes:

00000000 <.gnu.attributes>:
   0:	00000f41 	0xf41
   4:	756e6700 	jalx	5b99c00 <ans+0x5b99ac8>
   8:	00070100 	sll	zero,a3,0x4
   c:	01040000 	0x1040000

Disassembly of section .comment:

00000000 <.comment>:
   0:	3a434347 	xori	v1,s2,0x4347
   4:	4e472820 	c3	0x472820
   8:	36202955 	ori	zero,s1,0x2955
   c:	302e322e 	andi	t6,at,0x322e
	...
