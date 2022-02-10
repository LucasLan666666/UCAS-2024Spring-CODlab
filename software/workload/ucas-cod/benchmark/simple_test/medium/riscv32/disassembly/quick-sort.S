
../riscv32/elf/quick-sort:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <start>:
   0:	00004137          	lui	sp,0x4
   4:	00c0006f          	j	10 <continued>
   8:	00000013          	nop

0000000c <global_result>:
   c:	ffff                	0xffff
   e:	ffff                	0xffff

00000010 <continued>:
  10:	148000ef          	jal	ra,158 <main>
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

00000048 <partition>:
  48:	00259793          	slli	a5,a1,0x2
  4c:	00f50333          	add	t1,a0,a5
  50:	00032883          	lw	a7,0(t1)
  54:	08c5d663          	bge	a1,a2,e0 <partition+0x98>
  58:	00261693          	slli	a3,a2,0x2
  5c:	00d506b3          	add	a3,a0,a3
  60:	0006a703          	lw	a4,0(a3)
  64:	00068813          	mv	a6,a3
  68:	02e8dc63          	bge	a7,a4,a0 <partition+0x58>
  6c:	fff60613          	addi	a2,a2,-1
  70:	ffc80693          	addi	a3,a6,-4
  74:	fec5c6e3          	blt	a1,a2,60 <partition+0x18>
  78:	00261613          	slli	a2,a2,0x2
  7c:	00c50833          	add	a6,a0,a2
  80:	00082703          	lw	a4,0(a6)
  84:	00f50333          	add	t1,a0,a5
  88:	00058613          	mv	a2,a1
  8c:	00e32023          	sw	a4,0(t1)
  90:	00e82023          	sw	a4,0(a6)
  94:	00060513          	mv	a0,a2
  98:	01132023          	sw	a7,0(t1)
  9c:	00008067          	ret
  a0:	00f50333          	add	t1,a0,a5
  a4:	00e32023          	sw	a4,0(t1)
  a8:	02c5d863          	bge	a1,a2,d8 <partition+0x90>
  ac:	00478793          	addi	a5,a5,4
  b0:	00f507b3          	add	a5,a0,a5
  b4:	00158593          	addi	a1,a1,1
  b8:	0007a703          	lw	a4,0(a5)
  bc:	00078313          	mv	t1,a5
  c0:	fcc588e3          	beq	a1,a2,90 <partition+0x48>
  c4:	00478793          	addi	a5,a5,4
  c8:	fee8d6e3          	bge	a7,a4,b4 <partition+0x6c>
  cc:	00e6a023          	sw	a4,0(a3)
  d0:	00259793          	slli	a5,a1,0x2
  d4:	f85ff06f          	j	58 <partition+0x10>
  d8:	00058613          	mv	a2,a1
  dc:	fb5ff06f          	j	90 <partition+0x48>
  e0:	00058513          	mv	a0,a1
  e4:	01132023          	sw	a7,0(t1)
  e8:	00008067          	ret

000000ec <quick_sort>:
  ec:	06c5d463          	bge	a1,a2,154 <quick_sort+0x68>
  f0:	ff010113          	addi	sp,sp,-16 # 3ff0 <a+0x3dd8>
  f4:	00812423          	sw	s0,8(sp)
  f8:	00912223          	sw	s1,4(sp)
  fc:	01212023          	sw	s2,0(sp)
 100:	00112623          	sw	ra,12(sp)
 104:	00058413          	mv	s0,a1
 108:	00060493          	mv	s1,a2
 10c:	00050913          	mv	s2,a0
 110:	00040593          	mv	a1,s0
 114:	00048613          	mv	a2,s1
 118:	00090513          	mv	a0,s2
 11c:	f2dff0ef          	jal	ra,48 <partition>
 120:	00050793          	mv	a5,a0
 124:	00040593          	mv	a1,s0
 128:	fff50613          	addi	a2,a0,-1
 12c:	00178413          	addi	s0,a5,1
 130:	00090513          	mv	a0,s2
 134:	fb9ff0ef          	jal	ra,ec <quick_sort>
 138:	fc944ce3          	blt	s0,s1,110 <quick_sort+0x24>
 13c:	00c12083          	lw	ra,12(sp)
 140:	00812403          	lw	s0,8(sp)
 144:	00412483          	lw	s1,4(sp)
 148:	00012903          	lw	s2,0(sp)
 14c:	01010113          	addi	sp,sp,16
 150:	00008067          	ret
 154:	00008067          	ret

Disassembly of section .text.startup:

00000158 <main>:
 158:	fe010113          	addi	sp,sp,-32
 15c:	01412423          	sw	s4,8(sp)
 160:	01300613          	li	a2,19
 164:	00000593          	li	a1,0
 168:	21800513          	li	a0,536
 16c:	00812c23          	sw	s0,24(sp)
 170:	00912a23          	sw	s1,20(sp)
 174:	01212823          	sw	s2,16(sp)
 178:	01312623          	sw	s3,12(sp)
 17c:	00112e23          	sw	ra,28(sp)
 180:	21800493          	li	s1,536
 184:	f69ff0ef          	jal	ra,ec <quick_sort>
 188:	21800913          	li	s2,536
 18c:	00000413          	li	s0,0
 190:	01400993          	li	s3,20
 194:	00092503          	lw	a0,0(s2)
 198:	00490913          	addi	s2,s2,4
 19c:	40850533          	sub	a0,a0,s0
 1a0:	00153513          	seqz	a0,a0
 1a4:	00140413          	addi	s0,s0,1
 1a8:	e7dff0ef          	jal	ra,24 <nemu_assert>
 1ac:	ff3414e3          	bne	s0,s3,194 <main+0x3c>
 1b0:	00100513          	li	a0,1
 1b4:	e71ff0ef          	jal	ra,24 <nemu_assert>
 1b8:	01300613          	li	a2,19
 1bc:	00000593          	li	a1,0
 1c0:	21800513          	li	a0,536
 1c4:	f29ff0ef          	jal	ra,ec <quick_sort>
 1c8:	00000413          	li	s0,0
 1cc:	01400913          	li	s2,20
 1d0:	0004a503          	lw	a0,0(s1)
 1d4:	00448493          	addi	s1,s1,4
 1d8:	40850533          	sub	a0,a0,s0
 1dc:	00153513          	seqz	a0,a0
 1e0:	00140413          	addi	s0,s0,1
 1e4:	e41ff0ef          	jal	ra,24 <nemu_assert>
 1e8:	ff2414e3          	bne	s0,s2,1d0 <main+0x78>
 1ec:	00100513          	li	a0,1
 1f0:	e35ff0ef          	jal	ra,24 <nemu_assert>
 1f4:	01c12083          	lw	ra,28(sp)
 1f8:	01812403          	lw	s0,24(sp)
 1fc:	01412483          	lw	s1,20(sp)
 200:	01012903          	lw	s2,16(sp)
 204:	00c12983          	lw	s3,12(sp)
 208:	00812a03          	lw	s4,8(sp)
 20c:	00000513          	li	a0,0
 210:	02010113          	addi	sp,sp,32
 214:	00008067          	ret

Disassembly of section .data:

00000218 <a>:
 218:	0002                	c.slli64	zero
 21a:	0000                	unimp
 21c:	000c                	0xc
 21e:	0000                	unimp
 220:	000e                	c.slli	zero,0x3
 222:	0000                	unimp
 224:	0006                	c.slli	zero,0x1
 226:	0000                	unimp
 228:	000d                	c.nop	3
 22a:	0000                	unimp
 22c:	0000000f          	fence	unknown,unknown
 230:	0010                	0x10
 232:	0000                	unimp
 234:	000a                	c.slli	zero,0x2
 236:	0000                	unimp
 238:	0000                	unimp
 23a:	0000                	unimp
 23c:	0012                	c.slli	zero,0x4
 23e:	0000                	unimp
 240:	0000000b          	0xb
 244:	00000013          	nop
 248:	0009                	c.nop	2
 24a:	0000                	unimp
 24c:	0001                	nop
 24e:	0000                	unimp
 250:	00000007          	0x7
 254:	0005                	c.nop	1
 256:	0000                	unimp
 258:	0004                	0x4
 25a:	0000                	unimp
 25c:	00000003          	lb	zero,0(zero) # 0 <start>
 260:	0008                	0x8
 262:	0000                	unimp
 264:	0011                	c.nop	4
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
