
../riscv32/elf/movsx:     file format elf32-littleriscv


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
  48:	fe010113          	addi	sp,sp,-32 # 3fe0 <C+0x3e30>
  4c:	00912a23          	sw	s1,20(sp)
  50:	00812c23          	sw	s0,24(sp)
  54:	00100713          	li	a4,1
  58:	18800413          	li	s0,392
  5c:	01412423          	sw	s4,8(sp)
  60:	00300793          	li	a5,3
  64:	00e42223          	sw	a4,4(s0)
  68:	00200713          	li	a4,2
  6c:	01212823          	sw	s2,16(sp)
  70:	00e42423          	sw	a4,8(s0)
  74:	00400713          	li	a4,4
  78:	00f42623          	sw	a5,12(s0)
  7c:	18f02223          	sw	a5,388(zero) # 184 <b>
  80:	00f42a23          	sw	a5,20(s0)
  84:	00100513          	li	a0,1
  88:	06100793          	li	a5,97
  8c:	00112e23          	sw	ra,28(sp)
  90:	00e42823          	sw	a4,16(s0)
  94:	01312623          	sw	s3,12(sp)
  98:	1af00823          	sb	a5,432(zero) # 1b0 <C>
  9c:	18002423          	sw	zero,392(zero) # 188 <A>
  a0:	f85ff0ef          	jal	ra,24 <nemu_assert>
  a4:	1b000783          	lb	a5,432(zero) # 1b0 <C>
  a8:	1b000993          	li	s3,432
  ac:	f9f78513          	addi	a0,a5,-97
  b0:	00153513          	seqz	a0,a0
  b4:	00f980a3          	sb	a5,1(s3)
  b8:	f6dff0ef          	jal	ra,24 <nemu_assert>
  bc:	1b000783          	lb	a5,432(zero) # 1b0 <C>
  c0:	f9f78513          	addi	a0,a5,-97
  c4:	00153513          	seqz	a0,a0
  c8:	18f02423          	sw	a5,392(zero) # 188 <A>
  cc:	f59ff0ef          	jal	ra,24 <nemu_assert>
  d0:	00442503          	lw	a0,4(s0)
  d4:	f8000793          	li	a5,-128
  d8:	00f980a3          	sb	a5,1(s3)
  dc:	fff50513          	addi	a0,a0,-1
  e0:	f8000793          	li	a5,-128
  e4:	00153513          	seqz	a0,a0
  e8:	18f02423          	sw	a5,392(zero) # 188 <A>
  ec:	f39ff0ef          	jal	ra,24 <nemu_assert>
  f0:	00842503          	lw	a0,8(s0)
  f4:	ffe50513          	addi	a0,a0,-2
  f8:	00153513          	seqz	a0,a0
  fc:	f29ff0ef          	jal	ra,24 <nemu_assert>
 100:	00c42503          	lw	a0,12(s0)
 104:	ffd50513          	addi	a0,a0,-3
 108:	00153513          	seqz	a0,a0
 10c:	f19ff0ef          	jal	ra,24 <nemu_assert>
 110:	01042503          	lw	a0,16(s0)
 114:	ffc50513          	addi	a0,a0,-4
 118:	00153513          	seqz	a0,a0
 11c:	f09ff0ef          	jal	ra,24 <nemu_assert>
 120:	18402503          	lw	a0,388(zero) # 184 <b>
 124:	ffd50513          	addi	a0,a0,-3
 128:	00153513          	seqz	a0,a0
 12c:	ef9ff0ef          	jal	ra,24 <nemu_assert>
 130:	01442503          	lw	a0,20(s0)
 134:	ffd50513          	addi	a0,a0,-3
 138:	00153513          	seqz	a0,a0
 13c:	ee9ff0ef          	jal	ra,24 <nemu_assert>
 140:	00198503          	lb	a0,1(s3)
 144:	08050513          	addi	a0,a0,128
 148:	00153513          	seqz	a0,a0
 14c:	ed9ff0ef          	jal	ra,24 <nemu_assert>
 150:	18802503          	lw	a0,392(zero) # 188 <A>
 154:	08050513          	addi	a0,a0,128
 158:	00153513          	seqz	a0,a0
 15c:	ec9ff0ef          	jal	ra,24 <nemu_assert>
 160:	01c12083          	lw	ra,28(sp)
 164:	01812403          	lw	s0,24(sp)
 168:	01412483          	lw	s1,20(sp)
 16c:	01012903          	lw	s2,16(sp)
 170:	00c12983          	lw	s3,12(sp)
 174:	00812a03          	lw	s4,8(sp)
 178:	00000513          	li	a0,0
 17c:	02010113          	addi	sp,sp,32
 180:	00008067          	ret

Disassembly of section .bss:

00000184 <b>:
 184:	0000                	unimp
	...

00000188 <A>:
	...

000001b0 <C>:
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
