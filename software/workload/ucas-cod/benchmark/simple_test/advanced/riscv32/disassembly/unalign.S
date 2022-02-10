
../riscv32/elf/unalign:     file format elf32-littleriscv


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
  48:	ff010113          	addi	sp,sp,-16 # 3ff0 <buf+0x3f18>
  4c:	00112623          	sw	ra,12(sp)
  50:	0d800793          	li	a5,216
  54:	0037c703          	lbu	a4,3(a5)
  58:	55443537          	lui	a0,0x55443
  5c:	fdd00713          	li	a4,-35
  60:	00e781a3          	sb	a4,3(a5)
  64:	0047c703          	lbu	a4,4(a5)
  68:	32350513          	addi	a0,a0,803 # 55443323 <buf+0x5544324b>
  6c:	fcc00713          	li	a4,-52
  70:	00e78223          	sb	a4,4(a5)
  74:	0057c703          	lbu	a4,5(a5)
  78:	fbb00713          	li	a4,-69
  7c:	00e782a3          	sb	a4,5(a5)
  80:	0067c703          	lbu	a4,6(a5)
  84:	faa00713          	li	a4,-86
  88:	00e78323          	sb	a4,6(a5)
  8c:	0037c603          	lbu	a2,3(a5)
  90:	0047c683          	lbu	a3,4(a5)
  94:	0057c703          	lbu	a4,5(a5)
  98:	0067c783          	lbu	a5,6(a5)
  9c:	00869693          	slli	a3,a3,0x8
  a0:	00c6e6b3          	or	a3,a3,a2
  a4:	01071713          	slli	a4,a4,0x10
  a8:	00d76733          	or	a4,a4,a3
  ac:	01879793          	slli	a5,a5,0x18
  b0:	00e7e7b3          	or	a5,a5,a4
  b4:	00a78533          	add	a0,a5,a0
  b8:	00153513          	seqz	a0,a0
  bc:	0cf02a23          	sw	a5,212(zero) # d4 <x>
  c0:	f65ff0ef          	jal	ra,24 <nemu_assert>
  c4:	00c12083          	lw	ra,12(sp)
  c8:	00000513          	li	a0,0
  cc:	01010113          	addi	sp,sp,16
  d0:	00008067          	ret

Disassembly of section .sdata:

000000d4 <x>:
  d4:	ffff                	0xffff
  d6:	ffff                	0xffff

Disassembly of section .bss:

000000d8 <buf>:
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
