
../riscv32/elf/fib:     file format elf32-littleriscv


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
  48:	ff010113          	addi	sp,sp,-16 # 3ff0 <ans+0x3e98>
  4c:	00812423          	sw	s0,8(sp)
  50:	0b800413          	li	s0,184
  54:	00912223          	sw	s1,4(sp)
  58:	01212023          	sw	s2,0(sp)
  5c:	00112623          	sw	ra,12(sp)
  60:	0a840493          	addi	s1,s0,168
  64:	09840913          	addi	s2,s0,152
  68:	00442783          	lw	a5,4(s0)
  6c:	00042703          	lw	a4,0(s0)
  70:	0004a503          	lw	a0,0(s1)
  74:	00440413          	addi	s0,s0,4
  78:	00e787b3          	add	a5,a5,a4
  7c:	40f50533          	sub	a0,a0,a5
  80:	00153513          	seqz	a0,a0
  84:	00f42223          	sw	a5,4(s0)
  88:	00448493          	addi	s1,s1,4
  8c:	f99ff0ef          	jal	ra,24 <nemu_assert>
  90:	fd241ce3          	bne	s0,s2,68 <main+0x20>
  94:	00100513          	li	a0,1
  98:	f8dff0ef          	jal	ra,24 <nemu_assert>
  9c:	00c12083          	lw	ra,12(sp)
  a0:	00812403          	lw	s0,8(sp)
  a4:	00412483          	lw	s1,4(sp)
  a8:	00012903          	lw	s2,0(sp)
  ac:	00000513          	li	a0,0
  b0:	01010113          	addi	sp,sp,16
  b4:	00008067          	ret

Disassembly of section .data:

000000b8 <fib>:
  b8:	0001                	nop
  ba:	0000                	unimp
  bc:	0001                	nop
	...

00000158 <ans>:
 158:	0001                	nop
 15a:	0000                	unimp
 15c:	0001                	nop
 15e:	0000                	unimp
 160:	0002                	c.slli64	zero
 162:	0000                	unimp
 164:	00000003          	lb	zero,0(zero) # 0 <start>
 168:	0005                	c.nop	1
 16a:	0000                	unimp
 16c:	0008                	0x8
 16e:	0000                	unimp
 170:	000d                	c.nop	3
 172:	0000                	unimp
 174:	0015                	c.nop	5
 176:	0000                	unimp
 178:	0022                	c.slli	zero,0x8
 17a:	0000                	unimp
 17c:	00000037          	lui	zero,0x0
 180:	0059                	c.nop	22
 182:	0000                	unimp
 184:	0090                	addi	a2,sp,64
 186:	0000                	unimp
 188:	00e9                	addi	ra,ra,26
 18a:	0000                	unimp
 18c:	0179                	addi	sp,sp,30
 18e:	0000                	unimp
 190:	0262                	slli	tp,tp,0x18
 192:	0000                	unimp
 194:	000003db          	0x3db
 198:	063d                	addi	a2,a2,15
 19a:	0000                	unimp
 19c:	0a18                	addi	a4,sp,272
 19e:	0000                	unimp
 1a0:	1055                	c.nop	-11
 1a2:	0000                	unimp
 1a4:	1a6d                	addi	s4,s4,-5
 1a6:	0000                	unimp
 1a8:	2ac2                	fld	fs5,16(sp)
 1aa:	0000                	unimp
 1ac:	0000452f          	0x452f
 1b0:	6ff1                	lui	t6,0x1c
 1b2:	0000                	unimp
 1b4:	b520                	fsd	fs0,104(a0)
 1b6:	0000                	unimp
 1b8:	2511                	jal	7bc <ans+0x664>
 1ba:	0001                	nop
 1bc:	da31                	beqz	a2,110 <fib+0x58>
 1be:	0001                	nop
 1c0:	ff42                	fsw	fa6,188(sp)
 1c2:	0002                	c.slli64	zero
 1c4:	0004d973          	csrrwi	s2,ustatus,9
 1c8:	d8b5                	beqz	s1,13c <fib+0x84>
 1ca:	b2280007          	0xb2280007
 1ce:	000c                	0xc
 1d0:	8add                	andi	a3,a3,23
 1d2:	0014                	0x14
 1d4:	3d05                	jal	4 <start+0x4>
 1d6:	0021                	c.nop	8
 1d8:	c7e2                	sw	s8,204(sp)
 1da:	0035                	c.nop	13
 1dc:	005704e7          	jalr	s1,5(a4)
 1e0:	ccc9                	beqz	s1,27a <ans+0x122>
 1e2:	008c                	addi	a1,sp,64
 1e4:	d1b0                	sw	a2,96(a1)
 1e6:	9e7900e3          	beq	s2,t2,fffffbc6 <ans+0xfffffa6e>
 1ea:	0170                	addi	a2,sp,140
 1ec:	7029                	c.lui	zero,0xfffea
 1ee:	0254                	addi	a3,sp,260
 1f0:	0ea2                	slli	t4,t4,0x8
 1f2:	03c5                	addi	t2,t2,17
 1f4:	06197ecb          	fnmsub.q	ft9,fs2,ft1,ft0

Disassembly of section .comment:

00000000 <.comment>:
   0:	3a434347          	fmsub.d	ft6,ft6,ft4,ft7,rmm
   4:	2820                	fld	fs0,80(s0)
   6:	29554e47          	fmsub.s	ft8,fa0,fs5,ft5,rmm
   a:	3820                	fld	fs0,112(s0)
   c:	322e                	fld	ft4,232(sp)
   e:	302e                	fld	ft0,232(sp)
	...
