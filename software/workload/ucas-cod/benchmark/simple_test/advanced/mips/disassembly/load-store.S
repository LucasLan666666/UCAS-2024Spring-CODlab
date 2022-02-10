
../mips/elf/load-store:     file format elf32-littlemips


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
  64:	3c070000 	lui	a3,0x0
  68:	27bdffe8 	addiu	sp,sp,-24
  6c:	24e70210 	addiu	a3,a3,528
  70:	3c060000 	lui	a2,0x0
  74:	3c080000 	lui	t0,0x0
  78:	24c601f0 	addiu	a2,a2,496
  7c:	afbf0014 	sw	ra,20(sp)
  80:	25080220 	addiu	t0,t0,544
  84:	00e02825 	move	a1,a3
  88:	84a40000 	lh	a0,0(a1)
  8c:	8cc20000 	lw	v0,0(a2)
  90:	24a50002 	addiu	a1,a1,2
  94:	00822026 	xor	a0,a0,v0
  98:	2c840001 	sltiu	a0,a0,1
  9c:	0c00000c 	jal	30 <nemu_assert>
  a0:	00000000 	nop
  a4:	24c60004 	addiu	a2,a2,4
  a8:	1505fff7 	bne	t0,a1,88 <main+0x24>
  ac:	00000000 	nop
  b0:	3c080000 	lui	t0,0x0
  b4:	250801d0 	addiu	t0,t0,464
  b8:	00e03025 	move	a2,a3
  bc:	94c40000 	lhu	a0,0(a2)
  c0:	8d020000 	lw	v0,0(t0)
  c4:	24c60002 	addiu	a2,a2,2
  c8:	00822026 	xor	a0,a0,v0
  cc:	2c840001 	sltiu	a0,a0,1
  d0:	0c00000c 	jal	30 <nemu_assert>
  d4:	00000000 	nop
  d8:	25080004 	addiu	t0,t0,4
  dc:	14c5fff7 	bne	a2,a1,bc <main+0x58>
  e0:	00000000 	nop
  e4:	3c050000 	lui	a1,0x0
  e8:	3c060000 	lui	a2,0x0
  ec:	3c080000 	lui	t0,0x0
  f0:	24a50211 	addiu	a1,a1,529
  f4:	24c601a0 	addiu	a2,a2,416
  f8:	250801b0 	addiu	t0,t0,432
  fc:	88a40003 	lwl	a0,3(a1)
 100:	8cc20000 	lw	v0,0(a2)
 104:	98a40000 	lwr	a0,0(a1)
 108:	24c60004 	addiu	a2,a2,4
 10c:	00822026 	xor	a0,a0,v0
 110:	2c840001 	sltiu	a0,a0,1
 114:	0c00000c 	jal	30 <nemu_assert>
 118:	00000000 	nop
 11c:	24a50004 	addiu	a1,a1,4
 120:	1506fff6 	bne	t0,a2,fc <main+0x98>
 124:	00000000 	nop
 128:	3c060000 	lui	a2,0x0
 12c:	24c601b0 	addiu	a2,a2,432
 130:	24050001 	li	a1,1
 134:	24090001 	li	t1,1
 138:	24080011 	li	t0,17
 13c:	00a91004 	sllv	v0,t1,a1
 140:	8cc40000 	lw	a0,0(a2)
 144:	00021027 	nor	v0,zero,v0
 148:	3042ffff 	andi	v0,v0,0xffff
 14c:	00822026 	xor	a0,a0,v0
 150:	a4e20000 	sh	v0,0(a3)
 154:	2c840001 	sltiu	a0,a0,1
 158:	24a50002 	addiu	a1,a1,2
 15c:	24c60004 	addiu	a2,a2,4
 160:	0c00000c 	jal	30 <nemu_assert>
 164:	00000000 	nop
 168:	24e70002 	addiu	a3,a3,2
 16c:	14a8fff3 	bne	a1,t0,13c <main+0xd8>
 170:	00000000 	nop
 174:	8fbf0014 	lw	ra,20(sp)
 178:	00001025 	move	v0,zero
 17c:	27bd0018 	addiu	sp,sp,24
 180:	03e00008 	jr	ra
 184:	00000000 	nop

Disassembly of section .MIPS.abiflags:

00000188 <.MIPS.abiflags>:
 188:	01200000 	0x1200000
 18c:	01000101 	0x1000101
	...
 198:	00000001 	movf	zero,zero,$fcc0
 19c:	00000000 	nop

Disassembly of section .data:

000001a0 <lwlr_ans>:
 1a0:	bc025800 	cache	0x2,22528(zero)
 1a4:	007fff4a 	0x7fff4a
 1a8:	cd810080 	pref	0x1,128(t4)
 1ac:	00ffffab 	0xffffab

000001b0 <sh_ans>:
 1b0:	0000fffd 	0xfffd
 1b4:	0000fff7 	0xfff7
 1b8:	0000ffdf 	0xffdf
 1bc:	0000ff7f 	0xff7f
 1c0:	0000fdff 	0xfdff
 1c4:	0000f7ff 	0xf7ff
 1c8:	0000dfff 	0xdfff
 1cc:	00007fff 	0x7fff

000001d0 <lhu_ans>:
 1d0:	00000000 	nop
 1d4:	00000258 	0x258
 1d8:	00004abc 	0x4abc
 1dc:	00007fff 	0x7fff
 1e0:	00008000 	sll	s0,zero,0x0
 1e4:	00008100 	sll	s0,zero,0x4
 1e8:	0000abcd 	break	0x0,0x2af
 1ec:	0000ffff 	0xffff

000001f0 <lh_ans>:
 1f0:	00000000 	nop
 1f4:	00000258 	0x258
 1f8:	00004abc 	0x4abc
 1fc:	00007fff 	0x7fff
 200:	ffff8000 	sdc3	$31,-32768(ra)
 204:	ffff8100 	sdc3	$31,-32512(ra)
 208:	ffffabcd 	sdc3	$31,-21555(ra)
 20c:	ffffffff 	sdc3	$31,-1(ra)

00000210 <mem>:
 210:	02580000 	0x2580000
 214:	7fff4abc 	0x7fff4abc
 218:	81008000 	lb	zero,-32768(t0)
 21c:	ffffabcd 	sdc3	$31,-21555(ra)
 220:	00000000 	nop

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
   4:	756e6700 	jalx	5b99c00 <mem+0x5b999f0>
   8:	00070100 	sll	zero,a3,0x4
   c:	01040000 	0x1040000

Disassembly of section .comment:

00000000 <.comment>:
   0:	3a434347 	xori	v1,s2,0x4347
   4:	4e472820 	c3	0x472820
   8:	36202955 	ori	zero,s1,0x2955
   c:	302e322e 	andi	t6,at,0x322e
	...
