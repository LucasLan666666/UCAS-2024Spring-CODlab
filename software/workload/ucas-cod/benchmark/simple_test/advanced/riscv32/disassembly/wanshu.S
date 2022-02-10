
../riscv32/elf/wanshu:     file format elf32-littleriscv


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
  48:	fe010113          	addi	sp,sp,-32 # 3fe0 <ans+0x3ed8>
  4c:	00100693          	li	a3,1
  50:	00812c23          	sw	s0,24(sp)
  54:	00912a23          	sw	s1,20(sp)
  58:	01212823          	sw	s2,16(sp)
  5c:	01312623          	sw	s3,12(sp)
  60:	00112e23          	sw	ra,28(sp)
  64:	01e00493          	li	s1,30
  68:	00168413          	addi	s0,a3,1
  6c:	00000913          	li	s2,0
  70:	10800993          	li	s3,264
  74:	04940263          	beq	s0,s1,b8 <main+0x70>
  78:	00100713          	li	a4,1
  7c:	00000613          	li	a2,0
  80:	00040793          	mv	a5,s0
  84:	00e44a63          	blt	s0,a4,98 <main+0x50>
  88:	40e787b3          	sub	a5,a5,a4
  8c:	fee7dee3          	bge	a5,a4,88 <main+0x40>
  90:	00079463          	bnez	a5,98 <main+0x50>
  94:	00e60633          	add	a2,a2,a4
  98:	00170793          	addi	a5,a4,1
  9c:	00e68663          	beq	a3,a4,a8 <main+0x60>
  a0:	00078713          	mv	a4,a5
  a4:	fddff06f          	j	80 <main+0x38>
  a8:	02860e63          	beq	a2,s0,e4 <main+0x9c>
  ac:	00040693          	mv	a3,s0
  b0:	00168413          	addi	s0,a3,1
  b4:	fc9412e3          	bne	s0,s1,78 <main+0x30>
  b8:	ffe90513          	addi	a0,s2,-2
  bc:	00153513          	seqz	a0,a0
  c0:	f65ff0ef          	jal	ra,24 <nemu_assert>
  c4:	01c12083          	lw	ra,28(sp)
  c8:	01812403          	lw	s0,24(sp)
  cc:	01412483          	lw	s1,20(sp)
  d0:	01012903          	lw	s2,16(sp)
  d4:	00c12983          	lw	s3,12(sp)
  d8:	00000513          	li	a0,0
  dc:	02010113          	addi	sp,sp,32
  e0:	00008067          	ret
  e4:	00291793          	slli	a5,s2,0x2
  e8:	013787b3          	add	a5,a5,s3
  ec:	0007a503          	lw	a0,0(a5)
  f0:	00190913          	addi	s2,s2,1
  f4:	40850533          	sub	a0,a0,s0
  f8:	00153513          	seqz	a0,a0
  fc:	f29ff0ef          	jal	ra,24 <nemu_assert>
 100:	00040693          	mv	a3,s0
 104:	fadff06f          	j	b0 <main+0x68>

Disassembly of section .sdata:

00000108 <ans>:
 108:	0006                	c.slli	zero,0x1
 10a:	0000                	unimp
 10c:	001c                	0x1c
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
