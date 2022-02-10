
../riscv32/elf/prime:     file format elf32-littleriscv


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
  48:	fe010113          	addi	sp,sp,-32 # 3fe0 <ans+0x3f00>
  4c:	01312623          	sw	s3,12(sp)
  50:	00812c23          	sw	s0,24(sp)
  54:	00912a23          	sw	s1,20(sp)
  58:	01212823          	sw	s2,16(sp)
  5c:	00112e23          	sw	ra,28(sp)
  60:	00000493          	li	s1,0
  64:	06500413          	li	s0,101
  68:	0e000993          	li	s3,224
  6c:	09700913          	li	s2,151
  70:	00200713          	li	a4,2
  74:	00040793          	mv	a5,s0
  78:	00e44863          	blt	s0,a4,88 <main+0x40>
  7c:	40e787b3          	sub	a5,a5,a4
  80:	fee7dee3          	bge	a5,a4,7c <main+0x34>
  84:	02078463          	beqz	a5,ac <main+0x64>
  88:	00170713          	addi	a4,a4,1
  8c:	fe8714e3          	bne	a4,s0,74 <main+0x2c>
  90:	00249793          	slli	a5,s1,0x2
  94:	00f987b3          	add	a5,s3,a5
  98:	0007a503          	lw	a0,0(a5)
  9c:	00148493          	addi	s1,s1,1
  a0:	40850533          	sub	a0,a0,s0
  a4:	00153513          	seqz	a0,a0
  a8:	f7dff0ef          	jal	ra,24 <nemu_assert>
  ac:	00240413          	addi	s0,s0,2
  b0:	fd2410e3          	bne	s0,s2,70 <main+0x28>
  b4:	ff648513          	addi	a0,s1,-10
  b8:	00153513          	seqz	a0,a0
  bc:	f69ff0ef          	jal	ra,24 <nemu_assert>
  c0:	01c12083          	lw	ra,28(sp)
  c4:	01812403          	lw	s0,24(sp)
  c8:	01412483          	lw	s1,20(sp)
  cc:	01012903          	lw	s2,16(sp)
  d0:	00c12983          	lw	s3,12(sp)
  d4:	00000513          	li	a0,0
  d8:	02010113          	addi	sp,sp,32
  dc:	00008067          	ret

Disassembly of section .data:

000000e0 <ans>:
  e0:	0065                	c.nop	25
  e2:	0000                	unimp
  e4:	00000067          	jr	zero # 0 <start>
  e8:	0000006b          	0x6b
  ec:	006d                	c.nop	27
  ee:	0000                	unimp
  f0:	0071                	c.nop	28
  f2:	0000                	unimp
  f4:	007f                	0x7f
  f6:	0000                	unimp
  f8:	00000083          	lb	ra,0(zero) # 0 <start>
  fc:	0089                	addi	ra,ra,2
  fe:	0000                	unimp
 100:	0000008b          	0x8b
 104:	0095                	addi	ra,ra,5
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
