
../mips/elf/unalign:     file format elf32-littlemips


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
  68:	3c020000 	lui	v0,0x0
  6c:	3c03aabb 	lui	v1,0xaabb
  70:	244200e4 	addiu	v0,v0,228
  74:	afbf0014 	sw	ra,20(sp)
  78:	3463ccdd 	ori	v1,v1,0xccdd
  7c:	a8430006 	swl	v1,6(v0)
  80:	b8430003 	swr	v1,3(v0)
  84:	88430006 	lwl	v1,6(v0)
  88:	3c045544 	lui	a0,0x5544
  8c:	98430003 	lwr	v1,3(v0)
  90:	24843323 	addiu	a0,a0,13091
  94:	00642021 	addu	a0,v1,a0
  98:	00601025 	move	v0,v1
  9c:	2c840001 	sltiu	a0,a0,1
  a0:	3c030000 	lui	v1,0x0
  a4:	ac6200e0 	sw	v0,224(v1)
  a8:	0c00000c 	jal	30 <nemu_assert>
  ac:	00000000 	nop
  b0:	8fbf0014 	lw	ra,20(sp)
  b4:	00001025 	move	v0,zero
  b8:	27bd0018 	addiu	sp,sp,24
  bc:	03e00008 	jr	ra
  c0:	00000000 	nop

Disassembly of section .MIPS.abiflags:

000000c8 <.MIPS.abiflags>:
  c8:	01200000 	0x1200000
  cc:	01000101 	0x1000101
	...
  d8:	00000001 	movf	zero,zero,$fcc0
  dc:	00000000 	nop

Disassembly of section .data:

000000e0 <x>:
  e0:	ffffffff 	sdc3	$31,-1(ra)

Disassembly of section .bss:

000000e4 <buf>:
	...

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
   4:	756e6700 	jalx	5b99c00 <buf+0x5b99b1c>
   8:	00070100 	sll	zero,a3,0x4
   c:	01040000 	0x1040000

Disassembly of section .comment:

00000000 <.comment>:
   0:	3a434347 	xori	v1,s2,0x4347
   4:	4e472820 	c3	0x472820
   8:	36202955 	ori	zero,s1,0x2955
   c:	302e322e 	andi	t6,at,0x322e
	...
