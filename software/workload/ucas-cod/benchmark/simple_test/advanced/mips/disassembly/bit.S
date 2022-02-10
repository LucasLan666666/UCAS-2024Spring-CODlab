
../mips/elf/bit:     file format elf32-littlemips


Disassembly of section .text:

00000000 <start>:
   0:	241d4000 	li	sp,16384
   4:	08000004 	j	10 <continued>
   8:	00000000 	nop

0000000c <global_result>:
   c:	ffffffff 	sdc3	$31,-1(ra)

00000010 <continued>:
  10:	0c00003c 	jal	f0 <main>
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

00000064 <getbit>:
  64:	000510c3 	sra	v0,a1,0x3
  68:	00822021 	addu	a0,a0,v0
  6c:	30a50007 	andi	a1,a1,0x7
  70:	90830000 	lbu	v1,0(a0)
  74:	24020001 	li	v0,1
  78:	00a21004 	sllv	v0,v0,a1
  7c:	00431024 	and	v0,v0,v1
  80:	0002102b 	sltu	v0,zero,v0
  84:	03e00008 	jr	ra
  88:	00000000 	nop

0000008c <setbit>:
  8c:	000510c3 	sra	v0,a1,0x3
  90:	27bdfff8 	addiu	sp,sp,-8
  94:	00822021 	addu	a0,a0,v0
  98:	30a20007 	andi	v0,a1,0x7
  9c:	afa40000 	sw	a0,0(sp)
  a0:	24050001 	li	a1,1
  a4:	00452804 	sllv	a1,a1,v0
  a8:	8fa20000 	lw	v0,0(sp)
  ac:	8fa30000 	lw	v1,0(sp)
  b0:	10c00008 	beqz	a2,d4 <setbit+0x48>
  b4:	00000000 	nop
  b8:	90630000 	lbu	v1,0(v1)
  bc:	00a32825 	or	a1,a1,v1
  c0:	30a500ff 	andi	a1,a1,0xff
  c4:	a0450000 	sb	a1,0(v0)
  c8:	27bd0008 	addiu	sp,sp,8
  cc:	03e00008 	jr	ra
  d0:	00000000 	nop
  d4:	90630000 	lbu	v1,0(v1)
  d8:	00052827 	nor	a1,zero,a1
  dc:	00a32824 	and	a1,a1,v1
  e0:	a0450000 	sb	a1,0(v0)
  e4:	27bd0008 	addiu	sp,sp,8
  e8:	03e00008 	jr	ra
  ec:	00000000 	nop

Disassembly of section .text.startup:

000000f0 <main>:
  f0:	27bdffe0 	addiu	sp,sp,-32
  f4:	27a40010 	addiu	a0,sp,16
  f8:	00002825 	move	a1,zero
  fc:	2402ffaa 	li	v0,-86
 100:	afbf001c 	sw	ra,28(sp)
 104:	a3a20010 	sb	v0,16(sp)
 108:	0c000019 	jal	64 <getbit>
 10c:	00000000 	nop
 110:	2c440001 	sltiu	a0,v0,1
 114:	0c00000c 	jal	30 <nemu_assert>
 118:	00000000 	nop
 11c:	27a40010 	addiu	a0,sp,16
 120:	24050001 	li	a1,1
 124:	0c000019 	jal	64 <getbit>
 128:	00000000 	nop
 12c:	38420001 	xori	v0,v0,0x1
 130:	2c440001 	sltiu	a0,v0,1
 134:	0c00000c 	jal	30 <nemu_assert>
 138:	00000000 	nop
 13c:	27a40010 	addiu	a0,sp,16
 140:	24050002 	li	a1,2
 144:	0c000019 	jal	64 <getbit>
 148:	00000000 	nop
 14c:	2c440001 	sltiu	a0,v0,1
 150:	0c00000c 	jal	30 <nemu_assert>
 154:	00000000 	nop
 158:	27a40010 	addiu	a0,sp,16
 15c:	24050003 	li	a1,3
 160:	0c000019 	jal	64 <getbit>
 164:	00000000 	nop
 168:	38420001 	xori	v0,v0,0x1
 16c:	2c440001 	sltiu	a0,v0,1
 170:	0c00000c 	jal	30 <nemu_assert>
 174:	00000000 	nop
 178:	27a40010 	addiu	a0,sp,16
 17c:	24050004 	li	a1,4
 180:	0c000019 	jal	64 <getbit>
 184:	00000000 	nop
 188:	2c440001 	sltiu	a0,v0,1
 18c:	0c00000c 	jal	30 <nemu_assert>
 190:	00000000 	nop
 194:	27a40010 	addiu	a0,sp,16
 198:	24050005 	li	a1,5
 19c:	0c000019 	jal	64 <getbit>
 1a0:	00000000 	nop
 1a4:	38420001 	xori	v0,v0,0x1
 1a8:	2c440001 	sltiu	a0,v0,1
 1ac:	0c00000c 	jal	30 <nemu_assert>
 1b0:	00000000 	nop
 1b4:	27a40010 	addiu	a0,sp,16
 1b8:	24050006 	li	a1,6
 1bc:	0c000019 	jal	64 <getbit>
 1c0:	00000000 	nop
 1c4:	2c440001 	sltiu	a0,v0,1
 1c8:	0c00000c 	jal	30 <nemu_assert>
 1cc:	00000000 	nop
 1d0:	27a40010 	addiu	a0,sp,16
 1d4:	24050007 	li	a1,7
 1d8:	0c000019 	jal	64 <getbit>
 1dc:	00000000 	nop
 1e0:	38420001 	xori	v0,v0,0x1
 1e4:	2c440001 	sltiu	a0,v0,1
 1e8:	0c00000c 	jal	30 <nemu_assert>
 1ec:	00000000 	nop
 1f0:	27a40010 	addiu	a0,sp,16
 1f4:	24060001 	li	a2,1
 1f8:	24050008 	li	a1,8
 1fc:	0c000023 	jal	8c <setbit>
 200:	00000000 	nop
 204:	27a40010 	addiu	a0,sp,16
 208:	00003025 	move	a2,zero
 20c:	24050009 	li	a1,9
 210:	0c000023 	jal	8c <setbit>
 214:	00000000 	nop
 218:	27a40010 	addiu	a0,sp,16
 21c:	24060001 	li	a2,1
 220:	2405000a 	li	a1,10
 224:	0c000023 	jal	8c <setbit>
 228:	00000000 	nop
 22c:	27a40010 	addiu	a0,sp,16
 230:	00003025 	move	a2,zero
 234:	2405000b 	li	a1,11
 238:	0c000023 	jal	8c <setbit>
 23c:	00000000 	nop
 240:	27a40010 	addiu	a0,sp,16
 244:	24060001 	li	a2,1
 248:	2405000c 	li	a1,12
 24c:	0c000023 	jal	8c <setbit>
 250:	00000000 	nop
 254:	27a40010 	addiu	a0,sp,16
 258:	00003025 	move	a2,zero
 25c:	2405000d 	li	a1,13
 260:	0c000023 	jal	8c <setbit>
 264:	00000000 	nop
 268:	27a40010 	addiu	a0,sp,16
 26c:	24060001 	li	a2,1
 270:	2405000e 	li	a1,14
 274:	0c000023 	jal	8c <setbit>
 278:	00000000 	nop
 27c:	27a40010 	addiu	a0,sp,16
 280:	00003025 	move	a2,zero
 284:	2405000f 	li	a1,15
 288:	0c000023 	jal	8c <setbit>
 28c:	00000000 	nop
 290:	93a40011 	lbu	a0,17(sp)
 294:	38840055 	xori	a0,a0,0x55
 298:	2c840001 	sltiu	a0,a0,1
 29c:	0c00000c 	jal	30 <nemu_assert>
 2a0:	00000000 	nop
 2a4:	8fbf001c 	lw	ra,28(sp)
 2a8:	00001025 	move	v0,zero
 2ac:	27bd0020 	addiu	sp,sp,32
 2b0:	03e00008 	jr	ra
 2b4:	00000000 	nop

Disassembly of section .MIPS.abiflags:

000002b8 <.MIPS.abiflags>:
 2b8:	01200000 	0x1200000
 2bc:	01000101 	0x1000101
	...
 2c8:	00000001 	movf	zero,zero,$fcc0
 2cc:	00000000 	nop

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
  80:	0000008c 	syscall	0x2
	...
  94:	00000008 	jr	zero
  98:	0000001d 	0x1d
  9c:	0000001f 	0x1f
  a0:	000000f0 	tge	zero,zero,0x3
  a4:	80000000 	lb	zero,0(zero)
  a8:	fffffffc 	sdc3	$31,-4(ra)
	...
  b4:	00000020 	add	zero,zero,zero
  b8:	0000001d 	0x1d
  bc:	0000001f 	0x1f

Disassembly of section .gnu.attributes:

00000000 <.gnu.attributes>:
   0:	00000f41 	0xf41
   4:	756e6700 	jalx	5b99c00 <main+0x5b99b10>
   8:	00070100 	sll	zero,a3,0x4
   c:	01040000 	0x1040000

Disassembly of section .comment:

00000000 <.comment>:
   0:	3a434347 	xori	v1,s2,0x4347
   4:	4e472820 	c3	0x472820
   8:	36202955 	ori	zero,s1,0x2955
   c:	302e322e 	andi	t6,at,0x322e
	...
