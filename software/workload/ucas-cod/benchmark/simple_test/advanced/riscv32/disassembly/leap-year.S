
../riscv32/elf/leap-year:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <start>:
   0:	00004137          	lui	sp,0x4
   4:	00c0006f          	j	10 <continued>
   8:	00000013          	nop

0000000c <global_result>:
   c:	ffff                	0xffff
   e:	ffff                	0xffff

00000010 <continued>:
  10:	098000ef          	jal	ra,a8 <main>
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

00000048 <is_leap_year>:
  48:	00300713          	li	a4,3
  4c:	00050793          	mv	a5,a0
  50:	04a75863          	bge	a4,a0,a0 <is_leap_year+0x58>
  54:	00357713          	andi	a4,a0,3
  58:	02071263          	bnez	a4,7c <is_leap_year+0x34>
  5c:	06300713          	li	a4,99
  60:	02f75c63          	bge	a4,a5,98 <is_leap_year+0x50>
  64:	00078713          	mv	a4,a5
  68:	06300693          	li	a3,99
  6c:	f9c70713          	addi	a4,a4,-100
  70:	fee6cee3          	blt	a3,a4,6c <is_leap_year+0x24>
  74:	00100513          	li	a0,1
  78:	00071e63          	bnez	a4,94 <is_leap_year+0x4c>
  7c:	18f00693          	li	a3,399
  80:	18f00713          	li	a4,399
  84:	00f6d663          	bge	a3,a5,90 <is_leap_year+0x48>
  88:	e7078793          	addi	a5,a5,-400
  8c:	fef74ee3          	blt	a4,a5,88 <is_leap_year+0x40>
  90:	0017b513          	seqz	a0,a5
  94:	00008067          	ret
  98:	00078713          	mv	a4,a5
  9c:	fd9ff06f          	j	74 <is_leap_year+0x2c>
  a0:	00050713          	mv	a4,a0
  a4:	fb5ff06f          	j	58 <is_leap_year+0x10>

Disassembly of section .text.startup:

000000a8 <main>:
  a8:	fe010113          	addi	sp,sp,-32 # 3fe0 <ans+0x3e9c>
  ac:	01312623          	sw	s3,12(sp)
  b0:	00812c23          	sw	s0,24(sp)
  b4:	00912a23          	sw	s1,20(sp)
  b8:	01212823          	sw	s2,16(sp)
  bc:	01412423          	sw	s4,8(sp)
  c0:	00112e23          	sw	ra,28(sp)
  c4:	14400993          	li	s3,324
  c8:	75e00493          	li	s1,1886
  cc:	18f00413          	li	s0,399
  d0:	06300913          	li	s2,99
  d4:	7db00a13          	li	s4,2011
  d8:	0034f713          	andi	a4,s1,3
  dc:	00448793          	addi	a5,s1,4
  e0:	00071c63          	bnez	a4,f8 <main+0x50>
  e4:	00078713          	mv	a4,a5
  e8:	f9c70713          	addi	a4,a4,-100
  ec:	fee94ee3          	blt	s2,a4,e8 <main+0x40>
  f0:	00100693          	li	a3,1
  f4:	00071863          	bnez	a4,104 <main+0x5c>
  f8:	e7078793          	addi	a5,a5,-400
  fc:	fef44ee3          	blt	s0,a5,f8 <main+0x50>
 100:	0017b693          	seqz	a3,a5
 104:	0009a503          	lw	a0,0(s3)
 108:	00148493          	addi	s1,s1,1
 10c:	00498993          	addi	s3,s3,4
 110:	40d50533          	sub	a0,a0,a3
 114:	00153513          	seqz	a0,a0
 118:	f0dff0ef          	jal	ra,24 <nemu_assert>
 11c:	fb449ee3          	bne	s1,s4,d8 <main+0x30>
 120:	01c12083          	lw	ra,28(sp)
 124:	01812403          	lw	s0,24(sp)
 128:	01412483          	lw	s1,20(sp)
 12c:	01012903          	lw	s2,16(sp)
 130:	00c12983          	lw	s3,12(sp)
 134:	00812a03          	lw	s4,8(sp)
 138:	00000513          	li	a0,0
 13c:	02010113          	addi	sp,sp,32
 140:	00008067          	ret

Disassembly of section .data:

00000144 <ans>:
	...
 14c:	0001                	nop
	...
 15a:	0000                	unimp
 15c:	0001                	nop
	...
 17a:	0000                	unimp
 17c:	0001                	nop
	...
 18a:	0000                	unimp
 18c:	0001                	nop
	...
 19a:	0000                	unimp
 19c:	0001                	nop
	...
 1aa:	0000                	unimp
 1ac:	0001                	nop
	...
 1ba:	0000                	unimp
 1bc:	0001                	nop
	...
 1ca:	0000                	unimp
 1cc:	0001                	nop
	...
 1da:	0000                	unimp
 1dc:	0001                	nop
	...
 1ea:	0000                	unimp
 1ec:	0001                	nop
	...
 1fa:	0000                	unimp
 1fc:	0001                	nop
	...
 20a:	0000                	unimp
 20c:	0001                	nop
	...
 21a:	0000                	unimp
 21c:	0001                	nop
	...
 22a:	0000                	unimp
 22c:	0001                	nop
	...
 23a:	0000                	unimp
 23c:	0001                	nop
	...
 24a:	0000                	unimp
 24c:	0001                	nop
	...
 25a:	0000                	unimp
 25c:	0001                	nop
	...
 26a:	0000                	unimp
 26c:	0001                	nop
	...
 27a:	0000                	unimp
 27c:	0001                	nop
	...
 28a:	0000                	unimp
 28c:	0001                	nop
	...
 29a:	0000                	unimp
 29c:	0001                	nop
	...
 2aa:	0000                	unimp
 2ac:	0001                	nop
	...
 2ba:	0000                	unimp
 2bc:	0001                	nop
	...
 2ca:	0000                	unimp
 2cc:	0001                	nop
	...
 2da:	0000                	unimp
 2dc:	0001                	nop
	...
 2ea:	0000                	unimp
 2ec:	0001                	nop
	...
 2fa:	0000                	unimp
 2fc:	0001                	nop
	...
 30a:	0000                	unimp
 30c:	0001                	nop
	...
 31a:	0000                	unimp
 31c:	0001                	nop
	...
 32a:	0000                	unimp
 32c:	0001                	nop
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
