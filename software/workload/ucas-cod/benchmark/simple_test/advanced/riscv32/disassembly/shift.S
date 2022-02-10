
../riscv32/elf/shift:     file format elf32-littleriscv


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
  48:	fe010113          	addi	sp,sp,-32 # 3fe0 <srlv_ans+0x3e4c>
  4c:	00812c23          	sw	s0,24(sp)
  50:	00912a23          	sw	s1,20(sp)
  54:	13400493          	li	s1,308
  58:	01312623          	sw	s3,12(sp)
  5c:	02048993          	addi	s3,s1,32
  60:	01212823          	sw	s2,16(sp)
  64:	01412423          	sw	s4,8(sp)
  68:	13400913          	li	s2,308
  6c:	00112e23          	sw	ra,28(sp)
  70:	01512223          	sw	s5,4(sp)
  74:	00098a13          	mv	s4,s3
  78:	13400413          	li	s0,308
  7c:	00042503          	lw	a0,0(s0)
  80:	0009a783          	lw	a5,0(s3)
  84:	00440413          	addi	s0,s0,4
  88:	00755513          	srli	a0,a0,0x7
  8c:	40f50533          	sub	a0,a0,a5
  90:	00153513          	seqz	a0,a0
  94:	f91ff0ef          	jal	ra,24 <nemu_assert>
  98:	00498993          	addi	s3,s3,4
  9c:	ff4410e3          	bne	s0,s4,7c <main+0x34>
  a0:	04090a13          	addi	s4,s2,64
  a4:	00048993          	mv	s3,s1
  a8:	00400413          	li	s0,4
  ac:	00c00a93          	li	s5,12
  b0:	0009a503          	lw	a0,0(s3)
  b4:	000a2783          	lw	a5,0(s4)
  b8:	00498993          	addi	s3,s3,4
  bc:	40855533          	sra	a0,a0,s0
  c0:	40f50533          	sub	a0,a0,a5
  c4:	00153513          	seqz	a0,a0
  c8:	00140413          	addi	s0,s0,1
  cc:	f59ff0ef          	jal	ra,24 <nemu_assert>
  d0:	004a0a13          	addi	s4,s4,4
  d4:	fd541ee3          	bne	s0,s5,b0 <main+0x68>
  d8:	06090913          	addi	s2,s2,96
  dc:	00400413          	li	s0,4
  e0:	00c00993          	li	s3,12
  e4:	0004a503          	lw	a0,0(s1)
  e8:	00092783          	lw	a5,0(s2)
  ec:	00448493          	addi	s1,s1,4
  f0:	00855533          	srl	a0,a0,s0
  f4:	40f50533          	sub	a0,a0,a5
  f8:	00153513          	seqz	a0,a0
  fc:	00140413          	addi	s0,s0,1
 100:	f25ff0ef          	jal	ra,24 <nemu_assert>
 104:	00490913          	addi	s2,s2,4
 108:	fd341ee3          	bne	s0,s3,e4 <main+0x9c>
 10c:	01c12083          	lw	ra,28(sp)
 110:	01812403          	lw	s0,24(sp)
 114:	01412483          	lw	s1,20(sp)
 118:	01012903          	lw	s2,16(sp)
 11c:	00c12983          	lw	s3,12(sp)
 120:	00812a03          	lw	s4,8(sp)
 124:	00412a83          	lw	s5,4(sp)
 128:	00000513          	li	a0,0
 12c:	02010113          	addi	sp,sp,32
 130:	00008067          	ret

Disassembly of section .data:

00000134 <test>:
 134:	5678                	lw	a4,108(a2)
 136:	1234                	addi	a3,sp,296
 138:	5432                	lw	s0,44(sp)
 13a:	9876                	add	a6,a6,t4
 13c:	0000                	unimp
 13e:	0000                	unimp
 140:	1000                	addi	s0,sp,32
 142:	effa                	fsw	ft10,220(sp)
 144:	ffff                	0xffff
 146:	7fff                	0x7fff
 148:	0000                	unimp
 14a:	8000                	0x8000
 14c:	00000033          	add	zero,zero,zero
 150:	ffff                	0xffff
 152:	ffff                	0xffff

00000154 <srl_ans>:
 154:	68ac                	flw	fa1,80(s1)
 156:	0024                	addi	s1,sp,8
 158:	eca8                	fsw	fa0,88(s1)
 15a:	0130                	addi	a2,sp,136
 15c:	0000                	unimp
 15e:	0000                	unimp
 160:	f420                	fsw	fs0,104(s0)
 162:	01df ffff 00ff      	0xffffff01df
 168:	0000                	unimp
 16a:	0100                	addi	s0,sp,128
 16c:	0000                	unimp
 16e:	0000                	unimp
 170:	ffff                	0xffff
 172:	01ff                	0x1ff

00000174 <srav_ans>:
 174:	01234567          	0x1234567
 178:	b2a1                	j	fffffac0 <srlv_ans+0xfffff92c>
 17a:	0000fcc3          	fmadd.s	fs9,ft1,ft0,ft0
 17e:	0000                	unimp
 180:	f420                	fsw	fs0,104(s0)
 182:	ffdf ffff 007f      	0x7fffffffdf
 188:	0000                	unimp
 18a:	ffc0                	fsw	fs0,60(a5)
 18c:	0000                	unimp
 18e:	0000                	unimp
 190:	ffff                	0xffff
 192:	ffff                	0xffff

00000194 <srlv_ans>:
 194:	01234567          	0x1234567
 198:	b2a1                	j	fffffae0 <srlv_ans+0xfffff94c>
 19a:	000004c3          	fmadd.s	fs1,ft0,ft0,ft0,rne
 19e:	0000                	unimp
 1a0:	f420                	fsw	fs0,104(s0)
 1a2:	01df ffff 007f      	0x7fffff01df
 1a8:	0000                	unimp
 1aa:	0040                	addi	s0,sp,4
 1ac:	0000                	unimp
 1ae:	0000                	unimp
 1b0:	ffff                	0xffff
 1b2:	001f        	0x1f

Disassembly of section .comment:

00000000 <.comment>:
   0:	3a434347          	fmsub.d	ft6,ft6,ft4,ft7,rmm
   4:	2820                	fld	fs0,80(s0)
   6:	29554e47          	fmsub.s	ft8,fa0,fs5,ft5,rmm
   a:	3820                	fld	fs0,112(s0)
   c:	322e                	fld	ft4,232(sp)
   e:	302e                	fld	ft0,232(sp)
	...
