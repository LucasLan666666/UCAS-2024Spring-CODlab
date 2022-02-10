
../mips/elf/shuixianhua:     file format elf32-littlemips


Disassembly of section .text:

00000000 <start>:
   0:	241d4000 	li	sp,16384
   4:	08000004 	j	10 <continued>
   8:	00000000 	nop

0000000c <global_result>:
   c:	ffffffff 	sdc3	$31,-1(ra)

00000010 <continued>:
  10:	0c000043 	jal	10c <main>
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

00000064 <cube>:
  64:	28850000 	slti	a1,a0,0
  68:	00041023 	negu	v0,a0
  6c:	0085100a 	movz	v0,a0,a1
  70:	0004502a 	slt	t2,zero,a0
  74:	00402825 	move	a1,v0
  78:	24030001 	li	v1,1
  7c:	2402ffff 	li	v0,-1
  80:	006a100b 	movn	v0,v1,t2
  84:	00405025 	move	t2,v0
  88:	00a03025 	move	a2,a1
  8c:	00003825 	move	a3,zero
  90:	00001025 	move	v0,zero
  94:	24090020 	li	t1,32
  98:	30c30001 	andi	v1,a2,0x1
  9c:	00444004 	sllv	t0,a0,v0
  a0:	24420001 	addiu	v0,v0,1
  a4:	10600002 	beqz	v1,b0 <cube+0x4c>
  a8:	00000000 	nop
  ac:	00e83821 	addu	a3,a3,t0
  b0:	00063043 	sra	a2,a2,0x1
  b4:	1449fff8 	bne	v0,t1,98 <cube+0x34>
  b8:	00000000 	nop
  bc:	00071023 	negu	v0,a3
  c0:	39430001 	xori	v1,t2,0x1
  c4:	0043380b 	movn	a3,v0,v1
  c8:	00004025 	move	t0,zero
  cc:	00001825 	move	v1,zero
  d0:	24020020 	li	v0,32
  d4:	30a40001 	andi	a0,a1,0x1
  d8:	00673004 	sllv	a2,a3,v1
  dc:	24630001 	addiu	v1,v1,1
  e0:	10800002 	beqz	a0,ec <cube+0x88>
  e4:	00000000 	nop
  e8:	01064021 	addu	t0,t0,a2
  ec:	00052843 	sra	a1,a1,0x1
  f0:	1462fff8 	bne	v1,v0,d4 <cube+0x70>
  f4:	00000000 	nop
  f8:	00081023 	negu	v0,t0
  fc:	394a0001 	xori	t2,t2,0x1
 100:	010a100a 	movz	v0,t0,t2
 104:	03e00008 	jr	ra
 108:	00000000 	nop

Disassembly of section .text.startup:

0000010c <main>:
 10c:	27bdffe8 	addiu	sp,sp,-24
 110:	3c190000 	lui	t9,0x0
 114:	0000c025 	move	t8,zero
 118:	afbf0014 	sw	ra,20(sp)
 11c:	240d0064 	li	t5,100
 120:	27390238 	addiu	t9,t9,568
 124:	240f01f4 	li	t7,500
 128:	01a01025 	move	v0,t5
 12c:	00002025 	move	a0,zero
 130:	2442ff9c 	addiu	v0,v0,-100
 134:	28430064 	slti	v1,v0,100
 138:	24840001 	addiu	a0,a0,1
 13c:	1060fffc 	beqz	v1,130 <main+0x24>
 140:	00000000 	nop
 144:	01a01025 	move	v0,t5
 148:	00005825 	move	t3,zero
 14c:	2442fff6 	addiu	v0,v0,-10
 150:	2843000a 	slti	v1,v0,10
 154:	256b0001 	addiu	t3,t3,1
 158:	1060fffc 	beqz	v1,14c <main+0x40>
 15c:	00000000 	nop
 160:	2962000a 	slti	v0,t3,10
 164:	14400005 	bnez	v0,17c <main+0x70>
 168:	00000000 	nop
 16c:	256bfff6 	addiu	t3,t3,-10
 170:	2962000a 	slti	v0,t3,10
 174:	1040fffd 	beqz	v0,16c <main+0x60>
 178:	00000000 	nop
 17c:	01a06025 	move	t4,t5
 180:	258cfff6 	addiu	t4,t4,-10
 184:	2982000a 	slti	v0,t4,10
 188:	1040fffd 	beqz	v0,180 <main+0x74>
 18c:	00000000 	nop
 190:	0c000019 	jal	64 <cube>
 194:	00000000 	nop
 198:	01602025 	move	a0,t3
 19c:	00407025 	move	t6,v0
 1a0:	0c000019 	jal	64 <cube>
 1a4:	00000000 	nop
 1a8:	01802025 	move	a0,t4
 1ac:	01c27021 	addu	t6,t6,v0
 1b0:	0c000019 	jal	64 <cube>
 1b4:	00000000 	nop
 1b8:	01c21021 	addu	v0,t6,v0
 1bc:	104d000d 	beq	v0,t5,1f4 <main+0xe8>
 1c0:	00000000 	nop
 1c4:	25ad0001 	addiu	t5,t5,1
 1c8:	15afffd7 	bne	t5,t7,128 <main+0x1c>
 1cc:	00000000 	nop
 1d0:	3b040004 	xori	a0,t8,0x4
 1d4:	2c840001 	sltiu	a0,a0,1
 1d8:	0c00000c 	jal	30 <nemu_assert>
 1dc:	00000000 	nop
 1e0:	8fbf0014 	lw	ra,20(sp)
 1e4:	00001025 	move	v0,zero
 1e8:	27bd0018 	addiu	sp,sp,24
 1ec:	03e00008 	jr	ra
 1f0:	00000000 	nop
 1f4:	00181080 	sll	v0,t8,0x2
 1f8:	00591021 	addu	v0,v0,t9
 1fc:	8c440000 	lw	a0,0(v0)
 200:	27180001 	addiu	t8,t8,1
 204:	008d2026 	xor	a0,a0,t5
 208:	2c840001 	sltiu	a0,a0,1
 20c:	0c00000c 	jal	30 <nemu_assert>
 210:	00000000 	nop
 214:	1000ffeb 	b	1c4 <main+0xb8>
 218:	00000000 	nop

Disassembly of section .MIPS.abiflags:

00000220 <.MIPS.abiflags>:
 220:	01200000 	0x1200000
 224:	01000101 	0x1000101
	...
 230:	00000001 	movf	zero,zero,$fcc0
 234:	00000000 	nop

Disassembly of section .data:

00000238 <ans>:
 238:	00000099 	0x99
 23c:	00000172 	tlt	zero,zero,0x5
 240:	00000173 	tltu	zero,zero,0x5
 244:	00000197 	0x197

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
  80:	0000010c 	syscall	0x4
  84:	80000000 	lb	zero,0(zero)
  88:	fffffffc 	sdc3	$31,-4(ra)
	...
  94:	00000018 	mult	zero,zero
  98:	0000001d 	0x1d
  9c:	0000001f 	0x1f

Disassembly of section .gnu.attributes:

00000000 <.gnu.attributes>:
   0:	00000f41 	0xf41
   4:	756e6700 	jalx	5b99c00 <ans+0x5b999c8>
   8:	00070100 	sll	zero,a3,0x4
   c:	01040000 	0x1040000

Disassembly of section .comment:

00000000 <.comment>:
   0:	3a434347 	xori	v1,s2,0x4347
   4:	4e472820 	c3	0x472820
   8:	36202955 	ori	zero,s1,0x2955
   c:	302e322e 	andi	t6,at,0x322e
	...
