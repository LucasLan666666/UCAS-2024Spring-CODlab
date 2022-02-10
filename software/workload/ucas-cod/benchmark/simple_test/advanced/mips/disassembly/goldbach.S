
../mips/elf/goldbach:     file format elf32-littlemips


Disassembly of section .text:

00000000 <start>:
   0:	241d4000 	li	sp,16384
   4:	08000004 	j	10 <continued>
   8:	00000000 	nop

0000000c <global_result>:
   c:	ffffffff 	sdc3	$31,-1(ra)

00000010 <continued>:
  10:	0c000066 	jal	198 <main>
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

00000064 <is_prime>:
  64:	28820002 	slti	v0,a0,2
  68:	14400015 	bnez	v0,c0 <is_prime+0x5c>
  6c:	00000000 	nop
  70:	24020002 	li	v0,2
  74:	24030002 	li	v1,2
  78:	1082000e 	beq	a0,v0,b4 <is_prime+0x50>
  7c:	00000000 	nop
  80:	0083282a 	slt	a1,a0,v1
  84:	00801025 	move	v0,a0
  88:	14a00007 	bnez	a1,a8 <is_prime+0x44>
  8c:	00000000 	nop
  90:	00431023 	subu	v0,v0,v1
  94:	0043282a 	slt	a1,v0,v1
  98:	10a0fffd 	beqz	a1,90 <is_prime+0x2c>
  9c:	00000000 	nop
  a0:	10400008 	beqz	v0,c4 <is_prime+0x60>
  a4:	00000000 	nop
  a8:	24630001 	addiu	v1,v1,1
  ac:	1483fff4 	bne	a0,v1,80 <is_prime+0x1c>
  b0:	00000000 	nop
  b4:	24020001 	li	v0,1
  b8:	03e00008 	jr	ra
  bc:	00000000 	nop
  c0:	00001025 	move	v0,zero
  c4:	03e00008 	jr	ra
  c8:	00000000 	nop

000000cc <goldbach>:
  cc:	28820003 	slti	v0,a0,3
  d0:	1440002e 	bnez	v0,18c <goldbach+0xc0>
  d4:	00000000 	nop
  d8:	2487fffe 	addiu	a3,a0,-2
  dc:	24060002 	li	a2,2
  e0:	24080002 	li	t0,2
  e4:	24090001 	li	t1,1
  e8:	24030002 	li	v1,2
  ec:	10c8000e 	beq	a2,t0,128 <goldbach+0x5c>
  f0:	00000000 	nop
  f4:	00c3282a 	slt	a1,a2,v1
  f8:	00c01025 	move	v0,a2
  fc:	14a00007 	bnez	a1,11c <goldbach+0x50>
 100:	00000000 	nop
 104:	00431023 	subu	v0,v0,v1
 108:	0043282a 	slt	a1,v0,v1
 10c:	10a0fffd 	beqz	a1,104 <goldbach+0x38>
 110:	00000000 	nop
 114:	10400019 	beqz	v0,17c <goldbach+0xb0>
 118:	00000000 	nop
 11c:	24630001 	addiu	v1,v1,1
 120:	1466fff4 	bne	v1,a2,f4 <goldbach+0x28>
 124:	00000000 	nop
 128:	10e90014 	beq	a3,t1,17c <goldbach+0xb0>
 12c:	00000000 	nop
 130:	10e8000f 	beq	a3,t0,170 <goldbach+0xa4>
 134:	00000000 	nop
 138:	24030002 	li	v1,2
 13c:	00e3282a 	slt	a1,a3,v1
 140:	00e01025 	move	v0,a3
 144:	14a00007 	bnez	a1,164 <goldbach+0x98>
 148:	00000000 	nop
 14c:	00431023 	subu	v0,v0,v1
 150:	0043282a 	slt	a1,v0,v1
 154:	10a0fffd 	beqz	a1,14c <goldbach+0x80>
 158:	00000000 	nop
 15c:	10400007 	beqz	v0,17c <goldbach+0xb0>
 160:	00000000 	nop
 164:	24630001 	addiu	v1,v1,1
 168:	14e3fff4 	bne	a3,v1,13c <goldbach+0x70>
 16c:	00000000 	nop
 170:	24020001 	li	v0,1
 174:	03e00008 	jr	ra
 178:	00000000 	nop
 17c:	24c60001 	addiu	a2,a2,1
 180:	24e7ffff 	addiu	a3,a3,-1
 184:	1486ffd8 	bne	a0,a2,e8 <goldbach+0x1c>
 188:	00000000 	nop
 18c:	00001025 	move	v0,zero
 190:	03e00008 	jr	ra
 194:	00000000 	nop

Disassembly of section .text.startup:

00000198 <main>:
 198:	27bdffe8 	addiu	sp,sp,-24
 19c:	240a0004 	li	t2,4
 1a0:	240b0020 	li	t3,32
 1a4:	afbf0014 	sw	ra,20(sp)
 1a8:	01402025 	move	a0,t2
 1ac:	0c000033 	jal	cc <goldbach>
 1b0:	00000000 	nop
 1b4:	38420001 	xori	v0,v0,0x1
 1b8:	2c440001 	sltiu	a0,v0,1
 1bc:	254a0002 	addiu	t2,t2,2
 1c0:	0c00000c 	jal	30 <nemu_assert>
 1c4:	00000000 	nop
 1c8:	154bfff7 	bne	t2,t3,1a8 <main+0x10>
 1cc:	00000000 	nop
 1d0:	8fbf0014 	lw	ra,20(sp)
 1d4:	00001025 	move	v0,zero
 1d8:	27bd0018 	addiu	sp,sp,24
 1dc:	03e00008 	jr	ra
 1e0:	00000000 	nop

Disassembly of section .MIPS.abiflags:

000001e8 <.MIPS.abiflags>:
 1e8:	01200000 	0x1200000
 1ec:	01000101 	0x1000101
	...
 1f8:	00000001 	movf	zero,zero,$fcc0
 1fc:	00000000 	nop

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
  80:	000000cc 	syscall	0x3
	...
  98:	0000001d 	0x1d
  9c:	0000001f 	0x1f
  a0:	00000198 	0x198
  a4:	80000000 	lb	zero,0(zero)
  a8:	fffffffc 	sdc3	$31,-4(ra)
	...
  b4:	00000018 	mult	zero,zero
  b8:	0000001d 	0x1d
  bc:	0000001f 	0x1f

Disassembly of section .gnu.attributes:

00000000 <.gnu.attributes>:
   0:	00000f41 	0xf41
   4:	756e6700 	jalx	5b99c00 <main+0x5b99a68>
   8:	00070100 	sll	zero,a3,0x4
   c:	01040000 	0x1040000

Disassembly of section .comment:

00000000 <.comment>:
   0:	3a434347 	xori	v1,s2,0x4347
   4:	4e472820 	c3	0x472820
   8:	36202955 	ori	zero,s1,0x2955
   c:	302e322e 	andi	t6,at,0x322e
	...
