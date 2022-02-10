
../riscv32/elf/pascal:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <start>:
   0:	00004137          	lui	sp,0x4
   4:	00c0006f          	j	10 <continued>
   8:	00000013          	nop

0000000c <global_result>:
   c:	ffff                	0xffff
   e:	ffff                	0xffff

00000010 <continued>:
  10:	038000ef          	jal	ra,48 <main>
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

Disassembly of section .text.startup:

00000048 <main>:
  48:	ff010113          	addi	sp,sp,-16 # 3ff0 <a+0x3e6c>
  4c:	00812423          	sw	s0,8(sp)
  50:	18400713          	li	a4,388
  54:	01212023          	sw	s2,0(sp)
  58:	00100793          	li	a5,1
  5c:	18400893          	li	a7,388
  60:	00112623          	sw	ra,12(sp)
  64:	00912223          	sw	s1,4(sp)
  68:	00f72223          	sw	a5,4(a4)
  6c:	18f02223          	sw	a5,388(zero) # 184 <a>
  70:	18c00593          	li	a1,396
  74:	18400413          	li	s0,388
  78:	07c88913          	addi	s2,a7,124
  7c:	00100713          	li	a4,1
  80:	18800513          	li	a0,392
  84:	00100813          	li	a6,1
  88:	00050793          	mv	a5,a0
  8c:	00100693          	li	a3,1
  90:	0080006f          	j	98 <main+0x50>
  94:	0007a703          	lw	a4,0(a5)
  98:	00d70633          	add	a2,a4,a3
  9c:	00c7a023          	sw	a2,0(a5)
  a0:	00478793          	addi	a5,a5,4
  a4:	00070693          	mv	a3,a4
  a8:	feb796e3          	bne	a5,a1,94 <main+0x4c>
  ac:	0105a023          	sw	a6,0(a1)
  b0:	00458593          	addi	a1,a1,4
  b4:	01258663          	beq	a1,s2,c0 <main+0x78>
  b8:	0048a703          	lw	a4,4(a7)
  bc:	fcdff06f          	j	88 <main+0x40>
  c0:	10800493          	li	s1,264
  c4:	00042503          	lw	a0,0(s0)
  c8:	0004a783          	lw	a5,0(s1)
  cc:	00440413          	addi	s0,s0,4
  d0:	00448493          	addi	s1,s1,4
  d4:	40f50533          	sub	a0,a0,a5
  d8:	00153513          	seqz	a0,a0
  dc:	f49ff0ef          	jal	ra,24 <nemu_assert>
  e0:	ff2412e3          	bne	s0,s2,c4 <main+0x7c>
  e4:	00100513          	li	a0,1
  e8:	f3dff0ef          	jal	ra,24 <nemu_assert>
  ec:	00c12083          	lw	ra,12(sp)
  f0:	00812403          	lw	s0,8(sp)
  f4:	00412483          	lw	s1,4(sp)
  f8:	00012903          	lw	s2,0(sp)
  fc:	00000513          	li	a0,0
 100:	01010113          	addi	sp,sp,16
 104:	00008067          	ret

Disassembly of section .data:

00000108 <ans>:
 108:	0001                	nop
 10a:	0000                	unimp
 10c:	001e                	c.slli	zero,0x7
 10e:	0000                	unimp
 110:	000001b3          	add	gp,zero,zero
 114:	0fdc                	addi	a5,sp,980
 116:	0000                	unimp
 118:	6b0d                	lui	s6,0x3
 11a:	0000                	unimp
 11c:	2caa                	fld	fs9,136(sp)
 11e:	0002                	c.slli64	zero
 120:	00090f6f          	jal	t5,90120 <a+0x8ff9c>
 124:	1058                	addi	a4,sp,36
 126:	001f 4efd 0059      	0x594efd001f
 12c:	4f4e                	lw	t5,208(sp)
 12e:	00da                	slli	ra,ra,0x16
 130:	01ca7357          	0x1ca7357
 134:	8be4                	0x8be4
 136:	0341                	addi	t1,t1,16
 138:	c829                	beqz	s0,18a <a+0x6>
 13a:	63ea0527          	0x63ea0527
 13e:	f9530723          	sb	s5,-114(t1)
 142:	08aa                	slli	a7,a7,0xa
 144:	e7d0                	fsw	fa2,12(a5)
 146:	093e                	slli	s2,s2,0xf
 148:	08aaf953          	fsub.s	fs2,fs5,fa0
 14c:	63ea                	flw	ft7,152(sp)
 14e:	c8290723          	sb	sp,-882(s2)
 152:	8be40527          	0x8be40527
 156:	0341                	addi	t1,t1,16
 158:	01ca7357          	0x1ca7357
 15c:	4f4e                	lw	t5,208(sp)
 15e:	00da                	slli	ra,ra,0x16
 160:	4efd                	li	t4,31
 162:	0059                	c.nop	22
 164:	1058                	addi	a4,sp,36
 166:	001f 0f6f 0009      	0x90f6f001f
 16c:	2caa                	fld	fs9,136(sp)
 16e:	0002                	c.slli64	zero
 170:	6b0d                	lui	s6,0x3
 172:	0000                	unimp
 174:	0fdc                	addi	a5,sp,980
 176:	0000                	unimp
 178:	000001b3          	add	gp,zero,zero
 17c:	001e                	c.slli	zero,0x7
 17e:	0000                	unimp
 180:	0001                	nop
	...

Disassembly of section .bss:

00000184 <a>:
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
