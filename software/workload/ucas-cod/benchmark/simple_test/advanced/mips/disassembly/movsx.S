
../mips/elf/movsx:     file format elf32-littlemips


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
  68:	24c501d0 	addiu	a1,a2,464
  6c:	27bdffe8 	addiu	sp,sp,-24
  70:	24030001 	li	v1,1
  74:	3c090000 	lui	t1,0x0
  78:	24020003 	li	v0,3
  7c:	afbf0014 	sw	ra,20(sp)
  80:	aca30004 	sw	v1,4(a1)
  84:	24030002 	li	v1,2
  88:	3c070000 	lui	a3,0x0
  8c:	aca30008 	sw	v1,8(a1)
  90:	aca2000c 	sw	v0,12(a1)
  94:	24030004 	li	v1,4
  98:	ad220204 	sw	v0,516(t1)
  9c:	aca20014 	sw	v0,20(a1)
  a0:	24040001 	li	a0,1
  a4:	24020061 	li	v0,97
  a8:	a0e201f8 	sb	v0,504(a3)
  ac:	aca30010 	sw	v1,16(a1)
  b0:	acc001d0 	sw	zero,464(a2)
  b4:	0c00000c 	jal	30 <nemu_assert>
  b8:	00000000 	nop
  bc:	80e201f8 	lb	v0,504(a3)
  c0:	24e801f8 	addiu	t0,a3,504
  c4:	38440061 	xori	a0,v0,0x61
  c8:	2c840001 	sltiu	a0,a0,1
  cc:	a1020001 	sb	v0,1(t0)
  d0:	0c00000c 	jal	30 <nemu_assert>
  d4:	00000000 	nop
  d8:	80e201f8 	lb	v0,504(a3)
  dc:	38440061 	xori	a0,v0,0x61
  e0:	2c840001 	sltiu	a0,a0,1
  e4:	acc201d0 	sw	v0,464(a2)
  e8:	0c00000c 	jal	30 <nemu_assert>
  ec:	00000000 	nop
  f0:	8ca40004 	lw	a0,4(a1)
  f4:	2402ff80 	li	v0,-128
  f8:	38840001 	xori	a0,a0,0x1
  fc:	a1020001 	sb	v0,1(t0)
 100:	2c840001 	sltiu	a0,a0,1
 104:	2402ff80 	li	v0,-128
 108:	acc201d0 	sw	v0,464(a2)
 10c:	0c00000c 	jal	30 <nemu_assert>
 110:	00000000 	nop
 114:	8ca40008 	lw	a0,8(a1)
 118:	38840002 	xori	a0,a0,0x2
 11c:	2c840001 	sltiu	a0,a0,1
 120:	0c00000c 	jal	30 <nemu_assert>
 124:	00000000 	nop
 128:	8ca4000c 	lw	a0,12(a1)
 12c:	38840003 	xori	a0,a0,0x3
 130:	2c840001 	sltiu	a0,a0,1
 134:	0c00000c 	jal	30 <nemu_assert>
 138:	00000000 	nop
 13c:	8ca40010 	lw	a0,16(a1)
 140:	38840004 	xori	a0,a0,0x4
 144:	2c840001 	sltiu	a0,a0,1
 148:	0c00000c 	jal	30 <nemu_assert>
 14c:	00000000 	nop
 150:	8d240204 	lw	a0,516(t1)
 154:	38840003 	xori	a0,a0,0x3
 158:	2c840001 	sltiu	a0,a0,1
 15c:	0c00000c 	jal	30 <nemu_assert>
 160:	00000000 	nop
 164:	8ca40014 	lw	a0,20(a1)
 168:	38840003 	xori	a0,a0,0x3
 16c:	2c840001 	sltiu	a0,a0,1
 170:	0c00000c 	jal	30 <nemu_assert>
 174:	00000000 	nop
 178:	81040001 	lb	a0,1(t0)
 17c:	24840080 	addiu	a0,a0,128
 180:	2c840001 	sltiu	a0,a0,1
 184:	0c00000c 	jal	30 <nemu_assert>
 188:	00000000 	nop
 18c:	8cc401d0 	lw	a0,464(a2)
 190:	24840080 	addiu	a0,a0,128
 194:	2c840001 	sltiu	a0,a0,1
 198:	0c00000c 	jal	30 <nemu_assert>
 19c:	00000000 	nop
 1a0:	8fbf0014 	lw	ra,20(sp)
 1a4:	00001025 	move	v0,zero
 1a8:	27bd0018 	addiu	sp,sp,24
 1ac:	03e00008 	jr	ra
 1b0:	00000000 	nop

Disassembly of section .MIPS.abiflags:

000001b8 <.MIPS.abiflags>:
 1b8:	01200000 	0x1200000
 1bc:	01000101 	0x1000101
	...
 1c8:	00000001 	movf	zero,zero,$fcc0
 1cc:	00000000 	nop

Disassembly of section .bss:

000001d0 <A>:
	...

000001f8 <C>:
	...

Disassembly of section .scommon:

00000204 <b>:
 204:	00000000 	nop

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
   4:	756e6700 	jalx	5b99c00 <b+0x5b999fc>
   8:	00070100 	sll	zero,a3,0x4
   c:	01040000 	0x1040000

Disassembly of section .comment:

00000000 <.comment>:
   0:	3a434347 	xori	v1,s2,0x4347
   4:	4e472820 	c3	0x472820
   8:	36202955 	ori	zero,s1,0x2955
   c:	302e322e 	andi	t6,at,0x322e
	...
