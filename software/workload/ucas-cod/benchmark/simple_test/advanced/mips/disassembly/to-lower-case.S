
../mips/elf/to-lower-case:     file format elf32-littlemips


Disassembly of section .text:

00000000 <start>:
   0:	241d4000 	li	sp,16384
   4:	08000004 	j	10 <continued>
   8:	00000000 	nop

0000000c <global_result>:
   c:	ffffffff 	sdc3	$31,-1(ra)

00000010 <continued>:
  10:	0c000026 	jal	98 <main>
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

00000064 <to_lower_case>:
  64:	308200ff 	andi	v0,a0,0xff
  68:	2443ffbf 	addiu	v1,v0,-65
  6c:	2c63001a 	sltiu	v1,v1,26
  70:	10600006 	beqz	v1,8c <to_lower_case+0x28>
  74:	00000000 	nop
  78:	24420020 	addiu	v0,v0,32
  7c:	00021600 	sll	v0,v0,0x18
  80:	00021603 	sra	v0,v0,0x18
  84:	03e00008 	jr	ra
  88:	00000000 	nop
  8c:	00801025 	move	v0,a0
  90:	03e00008 	jr	ra
  94:	00000000 	nop

Disassembly of section .text.startup:

00000098 <main>:
  98:	27bdffe8 	addiu	sp,sp,-24
  9c:	3c060000 	lui	a2,0x0
  a0:	24c60140 	addiu	a2,a2,320
  a4:	afbf0014 	sw	ra,20(sp)
  a8:	240500c0 	li	a1,192
  ac:	00002025 	move	a0,zero
  b0:	2407003f 	li	a3,63
  b4:	10000007 	b	d4 <main+0x3c>
  b8:	00000000 	nop
  bc:	308400ff 	andi	a0,a0,0xff
  c0:	14600014 	bnez	v1,114 <main+0x7c>
  c4:	00000000 	nop
  c8:	00042600 	sll	a0,a0,0x18
  cc:	00042603 	sra	a0,a0,0x18
  d0:	304500ff 	andi	a1,v0,0xff
  d4:	80c20000 	lb	v0,0(a2)
  d8:	24c60001 	addiu	a2,a2,1
  dc:	00442026 	xor	a0,v0,a0
  e0:	2c840001 	sltiu	a0,a0,1
  e4:	0c00000c 	jal	30 <nemu_assert>
  e8:	00000000 	nop
  ec:	24a40041 	addiu	a0,a1,65
  f0:	2ca3001a 	sltiu	v1,a1,26
  f4:	24a20001 	addiu	v0,a1,1
  f8:	14a7fff0 	bne	a1,a3,bc <main+0x24>
  fc:	00000000 	nop
 100:	8fbf0014 	lw	ra,20(sp)
 104:	00001025 	move	v0,zero
 108:	27bd0018 	addiu	sp,sp,24
 10c:	03e00008 	jr	ra
 110:	00000000 	nop
 114:	24a40061 	addiu	a0,a1,97
 118:	308400ff 	andi	a0,a0,0xff
 11c:	1000ffea 	b	c8 <main+0x30>
 120:	00000000 	nop

Disassembly of section .MIPS.abiflags:

00000128 <.MIPS.abiflags>:
 128:	01200000 	0x1200000
 12c:	01000101 	0x1000101
	...
 138:	00000001 	movf	zero,zero,$fcc0
 13c:	00000000 	nop

Disassembly of section .data:

00000140 <ans>:
 140:	03020100 	0x3020100
 144:	07060504 	0x7060504
 148:	0b0a0908 	j	c282420 <ans+0xc2822e0>
 14c:	0f0e0d0c 	jal	c383430 <ans+0xc3832f0>
 150:	13121110 	beq	t8,s2,4594 <ans+0x4454>
 154:	17161514 	bne	t8,s6,55a8 <ans+0x5468>
 158:	1b1a1918 	0x1b1a1918
 15c:	1f1e1d1c 	0x1f1e1d1c
 160:	23222120 	addi	v0,t9,8480
 164:	27262524 	addiu	a2,t9,9508
 168:	2b2a2928 	slti	t2,t9,10536
 16c:	2f2e2d2c 	sltiu	t6,t9,11564
 170:	33323130 	andi	s2,t9,0x3130
 174:	37363534 	ori	s6,t9,0x3534
 178:	3b3a3938 	xori	k0,t9,0x3938
 17c:	3f3e3d3c 	0x3f3e3d3c
 180:	63626140 	0x63626140
 184:	67666564 	0x67666564
 188:	6b6a6968 	0x6b6a6968
 18c:	6f6e6d6c 	0x6f6e6d6c
 190:	73727170 	0x73727170
 194:	77767574 	jalx	dd9d5d0 <ans+0xdd9d490>
 198:	5b7a7978 	0x5b7a7978
 19c:	5f5e5d5c 	0x5f5e5d5c
 1a0:	63626160 	0x63626160
 1a4:	67666564 	0x67666564
 1a8:	6b6a6968 	0x6b6a6968
 1ac:	6f6e6d6c 	0x6f6e6d6c
 1b0:	73727170 	0x73727170
 1b4:	77767574 	jalx	dd9d5d0 <ans+0xdd9d490>
 1b8:	7b7a7978 	0x7b7a7978
 1bc:	7f7e7d7c 	0x7f7e7d7c

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
	...
  78:	0000001d 	0x1d
  7c:	0000001f 	0x1f
  80:	00000098 	0x98
  84:	80000000 	lb	zero,0(zero)
  88:	fffffffc 	sdc3	$31,-4(ra)
	...
  94:	00000018 	mult	zero,zero
  98:	0000001d 	0x1d
  9c:	0000001f 	0x1f

Disassembly of section .gnu.attributes:

00000000 <.gnu.attributes>:
   0:	00000f41 	0xf41
   4:	756e6700 	jalx	5b99c00 <ans+0x5b99ac0>
   8:	00070100 	sll	zero,a3,0x4
   c:	01040000 	0x1040000

Disassembly of section .comment:

00000000 <.comment>:
   0:	3a434347 	xori	v1,s2,0x4347
   4:	4e472820 	c3	0x472820
   8:	36202955 	ori	zero,s1,0x2955
   c:	302e322e 	andi	t6,at,0x322e
	...
