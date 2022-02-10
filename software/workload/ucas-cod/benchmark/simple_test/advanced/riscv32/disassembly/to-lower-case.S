
../riscv32/elf/to-lower-case:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <start>:
   0:	00004137          	lui	sp,0x4
   4:	00c0006f          	j	10 <continued>
   8:	00000013          	nop

0000000c <global_result>:
   c:	ffff                	0xffff
   e:	ffff                	0xffff

00000010 <continued>:
  10:	054000ef          	jal	ra,64 <main>
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

00000048 <to_lower_case>:
  48:	fbf50793          	addi	a5,a0,-65
  4c:	0ff7f793          	andi	a5,a5,255
  50:	01900713          	li	a4,25
  54:	00f76663          	bltu	a4,a5,60 <to_lower_case+0x18>
  58:	02050513          	addi	a0,a0,32
  5c:	0ff57513          	andi	a0,a0,255
  60:	00008067          	ret

Disassembly of section .text.startup:

00000064 <main>:
  64:	fe010113          	addi	sp,sp,-32 # 3fe0 <ans+0x3ef8>
  68:	00912a23          	sw	s1,20(sp)
  6c:	00812c23          	sw	s0,24(sp)
  70:	01212823          	sw	s2,16(sp)
  74:	01312623          	sw	s3,12(sp)
  78:	00112e23          	sw	ra,28(sp)
  7c:	00100413          	li	s0,1
  80:	00000513          	li	a0,0
  84:	0e800493          	li	s1,232
  88:	08000913          	li	s2,128
  8c:	01900993          	li	s3,25
  90:	008487b3          	add	a5,s1,s0
  94:	fff7c783          	lbu	a5,-1(a5)
  98:	40a78533          	sub	a0,a5,a0
  9c:	00153513          	seqz	a0,a0
  a0:	f85ff0ef          	jal	ra,24 <nemu_assert>
  a4:	0ff47513          	andi	a0,s0,255
  a8:	fbf50793          	addi	a5,a0,-65
  ac:	0ff7f793          	andi	a5,a5,255
  b0:	02050713          	addi	a4,a0,32
  b4:	01240a63          	beq	s0,s2,c8 <main+0x64>
  b8:	00f9e463          	bltu	s3,a5,c0 <main+0x5c>
  bc:	0ff77513          	andi	a0,a4,255
  c0:	00140413          	addi	s0,s0,1
  c4:	fcdff06f          	j	90 <main+0x2c>
  c8:	01c12083          	lw	ra,28(sp)
  cc:	01812403          	lw	s0,24(sp)
  d0:	01412483          	lw	s1,20(sp)
  d4:	01012903          	lw	s2,16(sp)
  d8:	00c12983          	lw	s3,12(sp)
  dc:	00000513          	li	a0,0
  e0:	02010113          	addi	sp,sp,32
  e4:	00008067          	ret

Disassembly of section .data:

000000e8 <ans>:
  e8:	0100                	addi	s0,sp,128
  ea:	0302                	c.slli64	t1
  ec:	0504                	addi	s1,sp,640
  ee:	0706                	slli	a4,a4,0x1
  f0:	0908                	addi	a0,sp,144
  f2:	0b0a                	slli	s6,s6,0x2
  f4:	0d0c                	addi	a1,sp,656
  f6:	0f0e                	slli	t5,t5,0x3
  f8:	1110                	addi	a2,sp,160
  fa:	1312                	slli	t1,t1,0x24
  fc:	1514                	addi	a3,sp,672
  fe:	1716                	slli	a4,a4,0x25
 100:	1918                	addi	a4,sp,176
 102:	1b1a                	slli	s6,s6,0x26
 104:	1d1c                	addi	a5,sp,688
 106:	1f1e                	slli	t5,t5,0x27
 108:	2120                	fld	fs0,64(a0)
 10a:	2322                	fld	ft6,8(sp)
 10c:	2524                	fld	fs1,72(a0)
 10e:	2726                	fld	fa4,72(sp)
 110:	2928                	fld	fa0,80(a0)
 112:	2b2a                	fld	fs6,136(sp)
 114:	2d2c                	fld	fa1,88(a0)
 116:	2f2e                	fld	ft10,200(sp)
 118:	3130                	fld	fa2,96(a0)
 11a:	3332                	fld	ft6,296(sp)
 11c:	3534                	fld	fa3,104(a0)
 11e:	3736                	fld	fa4,360(sp)
 120:	3938                	fld	fa4,112(a0)
 122:	3b3a                	fld	fs6,424(sp)
 124:	3d3c                	fld	fa5,120(a0)
 126:	3f3e                	fld	ft10,488(sp)
 128:	6140                	flw	fs0,4(a0)
 12a:	6362                	flw	ft6,24(sp)
 12c:	6564                	flw	fs1,76(a0)
 12e:	6766                	flw	fa4,88(sp)
 130:	6968                	flw	fa0,84(a0)
 132:	6b6a                	flw	fs6,152(sp)
 134:	6d6c                	flw	fa1,92(a0)
 136:	6f6e                	flw	ft10,216(sp)
 138:	7170                	flw	fa2,100(a0)
 13a:	7372                	flw	ft6,60(sp)
 13c:	7574                	flw	fa3,108(a0)
 13e:	7776                	flw	fa4,124(sp)
 140:	7978                	flw	fa4,116(a0)
 142:	5b7a                	lw	s6,188(sp)
 144:	5d5c                	lw	a5,60(a0)
 146:	5f5e                	lw	t5,244(sp)
 148:	6160                	flw	fs0,68(a0)
 14a:	6362                	flw	ft6,24(sp)
 14c:	6564                	flw	fs1,76(a0)
 14e:	6766                	flw	fa4,88(sp)
 150:	6968                	flw	fa0,84(a0)
 152:	6b6a                	flw	fs6,152(sp)
 154:	6d6c                	flw	fa1,92(a0)
 156:	6f6e                	flw	ft10,216(sp)
 158:	7170                	flw	fa2,100(a0)
 15a:	7372                	flw	ft6,60(sp)
 15c:	7574                	flw	fa3,108(a0)
 15e:	7776                	flw	fa4,124(sp)
 160:	7978                	flw	fa4,116(a0)
 162:	7b7a                	flw	fs6,188(sp)
 164:	7d7c                	flw	fa5,124(a0)
 166:	7f7e                	flw	ft10,252(sp)

Disassembly of section .comment:

00000000 <.comment>:
   0:	3a434347          	fmsub.d	ft6,ft6,ft4,ft7,rmm
   4:	2820                	fld	fs0,80(s0)
   6:	29554e47          	fmsub.s	ft8,fa0,fs5,ft5,rmm
   a:	3820                	fld	fs0,112(s0)
   c:	322e                	fld	ft4,232(sp)
   e:	302e                	fld	ft0,232(sp)
	...
