
../mips/elf/quick-sort:     file format elf32-littlemips


Disassembly of section .text:

00000000 <start>:
   0:	00000000 	nop
   4:	08000004 	j	10 <real_start>
   8:	00000000 	nop

0000000c <global_result>:
   c:	ffffffff 	sdc3	$31,-1(ra)

00000010 <real_start>:
  10:	241d0400 	li	sp,1024
  14:	0c00006b 	jal	1ac <main>
  18:	00000000 	nop
  1c:	3c010000 	lui	at,0x0
  20:	ac20000c 	sw	zero,12(at)

00000024 <end_loop>:
  24:	08000009 	j	24 <end_loop>
  28:	00000000 	nop

0000002c <partition>:
  2c:	00053880 	sll	a3,a1,0x2
  30:	00873821 	addu	a3,a0,a3
  34:	00a6102a 	slt	v0,a1,a2
  38:	8ce90000 	lw	t1,0(a3)
  3c:	10400038 	beqz	v0,120 <partition+0xf4>
  40:	00000000 	nop
  44:	00064080 	sll	t0,a2,0x2
  48:	00881021 	addu	v0,a0,t0
  4c:	8c430000 	lw	v1,0(v0)
  50:	00a01025 	move	v0,a1
  54:	0123282a 	slt	a1,t1,v1
  58:	00883821 	addu	a3,a0,t0
  5c:	10000003 	b	6c <partition+0x40>
  60:	00000000 	nop
  64:	8ce30000 	lw	v1,0(a3)
  68:	0123282a 	slt	a1,t1,v1
  6c:	10a00010 	beqz	a1,b0 <partition+0x84>
  70:	00000000 	nop
  74:	24c6ffff 	addiu	a2,a2,-1
  78:	0046182a 	slt	v1,v0,a2
  7c:	24e7fffc 	addiu	a3,a3,-4
  80:	1460fff8 	bnez	v1,64 <partition+0x38>
  84:	00000000 	nop
  88:	00063080 	sll	a2,a2,0x2
  8c:	00865021 	addu	t2,a0,a2
  90:	00023880 	sll	a3,v0,0x2
  94:	8d430000 	lw	v1,0(t2)
  98:	00873821 	addu	a3,a0,a3
  9c:	ace30000 	sw	v1,0(a3)
  a0:	ad430000 	sw	v1,0(t2)
  a4:	ace90000 	sw	t1,0(a3)
  a8:	03e00008 	jr	ra
  ac:	00000000 	nop
  b0:	00023880 	sll	a3,v0,0x2
  b4:	00064080 	sll	t0,a2,0x2
  b8:	00873821 	addu	a3,a0,a3
  bc:	0046282a 	slt	a1,v0,a2
  c0:	00885021 	addu	t2,a0,t0
  c4:	ace30000 	sw	v1,0(a3)
  c8:	14a00007 	bnez	a1,e8 <partition+0xbc>
  cc:	00000000 	nop
  d0:	1000fff3 	b	a0 <partition+0x74>
  d4:	00000000 	nop
  d8:	8ce30000 	lw	v1,0(a3)
  dc:	0123282a 	slt	a1,t1,v1
  e0:	14a0000c 	bnez	a1,114 <partition+0xe8>
  e4:	00000000 	nop
  e8:	24420001 	addiu	v0,v0,1
  ec:	24e70004 	addiu	a3,a3,4
  f0:	1446fff9 	bne	v0,a2,d8 <partition+0xac>
  f4:	00000000 	nop
  f8:	00023880 	sll	a3,v0,0x2
  fc:	00873821 	addu	a3,a0,a3
 100:	8ce30000 	lw	v1,0(a3)
 104:	ad430000 	sw	v1,0(t2)
 108:	ace90000 	sw	t1,0(a3)
 10c:	03e00008 	jr	ra
 110:	00000000 	nop
 114:	ad430000 	sw	v1,0(t2)
 118:	1000ffcf 	b	58 <partition+0x2c>
 11c:	00000000 	nop
 120:	00a01025 	move	v0,a1
 124:	1000ffdf 	b	a4 <partition+0x78>
 128:	00000000 	nop

0000012c <quick_sort>:
 12c:	00a6102a 	slt	v0,a1,a2
 130:	1040001c 	beqz	v0,1a4 <quick_sort+0x78>
 134:	00000000 	nop
 138:	27bdffe0 	addiu	sp,sp,-32
 13c:	afb20018 	sw	s2,24(sp)
 140:	afb10014 	sw	s1,20(sp)
 144:	afb00010 	sw	s0,16(sp)
 148:	afbf001c 	sw	ra,28(sp)
 14c:	00a08025 	move	s0,a1
 150:	00c08825 	move	s1,a2
 154:	00809025 	move	s2,a0
 158:	02002825 	move	a1,s0
 15c:	02203025 	move	a2,s1
 160:	02402025 	move	a0,s2
 164:	0c00000b 	jal	2c <partition>
 168:	00000000 	nop
 16c:	2446ffff 	addiu	a2,v0,-1
 170:	02002825 	move	a1,s0
 174:	02402025 	move	a0,s2
 178:	24500001 	addiu	s0,v0,1
 17c:	0c00004b 	jal	12c <quick_sort>
 180:	00000000 	nop
 184:	0211102a 	slt	v0,s0,s1
 188:	1440fff3 	bnez	v0,158 <quick_sort+0x2c>
 18c:	00000000 	nop
 190:	8fbf001c 	lw	ra,28(sp)
 194:	8fb20018 	lw	s2,24(sp)
 198:	8fb10014 	lw	s1,20(sp)
 19c:	8fb00010 	lw	s0,16(sp)
 1a0:	27bd0020 	addiu	sp,sp,32
 1a4:	03e00008 	jr	ra
 1a8:	00000000 	nop

Disassembly of section .text.startup:

000001ac <main>:
 1ac:	3c0c0000 	lui	t4,0x0
 1b0:	27bdffe8 	addiu	sp,sp,-24
 1b4:	24060013 	li	a2,19
 1b8:	00002825 	move	a1,zero
 1bc:	258402b8 	addiu	a0,t4,696
 1c0:	afbf0014 	sw	ra,20(sp)
 1c4:	0c00004b 	jal	12c <quick_sort>
 1c8:	00000000 	nop
 1cc:	3c0d0000 	lui	t5,0x0
 1d0:	258b02b8 	addiu	t3,t4,696
 1d4:	8da7000c 	lw	a3,12(t5)
 1d8:	01601825 	move	v1,t3
 1dc:	00003025 	move	a2,zero
 1e0:	00001025 	move	v0,zero
 1e4:	24050014 	li	a1,20
 1e8:	8c640000 	lw	a0,0(v1)
 1ec:	10820005 	beq	a0,v0,204 <main+0x58>
 1f0:	00000000 	nop
 1f4:	08000009 	j	24 <end_loop>
 1f8:	00000000 	nop
 1fc:	24060001 	li	a2,1
 200:	24070001 	li	a3,1
 204:	24420001 	addiu	v0,v0,1
 208:	24630004 	addiu	v1,v1,4
 20c:	1445fff6 	bne	v0,a1,1e8 <main+0x3c>
 210:	00000000 	nop
 214:	14c0001c 	bnez	a2,288 <main+0xdc>
 218:	00000000 	nop
 21c:	24060013 	li	a2,19
 220:	00002825 	move	a1,zero
 224:	258402b8 	addiu	a0,t4,696
 228:	0c00004b 	jal	12c <quick_sort>
 22c:	00000000 	nop
 230:	8da6000c 	lw	a2,12(t5)
 234:	00002825 	move	a1,zero
 238:	00001025 	move	v0,zero
 23c:	24040014 	li	a0,20
 240:	8d630000 	lw	v1,0(t3)
 244:	10620005 	beq	v1,v0,25c <main+0xb0>
 248:	00000000 	nop
 24c:	08000009 	j	24 <end_loop>
 250:	00000000 	nop
 254:	24050001 	li	a1,1
 258:	24060001 	li	a2,1
 25c:	24420001 	addiu	v0,v0,1
 260:	256b0004 	addiu	t3,t3,4
 264:	1444fff6 	bne	v0,a0,240 <main+0x94>
 268:	00000000 	nop
 26c:	14a00009 	bnez	a1,294 <main+0xe8>
 270:	00000000 	nop
 274:	8fbf0014 	lw	ra,20(sp)
 278:	00001025 	move	v0,zero
 27c:	27bd0018 	addiu	sp,sp,24
 280:	03e00008 	jr	ra
 284:	00000000 	nop
 288:	ada7000c 	sw	a3,12(t5)
 28c:	1000ffe3 	b	21c <main+0x70>
 290:	00000000 	nop
 294:	ada6000c 	sw	a2,12(t5)
 298:	1000fff6 	b	274 <main+0xc8>
 29c:	00000000 	nop

Disassembly of section .MIPS.abiflags:

000002a0 <.MIPS.abiflags>:
 2a0:	01200000 	0x1200000
 2a4:	01000101 	0x1000101
	...
 2b0:	00000001 	movf	zero,zero,$fcc0
 2b4:	00000000 	nop

Disassembly of section .data:

000002b8 <a>:
 2b8:	00000002 	srl	zero,zero,0x0
 2bc:	0000000c 	syscall
 2c0:	0000000e 	0xe
 2c4:	00000006 	srlv	zero,zero,zero
 2c8:	0000000d 	break
 2cc:	0000000f 	sync
 2d0:	00000010 	mfhi	zero
 2d4:	0000000a 	movz	zero,zero,zero
 2d8:	00000000 	nop
 2dc:	00000012 	mflo	zero
 2e0:	0000000b 	movn	zero,zero,zero
 2e4:	00000013 	mtlo	zero
 2e8:	00000009 	jalr	zero,zero
 2ec:	00000001 	movf	zero,zero,$fcc0
 2f0:	00000007 	srav	zero,zero,zero
 2f4:	00000005 	0x5
 2f8:	00000004 	sllv	zero,zero,zero
 2fc:	00000003 	sra	zero,zero,0x0
 300:	00000008 	jr	zero
 304:	00000011 	mthi	zero

Disassembly of section .reginfo:

00000000 <.reginfo>:
   0:	a0000002 	sb	zero,2(zero)
	...

Disassembly of section .pdr:

00000000 <.pdr>:
   0:	0000002c 	0x2c
	...
  18:	0000001d 	0x1d
  1c:	0000001f 	0x1f
  20:	0000012c 	0x12c
  24:	80070000 	lb	a3,0(zero)
  28:	fffffffc 	sdc3	$31,-4(ra)
	...
  34:	00000020 	add	zero,zero,zero
  38:	0000001d 	0x1d
  3c:	0000001f 	0x1f
  40:	000001ac 	0x1ac
  44:	80000000 	lb	zero,0(zero)
  48:	fffffffc 	sdc3	$31,-4(ra)
	...
  54:	00000018 	mult	zero,zero
  58:	0000001d 	0x1d
  5c:	0000001f 	0x1f

Disassembly of section .gnu.attributes:

00000000 <.gnu.attributes>:
   0:	00000f41 	0xf41
   4:	756e6700 	jalx	5b99c00 <a+0x5b99948>
   8:	00070100 	sll	zero,a3,0x4
   c:	01040000 	0x1040000

Disassembly of section .comment:

00000000 <.comment>:
   0:	3a434347 	xori	v1,s2,0x4347
   4:	4e472820 	c3	0x472820
   8:	36202955 	ori	zero,s1,0x2955
   c:	302e322e 	andi	t6,at,0x322e
	...
