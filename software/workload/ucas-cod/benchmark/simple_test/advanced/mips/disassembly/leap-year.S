
../mips/elf/leap-year:     file format elf32-littlemips


Disassembly of section .text:

00000000 <start>:
   0:	241d4000 	li	sp,16384
   4:	08000004 	j	10 <continued>
   8:	00000000 	nop

0000000c <global_result>:
   c:	ffffffff 	sdc3	$31,-1(ra)

00000010 <continued>:
  10:	0c000033 	jal	cc <main>
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

00000064 <is_leap_year>:
  64:	28820004 	slti	v0,a0,4
  68:	00801825 	move	v1,a0
  6c:	30850003 	andi	a1,a0,0x3
  70:	00a2180a 	movz	v1,a1,v0
  74:	1460000f 	bnez	v1,b4 <is_leap_year+0x50>
  78:	00000000 	nop
  7c:	28830064 	slti	v1,a0,100
  80:	00801025 	move	v0,a0
  84:	14600005 	bnez	v1,9c <is_leap_year+0x38>
  88:	00000000 	nop
  8c:	2442ff9c 	addiu	v0,v0,-100
  90:	28430064 	slti	v1,v0,100
  94:	1060fffd 	beqz	v1,8c <is_leap_year+0x28>
  98:	00000000 	nop
  9c:	10400005 	beqz	v0,b4 <is_leap_year+0x50>
  a0:	00000000 	nop
  a4:	24020001 	li	v0,1
  a8:	03e00008 	jr	ra
  ac:	00000000 	nop
  b0:	2484fe70 	addiu	a0,a0,-400
  b4:	28820190 	slti	v0,a0,400
  b8:	1040fffd 	beqz	v0,b0 <is_leap_year+0x4c>
  bc:	00000000 	nop
  c0:	2c820001 	sltiu	v0,a0,1
  c4:	03e00008 	jr	ra
  c8:	00000000 	nop

Disassembly of section .text.startup:

000000cc <main>:
  cc:	27bdffe8 	addiu	sp,sp,-24
  d0:	3c060000 	lui	a2,0x0
  d4:	24c601b0 	addiu	a2,a2,432
  d8:	afbf0014 	sw	ra,20(sp)
  dc:	2405075e 	li	a1,1886
  e0:	240707db 	li	a3,2011
  e4:	30a20003 	andi	v0,a1,0x3
  e8:	24a40004 	addiu	a0,a1,4
  ec:	14400017 	bnez	v0,14c <main+0x80>
  f0:	00000000 	nop
  f4:	00801025 	move	v0,a0
  f8:	2442ff9c 	addiu	v0,v0,-100
  fc:	28430064 	slti	v1,v0,100
 100:	1060fffd 	beqz	v1,f8 <main+0x2c>
 104:	00000000 	nop
 108:	10400010 	beqz	v0,14c <main+0x80>
 10c:	00000000 	nop
 110:	8cc20000 	lw	v0,0(a2)
 114:	24040001 	li	a0,1
 118:	00442026 	xor	a0,v0,a0
 11c:	2c840001 	sltiu	a0,a0,1
 120:	24a50001 	addiu	a1,a1,1
 124:	0c00000c 	jal	30 <nemu_assert>
 128:	00000000 	nop
 12c:	24c60004 	addiu	a2,a2,4
 130:	14a7ffec 	bne	a1,a3,e4 <main+0x18>
 134:	00000000 	nop
 138:	8fbf0014 	lw	ra,20(sp)
 13c:	00001025 	move	v0,zero
 140:	27bd0018 	addiu	sp,sp,24
 144:	03e00008 	jr	ra
 148:	00000000 	nop
 14c:	2484fe70 	addiu	a0,a0,-400
 150:	28820190 	slti	v0,a0,400
 154:	1040fffd 	beqz	v0,14c <main+0x80>
 158:	00000000 	nop
 15c:	8cc20000 	lw	v0,0(a2)
 160:	2c840001 	sltiu	a0,a0,1
 164:	00442026 	xor	a0,v0,a0
 168:	2c840001 	sltiu	a0,a0,1
 16c:	24a50001 	addiu	a1,a1,1
 170:	0c00000c 	jal	30 <nemu_assert>
 174:	00000000 	nop
 178:	24c60004 	addiu	a2,a2,4
 17c:	14a7ffd9 	bne	a1,a3,e4 <main+0x18>
 180:	00000000 	nop
 184:	8fbf0014 	lw	ra,20(sp)
 188:	00001025 	move	v0,zero
 18c:	27bd0018 	addiu	sp,sp,24
 190:	03e00008 	jr	ra
 194:	00000000 	nop

Disassembly of section .MIPS.abiflags:

00000198 <.MIPS.abiflags>:
 198:	01200000 	0x1200000
 19c:	01000101 	0x1000101
	...
 1a8:	00000001 	movf	zero,zero,$fcc0
 1ac:	00000000 	nop

Disassembly of section .data:

000001b0 <ans>:
	...
 1b8:	00000001 	movf	zero,zero,$fcc0
	...
 1c8:	00000001 	movf	zero,zero,$fcc0
	...
 1e8:	00000001 	movf	zero,zero,$fcc0
	...
 1f8:	00000001 	movf	zero,zero,$fcc0
	...
 208:	00000001 	movf	zero,zero,$fcc0
	...
 218:	00000001 	movf	zero,zero,$fcc0
	...
 228:	00000001 	movf	zero,zero,$fcc0
	...
 238:	00000001 	movf	zero,zero,$fcc0
	...
 248:	00000001 	movf	zero,zero,$fcc0
	...
 258:	00000001 	movf	zero,zero,$fcc0
	...
 268:	00000001 	movf	zero,zero,$fcc0
	...
 278:	00000001 	movf	zero,zero,$fcc0
	...
 288:	00000001 	movf	zero,zero,$fcc0
	...
 298:	00000001 	movf	zero,zero,$fcc0
	...
 2a8:	00000001 	movf	zero,zero,$fcc0
	...
 2b8:	00000001 	movf	zero,zero,$fcc0
	...
 2c8:	00000001 	movf	zero,zero,$fcc0
	...
 2d8:	00000001 	movf	zero,zero,$fcc0
	...
 2e8:	00000001 	movf	zero,zero,$fcc0
	...
 2f8:	00000001 	movf	zero,zero,$fcc0
	...
 308:	00000001 	movf	zero,zero,$fcc0
	...
 318:	00000001 	movf	zero,zero,$fcc0
	...
 328:	00000001 	movf	zero,zero,$fcc0
	...
 338:	00000001 	movf	zero,zero,$fcc0
	...
 348:	00000001 	movf	zero,zero,$fcc0
	...
 358:	00000001 	movf	zero,zero,$fcc0
	...
 368:	00000001 	movf	zero,zero,$fcc0
	...
 378:	00000001 	movf	zero,zero,$fcc0
	...
 388:	00000001 	movf	zero,zero,$fcc0
	...
 398:	00000001 	movf	zero,zero,$fcc0
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
  80:	000000cc 	syscall	0x3
  84:	80000000 	lb	zero,0(zero)
  88:	fffffffc 	sdc3	$31,-4(ra)
	...
  94:	00000018 	mult	zero,zero
  98:	0000001d 	0x1d
  9c:	0000001f 	0x1f

Disassembly of section .gnu.attributes:

00000000 <.gnu.attributes>:
   0:	00000f41 	0xf41
   4:	756e6700 	jalx	5b99c00 <ans+0x5b99a50>
   8:	00070100 	sll	zero,a3,0x4
   c:	01040000 	0x1040000

Disassembly of section .comment:

00000000 <.comment>:
   0:	3a434347 	xori	v1,s2,0x4347
   4:	4e472820 	c3	0x472820
   8:	36202955 	ori	zero,s1,0x2955
   c:	302e322e 	andi	t6,at,0x322e
	...
