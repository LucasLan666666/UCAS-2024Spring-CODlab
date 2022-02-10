
../mips/elf/fact:     file format elf32-littlemips


Disassembly of section .text:

00000000 <start>:
   0:	241d4000 	li	sp,16384
   4:	08000004 	j	10 <continued>
   8:	00000000 	nop

0000000c <global_result>:
   c:	ffffffff 	sdc3	$31,-1(ra)

00000010 <continued>:
  10:	0c000046 	jal	118 <main>
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

00000064 <fact>:
  64:	2c820002 	sltiu	v0,a0,2
  68:	14400003 	bnez	v0,78 <fact+0x14>
  6c:	00000000 	nop
  70:	08000021 	j	84 <fact.part.0>
  74:	00000000 	nop
  78:	24020001 	li	v0,1
  7c:	03e00008 	jr	ra
  80:	00000000 	nop

00000084 <fact.part.0>:
  84:	27bdffe8 	addiu	sp,sp,-24
  88:	afb00010 	sw	s0,16(sp)
  8c:	00808025 	move	s0,a0
  90:	2484ffff 	addiu	a0,a0,-1
  94:	afbf0014 	sw	ra,20(sp)
  98:	0c000019 	jal	64 <fact>
  9c:	00000000 	nop
  a0:	0010482a 	slt	t1,zero,s0
  a4:	00101823 	negu	v1,s0
  a8:	2a050000 	slti	a1,s0,0
  ac:	2404ffff 	li	a0,-1
  b0:	24060001 	li	a2,1
  b4:	0065800b 	movn	s0,v1,a1
  b8:	00c9200b 	movn	a0,a2,t1
  bc:	00804825 	move	t1,a0
  c0:	02002825 	move	a1,s0
  c4:	00003825 	move	a3,zero
  c8:	00001825 	move	v1,zero
  cc:	24080020 	li	t0,32
  d0:	30a40001 	andi	a0,a1,0x1
  d4:	00623004 	sllv	a2,v0,v1
  d8:	24630001 	addiu	v1,v1,1
  dc:	10800002 	beqz	a0,e8 <fact.part.0+0x64>
  e0:	00000000 	nop
  e4:	00e63821 	addu	a3,a3,a2
  e8:	00052843 	sra	a1,a1,0x1
  ec:	1468fff8 	bne	v1,t0,d0 <fact.part.0+0x4c>
  f0:	00000000 	nop
  f4:	39220001 	xori	v0,t1,0x1
  f8:	8fbf0014 	lw	ra,20(sp)
  fc:	00071823 	negu	v1,a3
 100:	0062380b 	movn	a3,v1,v0
 104:	8fb00010 	lw	s0,16(sp)
 108:	00e01025 	move	v0,a3
 10c:	27bd0018 	addiu	sp,sp,24
 110:	03e00008 	jr	ra
 114:	00000000 	nop

Disassembly of section .text.startup:

00000118 <main>:
 118:	27bdffd8 	addiu	sp,sp,-40
 11c:	afb10014 	sw	s1,20(sp)
 120:	3c110000 	lui	s1,0x0
 124:	26310210 	addiu	s1,s1,528
 128:	8e240000 	lw	a0,0(s1)
 12c:	24020001 	li	v0,1
 130:	afb20018 	sw	s2,24(sp)
 134:	afb00010 	sw	s0,16(sp)
 138:	00822026 	xor	a0,a0,v0
 13c:	3c120000 	lui	s2,0x0
 140:	00008025 	move	s0,zero
 144:	afb3001c 	sw	s3,28(sp)
 148:	2c840001 	sltiu	a0,a0,1
 14c:	26520244 	addiu	s2,s2,580
 150:	26100001 	addiu	s0,s0,1
 154:	2413000d 	li	s3,13
 158:	afb40020 	sw	s4,32(sp)
 15c:	afbf0024 	sw	ra,36(sp)
 160:	ae420000 	sw	v0,0(s2)
 164:	24140001 	li	s4,1
 168:	0c00000c 	jal	30 <nemu_assert>
 16c:	00000000 	nop
 170:	02002025 	move	a0,s0
 174:	12130011 	beq	s0,s3,1bc <main+0xa4>
 178:	00000000 	nop
 17c:	12140019 	beq	s0,s4,1e4 <main+0xcc>
 180:	00000000 	nop
 184:	0c000021 	jal	84 <fact.part.0>
 188:	00000000 	nop
 18c:	26520004 	addiu	s2,s2,4
 190:	26310004 	addiu	s1,s1,4
 194:	8e240000 	lw	a0,0(s1)
 198:	26100001 	addiu	s0,s0,1
 19c:	00822026 	xor	a0,a0,v0
 1a0:	2c840001 	sltiu	a0,a0,1
 1a4:	ae420000 	sw	v0,0(s2)
 1a8:	0c00000c 	jal	30 <nemu_assert>
 1ac:	00000000 	nop
 1b0:	02002025 	move	a0,s0
 1b4:	1613fff1 	bne	s0,s3,17c <main+0x64>
 1b8:	00000000 	nop
 1bc:	8fbf0024 	lw	ra,36(sp)
 1c0:	8fb40020 	lw	s4,32(sp)
 1c4:	8fb3001c 	lw	s3,28(sp)
 1c8:	8fb20018 	lw	s2,24(sp)
 1cc:	8fb10014 	lw	s1,20(sp)
 1d0:	8fb00010 	lw	s0,16(sp)
 1d4:	00001025 	move	v0,zero
 1d8:	27bd0028 	addiu	sp,sp,40
 1dc:	03e00008 	jr	ra
 1e0:	00000000 	nop
 1e4:	24020001 	li	v0,1
 1e8:	26520004 	addiu	s2,s2,4
 1ec:	26310004 	addiu	s1,s1,4
 1f0:	1000ffe8 	b	194 <main+0x7c>
 1f4:	00000000 	nop

Disassembly of section .MIPS.abiflags:

000001f8 <.MIPS.abiflags>:
 1f8:	01200000 	0x1200000
 1fc:	01000101 	0x1000101
	...
 208:	00000001 	movf	zero,zero,$fcc0
 20c:	00000000 	nop

Disassembly of section .data:

00000210 <ans>:
 210:	00000001 	movf	zero,zero,$fcc0
 214:	00000001 	movf	zero,zero,$fcc0
 218:	00000002 	srl	zero,zero,0x0
 21c:	00000006 	srlv	zero,zero,zero
 220:	00000018 	mult	zero,zero
 224:	00000078 	0x78
 228:	000002d0 	0x2d0
 22c:	000013b0 	tge	zero,zero,0x4e
 230:	00009d80 	sll	s3,zero,0x16
 234:	00058980 	sll	s1,a1,0x6
 238:	00375f00 	0x375f00
 23c:	02611500 	0x2611500
 240:	1c8cfc00 	0x1c8cfc00

Disassembly of section .bss:

00000244 <f>:
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
	...
  78:	0000001d 	0x1d
  7c:	0000001f 	0x1f
  80:	00000084 	0x84
  84:	80010000 	lb	at,0(zero)
  88:	fffffffc 	sdc3	$31,-4(ra)
	...
  94:	00000018 	mult	zero,zero
  98:	0000001d 	0x1d
  9c:	0000001f 	0x1f
  a0:	00000118 	0x118
  a4:	801f0000 	lb	ra,0(zero)
  a8:	fffffffc 	sdc3	$31,-4(ra)
	...
  b4:	00000028 	0x28
  b8:	0000001d 	0x1d
  bc:	0000001f 	0x1f

Disassembly of section .gnu.attributes:

00000000 <.gnu.attributes>:
   0:	00000f41 	0xf41
   4:	756e6700 	jalx	5b99c00 <f+0x5b999bc>
   8:	00070100 	sll	zero,a3,0x4
   c:	01040000 	0x1040000

Disassembly of section .comment:

00000000 <.comment>:
   0:	3a434347 	xori	v1,s2,0x4347
   4:	4e472820 	c3	0x472820
   8:	36202955 	ori	zero,s1,0x2955
   c:	302e322e 	andi	t6,at,0x322e
	...
