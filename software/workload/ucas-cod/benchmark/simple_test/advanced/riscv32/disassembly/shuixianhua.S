
../riscv32/elf/shuixianhua:     file format elf32-littleriscv


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

00000048 <cube>:
  48:	00100313          	li	t1,1
  4c:	00a04463          	bgtz	a0,54 <cube+0xc>
  50:	fff00313          	li	t1,-1
  54:	41f55793          	srai	a5,a0,0x1f
  58:	00a7c6b3          	xor	a3,a5,a0
  5c:	40f686b3          	sub	a3,a3,a5
  60:	00068613          	mv	a2,a3
  64:	00000593          	li	a1,0
  68:	00000793          	li	a5,0
  6c:	02000893          	li	a7,32
  70:	00167713          	andi	a4,a2,1
  74:	00f51833          	sll	a6,a0,a5
  78:	00178793          	addi	a5,a5,1
  7c:	00070463          	beqz	a4,84 <cube+0x3c>
  80:	010585b3          	add	a1,a1,a6
  84:	40165613          	srai	a2,a2,0x1
  88:	ff1794e3          	bne	a5,a7,70 <cube+0x28>
  8c:	00100793          	li	a5,1
  90:	00f30463          	beq	t1,a5,98 <cube+0x50>
  94:	40b005b3          	neg	a1,a1
  98:	00000513          	li	a0,0
  9c:	00000793          	li	a5,0
  a0:	02000813          	li	a6,32
  a4:	0016f713          	andi	a4,a3,1
  a8:	00f59633          	sll	a2,a1,a5
  ac:	00178793          	addi	a5,a5,1
  b0:	00070463          	beqz	a4,b8 <cube+0x70>
  b4:	00c50533          	add	a0,a0,a2
  b8:	4016d693          	srai	a3,a3,0x1
  bc:	ff0794e3          	bne	a5,a6,a4 <cube+0x5c>
  c0:	00100793          	li	a5,1
  c4:	00f31463          	bne	t1,a5,cc <cube+0x84>
  c8:	00008067          	ret
  cc:	40a00533          	neg	a0,a0
  d0:	00008067          	ret

Disassembly of section .text.startup:

000000d4 <main>:
  d4:	fd010113          	addi	sp,sp,-48 # 3fd0 <ans+0x3dec>
  d8:	01712623          	sw	s7,12(sp)
  dc:	03212023          	sw	s2,32(sp)
  e0:	01312e23          	sw	s3,28(sp)
  e4:	01412c23          	sw	s4,24(sp)
  e8:	01512a23          	sw	s5,20(sp)
  ec:	01612823          	sw	s6,16(sp)
  f0:	02112623          	sw	ra,44(sp)
  f4:	02812423          	sw	s0,40(sp)
  f8:	02912223          	sw	s1,36(sp)
  fc:	01812423          	sw	s8,8(sp)
 100:	00000b13          	li	s6,0
 104:	06400a13          	li	s4,100
 108:	06300993          	li	s3,99
 10c:	00900913          	li	s2,9
 110:	1e400b93          	li	s7,484
 114:	1f400a93          	li	s5,500
 118:	000a0793          	mv	a5,s4
 11c:	00000513          	li	a0,0
 120:	f9c78793          	addi	a5,a5,-100
 124:	00150513          	addi	a0,a0,1
 128:	fef9cce3          	blt	s3,a5,120 <main+0x4c>
 12c:	000a0793          	mv	a5,s4
 130:	00000413          	li	s0,0
 134:	ff678793          	addi	a5,a5,-10
 138:	00140413          	addi	s0,s0,1
 13c:	fef94ce3          	blt	s2,a5,134 <main+0x60>
 140:	00895663          	bge	s2,s0,14c <main+0x78>
 144:	ff640413          	addi	s0,s0,-10
 148:	fe894ee3          	blt	s2,s0,144 <main+0x70>
 14c:	000a0493          	mv	s1,s4
 150:	ff648493          	addi	s1,s1,-10
 154:	fe994ee3          	blt	s2,s1,150 <main+0x7c>
 158:	ef1ff0ef          	jal	ra,48 <cube>
 15c:	00050c13          	mv	s8,a0
 160:	00040513          	mv	a0,s0
 164:	ee5ff0ef          	jal	ra,48 <cube>
 168:	00ac0c33          	add	s8,s8,a0
 16c:	00048513          	mv	a0,s1
 170:	ed9ff0ef          	jal	ra,48 <cube>
 174:	00ac0533          	add	a0,s8,a0
 178:	05450663          	beq	a0,s4,1c4 <main+0xf0>
 17c:	001a0a13          	addi	s4,s4,1
 180:	f95a1ce3          	bne	s4,s5,118 <main+0x44>
 184:	ffcb0513          	addi	a0,s6,-4
 188:	00153513          	seqz	a0,a0
 18c:	e99ff0ef          	jal	ra,24 <nemu_assert>
 190:	02c12083          	lw	ra,44(sp)
 194:	02812403          	lw	s0,40(sp)
 198:	02412483          	lw	s1,36(sp)
 19c:	02012903          	lw	s2,32(sp)
 1a0:	01c12983          	lw	s3,28(sp)
 1a4:	01812a03          	lw	s4,24(sp)
 1a8:	01412a83          	lw	s5,20(sp)
 1ac:	01012b03          	lw	s6,16(sp)
 1b0:	00c12b83          	lw	s7,12(sp)
 1b4:	00812c03          	lw	s8,8(sp)
 1b8:	00000513          	li	a0,0
 1bc:	03010113          	addi	sp,sp,48
 1c0:	00008067          	ret
 1c4:	002b1793          	slli	a5,s6,0x2
 1c8:	00fb87b3          	add	a5,s7,a5
 1cc:	0007a503          	lw	a0,0(a5)
 1d0:	001b0b13          	addi	s6,s6,1
 1d4:	41450533          	sub	a0,a0,s4
 1d8:	00153513          	seqz	a0,a0
 1dc:	e49ff0ef          	jal	ra,24 <nemu_assert>
 1e0:	f9dff06f          	j	17c <main+0xa8>

Disassembly of section .data:

000001e4 <ans>:
 1e4:	0099                	addi	ra,ra,6
 1e6:	0000                	unimp
 1e8:	0172                	slli	sp,sp,0x1c
 1ea:	0000                	unimp
 1ec:	00000173          	0x173
 1f0:	00000197          	auipc	gp,0x0

Disassembly of section .comment:

00000000 <.comment>:
   0:	3a434347          	fmsub.d	ft6,ft6,ft4,ft7,rmm
   4:	2820                	fld	fs0,80(s0)
   6:	29554e47          	fmsub.s	ft8,fa0,fs5,ft5,rmm
   a:	3820                	fld	fs0,112(s0)
   c:	322e                	fld	ft4,232(sp)
   e:	302e                	fld	ft0,232(sp)
	...
