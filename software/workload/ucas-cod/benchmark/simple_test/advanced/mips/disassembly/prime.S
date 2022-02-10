
../mips/elf/prime:     file format elf32-littlemips


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
  68:	3c080000 	lui	t0,0x0
  6c:	00003025 	move	a2,zero
  70:	afbf0014 	sw	ra,20(sp)
  74:	24050065 	li	a1,101
  78:	25080120 	addiu	t0,t0,288
  7c:	24070097 	li	a3,151
  80:	24030002 	li	v1,2
  84:	00a3102a 	slt	v0,a1,v1
  88:	14400008 	bnez	v0,ac <main+0x48>
  8c:	00000000 	nop
  90:	00a01025 	move	v0,a1
  94:	00431023 	subu	v0,v0,v1
  98:	0043202a 	slt	a0,v0,v1
  9c:	1080fffd 	beqz	a0,94 <main+0x30>
  a0:	00000000 	nop
  a4:	1040000c 	beqz	v0,d8 <main+0x74>
  a8:	00000000 	nop
  ac:	24630001 	addiu	v1,v1,1
  b0:	1465fff4 	bne	v1,a1,84 <main+0x20>
  b4:	00000000 	nop
  b8:	00061080 	sll	v0,a2,0x2
  bc:	00481021 	addu	v0,v0,t0
  c0:	8c440000 	lw	a0,0(v0)
  c4:	24c60001 	addiu	a2,a2,1
  c8:	00852026 	xor	a0,a0,a1
  cc:	2c840001 	sltiu	a0,a0,1
  d0:	0c00000c 	jal	30 <nemu_assert>
  d4:	00000000 	nop
  d8:	24a50002 	addiu	a1,a1,2
  dc:	14a7ffe8 	bne	a1,a3,80 <main+0x1c>
  e0:	00000000 	nop
  e4:	38c4000a 	xori	a0,a2,0xa
  e8:	2c840001 	sltiu	a0,a0,1
  ec:	0c00000c 	jal	30 <nemu_assert>
  f0:	00000000 	nop
  f4:	8fbf0014 	lw	ra,20(sp)
  f8:	00001025 	move	v0,zero
  fc:	27bd0018 	addiu	sp,sp,24
 100:	03e00008 	jr	ra
 104:	00000000 	nop

Disassembly of section .MIPS.abiflags:

00000108 <.MIPS.abiflags>:
 108:	01200000 	0x1200000
 10c:	01000101 	0x1000101
	...
 118:	00000001 	movf	zero,zero,$fcc0
 11c:	00000000 	nop

Disassembly of section .data:

00000120 <ans>:
 120:	00000065 	0x65
 124:	00000067 	0x67
 128:	0000006b 	0x6b
 12c:	0000006d 	0x6d
 130:	00000071 	tgeu	zero,zero,0x1
 134:	0000007f 	0x7f
 138:	00000083 	sra	zero,zero,0x2
 13c:	00000089 	0x89
 140:	0000008b 	0x8b
 144:	00000095 	0x95

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
   4:	756e6700 	jalx	5b99c00 <ans+0x5b99ae0>
   8:	00070100 	sll	zero,a3,0x4
   c:	01040000 	0x1040000

Disassembly of section .comment:

00000000 <.comment>:
   0:	3a434347 	xori	v1,s2,0x4347
   4:	4e472820 	c3	0x472820
   8:	36202955 	ori	zero,s1,0x2955
   c:	302e322e 	andi	t6,at,0x322e
	...
