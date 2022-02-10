
../riscv32/elf/add:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <start>:
   0:	00004137          	lui	sp,0x4
   4:	00c0006f          	j	10 <continued>
   8:	00000013          	nop

0000000c <global_result>:
   c:	ffff                	0xffff
   e:	ffff                	0xffff

00000010 <continued>:
  10:	040000ef          	jal	ra,50 <main>
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

00000048 <add>:
  48:	00b50533          	add	a0,a0,a1
  4c:	00008067          	ret

Disassembly of section .text.startup:

00000050 <main>:
  50:	fe010113          	addi	sp,sp,-32 # 3fe0 <test_data+0x3dec>
  54:	01412423          	sw	s4,8(sp)
  58:	0f400a13          	li	s4,244
  5c:	01512223          	sw	s5,4(sp)
  60:	100a0a93          	addi	s5,s4,256
  64:	01212823          	sw	s2,16(sp)
  68:	01312623          	sw	s3,12(sp)
  6c:	00112e23          	sw	ra,28(sp)
  70:	00812c23          	sw	s0,24(sp)
  74:	00912a23          	sw	s1,20(sp)
  78:	120a0993          	addi	s3,s4,288
  7c:	000a8913          	mv	s2,s5
  80:	000a0493          	mv	s1,s4
  84:	000a8413          	mv	s0,s5
  88:	00042703          	lw	a4,0(s0)
  8c:	00092503          	lw	a0,0(s2)
  90:	0004a783          	lw	a5,0(s1)
  94:	00440413          	addi	s0,s0,4
  98:	00e50533          	add	a0,a0,a4
  9c:	40f50533          	sub	a0,a0,a5
  a0:	00153513          	seqz	a0,a0
  a4:	f81ff0ef          	jal	ra,24 <nemu_assert>
  a8:	00448493          	addi	s1,s1,4
  ac:	fd341ee3          	bne	s0,s3,88 <main+0x38>
  b0:	00100513          	li	a0,1
  b4:	00490913          	addi	s2,s2,4
  b8:	f6dff0ef          	jal	ra,24 <nemu_assert>
  bc:	020a0a13          	addi	s4,s4,32
  c0:	fc8910e3          	bne	s2,s0,80 <main+0x30>
  c4:	00100513          	li	a0,1
  c8:	f5dff0ef          	jal	ra,24 <nemu_assert>
  cc:	01c12083          	lw	ra,28(sp)
  d0:	01812403          	lw	s0,24(sp)
  d4:	01412483          	lw	s1,20(sp)
  d8:	01012903          	lw	s2,16(sp)
  dc:	00c12983          	lw	s3,12(sp)
  e0:	00812a03          	lw	s4,8(sp)
  e4:	00412a83          	lw	s5,4(sp)
  e8:	00000513          	li	a0,0
  ec:	02010113          	addi	sp,sp,32
  f0:	00008067          	ret

Disassembly of section .data:

000000f4 <ans>:
  f4:	0000                	unimp
  f6:	0000                	unimp
  f8:	0001                	nop
  fa:	0000                	unimp
  fc:	0002                	c.slli64	zero
  fe:	0000                	unimp
 100:	ffff                	0xffff
 102:	7fff                	0x7fff
 104:	0000                	unimp
 106:	8000                	0x8000
 108:	0001                	nop
 10a:	8000                	0x8000
 10c:	fffe                	fsw	ft11,252(sp)
 10e:	ffff                	0xffff
 110:	ffff                	0xffff
 112:	ffff                	0xffff
 114:	0001                	nop
 116:	0000                	unimp
 118:	0002                	c.slli64	zero
 11a:	0000                	unimp
 11c:	00000003          	lb	zero,0(zero) # 0 <start>
 120:	0000                	unimp
 122:	8000                	0x8000
 124:	0001                	nop
 126:	8000                	0x8000
 128:	0002                	c.slli64	zero
 12a:	8000                	0x8000
 12c:	ffff                	0xffff
 12e:	ffff                	0xffff
 130:	0000                	unimp
 132:	0000                	unimp
 134:	0002                	c.slli64	zero
 136:	0000                	unimp
 138:	00000003          	lb	zero,0(zero) # 0 <start>
 13c:	0004                	0x4
 13e:	0000                	unimp
 140:	0001                	nop
 142:	8000                	0x8000
 144:	0002                	c.slli64	zero
 146:	8000                	0x8000
 148:	80000003          	lb	zero,-2048(zero) # fffff800 <test_data+0xfffff60c>
 14c:	0000                	unimp
 14e:	0000                	unimp
 150:	0001                	nop
 152:	0000                	unimp
 154:	ffff                	0xffff
 156:	7fff                	0x7fff
 158:	0000                	unimp
 15a:	8000                	0x8000
 15c:	0001                	nop
 15e:	8000                	0x8000
 160:	fffe                	fsw	ft11,252(sp)
 162:	ffff                	0xffff
 164:	ffff                	0xffff
 166:	ffff                	0xffff
 168:	0000                	unimp
 16a:	0000                	unimp
 16c:	fffd                	bnez	a5,16a <ans+0x76>
 16e:	7fff                	0x7fff
 170:	fffe                	fsw	ft11,252(sp)
 172:	7fff                	0x7fff
 174:	0000                	unimp
 176:	8000                	0x8000
 178:	0001                	nop
 17a:	8000                	0x8000
 17c:	0002                	c.slli64	zero
 17e:	8000                	0x8000
 180:	ffff                	0xffff
 182:	ffff                	0xffff
 184:	0000                	unimp
 186:	0000                	unimp
 188:	0001                	nop
 18a:	0000                	unimp
 18c:	fffe                	fsw	ft11,252(sp)
 18e:	7fff                	0x7fff
 190:	ffff                	0xffff
 192:	7fff                	0x7fff
 194:	0001                	nop
 196:	8000                	0x8000
 198:	0002                	c.slli64	zero
 19a:	8000                	0x8000
 19c:	80000003          	lb	zero,-2048(zero) # fffff800 <test_data+0xfffff60c>
 1a0:	0000                	unimp
 1a2:	0000                	unimp
 1a4:	0001                	nop
 1a6:	0000                	unimp
 1a8:	0002                	c.slli64	zero
 1aa:	0000                	unimp
 1ac:	ffff                	0xffff
 1ae:	7fff                	0x7fff
 1b0:	0000                	unimp
 1b2:	8000                	0x8000
 1b4:	fffe                	fsw	ft11,252(sp)
 1b6:	ffff                	0xffff
 1b8:	ffff                	0xffff
 1ba:	ffff                	0xffff
 1bc:	0000                	unimp
 1be:	0000                	unimp
 1c0:	fffd                	bnez	a5,1be <ans+0xca>
 1c2:	7fff                	0x7fff
 1c4:	fffe                	fsw	ft11,252(sp)
 1c6:	7fff                	0x7fff
 1c8:	ffff                	0xffff
 1ca:	7fff                	0x7fff
 1cc:	fffc                	fsw	fa5,124(a5)
 1ce:	ffff                	0xffff
 1d0:	fffd                	bnez	a5,1ce <ans+0xda>
 1d2:	ffff                	0xffff
 1d4:	ffff                	0xffff
 1d6:	ffff                	0xffff
 1d8:	0000                	unimp
 1da:	0000                	unimp
 1dc:	0001                	nop
 1de:	0000                	unimp
 1e0:	fffe                	fsw	ft11,252(sp)
 1e2:	7fff                	0x7fff
 1e4:	ffff                	0xffff
 1e6:	7fff                	0x7fff
 1e8:	0000                	unimp
 1ea:	8000                	0x8000
 1ec:	fffd                	bnez	a5,1ea <ans+0xf6>
 1ee:	ffff                	0xffff
 1f0:	fffe                	fsw	ft11,252(sp)
 1f2:	ffff                	0xffff

000001f4 <test_data>:
 1f4:	0000                	unimp
 1f6:	0000                	unimp
 1f8:	0001                	nop
 1fa:	0000                	unimp
 1fc:	0002                	c.slli64	zero
 1fe:	0000                	unimp
 200:	ffff                	0xffff
 202:	7fff                	0x7fff
 204:	0000                	unimp
 206:	8000                	0x8000
 208:	0001                	nop
 20a:	8000                	0x8000
 20c:	fffe                	fsw	ft11,252(sp)
 20e:	ffff                	0xffff
 210:	ffff                	0xffff
 212:	ffff                	0xffff

Disassembly of section .comment:

00000000 <.comment>:
   0:	3a434347          	fmsub.d	ft6,ft6,ft4,ft7,rmm
   4:	2820                	fld	fs0,80(s0)
   6:	29554e47          	fmsub.s	ft8,fa0,fs5,ft5,rmm
   a:	3820                	fld	fs0,112(s0)
   c:	322e                	fld	ft4,232(sp)
   e:	302e                	fld	ft0,232(sp)
	...
