
../mips/elf/shift:     file format elf32-littlemips


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
  64:	3c060000 	lui	a2,0x0
  68:	27bdffe8 	addiu	sp,sp,-24
  6c:	24c601c8 	addiu	a2,a2,456
  70:	3c070000 	lui	a3,0x0
  74:	3c080000 	lui	t0,0x0
  78:	24e701a8 	addiu	a3,a3,424
  7c:	afbf0014 	sw	ra,20(sp)
  80:	250801e8 	addiu	t0,t0,488
  84:	00c02825 	move	a1,a2
  88:	8ca40000 	lw	a0,0(a1)
  8c:	8ce20000 	lw	v0,0(a3)
  90:	000421c2 	srl	a0,a0,0x7
  94:	00822026 	xor	a0,a0,v0
  98:	2c840001 	sltiu	a0,a0,1
  9c:	24a50004 	addiu	a1,a1,4
  a0:	0c00000c 	jal	30 <nemu_assert>
  a4:	00000000 	nop
  a8:	24e70004 	addiu	a3,a3,4
  ac:	14a8fff6 	bne	a1,t0,88 <main+0x24>
  b0:	00000000 	nop
  b4:	3c070000 	lui	a3,0x0
  b8:	24e70168 	addiu	a3,a3,360
  bc:	00c04025 	move	t0,a2
  c0:	24050004 	li	a1,4
  c4:	2409000c 	li	t1,12
  c8:	8d040000 	lw	a0,0(t0)
  cc:	8ce20000 	lw	v0,0(a3)
  d0:	00a42007 	srav	a0,a0,a1
  d4:	00822026 	xor	a0,a0,v0
  d8:	2c840001 	sltiu	a0,a0,1
  dc:	24a50001 	addiu	a1,a1,1
  e0:	0c00000c 	jal	30 <nemu_assert>
  e4:	00000000 	nop
  e8:	25080004 	addiu	t0,t0,4
  ec:	24e70004 	addiu	a3,a3,4
  f0:	14a9fff5 	bne	a1,t1,c8 <main+0x64>
  f4:	00000000 	nop
  f8:	3c070000 	lui	a3,0x0
  fc:	24e70188 	addiu	a3,a3,392
 100:	24050004 	li	a1,4
 104:	2408000c 	li	t0,12
 108:	8cc40000 	lw	a0,0(a2)
 10c:	8ce20000 	lw	v0,0(a3)
 110:	00a42006 	srlv	a0,a0,a1
 114:	00822026 	xor	a0,a0,v0
 118:	2c840001 	sltiu	a0,a0,1
 11c:	24a50001 	addiu	a1,a1,1
 120:	0c00000c 	jal	30 <nemu_assert>
 124:	00000000 	nop
 128:	24c60004 	addiu	a2,a2,4
 12c:	24e70004 	addiu	a3,a3,4
 130:	14a8fff5 	bne	a1,t0,108 <main+0xa4>
 134:	00000000 	nop
 138:	8fbf0014 	lw	ra,20(sp)
 13c:	00001025 	move	v0,zero
 140:	27bd0018 	addiu	sp,sp,24
 144:	03e00008 	jr	ra
 148:	00000000 	nop

Disassembly of section .MIPS.abiflags:

00000150 <.MIPS.abiflags>:
 150:	01200000 	0x1200000
 154:	01000101 	0x1000101
	...
 160:	00000001 	movf	zero,zero,$fcc0
 164:	00000000 	nop

Disassembly of section .data:

00000168 <srav_ans>:
 168:	01234567 	0x1234567
 16c:	fcc3b2a1 	sdc3	$3,-19807(a2)
 170:	00000000 	nop
 174:	ffdff420 	sdc3	$31,-3040(s8)
 178:	007fffff 	0x7fffff
 17c:	ffc00000 	sdc3	$0,0(s8)
 180:	00000000 	nop
 184:	ffffffff 	sdc3	$31,-1(ra)

00000188 <srlv_ans>:
 188:	01234567 	0x1234567
 18c:	04c3b2a1 	bgezl	a2,fffecc14 <test+0xfffeca4c>
 190:	00000000 	nop
 194:	01dff420 	0x1dff420
 198:	007fffff 	0x7fffff
 19c:	00400000 	0x400000
 1a0:	00000000 	nop
 1a4:	001fffff 	0x1fffff

000001a8 <srl_ans>:
 1a8:	002468ac 	0x2468ac
 1ac:	0130eca8 	0x130eca8
 1b0:	00000000 	nop
 1b4:	01dff420 	0x1dff420
 1b8:	00ffffff 	0xffffff
 1bc:	01000000 	0x1000000
 1c0:	00000000 	nop
 1c4:	01ffffff 	0x1ffffff

000001c8 <test>:
 1c8:	12345678 	beq	s1,s4,15bac <test+0x159e4>
 1cc:	98765432 	lwr	s6,21554(v1)
 1d0:	00000000 	nop
 1d4:	effa1000 	swc3	$26,4096(ra)
 1d8:	7fffffff 	0x7fffffff
 1dc:	80000000 	lb	zero,0(zero)
 1e0:	00000033 	tltu	zero,zero
 1e4:	ffffffff 	sdc3	$31,-1(ra)

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
   4:	756e6700 	jalx	5b99c00 <test+0x5b99a38>
   8:	00070100 	sll	zero,a3,0x4
   c:	01040000 	0x1040000

Disassembly of section .comment:

00000000 <.comment>:
   0:	3a434347 	xori	v1,s2,0x4347
   4:	4e472820 	c3	0x472820
   8:	36202955 	ori	zero,s1,0x2955
   c:	302e322e 	andi	t6,at,0x322e
	...
