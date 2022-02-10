
../riscv32/elf/fact:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <start>:
   0:	00004137          	lui	sp,0x4
   4:	00c0006f          	j	10 <continued>
   8:	00000013          	nop

0000000c <global_result>:
   c:	ffff                	0xffff
   e:	ffff                	0xffff

00000010 <continued>:
  10:	0c4000ef          	jal	ra,d4 <main>
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

00000048 <fact>:
  48:	00100793          	li	a5,1
  4c:	00a7e663          	bltu	a5,a0,58 <fact+0x10>
  50:	00100513          	li	a0,1
  54:	00008067          	ret
  58:	0040006f          	j	5c <fact.part.0>

0000005c <fact.part.0>:
  5c:	ff010113          	addi	sp,sp,-16 # 3ff0 <f+0x3e54>
  60:	00812423          	sw	s0,8(sp)
  64:	00050413          	mv	s0,a0
  68:	fff50513          	addi	a0,a0,-1
  6c:	00112623          	sw	ra,12(sp)
  70:	fd9ff0ef          	jal	ra,48 <fact>
  74:	fff00893          	li	a7,-1
  78:	00805463          	blez	s0,80 <fact.part.0+0x24>
  7c:	00100893          	li	a7,1
  80:	41f45793          	srai	a5,s0,0x1f
  84:	0087c6b3          	xor	a3,a5,s0
  88:	40f686b3          	sub	a3,a3,a5
  8c:	00000593          	li	a1,0
  90:	00000793          	li	a5,0
  94:	02000813          	li	a6,32
  98:	0016f713          	andi	a4,a3,1
  9c:	00f51633          	sll	a2,a0,a5
  a0:	00178793          	addi	a5,a5,1
  a4:	00070463          	beqz	a4,ac <fact.part.0+0x50>
  a8:	00c585b3          	add	a1,a1,a2
  ac:	4016d693          	srai	a3,a3,0x1
  b0:	ff0794e3          	bne	a5,a6,98 <fact.part.0+0x3c>
  b4:	00100793          	li	a5,1
  b8:	00f88463          	beq	a7,a5,c0 <fact.part.0+0x64>
  bc:	40b005b3          	neg	a1,a1
  c0:	00c12083          	lw	ra,12(sp)
  c4:	00812403          	lw	s0,8(sp)
  c8:	00058513          	mv	a0,a1
  cc:	01010113          	addi	sp,sp,16
  d0:	00008067          	ret

Disassembly of section .text.startup:

000000d4 <main>:
  d4:	fe010113          	addi	sp,sp,-32
  d8:	00912a23          	sw	s1,20(sp)
  dc:	01212823          	sw	s2,16(sp)
  e0:	00812c23          	sw	s0,24(sp)
  e4:	01312623          	sw	s3,12(sp)
  e8:	01412423          	sw	s4,8(sp)
  ec:	00112e23          	sw	ra,28(sp)
  f0:	19c00913          	li	s2,412
  f4:	16800493          	li	s1,360
  f8:	00000413          	li	s0,0
  fc:	00100793          	li	a5,1
 100:	00d00993          	li	s3,13
 104:	00100a13          	li	s4,1
 108:	01c0006f          	j	124 <main+0x50>
 10c:	00100793          	li	a5,1
 110:	01440663          	beq	s0,s4,11c <main+0x48>
 114:	f49ff0ef          	jal	ra,5c <fact.part.0>
 118:	00050793          	mv	a5,a0
 11c:	00490913          	addi	s2,s2,4
 120:	00448493          	addi	s1,s1,4
 124:	0004a503          	lw	a0,0(s1)
 128:	00140413          	addi	s0,s0,1
 12c:	00f92023          	sw	a5,0(s2)
 130:	40f50533          	sub	a0,a0,a5
 134:	00153513          	seqz	a0,a0
 138:	eedff0ef          	jal	ra,24 <nemu_assert>
 13c:	00040513          	mv	a0,s0
 140:	fd3416e3          	bne	s0,s3,10c <main+0x38>
 144:	01c12083          	lw	ra,28(sp)
 148:	01812403          	lw	s0,24(sp)
 14c:	01412483          	lw	s1,20(sp)
 150:	01012903          	lw	s2,16(sp)
 154:	00c12983          	lw	s3,12(sp)
 158:	00812a03          	lw	s4,8(sp)
 15c:	00000513          	li	a0,0
 160:	02010113          	addi	sp,sp,32
 164:	00008067          	ret

Disassembly of section .data:

00000168 <ans>:
 168:	0001                	nop
 16a:	0000                	unimp
 16c:	0001                	nop
 16e:	0000                	unimp
 170:	0002                	c.slli64	zero
 172:	0000                	unimp
 174:	0006                	c.slli	zero,0x1
 176:	0000                	unimp
 178:	0018                	0x18
 17a:	0000                	unimp
 17c:	0078                	addi	a4,sp,12
 17e:	0000                	unimp
 180:	02d0                	addi	a2,sp,324
 182:	0000                	unimp
 184:	13b0                	addi	a2,sp,488
 186:	0000                	unimp
 188:	9d80                	0x9d80
 18a:	0000                	unimp
 18c:	8980                	0x8980
 18e:	0005                	c.nop	1
 190:	5f00                	lw	s0,56(a4)
 192:	15000037          	lui	zero,0x15000
 196:	0261                	addi	tp,tp,24
 198:	fc00                	fsw	fs0,56(s0)
 19a:	1c8c                	addi	a1,sp,624

Disassembly of section .bss:

0000019c <f>:
	...

Disassembly of section .comment:

00000000 <.comment>:
   0:	3a434347          	fmsub.d	ft6,ft6,ft4,ft7,rmm
   4:	2820                	fld	fs0,80(s0)
   6:	29554e47          	fmsub.s	ft8,fa0,fs5,ft5,rmm
   a:	3820                	fld	fs0,112(s0)
   c:	322e                	fld	ft4,232(sp)
   e:	302e                	fld	ft0,232(sp)
	...
