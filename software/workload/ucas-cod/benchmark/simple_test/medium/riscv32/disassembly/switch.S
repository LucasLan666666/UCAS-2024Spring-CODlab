
../riscv32/elf/switch:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <start>:
   0:	00004137          	lui	sp,0x4
   4:	00c0006f          	j	10 <continued>
   8:	00000013          	nop

0000000c <global_result>:
   c:	ffff                	0xffff
   e:	ffff                	0xffff

00000010 <continued>:
  10:	05c000ef          	jal	ra,6c <main>
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

00000048 <switch_case>:
  48:	00c00793          	li	a5,12
  4c:	00a7ec63          	bltu	a5,a0,64 <switch_case+0x1c>
  50:	10000793          	li	a5,256
  54:	00251513          	slli	a0,a0,0x2
  58:	00a78533          	add	a0,a5,a0
  5c:	00052503          	lw	a0,0(a0)
  60:	00008067          	ret
  64:	fff00513          	li	a0,-1
  68:	00008067          	ret

Disassembly of section .text.startup:

0000006c <main>:
  6c:	fe010113          	addi	sp,sp,-32 # 3fe0 <ans+0x3eac>
  70:	00912a23          	sw	s1,20(sp)
  74:	01212823          	sw	s2,16(sp)
  78:	00812c23          	sw	s0,24(sp)
  7c:	01312623          	sw	s3,12(sp)
  80:	01412423          	sw	s4,8(sp)
  84:	00112e23          	sw	ra,28(sp)
  88:	13400493          	li	s1,308
  8c:	00000413          	li	s0,0
  90:	fff00713          	li	a4,-1
  94:	00e00993          	li	s3,14
  98:	00d00a13          	li	s4,13
  9c:	10000913          	li	s2,256
  a0:	0004a503          	lw	a0,0(s1)
  a4:	00448493          	addi	s1,s1,4
  a8:	40e50533          	sub	a0,a0,a4
  ac:	00153513          	seqz	a0,a0
  b0:	f75ff0ef          	jal	ra,24 <nemu_assert>
  b4:	00241793          	slli	a5,s0,0x2
  b8:	00f907b3          	add	a5,s2,a5
  bc:	01340c63          	beq	s0,s3,d4 <main+0x68>
  c0:	fff00713          	li	a4,-1
  c4:	01440463          	beq	s0,s4,cc <main+0x60>
  c8:	0007a703          	lw	a4,0(a5)
  cc:	00140413          	addi	s0,s0,1
  d0:	fd1ff06f          	j	a0 <main+0x34>
  d4:	00100513          	li	a0,1
  d8:	f4dff0ef          	jal	ra,24 <nemu_assert>
  dc:	01c12083          	lw	ra,28(sp)
  e0:	01812403          	lw	s0,24(sp)
  e4:	01412483          	lw	s1,20(sp)
  e8:	01012903          	lw	s2,16(sp)
  ec:	00c12983          	lw	s3,12(sp)
  f0:	00812a03          	lw	s4,8(sp)
  f4:	00000513          	li	a0,0
  f8:	02010113          	addi	sp,sp,32
  fc:	00008067          	ret

Disassembly of section .rodata:

00000100 <CSWTCH.0>:
 100:	0000                	unimp
 102:	0000                	unimp
 104:	0002                	c.slli64	zero
 106:	0000                	unimp
 108:	0005                	c.nop	1
 10a:	0000                	unimp
 10c:	0005                	c.nop	1
 10e:	0000                	unimp
 110:	0008                	0x8
 112:	0000                	unimp
 114:	0008                	0x8
 116:	0000                	unimp
 118:	0008                	0x8
 11a:	0000                	unimp
 11c:	0008                	0x8
 11e:	0000                	unimp
 120:	000a                	c.slli	zero,0x2
 122:	0000                	unimp
 124:	000a                	c.slli	zero,0x2
 126:	0000                	unimp
 128:	000a                	c.slli	zero,0x2
 12a:	0000                	unimp
 12c:	000a                	c.slli	zero,0x2
 12e:	0000                	unimp
 130:	0000000f          	fence	unknown,unknown

Disassembly of section .data:

00000134 <ans>:
 134:	ffff                	0xffff
 136:	ffff                	0xffff
 138:	0000                	unimp
 13a:	0000                	unimp
 13c:	0002                	c.slli64	zero
 13e:	0000                	unimp
 140:	0005                	c.nop	1
 142:	0000                	unimp
 144:	0005                	c.nop	1
 146:	0000                	unimp
 148:	0008                	0x8
 14a:	0000                	unimp
 14c:	0008                	0x8
 14e:	0000                	unimp
 150:	0008                	0x8
 152:	0000                	unimp
 154:	0008                	0x8
 156:	0000                	unimp
 158:	000a                	c.slli	zero,0x2
 15a:	0000                	unimp
 15c:	000a                	c.slli	zero,0x2
 15e:	0000                	unimp
 160:	000a                	c.slli	zero,0x2
 162:	0000                	unimp
 164:	000a                	c.slli	zero,0x2
 166:	0000                	unimp
 168:	0000000f          	fence	unknown,unknown
 16c:	ffff                	0xffff
 16e:	ffff                	0xffff

Disassembly of section .comment:

00000000 <.comment>:
   0:	3a434347          	fmsub.d	ft6,ft6,ft4,ft7,rmm
   4:	2820                	fld	fs0,80(s0)
   6:	29554e47          	fmsub.s	ft8,fa0,fs5,ft5,rmm
   a:	3820                	fld	fs0,112(s0)
   c:	322e                	fld	ft4,232(sp)
   e:	302e                	fld	ft0,232(sp)
	...
