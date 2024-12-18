
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
  e0:	d2858593          	addi	a1,a1,-728 # e04 <__crt0_copy_data_src_begin>
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
 190:	b0050513          	addi	a0,a0,-1280 # 4b00 <__crt0_copy_data_src_begin+0x3cfc>
 194:	00112623          	sw	ra,12(sp)
 198:	704000ef          	jal	ra,89c <neorv32_uart0_setup>
 19c:	19c000ef          	jal	ra,338 <neorv32_gpio_available>
 1a0:	00050c63          	beqz	a0,1b8 <main+0x38>
 1a4:	6a0000ef          	jal	ra,844 <neorv32_rte_setup>
 1a8:	00001537          	lui	a0,0x1
 1ac:	b4050513          	addi	a0,a0,-1216 # b40 <__etext+0x24>
 1b0:	7b0000ef          	jal	ra,960 <neorv32_uart0_print>
 1b4:	020000ef          	jal	ra,1d4 <blink_led_c>
 1b8:	00001537          	lui	a0,0x1
 1bc:	b1c50513          	addi	a0,a0,-1252 # b1c <__etext>
 1c0:	7a0000ef          	jal	ra,960 <neorv32_uart0_print>
 1c4:	00c12083          	lw	ra,12(sp)
 1c8:	00100513          	li	a0,1
 1cc:	01010113          	addi	sp,sp,16
 1d0:	00008067          	ret

000001d4 <blink_led_c>:
 1d4:	ff010113          	addi	sp,sp,-16
 1d8:	00112623          	sw	ra,12(sp)
 1dc:	00000513          	li	a0,0
 1e0:	00000593          	li	a1,0
 1e4:	188000ef          	jal	ra,36c <neorv32_gpio_port_set>
 1e8:	00100513          	li	a0,1
 1ec:	15c000ef          	jal	ra,348 <neorv32_gpio_pin_get>
 1f0:	00100793          	li	a5,1
 1f4:	fef51ae3          	bne	a0,a5,1e8 <blink_led_c+0x14>
 1f8:	00000593          	li	a1,0
 1fc:	01000513          	li	a0,16
 200:	16c000ef          	jal	ra,36c <neorv32_gpio_port_set>
 204:	0c800513          	li	a0,200
 208:	074000ef          	jal	ra,27c <neorv32_cpu_delay_ms>
 20c:	00000593          	li	a1,0
 210:	02000513          	li	a0,32
 214:	158000ef          	jal	ra,36c <neorv32_gpio_port_set>
 218:	0c800513          	li	a0,200
 21c:	060000ef          	jal	ra,27c <neorv32_cpu_delay_ms>
 220:	00000593          	li	a1,0
 224:	04000513          	li	a0,64
 228:	144000ef          	jal	ra,36c <neorv32_gpio_port_set>
 22c:	0c800513          	li	a0,200
 230:	04c000ef          	jal	ra,27c <neorv32_cpu_delay_ms>
 234:	08000513          	li	a0,128
 238:	00000593          	li	a1,0
 23c:	130000ef          	jal	ra,36c <neorv32_gpio_port_set>
 240:	0c800513          	li	a0,200
 244:	038000ef          	jal	ra,27c <neorv32_cpu_delay_ms>
 248:	10000513          	li	a0,256
 24c:	f95ff06f          	j	1e0 <blink_led_c+0xc>

00000250 <neorv32_cpu_get_systime>:
 250:	ff010113          	addi	sp,sp,-16
 254:	c81026f3          	rdtimeh	a3
 258:	c0102773          	rdtime	a4
 25c:	c81027f3          	rdtimeh	a5
 260:	fed79ae3          	bne	a5,a3,254 <neorv32_cpu_get_systime+0x4>
 264:	00e12023          	sw	a4,0(sp)
 268:	00f12223          	sw	a5,4(sp)
 26c:	00012503          	lw	a0,0(sp)
 270:	00412583          	lw	a1,4(sp)
 274:	01010113          	addi	sp,sp,16
 278:	00008067          	ret

0000027c <neorv32_cpu_delay_ms>:
 27c:	fd010113          	addi	sp,sp,-48
 280:	00a12623          	sw	a0,12(sp)
 284:	fe002503          	lw	a0,-32(zero) # ffffffe0 <__ctr0_io_space_begin+0x1e0>
 288:	3e800593          	li	a1,1000
 28c:	02112623          	sw	ra,44(sp)
 290:	02812423          	sw	s0,40(sp)
 294:	02912223          	sw	s1,36(sp)
 298:	03212023          	sw	s2,32(sp)
 29c:	01312e23          	sw	s3,28(sp)
 2a0:	7d0000ef          	jal	ra,a70 <__hidden___udivsi3>
 2a4:	00c12603          	lw	a2,12(sp)
 2a8:	00000693          	li	a3,0
 2ac:	00000593          	li	a1,0
 2b0:	72c000ef          	jal	ra,9dc <__muldi3>
 2b4:	00050413          	mv	s0,a0
 2b8:	00058993          	mv	s3,a1
 2bc:	f95ff0ef          	jal	ra,250 <neorv32_cpu_get_systime>
 2c0:	00058913          	mv	s2,a1
 2c4:	00050493          	mv	s1,a0
 2c8:	f89ff0ef          	jal	ra,250 <neorv32_cpu_get_systime>
 2cc:	00b96663          	bltu	s2,a1,2d8 <neorv32_cpu_delay_ms+0x5c>
 2d0:	05259263          	bne	a1,s2,314 <neorv32_cpu_delay_ms+0x98>
 2d4:	04a4f063          	bgeu	s1,a0,314 <neorv32_cpu_delay_ms+0x98>
 2d8:	008484b3          	add	s1,s1,s0
 2dc:	0084b433          	sltu	s0,s1,s0
 2e0:	01390933          	add	s2,s2,s3
 2e4:	01240433          	add	s0,s0,s2
 2e8:	f69ff0ef          	jal	ra,250 <neorv32_cpu_get_systime>
 2ec:	fe85eee3          	bltu	a1,s0,2e8 <neorv32_cpu_delay_ms+0x6c>
 2f0:	00b41463          	bne	s0,a1,2f8 <neorv32_cpu_delay_ms+0x7c>
 2f4:	fe956ae3          	bltu	a0,s1,2e8 <neorv32_cpu_delay_ms+0x6c>
 2f8:	02c12083          	lw	ra,44(sp)
 2fc:	02812403          	lw	s0,40(sp)
 300:	02412483          	lw	s1,36(sp)
 304:	02012903          	lw	s2,32(sp)
 308:	01c12983          	lw	s3,28(sp)
 30c:	03010113          	addi	sp,sp,48
 310:	00008067          	ret
 314:	01c99993          	slli	s3,s3,0x1c
 318:	00445413          	srli	s0,s0,0x4
 31c:	0089e433          	or	s0,s3,s0

00000320 <__neorv32_cpu_delay_ms_start>:
 320:	00040a63          	beqz	s0,334 <__neorv32_cpu_delay_ms_end>
 324:	00040863          	beqz	s0,334 <__neorv32_cpu_delay_ms_end>
 328:	fff40413          	addi	s0,s0,-1
 32c:	00000013          	nop
 330:	ff1ff06f          	j	320 <__neorv32_cpu_delay_ms_start>

00000334 <__neorv32_cpu_delay_ms_end>:
 334:	fc5ff06f          	j	2f8 <neorv32_cpu_delay_ms+0x7c>

00000338 <neorv32_gpio_available>:
 338:	fe802503          	lw	a0,-24(zero) # ffffffe8 <__ctr0_io_space_begin+0x1e8>
 33c:	01055513          	srli	a0,a0,0x10
 340:	00157513          	andi	a0,a0,1
 344:	00008067          	ret

00000348 <neorv32_gpio_pin_get>:
 348:	00100793          	li	a5,1
 34c:	01f00713          	li	a4,31
 350:	00a797b3          	sll	a5,a5,a0
 354:	00a74863          	blt	a4,a0,364 <neorv32_gpio_pin_get+0x1c>
 358:	fc002703          	lw	a4,-64(zero) # ffffffc0 <__ctr0_io_space_begin+0x1c0>
 35c:	00f77533          	and	a0,a4,a5
 360:	00008067          	ret
 364:	fc402703          	lw	a4,-60(zero) # ffffffc4 <__ctr0_io_space_begin+0x1c4>
 368:	ff5ff06f          	j	35c <neorv32_gpio_pin_get+0x14>

0000036c <neorv32_gpio_port_set>:
 36c:	fc000793          	li	a5,-64
 370:	00a7a423          	sw	a0,8(a5)
 374:	00b7a623          	sw	a1,12(a5)
 378:	00008067          	ret
 37c:	0000                	.2byte	0x0
 37e:	0000                	.2byte	0x0

00000380 <__neorv32_rte_core>:
 380:	fc010113          	addi	sp,sp,-64
 384:	02112e23          	sw	ra,60(sp)
 388:	02512c23          	sw	t0,56(sp)
 38c:	02612a23          	sw	t1,52(sp)
 390:	02712823          	sw	t2,48(sp)
 394:	02a12623          	sw	a0,44(sp)
 398:	02b12423          	sw	a1,40(sp)
 39c:	02c12223          	sw	a2,36(sp)
 3a0:	02d12023          	sw	a3,32(sp)
 3a4:	00e12e23          	sw	a4,28(sp)
 3a8:	00f12c23          	sw	a5,24(sp)
 3ac:	01012a23          	sw	a6,20(sp)
 3b0:	01112823          	sw	a7,16(sp)
 3b4:	01c12623          	sw	t3,12(sp)
 3b8:	01d12423          	sw	t4,8(sp)
 3bc:	01e12223          	sw	t5,4(sp)
 3c0:	01f12023          	sw	t6,0(sp)
 3c4:	34102773          	csrr	a4,mepc
 3c8:	34071073          	csrw	mscratch,a4
 3cc:	342027f3          	csrr	a5,mcause
 3d0:	0807c863          	bltz	a5,460 <__neorv32_rte_core+0xe0>
 3d4:	00071683          	lh	a3,0(a4)
 3d8:	00300593          	li	a1,3
 3dc:	0036f693          	andi	a3,a3,3
 3e0:	00270613          	addi	a2,a4,2
 3e4:	00b69463          	bne	a3,a1,3ec <__neorv32_rte_core+0x6c>
 3e8:	00470613          	addi	a2,a4,4
 3ec:	34161073          	csrw	mepc,a2
 3f0:	00b00713          	li	a4,11
 3f4:	04f77a63          	bgeu	a4,a5,448 <__neorv32_rte_core+0xc8>
 3f8:	63000793          	li	a5,1584
 3fc:	000780e7          	jalr	a5
 400:	03c12083          	lw	ra,60(sp)
 404:	03812283          	lw	t0,56(sp)
 408:	03412303          	lw	t1,52(sp)
 40c:	03012383          	lw	t2,48(sp)
 410:	02c12503          	lw	a0,44(sp)
 414:	02812583          	lw	a1,40(sp)
 418:	02412603          	lw	a2,36(sp)
 41c:	02012683          	lw	a3,32(sp)
 420:	01c12703          	lw	a4,28(sp)
 424:	01812783          	lw	a5,24(sp)
 428:	01412803          	lw	a6,20(sp)
 42c:	01012883          	lw	a7,16(sp)
 430:	00c12e03          	lw	t3,12(sp)
 434:	00812e83          	lw	t4,8(sp)
 438:	00412f03          	lw	t5,4(sp)
 43c:	00012f83          	lw	t6,0(sp)
 440:	04010113          	addi	sp,sp,64
 444:	30200073          	mret
 448:	00001737          	lui	a4,0x1
 44c:	00279793          	slli	a5,a5,0x2
 450:	b5c70713          	addi	a4,a4,-1188 # b5c <__etext+0x40>
 454:	00e787b3          	add	a5,a5,a4
 458:	0007a783          	lw	a5,0(a5)
 45c:	00078067          	jr	a5
 460:	80000737          	lui	a4,0x80000
 464:	ffd74713          	xori	a4,a4,-3
 468:	00e787b3          	add	a5,a5,a4
 46c:	01c00713          	li	a4,28
 470:	f8f764e3          	bltu	a4,a5,3f8 <__neorv32_rte_core+0x78>
 474:	00001737          	lui	a4,0x1
 478:	00279793          	slli	a5,a5,0x2
 47c:	b8c70713          	addi	a4,a4,-1140 # b8c <__etext+0x70>
 480:	00e787b3          	add	a5,a5,a4
 484:	0007a783          	lw	a5,0(a5)
 488:	00078067          	jr	a5
 48c:	800007b7          	lui	a5,0x80000
 490:	0007a783          	lw	a5,0(a5) # 80000000 <__ctr0_io_space_begin+0x80000200>
 494:	f69ff06f          	j	3fc <__neorv32_rte_core+0x7c>
 498:	800007b7          	lui	a5,0x80000
 49c:	0047a783          	lw	a5,4(a5) # 80000004 <__ctr0_io_space_begin+0x80000204>
 4a0:	f5dff06f          	j	3fc <__neorv32_rte_core+0x7c>
 4a4:	800007b7          	lui	a5,0x80000
 4a8:	0087a783          	lw	a5,8(a5) # 80000008 <__ctr0_io_space_begin+0x80000208>
 4ac:	f51ff06f          	j	3fc <__neorv32_rte_core+0x7c>
 4b0:	800007b7          	lui	a5,0x80000
 4b4:	00c7a783          	lw	a5,12(a5) # 8000000c <__ctr0_io_space_begin+0x8000020c>
 4b8:	f45ff06f          	j	3fc <__neorv32_rte_core+0x7c>
 4bc:	800007b7          	lui	a5,0x80000
 4c0:	0107a783          	lw	a5,16(a5) # 80000010 <__ctr0_io_space_begin+0x80000210>
 4c4:	f39ff06f          	j	3fc <__neorv32_rte_core+0x7c>
 4c8:	800007b7          	lui	a5,0x80000
 4cc:	0147a783          	lw	a5,20(a5) # 80000014 <__ctr0_io_space_begin+0x80000214>
 4d0:	f2dff06f          	j	3fc <__neorv32_rte_core+0x7c>
 4d4:	800007b7          	lui	a5,0x80000
 4d8:	0187a783          	lw	a5,24(a5) # 80000018 <__ctr0_io_space_begin+0x80000218>
 4dc:	f21ff06f          	j	3fc <__neorv32_rte_core+0x7c>
 4e0:	800007b7          	lui	a5,0x80000
 4e4:	01c7a783          	lw	a5,28(a5) # 8000001c <__ctr0_io_space_begin+0x8000021c>
 4e8:	f15ff06f          	j	3fc <__neorv32_rte_core+0x7c>
 4ec:	800007b7          	lui	a5,0x80000
 4f0:	0207a783          	lw	a5,32(a5) # 80000020 <__ctr0_io_space_begin+0x80000220>
 4f4:	f09ff06f          	j	3fc <__neorv32_rte_core+0x7c>
 4f8:	800007b7          	lui	a5,0x80000
 4fc:	0247a783          	lw	a5,36(a5) # 80000024 <__ctr0_io_space_begin+0x80000224>
 500:	efdff06f          	j	3fc <__neorv32_rte_core+0x7c>
 504:	800007b7          	lui	a5,0x80000
 508:	0287a783          	lw	a5,40(a5) # 80000028 <__ctr0_io_space_begin+0x80000228>
 50c:	ef1ff06f          	j	3fc <__neorv32_rte_core+0x7c>
 510:	800007b7          	lui	a5,0x80000
 514:	02c7a783          	lw	a5,44(a5) # 8000002c <__ctr0_io_space_begin+0x8000022c>
 518:	ee5ff06f          	j	3fc <__neorv32_rte_core+0x7c>
 51c:	800007b7          	lui	a5,0x80000
 520:	0307a783          	lw	a5,48(a5) # 80000030 <__ctr0_io_space_begin+0x80000230>
 524:	ed9ff06f          	j	3fc <__neorv32_rte_core+0x7c>
 528:	800007b7          	lui	a5,0x80000
 52c:	0347a783          	lw	a5,52(a5) # 80000034 <__ctr0_io_space_begin+0x80000234>
 530:	ecdff06f          	j	3fc <__neorv32_rte_core+0x7c>
 534:	800007b7          	lui	a5,0x80000
 538:	0387a783          	lw	a5,56(a5) # 80000038 <__ctr0_io_space_begin+0x80000238>
 53c:	ec1ff06f          	j	3fc <__neorv32_rte_core+0x7c>
 540:	800007b7          	lui	a5,0x80000
 544:	03c7a783          	lw	a5,60(a5) # 8000003c <__ctr0_io_space_begin+0x8000023c>
 548:	eb5ff06f          	j	3fc <__neorv32_rte_core+0x7c>
 54c:	800007b7          	lui	a5,0x80000
 550:	0407a783          	lw	a5,64(a5) # 80000040 <__ctr0_io_space_begin+0x80000240>
 554:	ea9ff06f          	j	3fc <__neorv32_rte_core+0x7c>
 558:	8441a783          	lw	a5,-1980(gp) # 80000044 <__neorv32_rte_vector_lut+0x44>
 55c:	ea1ff06f          	j	3fc <__neorv32_rte_core+0x7c>
 560:	8481a783          	lw	a5,-1976(gp) # 80000048 <__neorv32_rte_vector_lut+0x48>
 564:	e99ff06f          	j	3fc <__neorv32_rte_core+0x7c>
 568:	84c1a783          	lw	a5,-1972(gp) # 8000004c <__neorv32_rte_vector_lut+0x4c>
 56c:	e91ff06f          	j	3fc <__neorv32_rte_core+0x7c>
 570:	8501a783          	lw	a5,-1968(gp) # 80000050 <__neorv32_rte_vector_lut+0x50>
 574:	e89ff06f          	j	3fc <__neorv32_rte_core+0x7c>
 578:	8541a783          	lw	a5,-1964(gp) # 80000054 <__neorv32_rte_vector_lut+0x54>
 57c:	e81ff06f          	j	3fc <__neorv32_rte_core+0x7c>
 580:	8581a783          	lw	a5,-1960(gp) # 80000058 <__neorv32_rte_vector_lut+0x58>
 584:	e79ff06f          	j	3fc <__neorv32_rte_core+0x7c>
 588:	85c1a783          	lw	a5,-1956(gp) # 8000005c <__neorv32_rte_vector_lut+0x5c>
 58c:	e71ff06f          	j	3fc <__neorv32_rte_core+0x7c>
 590:	8601a783          	lw	a5,-1952(gp) # 80000060 <__neorv32_rte_vector_lut+0x60>
 594:	e69ff06f          	j	3fc <__neorv32_rte_core+0x7c>
 598:	8641a783          	lw	a5,-1948(gp) # 80000064 <__neorv32_rte_vector_lut+0x64>
 59c:	e61ff06f          	j	3fc <__neorv32_rte_core+0x7c>
 5a0:	8681a783          	lw	a5,-1944(gp) # 80000068 <__neorv32_rte_vector_lut+0x68>
 5a4:	e59ff06f          	j	3fc <__neorv32_rte_core+0x7c>
 5a8:	86c1a783          	lw	a5,-1940(gp) # 8000006c <__neorv32_rte_vector_lut+0x6c>
 5ac:	e51ff06f          	j	3fc <__neorv32_rte_core+0x7c>
 5b0:	8701a783          	lw	a5,-1936(gp) # 80000070 <__neorv32_rte_vector_lut+0x70>
 5b4:	e49ff06f          	j	3fc <__neorv32_rte_core+0x7c>
 5b8:	0000                	.2byte	0x0
 5ba:	0000                	.2byte	0x0
 5bc:	0000                	.2byte	0x0
 5be:	0000                	.2byte	0x0

000005c0 <__neorv32_rte_print_hex_word>:
 5c0:	fe010113          	addi	sp,sp,-32
 5c4:	01212823          	sw	s2,16(sp)
 5c8:	00050913          	mv	s2,a0
 5cc:	00001537          	lui	a0,0x1
 5d0:	00912a23          	sw	s1,20(sp)
 5d4:	c0050513          	addi	a0,a0,-1024 # c00 <__etext+0xe4>
 5d8:	000014b7          	lui	s1,0x1
 5dc:	00812c23          	sw	s0,24(sp)
 5e0:	01312623          	sw	s3,12(sp)
 5e4:	00112e23          	sw	ra,28(sp)
 5e8:	01c00413          	li	s0,28
 5ec:	374000ef          	jal	ra,960 <neorv32_uart0_print>
 5f0:	df448493          	addi	s1,s1,-524 # df4 <hex_symbols.0>
 5f4:	ffc00993          	li	s3,-4
 5f8:	008957b3          	srl	a5,s2,s0
 5fc:	00f7f793          	andi	a5,a5,15
 600:	00f487b3          	add	a5,s1,a5
 604:	0007c503          	lbu	a0,0(a5)
 608:	ffc40413          	addi	s0,s0,-4
 60c:	33c000ef          	jal	ra,948 <neorv32_uart0_putc>
 610:	ff3414e3          	bne	s0,s3,5f8 <__neorv32_rte_print_hex_word+0x38>
 614:	01c12083          	lw	ra,28(sp)
 618:	01812403          	lw	s0,24(sp)
 61c:	01412483          	lw	s1,20(sp)
 620:	01012903          	lw	s2,16(sp)
 624:	00c12983          	lw	s3,12(sp)
 628:	02010113          	addi	sp,sp,32
 62c:	00008067          	ret

00000630 <__neorv32_rte_debug_exc_handler>:
 630:	ff010113          	addi	sp,sp,-16
 634:	00112623          	sw	ra,12(sp)
 638:	00812423          	sw	s0,8(sp)
 63c:	00912223          	sw	s1,4(sp)
 640:	24c000ef          	jal	ra,88c <neorv32_uart0_available>
 644:	1a050e63          	beqz	a0,800 <__neorv32_rte_debug_exc_handler+0x1d0>
 648:	00001537          	lui	a0,0x1
 64c:	c0450513          	addi	a0,a0,-1020 # c04 <__etext+0xe8>
 650:	310000ef          	jal	ra,960 <neorv32_uart0_print>
 654:	34202473          	csrr	s0,mcause
 658:	00900713          	li	a4,9
 65c:	00f47793          	andi	a5,s0,15
 660:	03078493          	addi	s1,a5,48
 664:	00f77463          	bgeu	a4,a5,66c <__neorv32_rte_debug_exc_handler+0x3c>
 668:	05778493          	addi	s1,a5,87
 66c:	00b00793          	li	a5,11
 670:	0087ee63          	bltu	a5,s0,68c <__neorv32_rte_debug_exc_handler+0x5c>
 674:	00001737          	lui	a4,0x1
 678:	00241793          	slli	a5,s0,0x2
 67c:	dc470713          	addi	a4,a4,-572 # dc4 <__etext+0x2a8>
 680:	00e787b3          	add	a5,a5,a4
 684:	0007a783          	lw	a5,0(a5)
 688:	00078067          	jr	a5
 68c:	800007b7          	lui	a5,0x80000
 690:	00b78713          	addi	a4,a5,11 # 8000000b <__ctr0_io_space_begin+0x8000020b>
 694:	14e40463          	beq	s0,a4,7dc <__neorv32_rte_debug_exc_handler+0x1ac>
 698:	02876663          	bltu	a4,s0,6c4 <__neorv32_rte_debug_exc_handler+0x94>
 69c:	00378713          	addi	a4,a5,3
 6a0:	12e40263          	beq	s0,a4,7c4 <__neorv32_rte_debug_exc_handler+0x194>
 6a4:	00778793          	addi	a5,a5,7
 6a8:	12f40463          	beq	s0,a5,7d0 <__neorv32_rte_debug_exc_handler+0x1a0>
 6ac:	00001537          	lui	a0,0x1
 6b0:	d6450513          	addi	a0,a0,-668 # d64 <__etext+0x248>
 6b4:	2ac000ef          	jal	ra,960 <neorv32_uart0_print>
 6b8:	00040513          	mv	a0,s0
 6bc:	f05ff0ef          	jal	ra,5c0 <__neorv32_rte_print_hex_word>
 6c0:	0280006f          	j	6e8 <__neorv32_rte_debug_exc_handler+0xb8>
 6c4:	ff07c793          	xori	a5,a5,-16
 6c8:	00f407b3          	add	a5,s0,a5
 6cc:	00f00713          	li	a4,15
 6d0:	fcf76ee3          	bltu	a4,a5,6ac <__neorv32_rte_debug_exc_handler+0x7c>
 6d4:	00001537          	lui	a0,0x1
 6d8:	d5450513          	addi	a0,a0,-684 # d54 <__etext+0x238>
 6dc:	284000ef          	jal	ra,960 <neorv32_uart0_print>
 6e0:	00048513          	mv	a0,s1
 6e4:	264000ef          	jal	ra,948 <neorv32_uart0_putc>
 6e8:	00001537          	lui	a0,0x1
 6ec:	da850513          	addi	a0,a0,-600 # da8 <__etext+0x28c>
 6f0:	270000ef          	jal	ra,960 <neorv32_uart0_print>
 6f4:	34002573          	csrr	a0,mscratch
 6f8:	ec9ff0ef          	jal	ra,5c0 <__neorv32_rte_print_hex_word>
 6fc:	00001537          	lui	a0,0x1
 700:	db050513          	addi	a0,a0,-592 # db0 <__etext+0x294>
 704:	25c000ef          	jal	ra,960 <neorv32_uart0_print>
 708:	34302573          	csrr	a0,mtval
 70c:	eb5ff0ef          	jal	ra,5c0 <__neorv32_rte_print_hex_word>
 710:	00812403          	lw	s0,8(sp)
 714:	00c12083          	lw	ra,12(sp)
 718:	00412483          	lw	s1,4(sp)
 71c:	00001537          	lui	a0,0x1
 720:	dbc50513          	addi	a0,a0,-580 # dbc <__etext+0x2a0>
 724:	01010113          	addi	sp,sp,16
 728:	2380006f          	j	960 <neorv32_uart0_print>
 72c:	00001537          	lui	a0,0x1
 730:	c0c50513          	addi	a0,a0,-1012 # c0c <__etext+0xf0>
 734:	22c000ef          	jal	ra,960 <neorv32_uart0_print>
 738:	fb1ff06f          	j	6e8 <__neorv32_rte_debug_exc_handler+0xb8>
 73c:	00001537          	lui	a0,0x1
 740:	c2c50513          	addi	a0,a0,-980 # c2c <__etext+0x110>
 744:	21c000ef          	jal	ra,960 <neorv32_uart0_print>
 748:	f7c02783          	lw	a5,-132(zero) # ffffff7c <__ctr0_io_space_begin+0x17c>
 74c:	0a07d463          	bgez	a5,7f4 <__neorv32_rte_debug_exc_handler+0x1c4>
 750:	0017f793          	andi	a5,a5,1
 754:	08078a63          	beqz	a5,7e8 <__neorv32_rte_debug_exc_handler+0x1b8>
 758:	00001537          	lui	a0,0x1
 75c:	d7c50513          	addi	a0,a0,-644 # d7c <__etext+0x260>
 760:	fd5ff06f          	j	734 <__neorv32_rte_debug_exc_handler+0x104>
 764:	00001537          	lui	a0,0x1
 768:	c4850513          	addi	a0,a0,-952 # c48 <__etext+0x12c>
 76c:	fc9ff06f          	j	734 <__neorv32_rte_debug_exc_handler+0x104>
 770:	00001537          	lui	a0,0x1
 774:	c5c50513          	addi	a0,a0,-932 # c5c <__etext+0x140>
 778:	fbdff06f          	j	734 <__neorv32_rte_debug_exc_handler+0x104>
 77c:	00001537          	lui	a0,0x1
 780:	c6850513          	addi	a0,a0,-920 # c68 <__etext+0x14c>
 784:	fb1ff06f          	j	734 <__neorv32_rte_debug_exc_handler+0x104>
 788:	00001537          	lui	a0,0x1
 78c:	c8050513          	addi	a0,a0,-896 # c80 <__etext+0x164>
 790:	fb5ff06f          	j	744 <__neorv32_rte_debug_exc_handler+0x114>
 794:	00001537          	lui	a0,0x1
 798:	c9450513          	addi	a0,a0,-876 # c94 <__etext+0x178>
 79c:	f99ff06f          	j	734 <__neorv32_rte_debug_exc_handler+0x104>
 7a0:	00001537          	lui	a0,0x1
 7a4:	cb050513          	addi	a0,a0,-848 # cb0 <__etext+0x194>
 7a8:	f9dff06f          	j	744 <__neorv32_rte_debug_exc_handler+0x114>
 7ac:	00001537          	lui	a0,0x1
 7b0:	cc450513          	addi	a0,a0,-828 # cc4 <__etext+0x1a8>
 7b4:	f81ff06f          	j	734 <__neorv32_rte_debug_exc_handler+0x104>
 7b8:	00001537          	lui	a0,0x1
 7bc:	ce450513          	addi	a0,a0,-796 # ce4 <__etext+0x1c8>
 7c0:	f75ff06f          	j	734 <__neorv32_rte_debug_exc_handler+0x104>
 7c4:	00001537          	lui	a0,0x1
 7c8:	d0450513          	addi	a0,a0,-764 # d04 <__etext+0x1e8>
 7cc:	f69ff06f          	j	734 <__neorv32_rte_debug_exc_handler+0x104>
 7d0:	00001537          	lui	a0,0x1
 7d4:	d2050513          	addi	a0,a0,-736 # d20 <__etext+0x204>
 7d8:	f5dff06f          	j	734 <__neorv32_rte_debug_exc_handler+0x104>
 7dc:	00001537          	lui	a0,0x1
 7e0:	d3850513          	addi	a0,a0,-712 # d38 <__etext+0x21c>
 7e4:	f51ff06f          	j	734 <__neorv32_rte_debug_exc_handler+0x104>
 7e8:	00001537          	lui	a0,0x1
 7ec:	d8c50513          	addi	a0,a0,-628 # d8c <__etext+0x270>
 7f0:	f45ff06f          	j	734 <__neorv32_rte_debug_exc_handler+0x104>
 7f4:	00001537          	lui	a0,0x1
 7f8:	d9c50513          	addi	a0,a0,-612 # d9c <__etext+0x280>
 7fc:	f39ff06f          	j	734 <__neorv32_rte_debug_exc_handler+0x104>
 800:	00c12083          	lw	ra,12(sp)
 804:	00812403          	lw	s0,8(sp)
 808:	00412483          	lw	s1,4(sp)
 80c:	01010113          	addi	sp,sp,16
 810:	00008067          	ret

00000814 <neorv32_rte_exception_uninstall>:
 814:	01f00793          	li	a5,31
 818:	02a7e263          	bltu	a5,a0,83c <neorv32_rte_exception_uninstall+0x28>
 81c:	800007b7          	lui	a5,0x80000
 820:	00251513          	slli	a0,a0,0x2
 824:	00078793          	mv	a5,a5
 828:	00a787b3          	add	a5,a5,a0
 82c:	63000713          	li	a4,1584
 830:	00e7a023          	sw	a4,0(a5) # 80000000 <__ctr0_io_space_begin+0x80000200>
 834:	00000513          	li	a0,0
 838:	00008067          	ret
 83c:	00100513          	li	a0,1
 840:	00008067          	ret

00000844 <neorv32_rte_setup>:
 844:	ff010113          	addi	sp,sp,-16
 848:	00112623          	sw	ra,12(sp)
 84c:	00812423          	sw	s0,8(sp)
 850:	00912223          	sw	s1,4(sp)
 854:	38000793          	li	a5,896
 858:	30579073          	csrw	mtvec,a5
 85c:	00000413          	li	s0,0
 860:	01d00493          	li	s1,29
 864:	00040513          	mv	a0,s0
 868:	00140413          	addi	s0,s0,1
 86c:	0ff47413          	zext.b	s0,s0
 870:	fa5ff0ef          	jal	ra,814 <neorv32_rte_exception_uninstall>
 874:	fe9418e3          	bne	s0,s1,864 <neorv32_rte_setup+0x20>
 878:	00c12083          	lw	ra,12(sp)
 87c:	00812403          	lw	s0,8(sp)
 880:	00412483          	lw	s1,4(sp)
 884:	01010113          	addi	sp,sp,16
 888:	00008067          	ret

0000088c <neorv32_uart0_available>:
 88c:	fe802503          	lw	a0,-24(zero) # ffffffe8 <__ctr0_io_space_begin+0x1e8>
 890:	01255513          	srli	a0,a0,0x12
 894:	00157513          	andi	a0,a0,1
 898:	00008067          	ret

0000089c <neorv32_uart0_setup>:
 89c:	ff010113          	addi	sp,sp,-16
 8a0:	00812423          	sw	s0,8(sp)
 8a4:	00912223          	sw	s1,4(sp)
 8a8:	00112623          	sw	ra,12(sp)
 8ac:	fa002023          	sw	zero,-96(zero) # ffffffa0 <__ctr0_io_space_begin+0x1a0>
 8b0:	fe002783          	lw	a5,-32(zero) # ffffffe0 <__ctr0_io_space_begin+0x1e0>
 8b4:	00058413          	mv	s0,a1
 8b8:	00151593          	slli	a1,a0,0x1
 8bc:	00078513          	mv	a0,a5
 8c0:	00060493          	mv	s1,a2
 8c4:	1ac000ef          	jal	ra,a70 <__hidden___udivsi3>
 8c8:	01051513          	slli	a0,a0,0x10
 8cc:	000017b7          	lui	a5,0x1
 8d0:	01055513          	srli	a0,a0,0x10
 8d4:	00000713          	li	a4,0
 8d8:	ffe78793          	addi	a5,a5,-2 # ffe <__crt0_copy_data_src_begin+0x1fa>
 8dc:	04a7e463          	bltu	a5,a0,924 <neorv32_uart0_setup+0x88>
 8e0:	0034f493          	andi	s1,s1,3
 8e4:	01449493          	slli	s1,s1,0x14
 8e8:	00347413          	andi	s0,s0,3
 8ec:	fff50793          	addi	a5,a0,-1
 8f0:	0097e7b3          	or	a5,a5,s1
 8f4:	01641413          	slli	s0,s0,0x16
 8f8:	0087e7b3          	or	a5,a5,s0
 8fc:	01871713          	slli	a4,a4,0x18
 900:	00c12083          	lw	ra,12(sp)
 904:	00812403          	lw	s0,8(sp)
 908:	00e7e7b3          	or	a5,a5,a4
 90c:	10000737          	lui	a4,0x10000
 910:	00e7e7b3          	or	a5,a5,a4
 914:	faf02023          	sw	a5,-96(zero) # ffffffa0 <__ctr0_io_space_begin+0x1a0>
 918:	00412483          	lw	s1,4(sp)
 91c:	01010113          	addi	sp,sp,16
 920:	00008067          	ret
 924:	ffe70693          	addi	a3,a4,-2 # ffffffe <__crt0_copy_data_src_begin+0xffff1fa>
 928:	0fd6f693          	andi	a3,a3,253
 92c:	00069a63          	bnez	a3,940 <neorv32_uart0_setup+0xa4>
 930:	00355513          	srli	a0,a0,0x3
 934:	00170713          	addi	a4,a4,1
 938:	0ff77713          	zext.b	a4,a4
 93c:	fa1ff06f          	j	8dc <neorv32_uart0_setup+0x40>
 940:	00155513          	srli	a0,a0,0x1
 944:	ff1ff06f          	j	934 <neorv32_uart0_setup+0x98>

00000948 <neorv32_uart0_putc>:
 948:	00040737          	lui	a4,0x40
 94c:	fa002783          	lw	a5,-96(zero) # ffffffa0 <__ctr0_io_space_begin+0x1a0>
 950:	00e7f7b3          	and	a5,a5,a4
 954:	fe079ce3          	bnez	a5,94c <neorv32_uart0_putc+0x4>
 958:	faa02223          	sw	a0,-92(zero) # ffffffa4 <__ctr0_io_space_begin+0x1a4>
 95c:	00008067          	ret

00000960 <neorv32_uart0_print>:
 960:	ff010113          	addi	sp,sp,-16
 964:	00812423          	sw	s0,8(sp)
 968:	01212023          	sw	s2,0(sp)
 96c:	00112623          	sw	ra,12(sp)
 970:	00912223          	sw	s1,4(sp)
 974:	00050413          	mv	s0,a0
 978:	00a00913          	li	s2,10
 97c:	00044483          	lbu	s1,0(s0)
 980:	00140413          	addi	s0,s0,1
 984:	00049e63          	bnez	s1,9a0 <neorv32_uart0_print+0x40>
 988:	00c12083          	lw	ra,12(sp)
 98c:	00812403          	lw	s0,8(sp)
 990:	00412483          	lw	s1,4(sp)
 994:	00012903          	lw	s2,0(sp)
 998:	01010113          	addi	sp,sp,16
 99c:	00008067          	ret
 9a0:	01249663          	bne	s1,s2,9ac <neorv32_uart0_print+0x4c>
 9a4:	00d00513          	li	a0,13
 9a8:	fa1ff0ef          	jal	ra,948 <neorv32_uart0_putc>
 9ac:	00048513          	mv	a0,s1
 9b0:	f99ff0ef          	jal	ra,948 <neorv32_uart0_putc>
 9b4:	fc9ff06f          	j	97c <neorv32_uart0_print+0x1c>

000009b8 <__mulsi3>:
 9b8:	00050613          	mv	a2,a0
 9bc:	00000513          	li	a0,0
 9c0:	0015f693          	andi	a3,a1,1
 9c4:	00068463          	beqz	a3,9cc <__mulsi3+0x14>
 9c8:	00c50533          	add	a0,a0,a2
 9cc:	0015d593          	srli	a1,a1,0x1
 9d0:	00161613          	slli	a2,a2,0x1
 9d4:	fe0596e3          	bnez	a1,9c0 <__mulsi3+0x8>
 9d8:	00008067          	ret

000009dc <__muldi3>:
 9dc:	00050e13          	mv	t3,a0
 9e0:	ff010113          	addi	sp,sp,-16
 9e4:	00068313          	mv	t1,a3
 9e8:	00112623          	sw	ra,12(sp)
 9ec:	00060513          	mv	a0,a2
 9f0:	000e0893          	mv	a7,t3
 9f4:	00060693          	mv	a3,a2
 9f8:	00000713          	li	a4,0
 9fc:	00000793          	li	a5,0
 a00:	00000813          	li	a6,0
 a04:	0016fe93          	andi	t4,a3,1
 a08:	00171613          	slli	a2,a4,0x1
 a0c:	000e8a63          	beqz	t4,a20 <__muldi3+0x44>
 a10:	01088833          	add	a6,a7,a6
 a14:	00e787b3          	add	a5,a5,a4
 a18:	01183733          	sltu	a4,a6,a7
 a1c:	00f707b3          	add	a5,a4,a5
 a20:	01f8d713          	srli	a4,a7,0x1f
 a24:	0016d693          	srli	a3,a3,0x1
 a28:	00e66733          	or	a4,a2,a4
 a2c:	00189893          	slli	a7,a7,0x1
 a30:	fc069ae3          	bnez	a3,a04 <__muldi3+0x28>
 a34:	00058663          	beqz	a1,a40 <__muldi3+0x64>
 a38:	f81ff0ef          	jal	ra,9b8 <__mulsi3>
 a3c:	00a787b3          	add	a5,a5,a0
 a40:	00030a63          	beqz	t1,a54 <__muldi3+0x78>
 a44:	000e0513          	mv	a0,t3
 a48:	00030593          	mv	a1,t1
 a4c:	f6dff0ef          	jal	ra,9b8 <__mulsi3>
 a50:	00f507b3          	add	a5,a0,a5
 a54:	00c12083          	lw	ra,12(sp)
 a58:	00080513          	mv	a0,a6
 a5c:	00078593          	mv	a1,a5
 a60:	01010113          	addi	sp,sp,16
 a64:	00008067          	ret

00000a68 <__divsi3>:
 a68:	06054063          	bltz	a0,ac8 <__umodsi3+0x10>
 a6c:	0605c663          	bltz	a1,ad8 <__umodsi3+0x20>

00000a70 <__hidden___udivsi3>:
 a70:	00058613          	mv	a2,a1
 a74:	00050593          	mv	a1,a0
 a78:	fff00513          	li	a0,-1
 a7c:	02060c63          	beqz	a2,ab4 <__hidden___udivsi3+0x44>
 a80:	00100693          	li	a3,1
 a84:	00b67a63          	bgeu	a2,a1,a98 <__hidden___udivsi3+0x28>
 a88:	00c05863          	blez	a2,a98 <__hidden___udivsi3+0x28>
 a8c:	00161613          	slli	a2,a2,0x1
 a90:	00169693          	slli	a3,a3,0x1
 a94:	feb66ae3          	bltu	a2,a1,a88 <__hidden___udivsi3+0x18>
 a98:	00000513          	li	a0,0
 a9c:	00c5e663          	bltu	a1,a2,aa8 <__hidden___udivsi3+0x38>
 aa0:	40c585b3          	sub	a1,a1,a2
 aa4:	00d56533          	or	a0,a0,a3
 aa8:	0016d693          	srli	a3,a3,0x1
 aac:	00165613          	srli	a2,a2,0x1
 ab0:	fe0696e3          	bnez	a3,a9c <__hidden___udivsi3+0x2c>
 ab4:	00008067          	ret

00000ab8 <__umodsi3>:
 ab8:	00008293          	mv	t0,ra
 abc:	fb5ff0ef          	jal	ra,a70 <__hidden___udivsi3>
 ac0:	00058513          	mv	a0,a1
 ac4:	00028067          	jr	t0
 ac8:	40a00533          	neg	a0,a0
 acc:	00b04863          	bgtz	a1,adc <__umodsi3+0x24>
 ad0:	40b005b3          	neg	a1,a1
 ad4:	f9dff06f          	j	a70 <__hidden___udivsi3>
 ad8:	40b005b3          	neg	a1,a1
 adc:	00008293          	mv	t0,ra
 ae0:	f91ff0ef          	jal	ra,a70 <__hidden___udivsi3>
 ae4:	40a00533          	neg	a0,a0
 ae8:	00028067          	jr	t0

00000aec <__modsi3>:
 aec:	00008293          	mv	t0,ra
 af0:	0005ca63          	bltz	a1,b04 <__modsi3+0x18>
 af4:	00054c63          	bltz	a0,b0c <__modsi3+0x20>
 af8:	f79ff0ef          	jal	ra,a70 <__hidden___udivsi3>
 afc:	00058513          	mv	a0,a1
 b00:	00028067          	jr	t0
 b04:	40b005b3          	neg	a1,a1
 b08:	fe0558e3          	bgez	a0,af8 <__modsi3+0xc>
 b0c:	40a00533          	neg	a0,a0
 b10:	f61ff0ef          	jal	ra,a70 <__hidden___udivsi3>
 b14:	40b00533          	neg	a0,a1
 b18:	00028067          	jr	t0
