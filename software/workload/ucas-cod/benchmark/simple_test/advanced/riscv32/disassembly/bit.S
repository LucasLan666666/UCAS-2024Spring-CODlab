
../riscv32/elf/bit:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <start>:
   0:	00004137          	lui	sp,0x4
   4:	00c0006f          	j	10 <continued>
   8:	00000013          	nop

0000000c <global_result>:
   c:	ffff                	0xffff
   e:	ffff                	0xffff

00000010 <continued>:
  10:	0b0000ef          	jal	ra,c0 <main>
  14:	028000ef          	jal	ra,3c <hit_good_trap>

00000018 <_halt>:
  18:	000007b7          	lui	a5,0x0
  1c:	00a7a623          	sw	a0,12(a5) # c <global_result>
  20:	0000006f          	j	20 <_halt+0x8>

00000024 <nemu_assert>:
  24:	00051a63          	bnez	a0,38 <nemu_assert+0x14>
  28:	000007b7          	lui	a5,0x0
  2c:	00100713          	li	a4,1
  30:	00e7a623          	sw	a4,12(a5) # c <global_result>
  34:	0000006f          	j	34 <nemu_assert+0x10>
  38:	00008067          	ret

0000003c <hit_good_trap>:
  3c:	000007b7          	lui	a5,0x0
  40:	0007a623          	sw	zero,12(a5) # c <global_result>
  44:	0000006f          	j	44 <hit_good_trap+0x8>

00000048 <getbit>:
  48:	4035d793          	srai	a5,a1,0x3
  4c:	00f50533          	add	a0,a0,a5
  50:	00054503          	lbu	a0,0(a0)
  54:	0075f593          	andi	a1,a1,7
  58:	00b55533          	srl	a0,a0,a1
  5c:	00157513          	andi	a0,a0,1
  60:	00008067          	ret

00000064 <setbit>:
  64:	4035d793          	srai	a5,a1,0x3
  68:	ff010113          	addi	sp,sp,-16 # 3ff0 <main+0x3f30>
  6c:	00f50533          	add	a0,a0,a5
  70:	00a12623          	sw	a0,12(sp)
  74:	0075f793          	andi	a5,a1,7
  78:	00100593          	li	a1,1
  7c:	00f595b3          	sll	a1,a1,a5
  80:	00c12783          	lw	a5,12(sp)
  84:	02061063          	bnez	a2,a4 <setbit+0x40>
  88:	0007c783          	lbu	a5,0(a5)
  8c:	fff5c593          	not	a1,a1
  90:	00f5f5b3          	and	a1,a1,a5
  94:	00c12783          	lw	a5,12(sp)
  98:	00b78023          	sb	a1,0(a5)
  9c:	01010113          	addi	sp,sp,16
  a0:	00008067          	ret
  a4:	0007c783          	lbu	a5,0(a5)
  a8:	00f5e5b3          	or	a1,a1,a5
  ac:	00c12783          	lw	a5,12(sp)
  b0:	0ff5f593          	andi	a1,a1,255
  b4:	00b78023          	sb	a1,0(a5)
  b8:	01010113          	addi	sp,sp,16
  bc:	00008067          	ret

Disassembly of section .text.startup:

000000c0 <main>:
  c0:	fe010113          	addi	sp,sp,-32
  c4:	faa00793          	li	a5,-86
  c8:	00000593          	li	a1,0
  cc:	00c10513          	addi	a0,sp,12
  d0:	00112e23          	sw	ra,28(sp)
  d4:	00f10623          	sb	a5,12(sp)
  d8:	f71ff0ef          	jal	ra,48 <getbit>
  dc:	00153513          	seqz	a0,a0
  e0:	f45ff0ef          	jal	ra,24 <nemu_assert>
  e4:	00100593          	li	a1,1
  e8:	00c10513          	addi	a0,sp,12
  ec:	f5dff0ef          	jal	ra,48 <getbit>
  f0:	fff50513          	addi	a0,a0,-1
  f4:	00153513          	seqz	a0,a0
  f8:	f2dff0ef          	jal	ra,24 <nemu_assert>
  fc:	00200593          	li	a1,2
 100:	00c10513          	addi	a0,sp,12
 104:	f45ff0ef          	jal	ra,48 <getbit>
 108:	00153513          	seqz	a0,a0
 10c:	f19ff0ef          	jal	ra,24 <nemu_assert>
 110:	00300593          	li	a1,3
 114:	00c10513          	addi	a0,sp,12
 118:	f31ff0ef          	jal	ra,48 <getbit>
 11c:	fff50513          	addi	a0,a0,-1
 120:	00153513          	seqz	a0,a0
 124:	f01ff0ef          	jal	ra,24 <nemu_assert>
 128:	00400593          	li	a1,4
 12c:	00c10513          	addi	a0,sp,12
 130:	f19ff0ef          	jal	ra,48 <getbit>
 134:	00153513          	seqz	a0,a0
 138:	eedff0ef          	jal	ra,24 <nemu_assert>
 13c:	00500593          	li	a1,5
 140:	00c10513          	addi	a0,sp,12
 144:	f05ff0ef          	jal	ra,48 <getbit>
 148:	fff50513          	addi	a0,a0,-1
 14c:	00153513          	seqz	a0,a0
 150:	ed5ff0ef          	jal	ra,24 <nemu_assert>
 154:	00600593          	li	a1,6
 158:	00c10513          	addi	a0,sp,12
 15c:	eedff0ef          	jal	ra,48 <getbit>
 160:	00153513          	seqz	a0,a0
 164:	ec1ff0ef          	jal	ra,24 <nemu_assert>
 168:	00700593          	li	a1,7
 16c:	00c10513          	addi	a0,sp,12
 170:	ed9ff0ef          	jal	ra,48 <getbit>
 174:	fff50513          	addi	a0,a0,-1
 178:	00153513          	seqz	a0,a0
 17c:	ea9ff0ef          	jal	ra,24 <nemu_assert>
 180:	00c10513          	addi	a0,sp,12
 184:	00100613          	li	a2,1
 188:	00800593          	li	a1,8
 18c:	ed9ff0ef          	jal	ra,64 <setbit>
 190:	00c10513          	addi	a0,sp,12
 194:	00000613          	li	a2,0
 198:	00900593          	li	a1,9
 19c:	ec9ff0ef          	jal	ra,64 <setbit>
 1a0:	00c10513          	addi	a0,sp,12
 1a4:	00100613          	li	a2,1
 1a8:	00a00593          	li	a1,10
 1ac:	eb9ff0ef          	jal	ra,64 <setbit>
 1b0:	00c10513          	addi	a0,sp,12
 1b4:	00000613          	li	a2,0
 1b8:	00b00593          	li	a1,11
 1bc:	ea9ff0ef          	jal	ra,64 <setbit>
 1c0:	00c10513          	addi	a0,sp,12
 1c4:	00100613          	li	a2,1
 1c8:	00c00593          	li	a1,12
 1cc:	e99ff0ef          	jal	ra,64 <setbit>
 1d0:	00c10513          	addi	a0,sp,12
 1d4:	00000613          	li	a2,0
 1d8:	00d00593          	li	a1,13
 1dc:	e89ff0ef          	jal	ra,64 <setbit>
 1e0:	00c10513          	addi	a0,sp,12
 1e4:	00100613          	li	a2,1
 1e8:	00e00593          	li	a1,14
 1ec:	e79ff0ef          	jal	ra,64 <setbit>
 1f0:	00c10513          	addi	a0,sp,12
 1f4:	00000613          	li	a2,0
 1f8:	00f00593          	li	a1,15
 1fc:	e69ff0ef          	jal	ra,64 <setbit>
 200:	00d14503          	lbu	a0,13(sp)
 204:	fab50513          	addi	a0,a0,-85
 208:	00153513          	seqz	a0,a0
 20c:	e19ff0ef          	jal	ra,24 <nemu_assert>
 210:	01c12083          	lw	ra,28(sp)
 214:	00000513          	li	a0,0
 218:	02010113          	addi	sp,sp,32
 21c:	00008067          	ret

Disassembly of section .comment:

00000000 <.comment>:
   0:	3a434347          	fmsub.d	ft6,ft6,ft4,ft7,rmm
   4:	2820                	fld	fs0,80(s0)
   6:	29554e47          	fmsub.s	ft8,fa0,fs5,ft5,rmm
   a:	3820                	fld	fs0,112(s0)
   c:	322e                	fld	ft4,232(sp)
   e:	302e                	fld	ft0,232(sp)
	...
