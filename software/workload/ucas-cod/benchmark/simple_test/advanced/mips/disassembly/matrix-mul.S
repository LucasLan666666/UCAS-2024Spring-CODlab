
../mips/elf/matrix-mul:     file format elf32-littlemips


Disassembly of section .text:

00000000 <start>:
   0:	241d4000 	li	sp,16384
   4:	08000004 	j	10 <continued>
   8:	00000000 	nop

0000000c <global_result>:
   c:	ffffffff 	sdc3	$31,-1(ra)

00000010 <continued>:
  10:	0c000019 	jal	64 <main>
  14:	00000000 	nop
  18:	0c000015 	jal	54 <hit_good_trap>
  1c:	00000000 	nop

00000020 <_halt>:
  20:	3c020000 	lui	v0,0x0
  24:	ac44000c 	sw	a0,12(v0)
  28:	1000ffff 	b	28 <_halt+0x8>
  2c:	00000000 	nop

00000030 <nemu_assert>:
  30:	14800006 	bnez	a0,4c <nemu_assert+0x1c>
  34:	00000000 	nop
  38:	24030001 	li	v1,1
  3c:	3c020000 	lui	v0,0x0
  40:	ac43000c 	sw	v1,12(v0)
  44:	1000ffff 	b	44 <nemu_assert+0x14>
  48:	00000000 	nop
  4c:	03e00008 	jr	ra
  50:	00000000 	nop

00000054 <hit_good_trap>:
  54:	3c020000 	lui	v0,0x0
  58:	ac40000c 	sw	zero,12(v0)
  5c:	1000ffff 	b	5c <hit_good_trap+0x8>
  60:	00000000 	nop

Disassembly of section .text.startup:

00000064 <main>:
  64:	27bdffd8 	addiu	sp,sp,-40
  68:	3c0e0000 	lui	t6,0x0
  6c:	3c190000 	lui	t9,0x0
  70:	afb10014 	sw	s1,20(sp)
  74:	afb00010 	sw	s0,16(sp)
  78:	3c180000 	lui	t8,0x0
  7c:	3c110000 	lui	s1,0x0
  80:	3c100000 	lui	s0,0x0
  84:	3c0f0000 	lui	t7,0x0
  88:	afb20018 	sw	s2,24(sp)
  8c:	afbf0024 	sw	ra,36(sp)
  90:	afb40020 	sw	s4,32(sp)
  94:	afb3001c 	sw	s3,28(sp)
  98:	25ce0510 	addiu	t6,t6,1296
  9c:	273906a0 	addiu	t9,t9,1696
  a0:	271801f0 	addiu	t8,t8,496
  a4:	263106a0 	addiu	s1,s1,1696
  a8:	26100510 	addiu	s0,s0,1296
  ac:	25ef0538 	addiu	t7,t7,1336
  b0:	2412ffff 	li	s2,-1
  b4:	240d0001 	li	t5,1
  b8:	24080020 	li	t0,32
  bc:	0200a025 	move	s4,s0
  c0:	03009825 	move	s3,t8
  c4:	03206025 	move	t4,t9
  c8:	268afe70 	addiu	t2,s4,-400
  cc:	01c0f825 	move	ra,t6
  d0:	00005825 	move	t3,zero
  d4:	8d420000 	lw	v0,0(t2)
  d8:	01a02825 	move	a1,t5
  dc:	28490001 	slti	t1,v0,1
  e0:	28440000 	slti	a0,v0,0
  e4:	00021823 	negu	v1,v0
  e8:	0064100b 	movn	v0,v1,a0
  ec:	0249280b 	movn	a1,s2,t1
  f0:	8fe70000 	lw	a3,0(ra)
  f4:	00402025 	move	a0,v0
  f8:	00a04825 	move	t1,a1
  fc:	00003025 	move	a2,zero
 100:	00001025 	move	v0,zero
 104:	30830001 	andi	v1,a0,0x1
 108:	00472804 	sllv	a1,a3,v0
 10c:	24420001 	addiu	v0,v0,1
 110:	10600002 	beqz	v1,11c <main+0xb8>
 114:	00000000 	nop
 118:	00c53021 	addu	a2,a2,a1
 11c:	00042043 	sra	a0,a0,0x1
 120:	1448fff8 	bne	v0,t0,104 <main+0xa0>
 124:	00000000 	nop
 128:	00061823 	negu	v1,a2
 12c:	39220001 	xori	v0,t1,0x1
 130:	0062300b 	movn	a2,v1,v0
 134:	01665821 	addu	t3,t3,a2
 138:	254a0028 	addiu	t2,t2,40
 13c:	ad8b0000 	sw	t3,0(t4)
 140:	27ff0004 	addiu	ra,ra,4
 144:	1554ffe3 	bne	t2,s4,d4 <main+0x70>
 148:	00000000 	nop
 14c:	8e640000 	lw	a0,0(s3)
 150:	258c0004 	addiu	t4,t4,4
 154:	008b2026 	xor	a0,a0,t3
 158:	2c840001 	sltiu	a0,a0,1
 15c:	0c00000c 	jal	30 <nemu_assert>
 160:	00000000 	nop
 164:	24040001 	li	a0,1
 168:	0c00000c 	jal	30 <nemu_assert>
 16c:	00000000 	nop
 170:	25540004 	addiu	s4,t2,4
 174:	26730004 	addiu	s3,s3,4
 178:	15f4ffd3 	bne	t7,s4,c8 <main+0x64>
 17c:	00000000 	nop
 180:	24040001 	li	a0,1
 184:	25ce0028 	addiu	t6,t6,40
 188:	0c00000c 	jal	30 <nemu_assert>
 18c:	00000000 	nop
 190:	27390028 	addiu	t9,t9,40
 194:	27180028 	addiu	t8,t8,40
 198:	15d1ffc8 	bne	t6,s1,bc <main+0x58>
 19c:	00000000 	nop
 1a0:	24040001 	li	a0,1
 1a4:	0c00000c 	jal	30 <nemu_assert>
 1a8:	00000000 	nop
 1ac:	8fbf0024 	lw	ra,36(sp)
 1b0:	8fb40020 	lw	s4,32(sp)
 1b4:	8fb3001c 	lw	s3,28(sp)
 1b8:	8fb20018 	lw	s2,24(sp)
 1bc:	8fb10014 	lw	s1,20(sp)
 1c0:	8fb00010 	lw	s0,16(sp)
 1c4:	00001025 	move	v0,zero
 1c8:	27bd0028 	addiu	sp,sp,40
 1cc:	03e00008 	jr	ra
 1d0:	00000000 	nop

Disassembly of section .MIPS.abiflags:

000001d8 <.MIPS.abiflags>:
 1d8:	01200000 	0x1200000
 1dc:	01000101 	0x1000101
	...
 1e8:	00000001 	movf	zero,zero,$fcc0
 1ec:	00000000 	nop

Disassembly of section .data:

000001f0 <ans>:
 1f0:	fffffadb 	sdc3	$31,-1317(ra)
 1f4:	0000288b 	0x288b
 1f8:	ffffe943 	sdc3	$31,-5821(ra)
 1fc:	ffffc80e 	sdc3	$31,-14322(ra)
 200:	ffffef16 	sdc3	$31,-4330(ra)
 204:	fffff3d6 	sdc3	$31,-3114(ra)
 208:	ffffd92c 	sdc3	$31,-9940(ra)
 20c:	00001b79 	0x1b79
 210:	fffff8a5 	sdc3	$31,-1883(ra)
 214:	ffffe875 	sdc3	$31,-6027(ra)
 218:	ffffa136 	sdc3	$31,-24266(ra)
 21c:	fffffca3 	sdc3	$31,-861(ra)
 220:	00000fcc 	syscall	0x3f
 224:	ffffb290 	sdc3	$31,-19824(ra)
 228:	ffffff21 	sdc3	$31,-223(ra)
 22c:	00000376 	tne	zero,zero,0xd
 230:	ffffd12c 	sdc3	$31,-11988(ra)
 234:	ffffe6d6 	sdc3	$31,-6442(ra)
 238:	ffffc9ea 	sdc3	$31,-13846(ra)
 23c:	fffffbe2 	sdc3	$31,-1054(ra)
 240:	00002637 	0x2637
 244:	ffffe45f 	sdc3	$31,-7073(ra)
 248:	fffffc6a 	sdc3	$31,-918(ra)
 24c:	ffffe8e9 	sdc3	$31,-5911(ra)
 250:	fffffc39 	sdc3	$31,-967(ra)
 254:	ffffe444 	sdc3	$31,-7100(ra)
 258:	0000390d 	break	0x0,0xe4
 25c:	ffffe27c 	sdc3	$31,-7556(ra)
 260:	fffff291 	sdc3	$31,-3439(ra)
 264:	00002587 	0x2587
 268:	00003e6c 	0x3e6c
 26c:	fffffdf8 	sdc3	$31,-520(ra)
 270:	ffffcc0f 	sdc3	$31,-13297(ra)
 274:	00003ac3 	sra	a3,zero,0xb
 278:	00001829 	0x1829
 27c:	fffff1ba 	sdc3	$31,-3654(ra)
 280:	0000052d 	0x52d
 284:	00001061 	0x1061
 288:	0000421d 	0x421d
 28c:	ffffba9f 	sdc3	$31,-17761(ra)
 290:	00000a06 	0xa06
 294:	00000c73 	tltu	zero,zero,0x31
 298:	00002808 	0x2808
 29c:	00001ef5 	0x1ef5
 2a0:	000018ae 	0x18ae
 2a4:	0000058d 	break	0x0,0x16
 2a8:	00003938 	0x3938
 2ac:	000002bc 	0x2bc
 2b0:	ffffd05f 	sdc3	$31,-12193(ra)
 2b4:	0000043b 	0x43b
 2b8:	ffffcec5 	sdc3	$31,-12603(ra)
 2bc:	00004a3e 	0x4a3e
 2c0:	000051d8 	0x51d8
 2c4:	000048a7 	0x48a7
 2c8:	fffff9fd 	sdc3	$31,-1539(ra)
 2cc:	00001440 	sll	v0,zero,0x11
 2d0:	00004400 	sll	t0,zero,0x10
 2d4:	00001a54 	0x1a54
 2d8:	00001878 	0x1878
 2dc:	00003b0a 	0x3b0a
 2e0:	ffffce55 	sdc3	$31,-12715(ra)
 2e4:	00003b11 	0x3b11
 2e8:	000026eb 	0x26eb
 2ec:	ffffca6b 	sdc3	$31,-13717(ra)
 2f0:	0000096b 	0x96b
 2f4:	fffff76c 	sdc3	$31,-2196(ra)
 2f8:	00001803 	sra	v1,zero,0x0
 2fc:	fffff95e 	sdc3	$31,-1698(ra)
 300:	fffff2c3 	sdc3	$31,-3389(ra)
 304:	00002008 	0x2008
 308:	ffffb5c1 	sdc3	$31,-19007(ra)
 30c:	00003081 	0x3081
 310:	0000165b 	0x165b
 314:	ffffd3d3 	sdc3	$31,-11309(ra)
 318:	ffffb4d6 	sdc3	$31,-19242(ra)
 31c:	00003d7c 	0x3d7c
 320:	fffff131 	sdc3	$31,-3791(ra)
 324:	fffff093 	sdc3	$31,-3949(ra)
 328:	ffffccb6 	sdc3	$31,-13130(ra)
 32c:	ffffffeb 	sdc3	$31,-21(ra)
 330:	ffffcef3 	sdc3	$31,-12557(ra)
 334:	ffffe8ae 	sdc3	$31,-5970(ra)
 338:	ffffd2ce 	sdc3	$31,-11570(ra)
 33c:	ffffdd37 	sdc3	$31,-8905(ra)
 340:	00002fc3 	sra	a1,zero,0x1f
 344:	00001e86 	0x1e86
 348:	ffffec1a 	sdc3	$31,-5094(ra)
 34c:	000011b4 	teq	zero,zero,0x46
 350:	0000042f 	0x42f
 354:	fffffae3 	sdc3	$31,-1309(ra)
 358:	fffff475 	sdc3	$31,-2955(ra)
 35c:	000024a5 	0x24a5
 360:	000018e4 	0x18e4
 364:	ffffe50e 	sdc3	$31,-6898(ra)
 368:	0000239d 	0x239d
 36c:	00001679 	0x1679
 370:	0000512a 	0x512a
 374:	ffffec4b 	sdc3	$31,-5045(ra)
 378:	00000417 	0x417
 37c:	00002f52 	0x2f52

00000380 <b>:
 380:	ffffffd0 	sdc3	$31,-48(ra)
 384:	ffffffba 	sdc3	$31,-70(ra)
 388:	ffffffd8 	sdc3	$31,-40(ra)
 38c:	ffffffae 	sdc3	$31,-82(ra)
 390:	ffffffb6 	sdc3	$31,-74(ra)
 394:	ffffffc1 	sdc3	$31,-63(ra)
 398:	ffffffc5 	sdc3	$31,-59(ra)
 39c:	ffffffb8 	sdc3	$31,-72(ra)
 3a0:	ffffff9c 	sdc3	$31,-100(ra)
 3a4:	ffffffb8 	sdc3	$31,-72(ra)
 3a8:	00000005 	0x5
 3ac:	ffffffac 	sdc3	$31,-84(ra)
 3b0:	0000001c 	0x1c
 3b4:	00000038 	0x38
 3b8:	0000003c 	0x3c
 3bc:	ffffffdf 	sdc3	$31,-33(ra)
 3c0:	ffffffd6 	sdc3	$31,-42(ra)
 3c4:	ffffffce 	sdc3	$31,-50(ra)
 3c8:	ffffffad 	sdc3	$31,-83(ra)
 3cc:	ffffffad 	sdc3	$31,-83(ra)
 3d0:	fffffffb 	sdc3	$31,-5(ra)
 3d4:	00000005 	0x5
 3d8:	00000030 	tge	zero,zero
 3dc:	0000004b 	0x4b
 3e0:	ffffffb2 	sdc3	$31,-78(ra)
 3e4:	fffffff7 	sdc3	$31,-9(ra)
 3e8:	00000009 	jalr	zero,zero
 3ec:	00000002 	srl	zero,zero,0x0
 3f0:	00000058 	0x58
 3f4:	00000046 	rorv	zero,zero,zero
 3f8:	00000045 	0x45
 3fc:	00000017 	0x17
 400:	00000042 	srl	zero,zero,0x1
 404:	00000042 	srl	zero,zero,0x1
 408:	fffffff5 	sdc3	$31,-11(ra)
 40c:	00000032 	tlt	zero,zero
 410:	00000043 	sra	zero,zero,0x1
 414:	00000012 	mflo	zero
 418:	ffffffc6 	sdc3	$31,-58(ra)
 41c:	0000004c 	syscall	0x1
 420:	0000001e 	0x1e
 424:	0000002d 	0x2d
 428:	00000020 	add	zero,zero,zero
 42c:	00000019 	multu	zero,zero
 430:	ffffffb7 	sdc3	$31,-73(ra)
 434:	00000039 	0x39
 438:	ffffffbd 	sdc3	$31,-67(ra)
 43c:	fffffff2 	sdc3	$31,-14(ra)
 440:	00000035 	0x35
 444:	ffffffdf 	sdc3	$31,-33(ra)
 448:	00000062 	0x62
 44c:	ffffffaa 	sdc3	$31,-86(ra)
 450:	ffffffc1 	sdc3	$31,-63(ra)
 454:	00000050 	0x50
 458:	ffffffd3 	sdc3	$31,-45(ra)
 45c:	ffffffa8 	sdc3	$31,-88(ra)
 460:	00000050 	0x50
 464:	ffffffc0 	sdc3	$31,-64(ra)
 468:	0000003a 	0x3a
 46c:	ffffffac 	sdc3	$31,-84(ra)
 470:	ffffffc9 	sdc3	$31,-55(ra)
 474:	ffffffd9 	sdc3	$31,-39(ra)
 478:	fffffff3 	sdc3	$31,-13(ra)
 47c:	ffffffe5 	sdc3	$31,-27(ra)
 480:	ffffffdb 	sdc3	$31,-37(ra)
 484:	00000008 	jr	zero
 488:	ffffffa0 	sdc3	$31,-96(ra)
 48c:	00000054 	0x54
 490:	ffffffa7 	sdc3	$31,-89(ra)
 494:	0000001f 	0x1f
 498:	ffffffae 	sdc3	$31,-82(ra)
 49c:	0000003a 	0x3a
 4a0:	00000051 	0x51
 4a4:	ffffffd7 	sdc3	$31,-41(ra)
 4a8:	ffffffc6 	sdc3	$31,-58(ra)
 4ac:	00000024 	and	zero,zero,zero
 4b0:	0000004c 	syscall	0x1
 4b4:	ffffffb1 	sdc3	$31,-79(ra)
 4b8:	ffffffe3 	sdc3	$31,-29(ra)
 4bc:	00000017 	0x17
 4c0:	00000056 	0x56
 4c4:	ffffffd2 	sdc3	$31,-46(ra)
 4c8:	00000010 	mfhi	zero
 4cc:	ffffffee 	sdc3	$31,-18(ra)
 4d0:	00000051 	0x51
 4d4:	0000005a 	0x5a
 4d8:	00000023 	negu	zero,zero
 4dc:	ffffffa6 	sdc3	$31,-90(ra)
 4e0:	0000002b 	sltu	zero,zero,zero
 4e4:	00000037 	0x37
 4e8:	ffffffda 	sdc3	$31,-38(ra)
 4ec:	ffffffed 	sdc3	$31,-19(ra)
 4f0:	ffffffd8 	sdc3	$31,-40(ra)
 4f4:	00000052 	mflhxu	zero
 4f8:	ffffffb4 	sdc3	$31,-76(ra)
 4fc:	00000039 	0x39
 500:	ffffffe3 	sdc3	$31,-29(ra)
 504:	fffffffe 	sdc3	$31,-2(ra)
 508:	0000004f 	sync	0x1
 50c:	ffffffd0 	sdc3	$31,-48(ra)

00000510 <a>:
 510:	0000001f 	0x1f
 514:	ffffffb7 	sdc3	$31,-73(ra)
 518:	ffffffbd 	sdc3	$31,-67(ra)
 51c:	ffffffe4 	sdc3	$31,-28(ra)
 520:	00000057 	0x57
 524:	ffffffef 	sdc3	$31,-17(ra)
 528:	fffffff1 	sdc3	$31,-15(ra)
 52c:	ffffffdd 	sdc3	$31,-35(ra)
 530:	ffffffcb 	sdc3	$31,-53(ra)
 534:	ffffffca 	sdc3	$31,-54(ra)
 538:	00000034 	teq	zero,zero
 53c:	00000024 	and	zero,zero,zero
 540:	00000009 	jalr	zero,zero
 544:	ffffffa5 	sdc3	$31,-91(ra)
 548:	ffffffe5 	sdc3	$31,-27(ra)
 54c:	ffffffb2 	sdc3	$31,-78(ra)
 550:	0000002a 	slt	zero,zero,zero
 554:	00000052 	mflhxu	zero
 558:	00000013 	mtlo	zero
 55c:	fffffffa 	sdc3	$31,-6(ra)
 560:	00000029 	0x29
 564:	ffffffc8 	sdc3	$31,-56(ra)
 568:	0000001f 	0x1f
 56c:	00000020 	add	zero,zero,zero
 570:	ffffffcc 	sdc3	$31,-52(ra)
 574:	0000004a 	0x4a
 578:	0000001c 	0x1c
 57c:	00000014 	0x14
 580:	00000037 	0x37
 584:	ffffffb8 	sdc3	$31,-72(ra)
 588:	ffffffc5 	sdc3	$31,-59(ra)
 58c:	00000002 	srl	zero,zero,0x0
 590:	ffffffb1 	sdc3	$31,-79(ra)
 594:	fffffff8 	sdc3	$31,-8(ra)
 598:	0000002c 	0x2c
 59c:	00000037 	0x37
 5a0:	ffffffad 	sdc3	$31,-83(ra)
 5a4:	ffffffa1 	sdc3	$31,-95(ra)
 5a8:	ffffffd3 	sdc3	$31,-45(ra)
 5ac:	00000032 	tlt	zero,zero
 5b0:	ffffffa1 	sdc3	$31,-95(ra)
 5b4:	0000003d 	0x3d
 5b8:	ffffffc1 	sdc3	$31,-63(ra)
 5bc:	0000003e 	0x3e
 5c0:	fffffff0 	sdc3	$31,-16(ra)
 5c4:	00000034 	teq	zero,zero
 5c8:	00000028 	0x28
 5cc:	0000005c 	0x5c
 5d0:	ffffffe0 	sdc3	$31,-32(ra)
 5d4:	ffffffe6 	sdc3	$31,-26(ra)
 5d8:	ffffff9d 	sdc3	$31,-99(ra)
 5dc:	00000034 	teq	zero,zero
 5e0:	00000060 	0x60
 5e4:	0000003f 	0x3f
 5e8:	ffffffb5 	sdc3	$31,-75(ra)
 5ec:	ffffffb6 	sdc3	$31,-74(ra)
 5f0:	ffffffae 	sdc3	$31,-82(ra)
 5f4:	00000052 	mflhxu	zero
 5f8:	ffffffa1 	sdc3	$31,-95(ra)
 5fc:	0000002a 	slt	zero,zero,zero
 600:	0000000b 	movn	zero,zero,zero
 604:	ffffffea 	sdc3	$31,-22(ra)
 608:	0000001b 	divu	zero,zero,zero
 60c:	ffffffe5 	sdc3	$31,-27(ra)
 610:	ffffffe5 	sdc3	$31,-27(ra)
 614:	ffffffb4 	sdc3	$31,-76(ra)
 618:	ffffffb9 	sdc3	$31,-71(ra)
 61c:	0000003a 	0x3a
 620:	ffffffd8 	sdc3	$31,-40(ra)
 624:	ffffffbf 	sdc3	$31,-65(ra)
 628:	0000005b 	0x5b
 62c:	ffffffcb 	sdc3	$31,-53(ra)
 630:	ffffffbd 	sdc3	$31,-67(ra)
 634:	00000048 	0x48
 638:	00000024 	and	zero,zero,zero
 63c:	ffffffb3 	sdc3	$31,-77(ra)
 640:	fffffffd 	sdc3	$31,-3(ra)
 644:	0000005d 	0x5d
 648:	ffffffe8 	sdc3	$31,-24(ra)
 64c:	00000061 	0x61
 650:	ffffffcc 	sdc3	$31,-52(ra)
 654:	fffffff5 	sdc3	$31,-11(ra)
 658:	ffffffb3 	sdc3	$31,-77(ra)
 65c:	ffffffa3 	sdc3	$31,-93(ra)
 660:	ffffffa4 	sdc3	$31,-92(ra)
 664:	ffffffe8 	sdc3	$31,-24(ra)
 668:	00000046 	rorv	zero,zero,zero
 66c:	00000012 	mflo	zero
 670:	00000038 	0x38
 674:	00000058 	0x58
 678:	ffffffd5 	sdc3	$31,-43(ra)
 67c:	ffffffd7 	sdc3	$31,-41(ra)
 680:	ffffffe6 	sdc3	$31,-26(ra)
 684:	0000000b 	movn	zero,zero,zero
 688:	ffffffac 	sdc3	$31,-84(ra)
 68c:	fffffff2 	sdc3	$31,-14(ra)
 690:	ffffffd7 	sdc3	$31,-41(ra)
 694:	00000053 	mtlhx	zero
 698:	0000001b 	divu	zero,zero,zero
 69c:	fffffff5 	sdc3	$31,-11(ra)

Disassembly of section .bss:

000006a0 <c>:
	...

Disassembly of section .reginfo:

00000000 <.reginfo>:
   0:	a0000000 	sb	zero,0(zero)
	...

Disassembly of section .pdr:

00000000 <.pdr>:
   0:	00000020 	add	zero,zero,zero
	...
  18:	0000001d 	0x1d
  1c:	0000001f 	0x1f
  20:	00000030 	tge	zero,zero
	...
  38:	0000001d 	0x1d
  3c:	0000001f 	0x1f
  40:	00000054 	0x54
	...
  58:	0000001d 	0x1d
  5c:	0000001f 	0x1f
  60:	00000064 	0x64
  64:	801f0000 	lb	ra,0(zero)
  68:	fffffffc 	sdc3	$31,-4(ra)
	...
  74:	00000028 	0x28
  78:	0000001d 	0x1d
  7c:	0000001f 	0x1f

Disassembly of section .gnu.attributes:

00000000 <.gnu.attributes>:
   0:	00000f41 	0xf41
   4:	756e6700 	jalx	5b99c00 <c+0x5b99560>
   8:	00070100 	sll	zero,a3,0x4
   c:	01040000 	0x1040000

Disassembly of section .comment:

00000000 <.comment>:
   0:	3a434347 	xori	v1,s2,0x4347
   4:	4e472820 	c3	0x472820
   8:	36202955 	ori	zero,s1,0x2955
   c:	302e322e 	andi	t6,at,0x322e
	...
