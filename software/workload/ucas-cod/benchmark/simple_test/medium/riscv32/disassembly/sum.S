
../riscv32/elf/sum:     file format elf32-littleriscv


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
  48:	fe010113          	addi	sp,sp,-32 # 3fe0 <main+0x3f98>
  4c:	00112e23          	sw	ra,28(sp)
  50:	00012623          	sw	zero,12(sp)
  54:	00100793          	li	a5,1
  58:	06500693          	li	a3,101
  5c:	00c12703          	lw	a4,12(sp)
  60:	00f70733          	add	a4,a4,a5
  64:	00e12623          	sw	a4,12(sp)
  68:	00178793          	addi	a5,a5,1
  6c:	fed798e3          	bne	a5,a3,5c <main+0x14>
  70:	00c12503          	lw	a0,12(sp)
  74:	fffff7b7          	lui	a5,0xfffff
  78:	c4678793          	addi	a5,a5,-954 # ffffec46 <main+0xffffebfe>
  7c:	00f50533          	add	a0,a0,a5
  80:	00153513          	seqz	a0,a0
  84:	fa1ff0ef          	jal	ra,24 <nemu_assert>
  88:	01c12083          	lw	ra,28(sp)
  8c:	00000513          	li	a0,0
  90:	02010113          	addi	sp,sp,32
  94:	00008067          	ret

Disassembly of section .comment:

00000000 <.comment>:
   0:	3a434347          	fmsub.d	ft6,ft6,ft4,ft7,rmm
   4:	2820                	fld	fs0,80(s0)
   6:	29554e47          	fmsub.s	ft8,fa0,fs5,ft5,rmm
   a:	3820                	fld	fs0,112(s0)
   c:	322e                	fld	ft4,232(sp)
   e:	302e                	fld	ft0,232(sp)
	...
