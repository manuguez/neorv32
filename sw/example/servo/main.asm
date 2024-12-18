
main.elf:     formato del fichero elf32-littleriscv


Desensamblado de la sección .text:

00000000 <_start>:
   0:	00000037          	lui	zero,0x0

00000004 <__crt0_pointer_init>:
   4:	80002117          	auipc	sp,0x80002
   8:	ff810113          	addi	sp,sp,-8 # 80001ffc <__ctr0_io_space_begin+0x800021fc>
   c:	80000197          	auipc	gp,0x80000
  10:	7f418193          	addi	gp,gp,2036 # 80000800 <__ctr0_io_space_begin+0x80000a00>

00000014 <__crt0_cpu_csr_init>:
  14:	00000517          	auipc	a0,0x0
  18:	12050513          	addi	a0,a0,288 # 134 <__crt0_dummy_trap_handler>
  1c:	30551073          	csrw	mtvec,a0
  20:	34151073          	csrw	mepc,a0
  24:	30001073          	csrw	mstatus,zero
  28:	30401073          	csrw	mie,zero
  2c:	30601073          	csrw	mcounteren,zero
  30:	ffa00593          	li	a1,-6
  34:	32059073          	csrw	mcountinhibit,a1
  38:	b0001073          	csrw	mcycle,zero
  3c:	b8001073          	csrw	mcycleh,zero
  40:	b0201073          	csrw	minstret,zero
  44:	b8201073          	csrw	minstreth,zero

00000048 <__crt0_reg_file_clear>:
  48:	00000093          	li	ra,0
  4c:	00000213          	li	tp,0
  50:	00000293          	li	t0,0
  54:	00000313          	li	t1,0
  58:	00000393          	li	t2,0
  5c:	00000713          	li	a4,0
  60:	00000793          	li	a5,0
  64:	00000813          	li	a6,0
  68:	00000893          	li	a7,0
  6c:	00000913          	li	s2,0
  70:	00000993          	li	s3,0
  74:	00000a13          	li	s4,0
  78:	00000a93          	li	s5,0
  7c:	00000b13          	li	s6,0
  80:	00000b93          	li	s7,0
  84:	00000c13          	li	s8,0
  88:	00000c93          	li	s9,0
  8c:	00000d13          	li	s10,0
  90:	00000d93          	li	s11,0
  94:	00000e13          	li	t3,0
  98:	00000e93          	li	t4,0
  9c:	00000f13          	li	t5,0
  a0:	00000f93          	li	t6,0

000000a4 <__crt0_reset_io>:
  a4:	00000417          	auipc	s0,0x0
  a8:	d5c40413          	addi	s0,s0,-676 # fffffe00 <__ctr0_io_space_begin+0x0>
  ac:	00000497          	auipc	s1,0x0
  b0:	f5448493          	addi	s1,s1,-172 # 0 <_start>

000000b4 <__crt0_reset_io_loop>:
  b4:	00042023          	sw	zero,0(s0)
  b8:	00440413          	addi	s0,s0,4
  bc:	fe941ce3          	bne	s0,s1,b4 <__crt0_reset_io_loop>

000000c0 <__crt0_clear_bss>:
  c0:	80000597          	auipc	a1,0x80000
  c4:	f4058593          	addi	a1,a1,-192 # 80000000 <__ctr0_io_space_begin+0x80000200>
  c8:	87418613          	addi	a2,gp,-1932 # 80000074 <__BSS_END__>

000000cc <__crt0_clear_bss_loop>:
  cc:	00c5d863          	bge	a1,a2,dc <__crt0_clear_bss_loop_end>
  d0:	00058023          	sb	zero,0(a1)
  d4:	00158593          	addi	a1,a1,1
  d8:	ff5ff06f          	j	cc <__crt0_clear_bss_loop>

000000dc <__crt0_clear_bss_loop_end>:
  dc:	00001597          	auipc	a1,0x1
  e0:	0ac58593          	addi	a1,a1,172 # 1188 <__crt0_copy_data_src_begin>
  e4:	80000617          	auipc	a2,0x80000
  e8:	f1c60613          	addi	a2,a2,-228 # 80000000 <__ctr0_io_space_begin+0x80000200>
  ec:	80000697          	auipc	a3,0x80000
  f0:	f1468693          	addi	a3,a3,-236 # 80000000 <__ctr0_io_space_begin+0x80000200>

000000f4 <__crt0_copy_data_loop>:
  f4:	00d65c63          	bge	a2,a3,10c <__crt0_copy_data_loop_end>
  f8:	00058703          	lb	a4,0(a1)
  fc:	00e60023          	sb	a4,0(a2)
 100:	00158593          	addi	a1,a1,1
 104:	00160613          	addi	a2,a2,1
 108:	fedff06f          	j	f4 <__crt0_copy_data_loop>

0000010c <__crt0_copy_data_loop_end>:
 10c:	00000513          	li	a0,0
 110:	00000593          	li	a1,0
 114:	06c000ef          	jal	ra,180 <main>

00000118 <__crt0_main_aftermath>:
 118:	34051073          	csrw	mscratch,a0
 11c:	00000093          	li	ra,0
 120:	00008463          	beqz	ra,128 <__crt0_main_aftermath_end>
 124:	000080e7          	jalr	ra

00000128 <__crt0_main_aftermath_end>:
 128:	30047073          	csrci	mstatus,8

0000012c <__crt0_main_aftermath_end_loop>:
 12c:	10500073          	wfi
 130:	ffdff06f          	j	12c <__crt0_main_aftermath_end_loop>

00000134 <__crt0_dummy_trap_handler>:
 134:	ff810113          	addi	sp,sp,-8
 138:	00812023          	sw	s0,0(sp)
 13c:	00912223          	sw	s1,4(sp)
 140:	34202473          	csrr	s0,mcause
 144:	02044663          	bltz	s0,170 <__crt0_dummy_trap_handler_irq>
 148:	34102473          	csrr	s0,mepc

0000014c <__crt0_dummy_trap_handler_exc_c_check>:
 14c:	00041483          	lh	s1,0(s0)
 150:	0034f493          	andi	s1,s1,3
 154:	00240413          	addi	s0,s0,2
 158:	34141073          	csrw	mepc,s0
 15c:	00300413          	li	s0,3
 160:	00941863          	bne	s0,s1,170 <__crt0_dummy_trap_handler_irq>

00000164 <__crt0_dummy_trap_handler_exc_uncrompressed>:
 164:	34102473          	csrr	s0,mepc
 168:	00240413          	addi	s0,s0,2
 16c:	34141073          	csrw	mepc,s0

00000170 <__crt0_dummy_trap_handler_irq>:
 170:	00012403          	lw	s0,0(sp)
 174:	00412483          	lw	s1,4(sp)
 178:	00810113          	addi	sp,sp,8
 17c:	30200073          	mret

00000180 <main>:
 180:	00005537          	lui	a0,0x5
 184:	ff010113          	addi	sp,sp,-16
 188:	00000613          	li	a2,0
 18c:	00000593          	li	a1,0
 190:	b0050513          	addi	a0,a0,-1280 # 4b00 <__crt0_copy_data_src_begin+0x3978>
 194:	00112623          	sw	ra,12(sp)
 198:	00812423          	sw	s0,8(sp)
 19c:	00912223          	sw	s1,4(sp)
 1a0:	0c1000ef          	jal	ra,a60 <neorv32_uart0_setup>
 1a4:	1a8000ef          	jal	ra,34c <neorv32_gpio_available>
 1a8:	06050063          	beqz	a0,208 <main+0x88>
 1ac:	718000ef          	jal	ra,8c4 <neorv32_rte_setup>
 1b0:	00001537          	lui	a0,0x1
 1b4:	eac50513          	addi	a0,a0,-340 # eac <__etext+0x3c>
 1b8:	16d000ef          	jal	ra,b24 <neorv32_uart0_print>
 1bc:	00100493          	li	s1,1
 1c0:	06c000ef          	jal	ra,22c <pwm_init>
 1c4:	00200513          	li	a0,2
 1c8:	194000ef          	jal	ra,35c <neorv32_gpio_pin_get>
 1cc:	fe951ce3          	bne	a0,s1,1c4 <main+0x44>
 1d0:	00d00413          	li	s0,13
 1d4:	01900593          	li	a1,25
 1d8:	00000513          	li	a0,0
 1dc:	1e4000ef          	jal	ra,3c0 <neorv32_pwm_set>
 1e0:	02700513          	li	a0,39
 1e4:	0ac000ef          	jal	ra,290 <neorv32_cpu_delay_ms>
 1e8:	00000593          	li	a1,0
 1ec:	00000513          	li	a0,0
 1f0:	1d0000ef          	jal	ra,3c0 <neorv32_pwm_set>
 1f4:	3e800513          	li	a0,1000
 1f8:	fff40413          	addi	s0,s0,-1
 1fc:	094000ef          	jal	ra,290 <neorv32_cpu_delay_ms>
 200:	fc041ae3          	bnez	s0,1d4 <main+0x54>
 204:	fc1ff06f          	j	1c4 <main+0x44>
 208:	00001537          	lui	a0,0x1
 20c:	e8850513          	addi	a0,a0,-376 # e88 <__etext+0x18>
 210:	115000ef          	jal	ra,b24 <neorv32_uart0_print>
 214:	00c12083          	lw	ra,12(sp)
 218:	00812403          	lw	s0,8(sp)
 21c:	00412483          	lw	s1,4(sp)
 220:	00100513          	li	a0,1
 224:	01010113          	addi	sp,sp,16
 228:	00008067          	ret

0000022c <pwm_init>:
 22c:	ff010113          	addi	sp,sp,-16
 230:	00112623          	sw	ra,12(sp)
 234:	14c000ef          	jal	ra,380 <neorv32_pwm_available>
 238:	00051c63          	bnez	a0,250 <pwm_init+0x24>
 23c:	00c12083          	lw	ra,12(sp)
 240:	00001537          	lui	a0,0x1
 244:	e7050513          	addi	a0,a0,-400 # e70 <__etext>
 248:	01010113          	addi	sp,sp,16
 24c:	1310006f          	j	b7c <neorv32_uart0_printf>
 250:	00300513          	li	a0,3
 254:	13c000ef          	jal	ra,390 <neorv32_pwm_setup>
 258:	00c12083          	lw	ra,12(sp)
 25c:	01010113          	addi	sp,sp,16
 260:	14c0006f          	j	3ac <neorv32_pwm_enable>

00000264 <neorv32_cpu_get_systime>:
 264:	ff010113          	addi	sp,sp,-16
 268:	c81026f3          	rdtimeh	a3
 26c:	c0102773          	rdtime	a4
 270:	c81027f3          	rdtimeh	a5
 274:	fed79ae3          	bne	a5,a3,268 <neorv32_cpu_get_systime+0x4>
 278:	00e12023          	sw	a4,0(sp)
 27c:	00f12223          	sw	a5,4(sp)
 280:	00012503          	lw	a0,0(sp)
 284:	00412583          	lw	a1,4(sp)
 288:	01010113          	addi	sp,sp,16
 28c:	00008067          	ret

00000290 <neorv32_cpu_delay_ms>:
 290:	fd010113          	addi	sp,sp,-48
 294:	00a12623          	sw	a0,12(sp)
 298:	fe002503          	lw	a0,-32(zero) # ffffffe0 <__ctr0_io_space_begin+0x1e0>
 29c:	3e800593          	li	a1,1000
 2a0:	02112623          	sw	ra,44(sp)
 2a4:	02812423          	sw	s0,40(sp)
 2a8:	02912223          	sw	s1,36(sp)
 2ac:	03212023          	sw	s2,32(sp)
 2b0:	01312e23          	sw	s3,28(sp)
 2b4:	311000ef          	jal	ra,dc4 <__hidden___udivsi3>
 2b8:	00c12603          	lw	a2,12(sp)
 2bc:	00000693          	li	a3,0
 2c0:	00000593          	li	a1,0
 2c4:	26d000ef          	jal	ra,d30 <__muldi3>
 2c8:	00050413          	mv	s0,a0
 2cc:	00058993          	mv	s3,a1
 2d0:	f95ff0ef          	jal	ra,264 <neorv32_cpu_get_systime>
 2d4:	00058913          	mv	s2,a1
 2d8:	00050493          	mv	s1,a0
 2dc:	f89ff0ef          	jal	ra,264 <neorv32_cpu_get_systime>
 2e0:	00b96663          	bltu	s2,a1,2ec <neorv32_cpu_delay_ms+0x5c>
 2e4:	05259263          	bne	a1,s2,328 <neorv32_cpu_delay_ms+0x98>
 2e8:	04a4f063          	bgeu	s1,a0,328 <neorv32_cpu_delay_ms+0x98>
 2ec:	008484b3          	add	s1,s1,s0
 2f0:	0084b433          	sltu	s0,s1,s0
 2f4:	01390933          	add	s2,s2,s3
 2f8:	01240433          	add	s0,s0,s2
 2fc:	f69ff0ef          	jal	ra,264 <neorv32_cpu_get_systime>
 300:	fe85eee3          	bltu	a1,s0,2fc <neorv32_cpu_delay_ms+0x6c>
 304:	00b41463          	bne	s0,a1,30c <neorv32_cpu_delay_ms+0x7c>
 308:	fe956ae3          	bltu	a0,s1,2fc <neorv32_cpu_delay_ms+0x6c>
 30c:	02c12083          	lw	ra,44(sp)
 310:	02812403          	lw	s0,40(sp)
 314:	02412483          	lw	s1,36(sp)
 318:	02012903          	lw	s2,32(sp)
 31c:	01c12983          	lw	s3,28(sp)
 320:	03010113          	addi	sp,sp,48
 324:	00008067          	ret
 328:	01c99993          	slli	s3,s3,0x1c
 32c:	00445413          	srli	s0,s0,0x4
 330:	0089e433          	or	s0,s3,s0

00000334 <__neorv32_cpu_delay_ms_start>:
 334:	00040a63          	beqz	s0,348 <__neorv32_cpu_delay_ms_end>
 338:	00040863          	beqz	s0,348 <__neorv32_cpu_delay_ms_end>
 33c:	fff40413          	addi	s0,s0,-1
 340:	00000013          	nop
 344:	ff1ff06f          	j	334 <__neorv32_cpu_delay_ms_start>

00000348 <__neorv32_cpu_delay_ms_end>:
 348:	fc5ff06f          	j	30c <neorv32_cpu_delay_ms+0x7c>

0000034c <neorv32_gpio_available>:
 34c:	fe802503          	lw	a0,-24(zero) # ffffffe8 <__ctr0_io_space_begin+0x1e8>
 350:	01055513          	srli	a0,a0,0x10
 354:	00157513          	andi	a0,a0,1
 358:	00008067          	ret

0000035c <neorv32_gpio_pin_get>:
 35c:	00100793          	li	a5,1
 360:	01f00713          	li	a4,31
 364:	00a797b3          	sll	a5,a5,a0
 368:	00a74863          	blt	a4,a0,378 <neorv32_gpio_pin_get+0x1c>
 36c:	fc002703          	lw	a4,-64(zero) # ffffffc0 <__ctr0_io_space_begin+0x1c0>
 370:	00f77533          	and	a0,a4,a5
 374:	00008067          	ret
 378:	fc402703          	lw	a4,-60(zero) # ffffffc4 <__ctr0_io_space_begin+0x1c4>
 37c:	ff5ff06f          	j	370 <neorv32_gpio_pin_get+0x14>

00000380 <neorv32_pwm_available>:
 380:	fe802503          	lw	a0,-24(zero) # ffffffe8 <__ctr0_io_space_begin+0x1e8>
 384:	01555513          	srli	a0,a0,0x15
 388:	00157513          	andi	a0,a0,1
 38c:	00008067          	ret

00000390 <neorv32_pwm_setup>:
 390:	00757513          	andi	a0,a0,7
 394:	e8000793          	li	a5,-384
 398:	00151513          	slli	a0,a0,0x1
 39c:	0007a023          	sw	zero,0(a5)
 3a0:	00156513          	ori	a0,a0,1
 3a4:	00a7a023          	sw	a0,0(a5)
 3a8:	00008067          	ret

000003ac <neorv32_pwm_enable>:
 3ac:	e8000713          	li	a4,-384
 3b0:	00072783          	lw	a5,0(a4)
 3b4:	0017e793          	ori	a5,a5,1
 3b8:	00f72023          	sw	a5,0(a4)
 3bc:	00008067          	ret

000003c0 <neorv32_pwm_set>:
 3c0:	03b00793          	li	a5,59
 3c4:	02a7e863          	bltu	a5,a0,3f4 <neorv32_pwm_set+0x34>
 3c8:	00357713          	andi	a4,a0,3
 3cc:	0fc57513          	andi	a0,a0,252
 3d0:	e8452683          	lw	a3,-380(a0)
 3d4:	00371713          	slli	a4,a4,0x3
 3d8:	0ff00793          	li	a5,255
 3dc:	00e797b3          	sll	a5,a5,a4
 3e0:	fff7c793          	not	a5,a5
 3e4:	00d7f7b3          	and	a5,a5,a3
 3e8:	00e595b3          	sll	a1,a1,a4
 3ec:	00f5e5b3          	or	a1,a1,a5
 3f0:	e8b52223          	sw	a1,-380(a0)
 3f4:	00008067          	ret
 3f8:	0000                	.2byte	0x0
 3fa:	0000                	.2byte	0x0
 3fc:	0000                	.2byte	0x0
 3fe:	0000                	.2byte	0x0

00000400 <__neorv32_rte_core>:
 400:	fc010113          	addi	sp,sp,-64
 404:	02112e23          	sw	ra,60(sp)
 408:	02512c23          	sw	t0,56(sp)
 40c:	02612a23          	sw	t1,52(sp)
 410:	02712823          	sw	t2,48(sp)
 414:	02a12623          	sw	a0,44(sp)
 418:	02b12423          	sw	a1,40(sp)
 41c:	02c12223          	sw	a2,36(sp)
 420:	02d12023          	sw	a3,32(sp)
 424:	00e12e23          	sw	a4,28(sp)
 428:	00f12c23          	sw	a5,24(sp)
 42c:	01012a23          	sw	a6,20(sp)
 430:	01112823          	sw	a7,16(sp)
 434:	01c12623          	sw	t3,12(sp)
 438:	01d12423          	sw	t4,8(sp)
 43c:	01e12223          	sw	t5,4(sp)
 440:	01f12023          	sw	t6,0(sp)
 444:	34102773          	csrr	a4,mepc
 448:	34071073          	csrw	mscratch,a4
 44c:	342027f3          	csrr	a5,mcause
 450:	0807c863          	bltz	a5,4e0 <__neorv32_rte_core+0xe0>
 454:	00071683          	lh	a3,0(a4)
 458:	00300593          	li	a1,3
 45c:	0036f693          	andi	a3,a3,3
 460:	00270613          	addi	a2,a4,2
 464:	00b69463          	bne	a3,a1,46c <__neorv32_rte_core+0x6c>
 468:	00470613          	addi	a2,a4,4
 46c:	34161073          	csrw	mepc,a2
 470:	00b00713          	li	a4,11
 474:	04f77a63          	bgeu	a4,a5,4c8 <__neorv32_rte_core+0xc8>
 478:	6b000793          	li	a5,1712
 47c:	000780e7          	jalr	a5
 480:	03c12083          	lw	ra,60(sp)
 484:	03812283          	lw	t0,56(sp)
 488:	03412303          	lw	t1,52(sp)
 48c:	03012383          	lw	t2,48(sp)
 490:	02c12503          	lw	a0,44(sp)
 494:	02812583          	lw	a1,40(sp)
 498:	02412603          	lw	a2,36(sp)
 49c:	02012683          	lw	a3,32(sp)
 4a0:	01c12703          	lw	a4,28(sp)
 4a4:	01812783          	lw	a5,24(sp)
 4a8:	01412803          	lw	a6,20(sp)
 4ac:	01012883          	lw	a7,16(sp)
 4b0:	00c12e03          	lw	t3,12(sp)
 4b4:	00812e83          	lw	t4,8(sp)
 4b8:	00412f03          	lw	t5,4(sp)
 4bc:	00012f83          	lw	t6,0(sp)
 4c0:	04010113          	addi	sp,sp,64
 4c4:	30200073          	mret
 4c8:	00001737          	lui	a4,0x1
 4cc:	00279793          	slli	a5,a5,0x2
 4d0:	ec070713          	addi	a4,a4,-320 # ec0 <__etext+0x50>
 4d4:	00e787b3          	add	a5,a5,a4
 4d8:	0007a783          	lw	a5,0(a5)
 4dc:	00078067          	jr	a5
 4e0:	80000737          	lui	a4,0x80000
 4e4:	ffd74713          	xori	a4,a4,-3
 4e8:	00e787b3          	add	a5,a5,a4
 4ec:	01c00713          	li	a4,28
 4f0:	f8f764e3          	bltu	a4,a5,478 <__neorv32_rte_core+0x78>
 4f4:	00001737          	lui	a4,0x1
 4f8:	00279793          	slli	a5,a5,0x2
 4fc:	ef070713          	addi	a4,a4,-272 # ef0 <__etext+0x80>
 500:	00e787b3          	add	a5,a5,a4
 504:	0007a783          	lw	a5,0(a5)
 508:	00078067          	jr	a5
 50c:	800007b7          	lui	a5,0x80000
 510:	0007a783          	lw	a5,0(a5) # 80000000 <__ctr0_io_space_begin+0x80000200>
 514:	f69ff06f          	j	47c <__neorv32_rte_core+0x7c>
 518:	800007b7          	lui	a5,0x80000
 51c:	0047a783          	lw	a5,4(a5) # 80000004 <__ctr0_io_space_begin+0x80000204>
 520:	f5dff06f          	j	47c <__neorv32_rte_core+0x7c>
 524:	800007b7          	lui	a5,0x80000
 528:	0087a783          	lw	a5,8(a5) # 80000008 <__ctr0_io_space_begin+0x80000208>
 52c:	f51ff06f          	j	47c <__neorv32_rte_core+0x7c>
 530:	800007b7          	lui	a5,0x80000
 534:	00c7a783          	lw	a5,12(a5) # 8000000c <__ctr0_io_space_begin+0x8000020c>
 538:	f45ff06f          	j	47c <__neorv32_rte_core+0x7c>
 53c:	800007b7          	lui	a5,0x80000
 540:	0107a783          	lw	a5,16(a5) # 80000010 <__ctr0_io_space_begin+0x80000210>
 544:	f39ff06f          	j	47c <__neorv32_rte_core+0x7c>
 548:	800007b7          	lui	a5,0x80000
 54c:	0147a783          	lw	a5,20(a5) # 80000014 <__ctr0_io_space_begin+0x80000214>
 550:	f2dff06f          	j	47c <__neorv32_rte_core+0x7c>
 554:	800007b7          	lui	a5,0x80000
 558:	0187a783          	lw	a5,24(a5) # 80000018 <__ctr0_io_space_begin+0x80000218>
 55c:	f21ff06f          	j	47c <__neorv32_rte_core+0x7c>
 560:	800007b7          	lui	a5,0x80000
 564:	01c7a783          	lw	a5,28(a5) # 8000001c <__ctr0_io_space_begin+0x8000021c>
 568:	f15ff06f          	j	47c <__neorv32_rte_core+0x7c>
 56c:	800007b7          	lui	a5,0x80000
 570:	0207a783          	lw	a5,32(a5) # 80000020 <__ctr0_io_space_begin+0x80000220>
 574:	f09ff06f          	j	47c <__neorv32_rte_core+0x7c>
 578:	800007b7          	lui	a5,0x80000
 57c:	0247a783          	lw	a5,36(a5) # 80000024 <__ctr0_io_space_begin+0x80000224>
 580:	efdff06f          	j	47c <__neorv32_rte_core+0x7c>
 584:	800007b7          	lui	a5,0x80000
 588:	0287a783          	lw	a5,40(a5) # 80000028 <__ctr0_io_space_begin+0x80000228>
 58c:	ef1ff06f          	j	47c <__neorv32_rte_core+0x7c>
 590:	800007b7          	lui	a5,0x80000
 594:	02c7a783          	lw	a5,44(a5) # 8000002c <__ctr0_io_space_begin+0x8000022c>
 598:	ee5ff06f          	j	47c <__neorv32_rte_core+0x7c>
 59c:	800007b7          	lui	a5,0x80000
 5a0:	0307a783          	lw	a5,48(a5) # 80000030 <__ctr0_io_space_begin+0x80000230>
 5a4:	ed9ff06f          	j	47c <__neorv32_rte_core+0x7c>
 5a8:	800007b7          	lui	a5,0x80000
 5ac:	0347a783          	lw	a5,52(a5) # 80000034 <__ctr0_io_space_begin+0x80000234>
 5b0:	ecdff06f          	j	47c <__neorv32_rte_core+0x7c>
 5b4:	800007b7          	lui	a5,0x80000
 5b8:	0387a783          	lw	a5,56(a5) # 80000038 <__ctr0_io_space_begin+0x80000238>
 5bc:	ec1ff06f          	j	47c <__neorv32_rte_core+0x7c>
 5c0:	800007b7          	lui	a5,0x80000
 5c4:	03c7a783          	lw	a5,60(a5) # 8000003c <__ctr0_io_space_begin+0x8000023c>
 5c8:	eb5ff06f          	j	47c <__neorv32_rte_core+0x7c>
 5cc:	800007b7          	lui	a5,0x80000
 5d0:	0407a783          	lw	a5,64(a5) # 80000040 <__ctr0_io_space_begin+0x80000240>
 5d4:	ea9ff06f          	j	47c <__neorv32_rte_core+0x7c>
 5d8:	8441a783          	lw	a5,-1980(gp) # 80000044 <__neorv32_rte_vector_lut+0x44>
 5dc:	ea1ff06f          	j	47c <__neorv32_rte_core+0x7c>
 5e0:	8481a783          	lw	a5,-1976(gp) # 80000048 <__neorv32_rte_vector_lut+0x48>
 5e4:	e99ff06f          	j	47c <__neorv32_rte_core+0x7c>
 5e8:	84c1a783          	lw	a5,-1972(gp) # 8000004c <__neorv32_rte_vector_lut+0x4c>
 5ec:	e91ff06f          	j	47c <__neorv32_rte_core+0x7c>
 5f0:	8501a783          	lw	a5,-1968(gp) # 80000050 <__neorv32_rte_vector_lut+0x50>
 5f4:	e89ff06f          	j	47c <__neorv32_rte_core+0x7c>
 5f8:	8541a783          	lw	a5,-1964(gp) # 80000054 <__neorv32_rte_vector_lut+0x54>
 5fc:	e81ff06f          	j	47c <__neorv32_rte_core+0x7c>
 600:	8581a783          	lw	a5,-1960(gp) # 80000058 <__neorv32_rte_vector_lut+0x58>
 604:	e79ff06f          	j	47c <__neorv32_rte_core+0x7c>
 608:	85c1a783          	lw	a5,-1956(gp) # 8000005c <__neorv32_rte_vector_lut+0x5c>
 60c:	e71ff06f          	j	47c <__neorv32_rte_core+0x7c>
 610:	8601a783          	lw	a5,-1952(gp) # 80000060 <__neorv32_rte_vector_lut+0x60>
 614:	e69ff06f          	j	47c <__neorv32_rte_core+0x7c>
 618:	8641a783          	lw	a5,-1948(gp) # 80000064 <__neorv32_rte_vector_lut+0x64>
 61c:	e61ff06f          	j	47c <__neorv32_rte_core+0x7c>
 620:	8681a783          	lw	a5,-1944(gp) # 80000068 <__neorv32_rte_vector_lut+0x68>
 624:	e59ff06f          	j	47c <__neorv32_rte_core+0x7c>
 628:	86c1a783          	lw	a5,-1940(gp) # 8000006c <__neorv32_rte_vector_lut+0x6c>
 62c:	e51ff06f          	j	47c <__neorv32_rte_core+0x7c>
 630:	8701a783          	lw	a5,-1936(gp) # 80000070 <__neorv32_rte_vector_lut+0x70>
 634:	e49ff06f          	j	47c <__neorv32_rte_core+0x7c>
 638:	0000                	.2byte	0x0
 63a:	0000                	.2byte	0x0
 63c:	0000                	.2byte	0x0
 63e:	0000                	.2byte	0x0

00000640 <__neorv32_rte_print_hex_word>:
 640:	fe010113          	addi	sp,sp,-32
 644:	01212823          	sw	s2,16(sp)
 648:	00050913          	mv	s2,a0
 64c:	00001537          	lui	a0,0x1
 650:	00912a23          	sw	s1,20(sp)
 654:	f6450513          	addi	a0,a0,-156 # f64 <__etext+0xf4>
 658:	000014b7          	lui	s1,0x1
 65c:	00812c23          	sw	s0,24(sp)
 660:	01312623          	sw	s3,12(sp)
 664:	00112e23          	sw	ra,28(sp)
 668:	01c00413          	li	s0,28
 66c:	4b8000ef          	jal	ra,b24 <neorv32_uart0_print>
 670:	15848493          	addi	s1,s1,344 # 1158 <hex_symbols.0>
 674:	ffc00993          	li	s3,-4
 678:	008957b3          	srl	a5,s2,s0
 67c:	00f7f793          	andi	a5,a5,15
 680:	00f487b3          	add	a5,s1,a5
 684:	0007c503          	lbu	a0,0(a5)
 688:	ffc40413          	addi	s0,s0,-4
 68c:	480000ef          	jal	ra,b0c <neorv32_uart0_putc>
 690:	ff3414e3          	bne	s0,s3,678 <__neorv32_rte_print_hex_word+0x38>
 694:	01c12083          	lw	ra,28(sp)
 698:	01812403          	lw	s0,24(sp)
 69c:	01412483          	lw	s1,20(sp)
 6a0:	01012903          	lw	s2,16(sp)
 6a4:	00c12983          	lw	s3,12(sp)
 6a8:	02010113          	addi	sp,sp,32
 6ac:	00008067          	ret

000006b0 <__neorv32_rte_debug_exc_handler>:
 6b0:	ff010113          	addi	sp,sp,-16
 6b4:	00112623          	sw	ra,12(sp)
 6b8:	00812423          	sw	s0,8(sp)
 6bc:	00912223          	sw	s1,4(sp)
 6c0:	390000ef          	jal	ra,a50 <neorv32_uart0_available>
 6c4:	1a050e63          	beqz	a0,880 <__neorv32_rte_debug_exc_handler+0x1d0>
 6c8:	00001537          	lui	a0,0x1
 6cc:	f6850513          	addi	a0,a0,-152 # f68 <__etext+0xf8>
 6d0:	454000ef          	jal	ra,b24 <neorv32_uart0_print>
 6d4:	34202473          	csrr	s0,mcause
 6d8:	00900713          	li	a4,9
 6dc:	00f47793          	andi	a5,s0,15
 6e0:	03078493          	addi	s1,a5,48
 6e4:	00f77463          	bgeu	a4,a5,6ec <__neorv32_rte_debug_exc_handler+0x3c>
 6e8:	05778493          	addi	s1,a5,87
 6ec:	00b00793          	li	a5,11
 6f0:	0087ee63          	bltu	a5,s0,70c <__neorv32_rte_debug_exc_handler+0x5c>
 6f4:	00001737          	lui	a4,0x1
 6f8:	00241793          	slli	a5,s0,0x2
 6fc:	12870713          	addi	a4,a4,296 # 1128 <__etext+0x2b8>
 700:	00e787b3          	add	a5,a5,a4
 704:	0007a783          	lw	a5,0(a5)
 708:	00078067          	jr	a5
 70c:	800007b7          	lui	a5,0x80000
 710:	00b78713          	addi	a4,a5,11 # 8000000b <__ctr0_io_space_begin+0x8000020b>
 714:	14e40463          	beq	s0,a4,85c <__neorv32_rte_debug_exc_handler+0x1ac>
 718:	02876663          	bltu	a4,s0,744 <__neorv32_rte_debug_exc_handler+0x94>
 71c:	00378713          	addi	a4,a5,3
 720:	12e40263          	beq	s0,a4,844 <__neorv32_rte_debug_exc_handler+0x194>
 724:	00778793          	addi	a5,a5,7
 728:	12f40463          	beq	s0,a5,850 <__neorv32_rte_debug_exc_handler+0x1a0>
 72c:	00001537          	lui	a0,0x1
 730:	0c850513          	addi	a0,a0,200 # 10c8 <__etext+0x258>
 734:	3f0000ef          	jal	ra,b24 <neorv32_uart0_print>
 738:	00040513          	mv	a0,s0
 73c:	f05ff0ef          	jal	ra,640 <__neorv32_rte_print_hex_word>
 740:	0280006f          	j	768 <__neorv32_rte_debug_exc_handler+0xb8>
 744:	ff07c793          	xori	a5,a5,-16
 748:	00f407b3          	add	a5,s0,a5
 74c:	00f00713          	li	a4,15
 750:	fcf76ee3          	bltu	a4,a5,72c <__neorv32_rte_debug_exc_handler+0x7c>
 754:	00001537          	lui	a0,0x1
 758:	0b850513          	addi	a0,a0,184 # 10b8 <__etext+0x248>
 75c:	3c8000ef          	jal	ra,b24 <neorv32_uart0_print>
 760:	00048513          	mv	a0,s1
 764:	3a8000ef          	jal	ra,b0c <neorv32_uart0_putc>
 768:	00001537          	lui	a0,0x1
 76c:	10c50513          	addi	a0,a0,268 # 110c <__etext+0x29c>
 770:	3b4000ef          	jal	ra,b24 <neorv32_uart0_print>
 774:	34002573          	csrr	a0,mscratch
 778:	ec9ff0ef          	jal	ra,640 <__neorv32_rte_print_hex_word>
 77c:	00001537          	lui	a0,0x1
 780:	11450513          	addi	a0,a0,276 # 1114 <__etext+0x2a4>
 784:	3a0000ef          	jal	ra,b24 <neorv32_uart0_print>
 788:	34302573          	csrr	a0,mtval
 78c:	eb5ff0ef          	jal	ra,640 <__neorv32_rte_print_hex_word>
 790:	00812403          	lw	s0,8(sp)
 794:	00c12083          	lw	ra,12(sp)
 798:	00412483          	lw	s1,4(sp)
 79c:	00001537          	lui	a0,0x1
 7a0:	12050513          	addi	a0,a0,288 # 1120 <__etext+0x2b0>
 7a4:	01010113          	addi	sp,sp,16
 7a8:	37c0006f          	j	b24 <neorv32_uart0_print>
 7ac:	00001537          	lui	a0,0x1
 7b0:	f7050513          	addi	a0,a0,-144 # f70 <__etext+0x100>
 7b4:	370000ef          	jal	ra,b24 <neorv32_uart0_print>
 7b8:	fb1ff06f          	j	768 <__neorv32_rte_debug_exc_handler+0xb8>
 7bc:	00001537          	lui	a0,0x1
 7c0:	f9050513          	addi	a0,a0,-112 # f90 <__etext+0x120>
 7c4:	360000ef          	jal	ra,b24 <neorv32_uart0_print>
 7c8:	f7c02783          	lw	a5,-132(zero) # ffffff7c <__ctr0_io_space_begin+0x17c>
 7cc:	0a07d463          	bgez	a5,874 <__neorv32_rte_debug_exc_handler+0x1c4>
 7d0:	0017f793          	andi	a5,a5,1
 7d4:	08078a63          	beqz	a5,868 <__neorv32_rte_debug_exc_handler+0x1b8>
 7d8:	00001537          	lui	a0,0x1
 7dc:	0e050513          	addi	a0,a0,224 # 10e0 <__etext+0x270>
 7e0:	fd5ff06f          	j	7b4 <__neorv32_rte_debug_exc_handler+0x104>
 7e4:	00001537          	lui	a0,0x1
 7e8:	fac50513          	addi	a0,a0,-84 # fac <__etext+0x13c>
 7ec:	fc9ff06f          	j	7b4 <__neorv32_rte_debug_exc_handler+0x104>
 7f0:	00001537          	lui	a0,0x1
 7f4:	fc050513          	addi	a0,a0,-64 # fc0 <__etext+0x150>
 7f8:	fbdff06f          	j	7b4 <__neorv32_rte_debug_exc_handler+0x104>
 7fc:	00001537          	lui	a0,0x1
 800:	fcc50513          	addi	a0,a0,-52 # fcc <__etext+0x15c>
 804:	fb1ff06f          	j	7b4 <__neorv32_rte_debug_exc_handler+0x104>
 808:	00001537          	lui	a0,0x1
 80c:	fe450513          	addi	a0,a0,-28 # fe4 <__etext+0x174>
 810:	fb5ff06f          	j	7c4 <__neorv32_rte_debug_exc_handler+0x114>
 814:	00001537          	lui	a0,0x1
 818:	ff850513          	addi	a0,a0,-8 # ff8 <__etext+0x188>
 81c:	f99ff06f          	j	7b4 <__neorv32_rte_debug_exc_handler+0x104>
 820:	00001537          	lui	a0,0x1
 824:	01450513          	addi	a0,a0,20 # 1014 <__etext+0x1a4>
 828:	f9dff06f          	j	7c4 <__neorv32_rte_debug_exc_handler+0x114>
 82c:	00001537          	lui	a0,0x1
 830:	02850513          	addi	a0,a0,40 # 1028 <__etext+0x1b8>
 834:	f81ff06f          	j	7b4 <__neorv32_rte_debug_exc_handler+0x104>
 838:	00001537          	lui	a0,0x1
 83c:	04850513          	addi	a0,a0,72 # 1048 <__etext+0x1d8>
 840:	f75ff06f          	j	7b4 <__neorv32_rte_debug_exc_handler+0x104>
 844:	00001537          	lui	a0,0x1
 848:	06850513          	addi	a0,a0,104 # 1068 <__etext+0x1f8>
 84c:	f69ff06f          	j	7b4 <__neorv32_rte_debug_exc_handler+0x104>
 850:	00001537          	lui	a0,0x1
 854:	08450513          	addi	a0,a0,132 # 1084 <__etext+0x214>
 858:	f5dff06f          	j	7b4 <__neorv32_rte_debug_exc_handler+0x104>
 85c:	00001537          	lui	a0,0x1
 860:	09c50513          	addi	a0,a0,156 # 109c <__etext+0x22c>
 864:	f51ff06f          	j	7b4 <__neorv32_rte_debug_exc_handler+0x104>
 868:	00001537          	lui	a0,0x1
 86c:	0f050513          	addi	a0,a0,240 # 10f0 <__etext+0x280>
 870:	f45ff06f          	j	7b4 <__neorv32_rte_debug_exc_handler+0x104>
 874:	00001537          	lui	a0,0x1
 878:	10050513          	addi	a0,a0,256 # 1100 <__etext+0x290>
 87c:	f39ff06f          	j	7b4 <__neorv32_rte_debug_exc_handler+0x104>
 880:	00c12083          	lw	ra,12(sp)
 884:	00812403          	lw	s0,8(sp)
 888:	00412483          	lw	s1,4(sp)
 88c:	01010113          	addi	sp,sp,16
 890:	00008067          	ret

00000894 <neorv32_rte_exception_uninstall>:
 894:	01f00793          	li	a5,31
 898:	02a7e263          	bltu	a5,a0,8bc <neorv32_rte_exception_uninstall+0x28>
 89c:	800007b7          	lui	a5,0x80000
 8a0:	00251513          	slli	a0,a0,0x2
 8a4:	00078793          	mv	a5,a5
 8a8:	00a787b3          	add	a5,a5,a0
 8ac:	6b000713          	li	a4,1712
 8b0:	00e7a023          	sw	a4,0(a5) # 80000000 <__ctr0_io_space_begin+0x80000200>
 8b4:	00000513          	li	a0,0
 8b8:	00008067          	ret
 8bc:	00100513          	li	a0,1
 8c0:	00008067          	ret

000008c4 <neorv32_rte_setup>:
 8c4:	ff010113          	addi	sp,sp,-16
 8c8:	00112623          	sw	ra,12(sp)
 8cc:	00812423          	sw	s0,8(sp)
 8d0:	00912223          	sw	s1,4(sp)
 8d4:	40000793          	li	a5,1024
 8d8:	30579073          	csrw	mtvec,a5
 8dc:	00000413          	li	s0,0
 8e0:	01d00493          	li	s1,29
 8e4:	00040513          	mv	a0,s0
 8e8:	00140413          	addi	s0,s0,1
 8ec:	0ff47413          	zext.b	s0,s0
 8f0:	fa5ff0ef          	jal	ra,894 <neorv32_rte_exception_uninstall>
 8f4:	fe9418e3          	bne	s0,s1,8e4 <neorv32_rte_setup+0x20>
 8f8:	00c12083          	lw	ra,12(sp)
 8fc:	00812403          	lw	s0,8(sp)
 900:	00412483          	lw	s1,4(sp)
 904:	01010113          	addi	sp,sp,16
 908:	00008067          	ret

0000090c <__neorv32_uart_itoa>:
 90c:	fd010113          	addi	sp,sp,-48
 910:	02812423          	sw	s0,40(sp)
 914:	02912223          	sw	s1,36(sp)
 918:	03212023          	sw	s2,32(sp)
 91c:	01312e23          	sw	s3,28(sp)
 920:	01412c23          	sw	s4,24(sp)
 924:	02112623          	sw	ra,44(sp)
 928:	01512a23          	sw	s5,20(sp)
 92c:	00001a37          	lui	s4,0x1
 930:	00050493          	mv	s1,a0
 934:	00058413          	mv	s0,a1
 938:	00058523          	sb	zero,10(a1)
 93c:	00000993          	li	s3,0
 940:	00410913          	addi	s2,sp,4
 944:	17ca0a13          	addi	s4,s4,380 # 117c <numbers.1>
 948:	00a00593          	li	a1,10
 94c:	00048513          	mv	a0,s1
 950:	4bc000ef          	jal	ra,e0c <__umodsi3>
 954:	00aa0533          	add	a0,s4,a0
 958:	00054783          	lbu	a5,0(a0)
 95c:	01390ab3          	add	s5,s2,s3
 960:	00048513          	mv	a0,s1
 964:	00fa8023          	sb	a5,0(s5)
 968:	00a00593          	li	a1,10
 96c:	458000ef          	jal	ra,dc4 <__hidden___udivsi3>
 970:	00198993          	addi	s3,s3,1
 974:	00a00793          	li	a5,10
 978:	00050493          	mv	s1,a0
 97c:	fcf996e3          	bne	s3,a5,948 <__neorv32_uart_itoa+0x3c>
 980:	00090693          	mv	a3,s2
 984:	00900713          	li	a4,9
 988:	03000613          	li	a2,48
 98c:	0096c583          	lbu	a1,9(a3)
 990:	00070793          	mv	a5,a4
 994:	fff70713          	addi	a4,a4,-1
 998:	01071713          	slli	a4,a4,0x10
 99c:	01075713          	srli	a4,a4,0x10
 9a0:	00c59a63          	bne	a1,a2,9b4 <__neorv32_uart_itoa+0xa8>
 9a4:	000684a3          	sb	zero,9(a3)
 9a8:	fff68693          	addi	a3,a3,-1
 9ac:	fe0710e3          	bnez	a4,98c <__neorv32_uart_itoa+0x80>
 9b0:	00000793          	li	a5,0
 9b4:	00f907b3          	add	a5,s2,a5
 9b8:	00000713          	li	a4,0
 9bc:	0007c683          	lbu	a3,0(a5)
 9c0:	00068c63          	beqz	a3,9d8 <__neorv32_uart_itoa+0xcc>
 9c4:	00170613          	addi	a2,a4,1
 9c8:	00e40733          	add	a4,s0,a4
 9cc:	00d70023          	sb	a3,0(a4)
 9d0:	01061713          	slli	a4,a2,0x10
 9d4:	01075713          	srli	a4,a4,0x10
 9d8:	fff78693          	addi	a3,a5,-1
 9dc:	02f91863          	bne	s2,a5,a0c <__neorv32_uart_itoa+0x100>
 9e0:	00e40433          	add	s0,s0,a4
 9e4:	00040023          	sb	zero,0(s0)
 9e8:	02c12083          	lw	ra,44(sp)
 9ec:	02812403          	lw	s0,40(sp)
 9f0:	02412483          	lw	s1,36(sp)
 9f4:	02012903          	lw	s2,32(sp)
 9f8:	01c12983          	lw	s3,28(sp)
 9fc:	01812a03          	lw	s4,24(sp)
 a00:	01412a83          	lw	s5,20(sp)
 a04:	03010113          	addi	sp,sp,48
 a08:	00008067          	ret
 a0c:	00068793          	mv	a5,a3
 a10:	fadff06f          	j	9bc <__neorv32_uart_itoa+0xb0>

00000a14 <__neorv32_uart_tohex>:
 a14:	00001637          	lui	a2,0x1
 a18:	00758693          	addi	a3,a1,7
 a1c:	00000713          	li	a4,0
 a20:	16860613          	addi	a2,a2,360 # 1168 <symbols.0>
 a24:	02000813          	li	a6,32
 a28:	00e557b3          	srl	a5,a0,a4
 a2c:	00f7f793          	andi	a5,a5,15
 a30:	00f607b3          	add	a5,a2,a5
 a34:	0007c783          	lbu	a5,0(a5)
 a38:	00470713          	addi	a4,a4,4
 a3c:	fff68693          	addi	a3,a3,-1
 a40:	00f680a3          	sb	a5,1(a3)
 a44:	ff0712e3          	bne	a4,a6,a28 <__neorv32_uart_tohex+0x14>
 a48:	00058423          	sb	zero,8(a1)
 a4c:	00008067          	ret

00000a50 <neorv32_uart0_available>:
 a50:	fe802503          	lw	a0,-24(zero) # ffffffe8 <__ctr0_io_space_begin+0x1e8>
 a54:	01255513          	srli	a0,a0,0x12
 a58:	00157513          	andi	a0,a0,1
 a5c:	00008067          	ret

00000a60 <neorv32_uart0_setup>:
 a60:	ff010113          	addi	sp,sp,-16
 a64:	00812423          	sw	s0,8(sp)
 a68:	00912223          	sw	s1,4(sp)
 a6c:	00112623          	sw	ra,12(sp)
 a70:	fa002023          	sw	zero,-96(zero) # ffffffa0 <__ctr0_io_space_begin+0x1a0>
 a74:	fe002783          	lw	a5,-32(zero) # ffffffe0 <__ctr0_io_space_begin+0x1e0>
 a78:	00058413          	mv	s0,a1
 a7c:	00151593          	slli	a1,a0,0x1
 a80:	00078513          	mv	a0,a5
 a84:	00060493          	mv	s1,a2
 a88:	33c000ef          	jal	ra,dc4 <__hidden___udivsi3>
 a8c:	01051513          	slli	a0,a0,0x10
 a90:	000017b7          	lui	a5,0x1
 a94:	01055513          	srli	a0,a0,0x10
 a98:	00000713          	li	a4,0
 a9c:	ffe78793          	addi	a5,a5,-2 # ffe <__etext+0x18e>
 aa0:	04a7e463          	bltu	a5,a0,ae8 <neorv32_uart0_setup+0x88>
 aa4:	0034f493          	andi	s1,s1,3
 aa8:	01449493          	slli	s1,s1,0x14
 aac:	00347413          	andi	s0,s0,3
 ab0:	fff50793          	addi	a5,a0,-1
 ab4:	0097e7b3          	or	a5,a5,s1
 ab8:	01641413          	slli	s0,s0,0x16
 abc:	0087e7b3          	or	a5,a5,s0
 ac0:	01871713          	slli	a4,a4,0x18
 ac4:	00c12083          	lw	ra,12(sp)
 ac8:	00812403          	lw	s0,8(sp)
 acc:	00e7e7b3          	or	a5,a5,a4
 ad0:	10000737          	lui	a4,0x10000
 ad4:	00e7e7b3          	or	a5,a5,a4
 ad8:	faf02023          	sw	a5,-96(zero) # ffffffa0 <__ctr0_io_space_begin+0x1a0>
 adc:	00412483          	lw	s1,4(sp)
 ae0:	01010113          	addi	sp,sp,16
 ae4:	00008067          	ret
 ae8:	ffe70693          	addi	a3,a4,-2 # ffffffe <__crt0_copy_data_src_begin+0xfffee76>
 aec:	0fd6f693          	andi	a3,a3,253
 af0:	00069a63          	bnez	a3,b04 <neorv32_uart0_setup+0xa4>
 af4:	00355513          	srli	a0,a0,0x3
 af8:	00170713          	addi	a4,a4,1
 afc:	0ff77713          	zext.b	a4,a4
 b00:	fa1ff06f          	j	aa0 <neorv32_uart0_setup+0x40>
 b04:	00155513          	srli	a0,a0,0x1
 b08:	ff1ff06f          	j	af8 <neorv32_uart0_setup+0x98>

00000b0c <neorv32_uart0_putc>:
 b0c:	00040737          	lui	a4,0x40
 b10:	fa002783          	lw	a5,-96(zero) # ffffffa0 <__ctr0_io_space_begin+0x1a0>
 b14:	00e7f7b3          	and	a5,a5,a4
 b18:	fe079ce3          	bnez	a5,b10 <neorv32_uart0_putc+0x4>
 b1c:	faa02223          	sw	a0,-92(zero) # ffffffa4 <__ctr0_io_space_begin+0x1a4>
 b20:	00008067          	ret

00000b24 <neorv32_uart0_print>:
 b24:	ff010113          	addi	sp,sp,-16
 b28:	00812423          	sw	s0,8(sp)
 b2c:	01212023          	sw	s2,0(sp)
 b30:	00112623          	sw	ra,12(sp)
 b34:	00912223          	sw	s1,4(sp)
 b38:	00050413          	mv	s0,a0
 b3c:	00a00913          	li	s2,10
 b40:	00044483          	lbu	s1,0(s0)
 b44:	00140413          	addi	s0,s0,1
 b48:	00049e63          	bnez	s1,b64 <neorv32_uart0_print+0x40>
 b4c:	00c12083          	lw	ra,12(sp)
 b50:	00812403          	lw	s0,8(sp)
 b54:	00412483          	lw	s1,4(sp)
 b58:	00012903          	lw	s2,0(sp)
 b5c:	01010113          	addi	sp,sp,16
 b60:	00008067          	ret
 b64:	01249663          	bne	s1,s2,b70 <neorv32_uart0_print+0x4c>
 b68:	00d00513          	li	a0,13
 b6c:	fa1ff0ef          	jal	ra,b0c <neorv32_uart0_putc>
 b70:	00048513          	mv	a0,s1
 b74:	f99ff0ef          	jal	ra,b0c <neorv32_uart0_putc>
 b78:	fc9ff06f          	j	b40 <neorv32_uart0_print+0x1c>

00000b7c <neorv32_uart0_printf>:
 b7c:	fa010113          	addi	sp,sp,-96
 b80:	04f12a23          	sw	a5,84(sp)
 b84:	04410793          	addi	a5,sp,68
 b88:	02812c23          	sw	s0,56(sp)
 b8c:	03212823          	sw	s2,48(sp)
 b90:	03312623          	sw	s3,44(sp)
 b94:	03412423          	sw	s4,40(sp)
 b98:	03512223          	sw	s5,36(sp)
 b9c:	03612023          	sw	s6,32(sp)
 ba0:	01712e23          	sw	s7,28(sp)
 ba4:	01812c23          	sw	s8,24(sp)
 ba8:	02112e23          	sw	ra,60(sp)
 bac:	02912a23          	sw	s1,52(sp)
 bb0:	00050413          	mv	s0,a0
 bb4:	04b12223          	sw	a1,68(sp)
 bb8:	04c12423          	sw	a2,72(sp)
 bbc:	04d12623          	sw	a3,76(sp)
 bc0:	04e12823          	sw	a4,80(sp)
 bc4:	05012c23          	sw	a6,88(sp)
 bc8:	05112e23          	sw	a7,92(sp)
 bcc:	00f12023          	sw	a5,0(sp)
 bd0:	02500993          	li	s3,37
 bd4:	00a00a13          	li	s4,10
 bd8:	07300913          	li	s2,115
 bdc:	07500a93          	li	s5,117
 be0:	07800b13          	li	s6,120
 be4:	06300b93          	li	s7,99
 be8:	06900c13          	li	s8,105
 bec:	00044483          	lbu	s1,0(s0)
 bf0:	02049a63          	bnez	s1,c24 <neorv32_uart0_printf+0xa8>
 bf4:	03c12083          	lw	ra,60(sp)
 bf8:	03812403          	lw	s0,56(sp)
 bfc:	03412483          	lw	s1,52(sp)
 c00:	03012903          	lw	s2,48(sp)
 c04:	02c12983          	lw	s3,44(sp)
 c08:	02812a03          	lw	s4,40(sp)
 c0c:	02412a83          	lw	s5,36(sp)
 c10:	02012b03          	lw	s6,32(sp)
 c14:	01c12b83          	lw	s7,28(sp)
 c18:	01812c03          	lw	s8,24(sp)
 c1c:	06010113          	addi	sp,sp,96
 c20:	00008067          	ret
 c24:	0d349663          	bne	s1,s3,cf0 <neorv32_uart0_printf+0x174>
 c28:	00144483          	lbu	s1,1(s0)
 c2c:	05248263          	beq	s1,s2,c70 <neorv32_uart0_printf+0xf4>
 c30:	00996e63          	bltu	s2,s1,c4c <neorv32_uart0_printf+0xd0>
 c34:	05748c63          	beq	s1,s7,c8c <neorv32_uart0_printf+0x110>
 c38:	07848663          	beq	s1,s8,ca4 <neorv32_uart0_printf+0x128>
 c3c:	02500513          	li	a0,37
 c40:	ecdff0ef          	jal	ra,b0c <neorv32_uart0_putc>
 c44:	00048513          	mv	a0,s1
 c48:	0540006f          	j	c9c <neorv32_uart0_printf+0x120>
 c4c:	09548663          	beq	s1,s5,cd8 <neorv32_uart0_printf+0x15c>
 c50:	ff6496e3          	bne	s1,s6,c3c <neorv32_uart0_printf+0xc0>
 c54:	00012783          	lw	a5,0(sp)
 c58:	00410593          	addi	a1,sp,4
 c5c:	0007a503          	lw	a0,0(a5)
 c60:	00478713          	addi	a4,a5,4
 c64:	00e12023          	sw	a4,0(sp)
 c68:	dadff0ef          	jal	ra,a14 <__neorv32_uart_tohex>
 c6c:	0640006f          	j	cd0 <neorv32_uart0_printf+0x154>
 c70:	00012783          	lw	a5,0(sp)
 c74:	0007a503          	lw	a0,0(a5)
 c78:	00478713          	addi	a4,a5,4
 c7c:	00e12023          	sw	a4,0(sp)
 c80:	ea5ff0ef          	jal	ra,b24 <neorv32_uart0_print>
 c84:	00240413          	addi	s0,s0,2
 c88:	f65ff06f          	j	bec <neorv32_uart0_printf+0x70>
 c8c:	00012783          	lw	a5,0(sp)
 c90:	0007c503          	lbu	a0,0(a5)
 c94:	00478713          	addi	a4,a5,4
 c98:	00e12023          	sw	a4,0(sp)
 c9c:	e71ff0ef          	jal	ra,b0c <neorv32_uart0_putc>
 ca0:	fe5ff06f          	j	c84 <neorv32_uart0_printf+0x108>
 ca4:	00012783          	lw	a5,0(sp)
 ca8:	0007a483          	lw	s1,0(a5)
 cac:	00478713          	addi	a4,a5,4
 cb0:	00e12023          	sw	a4,0(sp)
 cb4:	0004d863          	bgez	s1,cc4 <neorv32_uart0_printf+0x148>
 cb8:	02d00513          	li	a0,45
 cbc:	409004b3          	neg	s1,s1
 cc0:	e4dff0ef          	jal	ra,b0c <neorv32_uart0_putc>
 cc4:	00410593          	addi	a1,sp,4
 cc8:	00048513          	mv	a0,s1
 ccc:	c41ff0ef          	jal	ra,90c <__neorv32_uart_itoa>
 cd0:	00410513          	addi	a0,sp,4
 cd4:	fadff06f          	j	c80 <neorv32_uart0_printf+0x104>
 cd8:	00012783          	lw	a5,0(sp)
 cdc:	00410593          	addi	a1,sp,4
 ce0:	00478713          	addi	a4,a5,4
 ce4:	0007a503          	lw	a0,0(a5)
 ce8:	00e12023          	sw	a4,0(sp)
 cec:	fe1ff06f          	j	ccc <neorv32_uart0_printf+0x150>
 cf0:	01449663          	bne	s1,s4,cfc <neorv32_uart0_printf+0x180>
 cf4:	00d00513          	li	a0,13
 cf8:	e15ff0ef          	jal	ra,b0c <neorv32_uart0_putc>
 cfc:	00048513          	mv	a0,s1
 d00:	00140413          	addi	s0,s0,1
 d04:	e09ff0ef          	jal	ra,b0c <neorv32_uart0_putc>
 d08:	ee5ff06f          	j	bec <neorv32_uart0_printf+0x70>

00000d0c <__mulsi3>:
 d0c:	00050613          	mv	a2,a0
 d10:	00000513          	li	a0,0
 d14:	0015f693          	andi	a3,a1,1
 d18:	00068463          	beqz	a3,d20 <__mulsi3+0x14>
 d1c:	00c50533          	add	a0,a0,a2
 d20:	0015d593          	srli	a1,a1,0x1
 d24:	00161613          	slli	a2,a2,0x1
 d28:	fe0596e3          	bnez	a1,d14 <__mulsi3+0x8>
 d2c:	00008067          	ret

00000d30 <__muldi3>:
 d30:	00050e13          	mv	t3,a0
 d34:	ff010113          	addi	sp,sp,-16
 d38:	00068313          	mv	t1,a3
 d3c:	00112623          	sw	ra,12(sp)
 d40:	00060513          	mv	a0,a2
 d44:	000e0893          	mv	a7,t3
 d48:	00060693          	mv	a3,a2
 d4c:	00000713          	li	a4,0
 d50:	00000793          	li	a5,0
 d54:	00000813          	li	a6,0
 d58:	0016fe93          	andi	t4,a3,1
 d5c:	00171613          	slli	a2,a4,0x1
 d60:	000e8a63          	beqz	t4,d74 <__muldi3+0x44>
 d64:	01088833          	add	a6,a7,a6
 d68:	00e787b3          	add	a5,a5,a4
 d6c:	01183733          	sltu	a4,a6,a7
 d70:	00f707b3          	add	a5,a4,a5
 d74:	01f8d713          	srli	a4,a7,0x1f
 d78:	0016d693          	srli	a3,a3,0x1
 d7c:	00e66733          	or	a4,a2,a4
 d80:	00189893          	slli	a7,a7,0x1
 d84:	fc069ae3          	bnez	a3,d58 <__muldi3+0x28>
 d88:	00058663          	beqz	a1,d94 <__muldi3+0x64>
 d8c:	f81ff0ef          	jal	ra,d0c <__mulsi3>
 d90:	00a787b3          	add	a5,a5,a0
 d94:	00030a63          	beqz	t1,da8 <__muldi3+0x78>
 d98:	000e0513          	mv	a0,t3
 d9c:	00030593          	mv	a1,t1
 da0:	f6dff0ef          	jal	ra,d0c <__mulsi3>
 da4:	00f507b3          	add	a5,a0,a5
 da8:	00c12083          	lw	ra,12(sp)
 dac:	00080513          	mv	a0,a6
 db0:	00078593          	mv	a1,a5
 db4:	01010113          	addi	sp,sp,16
 db8:	00008067          	ret

00000dbc <__divsi3>:
 dbc:	06054063          	bltz	a0,e1c <__umodsi3+0x10>
 dc0:	0605c663          	bltz	a1,e2c <__umodsi3+0x20>

00000dc4 <__hidden___udivsi3>:
 dc4:	00058613          	mv	a2,a1
 dc8:	00050593          	mv	a1,a0
 dcc:	fff00513          	li	a0,-1
 dd0:	02060c63          	beqz	a2,e08 <__hidden___udivsi3+0x44>
 dd4:	00100693          	li	a3,1
 dd8:	00b67a63          	bgeu	a2,a1,dec <__hidden___udivsi3+0x28>
 ddc:	00c05863          	blez	a2,dec <__hidden___udivsi3+0x28>
 de0:	00161613          	slli	a2,a2,0x1
 de4:	00169693          	slli	a3,a3,0x1
 de8:	feb66ae3          	bltu	a2,a1,ddc <__hidden___udivsi3+0x18>
 dec:	00000513          	li	a0,0
 df0:	00c5e663          	bltu	a1,a2,dfc <__hidden___udivsi3+0x38>
 df4:	40c585b3          	sub	a1,a1,a2
 df8:	00d56533          	or	a0,a0,a3
 dfc:	0016d693          	srli	a3,a3,0x1
 e00:	00165613          	srli	a2,a2,0x1
 e04:	fe0696e3          	bnez	a3,df0 <__hidden___udivsi3+0x2c>
 e08:	00008067          	ret

00000e0c <__umodsi3>:
 e0c:	00008293          	mv	t0,ra
 e10:	fb5ff0ef          	jal	ra,dc4 <__hidden___udivsi3>
 e14:	00058513          	mv	a0,a1
 e18:	00028067          	jr	t0
 e1c:	40a00533          	neg	a0,a0
 e20:	00b04863          	bgtz	a1,e30 <__umodsi3+0x24>
 e24:	40b005b3          	neg	a1,a1
 e28:	f9dff06f          	j	dc4 <__hidden___udivsi3>
 e2c:	40b005b3          	neg	a1,a1
 e30:	00008293          	mv	t0,ra
 e34:	f91ff0ef          	jal	ra,dc4 <__hidden___udivsi3>
 e38:	40a00533          	neg	a0,a0
 e3c:	00028067          	jr	t0

00000e40 <__modsi3>:
 e40:	00008293          	mv	t0,ra
 e44:	0005ca63          	bltz	a1,e58 <__modsi3+0x18>
 e48:	00054c63          	bltz	a0,e60 <__modsi3+0x20>
 e4c:	f79ff0ef          	jal	ra,dc4 <__hidden___udivsi3>
 e50:	00058513          	mv	a0,a1
 e54:	00028067          	jr	t0
 e58:	40b005b3          	neg	a1,a1
 e5c:	fe0558e3          	bgez	a0,e4c <__modsi3+0xc>
 e60:	40a00533          	neg	a0,a0
 e64:	f61ff0ef          	jal	ra,dc4 <__hidden___udivsi3>
 e68:	40b00533          	neg	a0,a1
 e6c:	00028067          	jr	t0
