
../riscv32/elf/mul-longlong:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <start>:
   0:	00004137          	lui	sp,0x4
   4:	00c0006f          	j	10 <continued>
   8:	00000013          	nop

0000000c <global_result>:
   c:	ffff                	0xffff
   e:	ffff                	0xffff

00000010 <continued>:
  10:	11c000ef          	jal	ra,12c <main>
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

00000048 <mul>:
  48:	00050f13          	mv	t5,a0
  4c:	00058f93          	mv	t6,a1
  50:	0cd05463          	blez	a3,118 <mul+0xd0>
  54:	00100293          	li	t0,1
  58:	00000393          	li	t2,0
  5c:	41f6d793          	srai	a5,a3,0x1f
  60:	00c7c733          	xor	a4,a5,a2
  64:	00d7c633          	xor	a2,a5,a3
  68:	40f706b3          	sub	a3,a4,a5
  6c:	00d735b3          	sltu	a1,a4,a3
  70:	40f60633          	sub	a2,a2,a5
  74:	40b60633          	sub	a2,a2,a1
  78:	00068713          	mv	a4,a3
  7c:	00000513          	li	a0,0
  80:	00000593          	li	a1,0
  84:	00000793          	li	a5,0
  88:	001f5e93          	srli	t4,t5,0x1
  8c:	01f00e13          	li	t3,31
  90:	04000313          	li	t1,64
  94:	0380006f          	j	cc <mul+0x84>
  98:	011f1833          	sll	a6,t5,a7
  9c:	00000893          	li	a7,0
  a0:	011506b3          	add	a3,a0,a7
  a4:	00a6b8b3          	sltu	a7,a3,a0
  a8:	01058833          	add	a6,a1,a6
  ac:	00068513          	mv	a0,a3
  b0:	010885b3          	add	a1,a7,a6
  b4:	01f61693          	slli	a3,a2,0x1f
  b8:	00175713          	srli	a4,a4,0x1
  bc:	00178793          	addi	a5,a5,1
  c0:	00e6e733          	or	a4,a3,a4
  c4:	40165613          	srai	a2,a2,0x1
  c8:	02678663          	beq	a5,t1,f4 <mul+0xac>
  cc:	00177693          	andi	a3,a4,1
  d0:	fe078893          	addi	a7,a5,-32
  d4:	fe0680e3          	beqz	a3,b4 <mul+0x6c>
  d8:	40fe06b3          	sub	a3,t3,a5
  dc:	00ff9833          	sll	a6,t6,a5
  e0:	00ded6b3          	srl	a3,t4,a3
  e4:	fa08dae3          	bgez	a7,98 <mul+0x50>
  e8:	00ff18b3          	sll	a7,t5,a5
  ec:	0106e833          	or	a6,a3,a6
  f0:	fb1ff06f          	j	a0 <mul+0x58>
  f4:	00100793          	li	a5,1
  f8:	00f29663          	bne	t0,a5,104 <mul+0xbc>
  fc:	00039463          	bnez	t2,104 <mul+0xbc>
 100:	00008067          	ret
 104:	40a00533          	neg	a0,a0
 108:	00a037b3          	snez	a5,a0
 10c:	40b00833          	neg	a6,a1
 110:	40f805b3          	sub	a1,a6,a5
 114:	00008067          	ret
 118:	00069463          	bnez	a3,120 <mul+0xd8>
 11c:	f2061ce3          	bnez	a2,54 <mul+0xc>
 120:	fff00293          	li	t0,-1
 124:	fff00393          	li	t2,-1
 128:	f35ff06f          	j	5c <mul+0x14>

Disassembly of section .text.startup:

0000012c <main>:
 12c:	fd010113          	addi	sp,sp,-48 # 3fd0 <ans+0x3cb0>
 130:	02812423          	sw	s0,40(sp)
 134:	02912223          	sw	s1,36(sp)
 138:	01312e23          	sw	s3,28(sp)
 13c:	01412c23          	sw	s4,24(sp)
 140:	01512a23          	sw	s5,20(sp)
 144:	01612823          	sw	s6,16(sp)
 148:	01812423          	sw	s8,8(sp)
 14c:	02112623          	sw	ra,44(sp)
 150:	03212023          	sw	s2,32(sp)
 154:	01712623          	sw	s7,12(sp)
 158:	01912223          	sw	s9,4(sp)
 15c:	01a12023          	sw	s10,0(sp)
 160:	00000a13          	li	s4,0
 164:	00400b13          	li	s6,4
 168:	32000a93          	li	s5,800
 16c:	31000413          	li	s0,784
 170:	00000993          	li	s3,0
 174:	32000493          	li	s1,800
 178:	01f00c13          	li	s8,31
 17c:	136a0063          	beq	s4,s6,29c <main+0x170>
 180:	00399c93          	slli	s9,s3,0x3
 184:	019a8cb3          	add	s9,s5,s9
 188:	00040d13          	mv	s10,s0
 18c:	00048a93          	mv	s5,s1
 190:	00100913          	li	s2,1
 194:	04000b93          	li	s7,64
 198:	000d2703          	lw	a4,0(s10)
 19c:	00042883          	lw	a7,0(s0)
 1a0:	000cae83          	lw	t4,0(s9)
 1a4:	41f75613          	srai	a2,a4,0x1f
 1a8:	004caf03          	lw	t5,4(s9)
 1ac:	41f8de13          	srai	t3,a7,0x1f
 1b0:	10061663          	bnez	a2,2bc <main+0x190>
 1b4:	00100f93          	li	t6,1
 1b8:	00000293          	li	t0,0
 1bc:	10070063          	beqz	a4,2bc <main+0x190>
 1c0:	41f65793          	srai	a5,a2,0x1f
 1c4:	00e7c733          	xor	a4,a5,a4
 1c8:	40f706b3          	sub	a3,a4,a5
 1cc:	00c7c633          	xor	a2,a5,a2
 1d0:	00d735b3          	sltu	a1,a4,a3
 1d4:	40f60633          	sub	a2,a2,a5
 1d8:	00068713          	mv	a4,a3
 1dc:	40b60633          	sub	a2,a2,a1
 1e0:	00000513          	li	a0,0
 1e4:	00000813          	li	a6,0
 1e8:	00000793          	li	a5,0
 1ec:	0018d313          	srli	t1,a7,0x1
 1f0:	0380006f          	j	228 <main+0xfc>
 1f4:	00b893b3          	sll	t2,a7,a1
 1f8:	00000593          	li	a1,0
 1fc:	00b506b3          	add	a3,a0,a1
 200:	00a6b5b3          	sltu	a1,a3,a0
 204:	00780833          	add	a6,a6,t2
 208:	00068513          	mv	a0,a3
 20c:	01058833          	add	a6,a1,a6
 210:	01f61693          	slli	a3,a2,0x1f
 214:	00175713          	srli	a4,a4,0x1
 218:	00178793          	addi	a5,a5,1
 21c:	00e6e733          	or	a4,a3,a4
 220:	40165613          	srai	a2,a2,0x1
 224:	03778663          	beq	a5,s7,250 <main+0x124>
 228:	00177693          	andi	a3,a4,1
 22c:	fe078593          	addi	a1,a5,-32
 230:	fe0680e3          	beqz	a3,210 <main+0xe4>
 234:	40fc06b3          	sub	a3,s8,a5
 238:	00fe13b3          	sll	t2,t3,a5
 23c:	00d356b3          	srl	a3,t1,a3
 240:	fa05dae3          	bgez	a1,1f4 <main+0xc8>
 244:	00f895b3          	sll	a1,a7,a5
 248:	0076e3b3          	or	t2,a3,t2
 24c:	fb1ff06f          	j	1fc <main+0xd0>
 250:	052f9c63          	bne	t6,s2,2a8 <main+0x17c>
 254:	04029a63          	bnez	t0,2a8 <main+0x17c>
 258:	00aec533          	xor	a0,t4,a0
 25c:	010f4833          	xor	a6,t5,a6
 260:	01056533          	or	a0,a0,a6
 264:	00153513          	seqz	a0,a0
 268:	004d0d13          	addi	s10,s10,4
 26c:	db9ff0ef          	jal	ra,24 <nemu_assert>
 270:	008c8c93          	addi	s9,s9,8
 274:	f3a492e3          	bne	s1,s10,198 <main+0x6c>
 278:	00100513          	li	a0,1
 27c:	da9ff0ef          	jal	ra,24 <nemu_assert>
 280:	00498993          	addi	s3,s3,4
 284:	00300793          	li	a5,3
 288:	414989b3          	sub	s3,s3,s4
 28c:	02fa0e63          	beq	s4,a5,2c8 <main+0x19c>
 290:	001a0a13          	addi	s4,s4,1
 294:	00440413          	addi	s0,s0,4
 298:	ef6a14e3          	bne	s4,s6,180 <main+0x54>
 29c:	00100513          	li	a0,1
 2a0:	d85ff0ef          	jal	ra,24 <nemu_assert>
 2a4:	fedff06f          	j	290 <main+0x164>
 2a8:	40a00533          	neg	a0,a0
 2ac:	00a037b3          	snez	a5,a0
 2b0:	41000833          	neg	a6,a6
 2b4:	40f80833          	sub	a6,a6,a5
 2b8:	fa1ff06f          	j	258 <main+0x12c>
 2bc:	fff00f93          	li	t6,-1
 2c0:	fff00293          	li	t0,-1
 2c4:	efdff06f          	j	1c0 <main+0x94>
 2c8:	00100513          	li	a0,1
 2cc:	d59ff0ef          	jal	ra,24 <nemu_assert>
 2d0:	02c12083          	lw	ra,44(sp)
 2d4:	02812403          	lw	s0,40(sp)
 2d8:	02412483          	lw	s1,36(sp)
 2dc:	02012903          	lw	s2,32(sp)
 2e0:	01c12983          	lw	s3,28(sp)
 2e4:	01812a03          	lw	s4,24(sp)
 2e8:	01412a83          	lw	s5,20(sp)
 2ec:	01012b03          	lw	s6,16(sp)
 2f0:	00c12b83          	lw	s7,12(sp)
 2f4:	00812c03          	lw	s8,8(sp)
 2f8:	00412c83          	lw	s9,4(sp)
 2fc:	00012d03          	lw	s10,0(sp)
 300:	00000513          	li	a0,0
 304:	03010113          	addi	sp,sp,48
 308:	00008067          	ret

Disassembly of section .data:

00000310 <test_data>:
 310:	c2aa                	sw	a0,68(sp)
 312:	aeb1                	j	66e <ans+0x34e>
 314:	4500ff2b          	0x4500ff2b
 318:	877190af          	0x877190af
 31c:	2438                	fld	fa4,72(s0)
 31e:	11f4                	addi	a3,sp,236

00000320 <ans>:
 320:	18e4                	addi	s1,sp,124
 322:	db1a                	sw	t1,180(sp)
 324:	9ab9                	andi	a3,a3,-18
 326:	19d2                	slli	s3,s3,0x34
 328:	088e                	slli	a7,a7,0x3
 32a:	986d3ac3          	fmadd.s	fs5,fs10,ft6,fs3,rup
 32e:	ea15                	bnez	a2,362 <ans+0x42>
 330:	b236                	fsd	fa3,288(sp)
 332:	fc0d                	bnez	s0,26c <main+0x140>
 334:	e980                	fsw	fs0,16(a1)
 336:	2649                	jal	6b8 <ans+0x398>
 338:	7d30                	flw	fa2,120(a0)
 33a:	0a4a                	slli	s4,s4,0x12
 33c:	43da                	lw	t2,148(sp)
 33e:	fa4c                	fsw	fa1,52(a2)
 340:	b139                	j	ffffff4e <ans+0xfffffc2e>
 342:	2c56                	fld	fs8,336(sp)
 344:	898e                	mv	s3,gp
 346:	1299                	addi	t0,t0,-26
 348:	9e65                	0x9e65
 34a:	0a31                	addi	s4,s4,12
 34c:	23d5                	jal	930 <ans+0x610>
 34e:	df81                	beqz	a5,266 <main+0x13a>
 350:	dd68                	sw	a0,124(a0)
 352:	4c15                	li	s8,5
 354:	dfa8                	sw	a0,120(a5)
 356:	04d6                	slli	s1,s1,0x15
 358:	57a1                	li	a5,-24
 35a:	d79b9e43          	fmadd.q	ft8,fs7,fs9,fs10,rtz
 35e:	38c5                	jal	fffffc4e <ans+0xfffff92e>
 360:	4248                	lw	a0,4(a2)
 362:	1efc                	addi	a5,sp,892
 364:	f78b91cb          	fnmsub.q	ft3,fs7,fs8,ft10,rtz
 368:	cc40                	sw	s0,28(s0)
 36a:	7fdf 55a4 0142      	0x14255a47fdf

Disassembly of section .comment:

00000000 <.comment>:
   0:	3a434347          	fmsub.d	ft6,ft6,ft4,ft7,rmm
   4:	2820                	fld	fs0,80(s0)
   6:	29554e47          	fmsub.s	ft8,fa0,fs5,ft5,rmm
   a:	3820                	fld	fs0,112(s0)
   c:	322e                	fld	ft4,232(sp)
   e:	302e                	fld	ft0,232(sp)
	...
