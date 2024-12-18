
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
  c4:	f4458593          	addi	a1,a1,-188 # 80000004 <__ctr0_io_space_begin+0x80000204>
  c8:	87818613          	addi	a2,gp,-1928 # 80000078 <__BSS_END__>

000000cc <__crt0_clear_bss_loop>:
  cc:	00c5d863          	bge	a1,a2,dc <__crt0_clear_bss_loop_end>
  d0:	00058023          	sb	zero,0(a1)
  d4:	00158593          	addi	a1,a1,1
  d8:	ff5ff06f          	j	cc <__crt0_clear_bss_loop>

000000dc <__crt0_clear_bss_loop_end>:
  dc:	00001597          	auipc	a1,0x1
  e0:	08458593          	addi	a1,a1,132 # 1160 <__crt0_copy_data_src_begin>
  e4:	80000617          	auipc	a2,0x80000
  e8:	f1c60613          	addi	a2,a2,-228 # 80000000 <__ctr0_io_space_begin+0x80000200>
  ec:	80000697          	auipc	a3,0x80000
  f0:	f1868693          	addi	a3,a3,-232 # 80000004 <__ctr0_io_space_begin+0x80000204>

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
 190:	b0050513          	addi	a0,a0,-1280 # 4b00 <__crt0_copy_data_src_begin+0x39a0>
 194:	00112623          	sw	ra,12(sp)
 198:	075000ef          	jal	ra,a0c <neorv32_uart0_setup>
 19c:	16c000ef          	jal	ra,308 <neorv32_gpio_available>
 1a0:	00050663          	beqz	a0,1ac <main+0x2c>
 1a4:	6cc000ef          	jal	ra,870 <neorv32_rte_setup>
 1a8:	020000ef          	jal	ra,1c8 <keyboard_c>
 1ac:	00001537          	lui	a0,0x1
 1b0:	e7450513          	addi	a0,a0,-396 # e74 <__etext+0x2c>
 1b4:	11d000ef          	jal	ra,ad0 <neorv32_uart0_print>
 1b8:	00c12083          	lw	ra,12(sp)
 1bc:	00100513          	li	a0,1
 1c0:	01010113          	addi	sp,sp,16
 1c4:	00008067          	ret

000001c8 <keyboard_c>:
 1c8:	f8010113          	addi	sp,sp,-128
 1cc:	0ff00513          	li	a0,255
 1d0:	00000593          	li	a1,0
 1d4:	06112e23          	sw	ra,124(sp)
 1d8:	06912a23          	sw	s1,116(sp)
 1dc:	07312623          	sw	s3,108(sp)
 1e0:	07412423          	sw	s4,104(sp)
 1e4:	07512223          	sw	s5,100(sp)
 1e8:	06812c23          	sw	s0,120(sp)
 1ec:	07212823          	sw	s2,112(sp)
 1f0:	07612023          	sw	s6,96(sp)
 1f4:	05712e23          	sw	s7,92(sp)
 1f8:	05812c23          	sw	s8,88(sp)
 1fc:	05912a23          	sw	s9,84(sp)
 200:	05a12823          	sw	s10,80(sp)
 204:	05b12623          	sw	s11,76(sp)
 208:	198000ef          	jal	ra,3a0 <neorv32_gpio_port_set>
 20c:	04000613          	li	a2,64
 210:	00000593          	li	a1,0
 214:	00010513          	mv	a0,sp
 218:	355000ef          	jal	ra,d6c <memset>
 21c:	00700993          	li	s3,7
 220:	00200493          	li	s1,2
 224:	00001a37          	lui	s4,0x1
 228:	00100a93          	li	s5,1
 22c:	00010913          	mv	s2,sp
 230:	fff00413          	li	s0,-1
 234:	00800b13          	li	s6,8
 238:	00600b93          	li	s7,6
 23c:	00500c13          	li	s8,5
 240:	00040c93          	mv	s9,s0
 244:	00140413          	addi	s0,s0,1
 248:	00040513          	mv	a0,s0
 24c:	0fc000ef          	jal	ra,348 <neorv32_gpio_pin_clr>
 250:	00090d93          	mv	s11,s2
 254:	00400d13          	li	s10,4
 258:	000d0513          	mv	a0,s10
 25c:	120000ef          	jal	ra,37c <neorv32_gpio_pin_get>
 260:	0a051063          	bnez	a0,300 <keyboard_c+0x138>
 264:	000da783          	lw	a5,0(s11)
 268:	02079863          	bnez	a5,298 <keyboard_c+0xd0>
 26c:	053d1863          	bne	s10,s3,2bc <keyboard_c+0xf4>
 270:	04100593          	li	a1,65
 274:	0194e863          	bltu	s1,s9,284 <keyboard_c+0xbc>
 278:	03300593          	li	a1,51
 27c:	419585b3          	sub	a1,a1,s9
 280:	0ff5f593          	zext.b	a1,a1
 284:	419486b3          	sub	a3,s1,s9
 288:	41a98633          	sub	a2,s3,s10
 28c:	e48a0513          	addi	a0,s4,-440 # e48 <__etext>
 290:	099000ef          	jal	ra,b28 <neorv32_uart0_printf>
 294:	015da023          	sw	s5,0(s11)
 298:	001d0d13          	addi	s10,s10,1
 29c:	010d8d93          	addi	s11,s11,16
 2a0:	fb6d1ce3          	bne	s10,s6,258 <keyboard_c+0x90>
 2a4:	00040513          	mv	a0,s0
 2a8:	070000ef          	jal	ra,318 <neorv32_gpio_pin_set>
 2ac:	00300793          	li	a5,3
 2b0:	00490913          	addi	s2,s2,4
 2b4:	f8f416e3          	bne	s0,a5,240 <keyboard_c+0x78>
 2b8:	f75ff06f          	j	22c <keyboard_c+0x64>
 2bc:	017d1a63          	bne	s10,s7,2d0 <keyboard_c+0x108>
 2c0:	04200593          	li	a1,66
 2c4:	fd94e0e3          	bltu	s1,s9,284 <keyboard_c+0xbc>
 2c8:	03600593          	li	a1,54
 2cc:	fb1ff06f          	j	27c <keyboard_c+0xb4>
 2d0:	018d1a63          	bne	s10,s8,2e4 <keyboard_c+0x11c>
 2d4:	04300593          	li	a1,67
 2d8:	fb94e6e3          	bltu	s1,s9,284 <keyboard_c+0xbc>
 2dc:	03900593          	li	a1,57
 2e0:	f9dff06f          	j	27c <keyboard_c+0xb4>
 2e4:	04400593          	li	a1,68
 2e8:	f994eee3          	bltu	s1,s9,284 <keyboard_c+0xbc>
 2ec:	800007b7          	lui	a5,0x80000
 2f0:	00078793          	mv	a5,a5
 2f4:	00fc87b3          	add	a5,s9,a5
 2f8:	0007c583          	lbu	a1,0(a5) # 80000000 <__ctr0_io_space_begin+0x80000200>
 2fc:	f89ff06f          	j	284 <keyboard_c+0xbc>
 300:	000da023          	sw	zero,0(s11)
 304:	f95ff06f          	j	298 <keyboard_c+0xd0>

00000308 <neorv32_gpio_available>:
 308:	fe802503          	lw	a0,-24(zero) # ffffffe8 <__ctr0_io_space_begin+0x1e8>
 30c:	01055513          	srli	a0,a0,0x10
 310:	00157513          	andi	a0,a0,1
 314:	00008067          	ret

00000318 <neorv32_gpio_pin_set>:
 318:	00100793          	li	a5,1
 31c:	01f00713          	li	a4,31
 320:	00a797b3          	sll	a5,a5,a0
 324:	00a74a63          	blt	a4,a0,338 <neorv32_gpio_pin_set+0x20>
 328:	fc802703          	lw	a4,-56(zero) # ffffffc8 <__ctr0_io_space_begin+0x1c8>
 32c:	00f767b3          	or	a5,a4,a5
 330:	fcf02423          	sw	a5,-56(zero) # ffffffc8 <__ctr0_io_space_begin+0x1c8>
 334:	00008067          	ret
 338:	fcc02703          	lw	a4,-52(zero) # ffffffcc <__ctr0_io_space_begin+0x1cc>
 33c:	00f767b3          	or	a5,a4,a5
 340:	fcf02623          	sw	a5,-52(zero) # ffffffcc <__ctr0_io_space_begin+0x1cc>
 344:	00008067          	ret

00000348 <neorv32_gpio_pin_clr>:
 348:	00100793          	li	a5,1
 34c:	00a797b3          	sll	a5,a5,a0
 350:	01f00713          	li	a4,31
 354:	fff7c793          	not	a5,a5
 358:	00a74a63          	blt	a4,a0,36c <neorv32_gpio_pin_clr+0x24>
 35c:	fc802703          	lw	a4,-56(zero) # ffffffc8 <__ctr0_io_space_begin+0x1c8>
 360:	00f777b3          	and	a5,a4,a5
 364:	fcf02423          	sw	a5,-56(zero) # ffffffc8 <__ctr0_io_space_begin+0x1c8>
 368:	00008067          	ret
 36c:	fcc02703          	lw	a4,-52(zero) # ffffffcc <__ctr0_io_space_begin+0x1cc>
 370:	00f777b3          	and	a5,a4,a5
 374:	fcf02623          	sw	a5,-52(zero) # ffffffcc <__ctr0_io_space_begin+0x1cc>
 378:	00008067          	ret

0000037c <neorv32_gpio_pin_get>:
 37c:	00100793          	li	a5,1
 380:	01f00713          	li	a4,31
 384:	00a797b3          	sll	a5,a5,a0
 388:	00a74863          	blt	a4,a0,398 <neorv32_gpio_pin_get+0x1c>
 38c:	fc002703          	lw	a4,-64(zero) # ffffffc0 <__ctr0_io_space_begin+0x1c0>
 390:	00f77533          	and	a0,a4,a5
 394:	00008067          	ret
 398:	fc402703          	lw	a4,-60(zero) # ffffffc4 <__ctr0_io_space_begin+0x1c4>
 39c:	ff5ff06f          	j	390 <neorv32_gpio_pin_get+0x14>

000003a0 <neorv32_gpio_port_set>:
 3a0:	fc000793          	li	a5,-64
 3a4:	00a7a423          	sw	a0,8(a5)
 3a8:	00b7a623          	sw	a1,12(a5)
 3ac:	00008067          	ret

000003b0 <__neorv32_rte_core>:
 3b0:	fc010113          	addi	sp,sp,-64
 3b4:	02112e23          	sw	ra,60(sp)
 3b8:	02512c23          	sw	t0,56(sp)
 3bc:	02612a23          	sw	t1,52(sp)
 3c0:	02712823          	sw	t2,48(sp)
 3c4:	02a12623          	sw	a0,44(sp)
 3c8:	02b12423          	sw	a1,40(sp)
 3cc:	02c12223          	sw	a2,36(sp)
 3d0:	02d12023          	sw	a3,32(sp)
 3d4:	00e12e23          	sw	a4,28(sp)
 3d8:	00f12c23          	sw	a5,24(sp)
 3dc:	01012a23          	sw	a6,20(sp)
 3e0:	01112823          	sw	a7,16(sp)
 3e4:	01c12623          	sw	t3,12(sp)
 3e8:	01d12423          	sw	t4,8(sp)
 3ec:	01e12223          	sw	t5,4(sp)
 3f0:	01f12023          	sw	t6,0(sp)
 3f4:	34102773          	csrr	a4,mepc
 3f8:	34071073          	csrw	mscratch,a4
 3fc:	342027f3          	csrr	a5,mcause
 400:	0807c863          	bltz	a5,490 <__neorv32_rte_core+0xe0>
 404:	00071683          	lh	a3,0(a4)
 408:	00300593          	li	a1,3
 40c:	0036f693          	andi	a3,a3,3
 410:	00270613          	addi	a2,a4,2
 414:	00b69463          	bne	a3,a1,41c <__neorv32_rte_core+0x6c>
 418:	00470613          	addi	a2,a4,4
 41c:	34161073          	csrw	mepc,a2
 420:	00b00713          	li	a4,11
 424:	04f77a63          	bgeu	a4,a5,478 <__neorv32_rte_core+0xc8>
 428:	65c00793          	li	a5,1628
 42c:	000780e7          	jalr	a5
 430:	03c12083          	lw	ra,60(sp)
 434:	03812283          	lw	t0,56(sp)
 438:	03412303          	lw	t1,52(sp)
 43c:	03012383          	lw	t2,48(sp)
 440:	02c12503          	lw	a0,44(sp)
 444:	02812583          	lw	a1,40(sp)
 448:	02412603          	lw	a2,36(sp)
 44c:	02012683          	lw	a3,32(sp)
 450:	01c12703          	lw	a4,28(sp)
 454:	01812783          	lw	a5,24(sp)
 458:	01412803          	lw	a6,20(sp)
 45c:	01012883          	lw	a7,16(sp)
 460:	00c12e03          	lw	t3,12(sp)
 464:	00812e83          	lw	t4,8(sp)
 468:	00412f03          	lw	t5,4(sp)
 46c:	00012f83          	lw	t6,0(sp)
 470:	04010113          	addi	sp,sp,64
 474:	30200073          	mret
 478:	00001737          	lui	a4,0x1
 47c:	00279793          	slli	a5,a5,0x2
 480:	e9870713          	addi	a4,a4,-360 # e98 <__etext+0x50>
 484:	00e787b3          	add	a5,a5,a4
 488:	0007a783          	lw	a5,0(a5)
 48c:	00078067          	jr	a5
 490:	80000737          	lui	a4,0x80000
 494:	ffd74713          	xori	a4,a4,-3
 498:	00e787b3          	add	a5,a5,a4
 49c:	01c00713          	li	a4,28
 4a0:	f8f764e3          	bltu	a4,a5,428 <__neorv32_rte_core+0x78>
 4a4:	00001737          	lui	a4,0x1
 4a8:	00279793          	slli	a5,a5,0x2
 4ac:	ec870713          	addi	a4,a4,-312 # ec8 <__etext+0x80>
 4b0:	00e787b3          	add	a5,a5,a4
 4b4:	0007a783          	lw	a5,0(a5)
 4b8:	00078067          	jr	a5
 4bc:	800007b7          	lui	a5,0x80000
 4c0:	0047a783          	lw	a5,4(a5) # 80000004 <__ctr0_io_space_begin+0x80000204>
 4c4:	f69ff06f          	j	42c <__neorv32_rte_core+0x7c>
 4c8:	800007b7          	lui	a5,0x80000
 4cc:	0087a783          	lw	a5,8(a5) # 80000008 <__ctr0_io_space_begin+0x80000208>
 4d0:	f5dff06f          	j	42c <__neorv32_rte_core+0x7c>
 4d4:	800007b7          	lui	a5,0x80000
 4d8:	00c7a783          	lw	a5,12(a5) # 8000000c <__ctr0_io_space_begin+0x8000020c>
 4dc:	f51ff06f          	j	42c <__neorv32_rte_core+0x7c>
 4e0:	800007b7          	lui	a5,0x80000
 4e4:	0107a783          	lw	a5,16(a5) # 80000010 <__ctr0_io_space_begin+0x80000210>
 4e8:	f45ff06f          	j	42c <__neorv32_rte_core+0x7c>
 4ec:	800007b7          	lui	a5,0x80000
 4f0:	0147a783          	lw	a5,20(a5) # 80000014 <__ctr0_io_space_begin+0x80000214>
 4f4:	f39ff06f          	j	42c <__neorv32_rte_core+0x7c>
 4f8:	800007b7          	lui	a5,0x80000
 4fc:	0187a783          	lw	a5,24(a5) # 80000018 <__ctr0_io_space_begin+0x80000218>
 500:	f2dff06f          	j	42c <__neorv32_rte_core+0x7c>
 504:	800007b7          	lui	a5,0x80000
 508:	01c7a783          	lw	a5,28(a5) # 8000001c <__ctr0_io_space_begin+0x8000021c>
 50c:	f21ff06f          	j	42c <__neorv32_rte_core+0x7c>
 510:	800007b7          	lui	a5,0x80000
 514:	0207a783          	lw	a5,32(a5) # 80000020 <__ctr0_io_space_begin+0x80000220>
 518:	f15ff06f          	j	42c <__neorv32_rte_core+0x7c>
 51c:	800007b7          	lui	a5,0x80000
 520:	0247a783          	lw	a5,36(a5) # 80000024 <__ctr0_io_space_begin+0x80000224>
 524:	f09ff06f          	j	42c <__neorv32_rte_core+0x7c>
 528:	800007b7          	lui	a5,0x80000
 52c:	0287a783          	lw	a5,40(a5) # 80000028 <__ctr0_io_space_begin+0x80000228>
 530:	efdff06f          	j	42c <__neorv32_rte_core+0x7c>
 534:	800007b7          	lui	a5,0x80000
 538:	02c7a783          	lw	a5,44(a5) # 8000002c <__ctr0_io_space_begin+0x8000022c>
 53c:	ef1ff06f          	j	42c <__neorv32_rte_core+0x7c>
 540:	800007b7          	lui	a5,0x80000
 544:	0307a783          	lw	a5,48(a5) # 80000030 <__ctr0_io_space_begin+0x80000230>
 548:	ee5ff06f          	j	42c <__neorv32_rte_core+0x7c>
 54c:	800007b7          	lui	a5,0x80000
 550:	0347a783          	lw	a5,52(a5) # 80000034 <__ctr0_io_space_begin+0x80000234>
 554:	ed9ff06f          	j	42c <__neorv32_rte_core+0x7c>
 558:	800007b7          	lui	a5,0x80000
 55c:	0387a783          	lw	a5,56(a5) # 80000038 <__ctr0_io_space_begin+0x80000238>
 560:	ecdff06f          	j	42c <__neorv32_rte_core+0x7c>
 564:	800007b7          	lui	a5,0x80000
 568:	03c7a783          	lw	a5,60(a5) # 8000003c <__ctr0_io_space_begin+0x8000023c>
 56c:	ec1ff06f          	j	42c <__neorv32_rte_core+0x7c>
 570:	800007b7          	lui	a5,0x80000
 574:	0407a783          	lw	a5,64(a5) # 80000040 <__ctr0_io_space_begin+0x80000240>
 578:	eb5ff06f          	j	42c <__neorv32_rte_core+0x7c>
 57c:	8441a783          	lw	a5,-1980(gp) # 80000044 <__neorv32_rte_vector_lut+0x40>
 580:	eadff06f          	j	42c <__neorv32_rte_core+0x7c>
 584:	8481a783          	lw	a5,-1976(gp) # 80000048 <__neorv32_rte_vector_lut+0x44>
 588:	ea5ff06f          	j	42c <__neorv32_rte_core+0x7c>
 58c:	84c1a783          	lw	a5,-1972(gp) # 8000004c <__neorv32_rte_vector_lut+0x48>
 590:	e9dff06f          	j	42c <__neorv32_rte_core+0x7c>
 594:	8501a783          	lw	a5,-1968(gp) # 80000050 <__neorv32_rte_vector_lut+0x4c>
 598:	e95ff06f          	j	42c <__neorv32_rte_core+0x7c>
 59c:	8541a783          	lw	a5,-1964(gp) # 80000054 <__neorv32_rte_vector_lut+0x50>
 5a0:	e8dff06f          	j	42c <__neorv32_rte_core+0x7c>
 5a4:	8581a783          	lw	a5,-1960(gp) # 80000058 <__neorv32_rte_vector_lut+0x54>
 5a8:	e85ff06f          	j	42c <__neorv32_rte_core+0x7c>
 5ac:	85c1a783          	lw	a5,-1956(gp) # 8000005c <__neorv32_rte_vector_lut+0x58>
 5b0:	e7dff06f          	j	42c <__neorv32_rte_core+0x7c>
 5b4:	8601a783          	lw	a5,-1952(gp) # 80000060 <__neorv32_rte_vector_lut+0x5c>
 5b8:	e75ff06f          	j	42c <__neorv32_rte_core+0x7c>
 5bc:	8641a783          	lw	a5,-1948(gp) # 80000064 <__neorv32_rte_vector_lut+0x60>
 5c0:	e6dff06f          	j	42c <__neorv32_rte_core+0x7c>
 5c4:	8681a783          	lw	a5,-1944(gp) # 80000068 <__neorv32_rte_vector_lut+0x64>
 5c8:	e65ff06f          	j	42c <__neorv32_rte_core+0x7c>
 5cc:	86c1a783          	lw	a5,-1940(gp) # 8000006c <__neorv32_rte_vector_lut+0x68>
 5d0:	e5dff06f          	j	42c <__neorv32_rte_core+0x7c>
 5d4:	8701a783          	lw	a5,-1936(gp) # 80000070 <__neorv32_rte_vector_lut+0x6c>
 5d8:	e55ff06f          	j	42c <__neorv32_rte_core+0x7c>
 5dc:	8741a783          	lw	a5,-1932(gp) # 80000074 <__neorv32_rte_vector_lut+0x70>
 5e0:	e4dff06f          	j	42c <__neorv32_rte_core+0x7c>
 5e4:	0000                	.2byte	0x0
 5e6:	0000                	.2byte	0x0
 5e8:	0000                	.2byte	0x0
 5ea:	0000                	.2byte	0x0

000005ec <__neorv32_rte_print_hex_word>:
 5ec:	fe010113          	addi	sp,sp,-32
 5f0:	01212823          	sw	s2,16(sp)
 5f4:	00050913          	mv	s2,a0
 5f8:	00001537          	lui	a0,0x1
 5fc:	00912a23          	sw	s1,20(sp)
 600:	f3c50513          	addi	a0,a0,-196 # f3c <__etext+0xf4>
 604:	000014b7          	lui	s1,0x1
 608:	00812c23          	sw	s0,24(sp)
 60c:	01312623          	sw	s3,12(sp)
 610:	00112e23          	sw	ra,28(sp)
 614:	01c00413          	li	s0,28
 618:	4b8000ef          	jal	ra,ad0 <neorv32_uart0_print>
 61c:	13048493          	addi	s1,s1,304 # 1130 <hex_symbols.0>
 620:	ffc00993          	li	s3,-4
 624:	008957b3          	srl	a5,s2,s0
 628:	00f7f793          	andi	a5,a5,15
 62c:	00f487b3          	add	a5,s1,a5
 630:	0007c503          	lbu	a0,0(a5)
 634:	ffc40413          	addi	s0,s0,-4
 638:	480000ef          	jal	ra,ab8 <neorv32_uart0_putc>
 63c:	ff3414e3          	bne	s0,s3,624 <__neorv32_rte_print_hex_word+0x38>
 640:	01c12083          	lw	ra,28(sp)
 644:	01812403          	lw	s0,24(sp)
 648:	01412483          	lw	s1,20(sp)
 64c:	01012903          	lw	s2,16(sp)
 650:	00c12983          	lw	s3,12(sp)
 654:	02010113          	addi	sp,sp,32
 658:	00008067          	ret

0000065c <__neorv32_rte_debug_exc_handler>:
 65c:	ff010113          	addi	sp,sp,-16
 660:	00112623          	sw	ra,12(sp)
 664:	00812423          	sw	s0,8(sp)
 668:	00912223          	sw	s1,4(sp)
 66c:	390000ef          	jal	ra,9fc <neorv32_uart0_available>
 670:	1a050e63          	beqz	a0,82c <__neorv32_rte_debug_exc_handler+0x1d0>
 674:	00001537          	lui	a0,0x1
 678:	f4050513          	addi	a0,a0,-192 # f40 <__etext+0xf8>
 67c:	454000ef          	jal	ra,ad0 <neorv32_uart0_print>
 680:	34202473          	csrr	s0,mcause
 684:	00900713          	li	a4,9
 688:	00f47793          	andi	a5,s0,15
 68c:	03078493          	addi	s1,a5,48
 690:	00f77463          	bgeu	a4,a5,698 <__neorv32_rte_debug_exc_handler+0x3c>
 694:	05778493          	addi	s1,a5,87
 698:	00b00793          	li	a5,11
 69c:	0087ee63          	bltu	a5,s0,6b8 <__neorv32_rte_debug_exc_handler+0x5c>
 6a0:	00001737          	lui	a4,0x1
 6a4:	00241793          	slli	a5,s0,0x2
 6a8:	10070713          	addi	a4,a4,256 # 1100 <__etext+0x2b8>
 6ac:	00e787b3          	add	a5,a5,a4
 6b0:	0007a783          	lw	a5,0(a5)
 6b4:	00078067          	jr	a5
 6b8:	800007b7          	lui	a5,0x80000
 6bc:	00b78713          	addi	a4,a5,11 # 8000000b <__ctr0_io_space_begin+0x8000020b>
 6c0:	14e40463          	beq	s0,a4,808 <__neorv32_rte_debug_exc_handler+0x1ac>
 6c4:	02876663          	bltu	a4,s0,6f0 <__neorv32_rte_debug_exc_handler+0x94>
 6c8:	00378713          	addi	a4,a5,3
 6cc:	12e40263          	beq	s0,a4,7f0 <__neorv32_rte_debug_exc_handler+0x194>
 6d0:	00778793          	addi	a5,a5,7
 6d4:	12f40463          	beq	s0,a5,7fc <__neorv32_rte_debug_exc_handler+0x1a0>
 6d8:	00001537          	lui	a0,0x1
 6dc:	0a050513          	addi	a0,a0,160 # 10a0 <__etext+0x258>
 6e0:	3f0000ef          	jal	ra,ad0 <neorv32_uart0_print>
 6e4:	00040513          	mv	a0,s0
 6e8:	f05ff0ef          	jal	ra,5ec <__neorv32_rte_print_hex_word>
 6ec:	0280006f          	j	714 <__neorv32_rte_debug_exc_handler+0xb8>
 6f0:	ff07c793          	xori	a5,a5,-16
 6f4:	00f407b3          	add	a5,s0,a5
 6f8:	00f00713          	li	a4,15
 6fc:	fcf76ee3          	bltu	a4,a5,6d8 <__neorv32_rte_debug_exc_handler+0x7c>
 700:	00001537          	lui	a0,0x1
 704:	09050513          	addi	a0,a0,144 # 1090 <__etext+0x248>
 708:	3c8000ef          	jal	ra,ad0 <neorv32_uart0_print>
 70c:	00048513          	mv	a0,s1
 710:	3a8000ef          	jal	ra,ab8 <neorv32_uart0_putc>
 714:	00001537          	lui	a0,0x1
 718:	0e450513          	addi	a0,a0,228 # 10e4 <__etext+0x29c>
 71c:	3b4000ef          	jal	ra,ad0 <neorv32_uart0_print>
 720:	34002573          	csrr	a0,mscratch
 724:	ec9ff0ef          	jal	ra,5ec <__neorv32_rte_print_hex_word>
 728:	00001537          	lui	a0,0x1
 72c:	0ec50513          	addi	a0,a0,236 # 10ec <__etext+0x2a4>
 730:	3a0000ef          	jal	ra,ad0 <neorv32_uart0_print>
 734:	34302573          	csrr	a0,mtval
 738:	eb5ff0ef          	jal	ra,5ec <__neorv32_rte_print_hex_word>
 73c:	00812403          	lw	s0,8(sp)
 740:	00c12083          	lw	ra,12(sp)
 744:	00412483          	lw	s1,4(sp)
 748:	00001537          	lui	a0,0x1
 74c:	0f850513          	addi	a0,a0,248 # 10f8 <__etext+0x2b0>
 750:	01010113          	addi	sp,sp,16
 754:	37c0006f          	j	ad0 <neorv32_uart0_print>
 758:	00001537          	lui	a0,0x1
 75c:	f4850513          	addi	a0,a0,-184 # f48 <__etext+0x100>
 760:	370000ef          	jal	ra,ad0 <neorv32_uart0_print>
 764:	fb1ff06f          	j	714 <__neorv32_rte_debug_exc_handler+0xb8>
 768:	00001537          	lui	a0,0x1
 76c:	f6850513          	addi	a0,a0,-152 # f68 <__etext+0x120>
 770:	360000ef          	jal	ra,ad0 <neorv32_uart0_print>
 774:	f7c02783          	lw	a5,-132(zero) # ffffff7c <__ctr0_io_space_begin+0x17c>
 778:	0a07d463          	bgez	a5,820 <__neorv32_rte_debug_exc_handler+0x1c4>
 77c:	0017f793          	andi	a5,a5,1
 780:	08078a63          	beqz	a5,814 <__neorv32_rte_debug_exc_handler+0x1b8>
 784:	00001537          	lui	a0,0x1
 788:	0b850513          	addi	a0,a0,184 # 10b8 <__etext+0x270>
 78c:	fd5ff06f          	j	760 <__neorv32_rte_debug_exc_handler+0x104>
 790:	00001537          	lui	a0,0x1
 794:	f8450513          	addi	a0,a0,-124 # f84 <__etext+0x13c>
 798:	fc9ff06f          	j	760 <__neorv32_rte_debug_exc_handler+0x104>
 79c:	00001537          	lui	a0,0x1
 7a0:	f9850513          	addi	a0,a0,-104 # f98 <__etext+0x150>
 7a4:	fbdff06f          	j	760 <__neorv32_rte_debug_exc_handler+0x104>
 7a8:	00001537          	lui	a0,0x1
 7ac:	fa450513          	addi	a0,a0,-92 # fa4 <__etext+0x15c>
 7b0:	fb1ff06f          	j	760 <__neorv32_rte_debug_exc_handler+0x104>
 7b4:	00001537          	lui	a0,0x1
 7b8:	fbc50513          	addi	a0,a0,-68 # fbc <__etext+0x174>
 7bc:	fb5ff06f          	j	770 <__neorv32_rte_debug_exc_handler+0x114>
 7c0:	00001537          	lui	a0,0x1
 7c4:	fd050513          	addi	a0,a0,-48 # fd0 <__etext+0x188>
 7c8:	f99ff06f          	j	760 <__neorv32_rte_debug_exc_handler+0x104>
 7cc:	00001537          	lui	a0,0x1
 7d0:	fec50513          	addi	a0,a0,-20 # fec <__etext+0x1a4>
 7d4:	f9dff06f          	j	770 <__neorv32_rte_debug_exc_handler+0x114>
 7d8:	00001537          	lui	a0,0x1
 7dc:	00050513          	mv	a0,a0
 7e0:	f81ff06f          	j	760 <__neorv32_rte_debug_exc_handler+0x104>
 7e4:	00001537          	lui	a0,0x1
 7e8:	02050513          	addi	a0,a0,32 # 1020 <__etext+0x1d8>
 7ec:	f75ff06f          	j	760 <__neorv32_rte_debug_exc_handler+0x104>
 7f0:	00001537          	lui	a0,0x1
 7f4:	04050513          	addi	a0,a0,64 # 1040 <__etext+0x1f8>
 7f8:	f69ff06f          	j	760 <__neorv32_rte_debug_exc_handler+0x104>
 7fc:	00001537          	lui	a0,0x1
 800:	05c50513          	addi	a0,a0,92 # 105c <__etext+0x214>
 804:	f5dff06f          	j	760 <__neorv32_rte_debug_exc_handler+0x104>
 808:	00001537          	lui	a0,0x1
 80c:	07450513          	addi	a0,a0,116 # 1074 <__etext+0x22c>
 810:	f51ff06f          	j	760 <__neorv32_rte_debug_exc_handler+0x104>
 814:	00001537          	lui	a0,0x1
 818:	0c850513          	addi	a0,a0,200 # 10c8 <__etext+0x280>
 81c:	f45ff06f          	j	760 <__neorv32_rte_debug_exc_handler+0x104>
 820:	00001537          	lui	a0,0x1
 824:	0d850513          	addi	a0,a0,216 # 10d8 <__etext+0x290>
 828:	f39ff06f          	j	760 <__neorv32_rte_debug_exc_handler+0x104>
 82c:	00c12083          	lw	ra,12(sp)
 830:	00812403          	lw	s0,8(sp)
 834:	00412483          	lw	s1,4(sp)
 838:	01010113          	addi	sp,sp,16
 83c:	00008067          	ret

00000840 <neorv32_rte_exception_uninstall>:
 840:	01f00793          	li	a5,31
 844:	02a7e263          	bltu	a5,a0,868 <neorv32_rte_exception_uninstall+0x28>
 848:	800007b7          	lui	a5,0x80000
 84c:	00251513          	slli	a0,a0,0x2
 850:	00478793          	addi	a5,a5,4 # 80000004 <__ctr0_io_space_begin+0x80000204>
 854:	00a787b3          	add	a5,a5,a0
 858:	65c00713          	li	a4,1628
 85c:	00e7a023          	sw	a4,0(a5)
 860:	00000513          	li	a0,0
 864:	00008067          	ret
 868:	00100513          	li	a0,1
 86c:	00008067          	ret

00000870 <neorv32_rte_setup>:
 870:	ff010113          	addi	sp,sp,-16
 874:	00112623          	sw	ra,12(sp)
 878:	00812423          	sw	s0,8(sp)
 87c:	00912223          	sw	s1,4(sp)
 880:	3b000793          	li	a5,944
 884:	30579073          	csrw	mtvec,a5
 888:	00000413          	li	s0,0
 88c:	01d00493          	li	s1,29
 890:	00040513          	mv	a0,s0
 894:	00140413          	addi	s0,s0,1
 898:	0ff47413          	zext.b	s0,s0
 89c:	fa5ff0ef          	jal	ra,840 <neorv32_rte_exception_uninstall>
 8a0:	fe9418e3          	bne	s0,s1,890 <neorv32_rte_setup+0x20>
 8a4:	00c12083          	lw	ra,12(sp)
 8a8:	00812403          	lw	s0,8(sp)
 8ac:	00412483          	lw	s1,4(sp)
 8b0:	01010113          	addi	sp,sp,16
 8b4:	00008067          	ret

000008b8 <__neorv32_uart_itoa>:
 8b8:	fd010113          	addi	sp,sp,-48
 8bc:	02812423          	sw	s0,40(sp)
 8c0:	02912223          	sw	s1,36(sp)
 8c4:	03212023          	sw	s2,32(sp)
 8c8:	01312e23          	sw	s3,28(sp)
 8cc:	01412c23          	sw	s4,24(sp)
 8d0:	02112623          	sw	ra,44(sp)
 8d4:	01512a23          	sw	s5,20(sp)
 8d8:	00001a37          	lui	s4,0x1
 8dc:	00050493          	mv	s1,a0
 8e0:	00058413          	mv	s0,a1
 8e4:	00058523          	sb	zero,10(a1)
 8e8:	00000993          	li	s3,0
 8ec:	00410913          	addi	s2,sp,4
 8f0:	154a0a13          	addi	s4,s4,340 # 1154 <numbers.1>
 8f4:	00a00593          	li	a1,10
 8f8:	00048513          	mv	a0,s1
 8fc:	40c000ef          	jal	ra,d08 <__umodsi3>
 900:	00aa0533          	add	a0,s4,a0
 904:	00054783          	lbu	a5,0(a0)
 908:	01390ab3          	add	s5,s2,s3
 90c:	00048513          	mv	a0,s1
 910:	00fa8023          	sb	a5,0(s5)
 914:	00a00593          	li	a1,10
 918:	3a8000ef          	jal	ra,cc0 <__hidden___udivsi3>
 91c:	00198993          	addi	s3,s3,1
 920:	00a00793          	li	a5,10
 924:	00050493          	mv	s1,a0
 928:	fcf996e3          	bne	s3,a5,8f4 <__neorv32_uart_itoa+0x3c>
 92c:	00090693          	mv	a3,s2
 930:	00900713          	li	a4,9
 934:	03000613          	li	a2,48
 938:	0096c583          	lbu	a1,9(a3)
 93c:	00070793          	mv	a5,a4
 940:	fff70713          	addi	a4,a4,-1
 944:	01071713          	slli	a4,a4,0x10
 948:	01075713          	srli	a4,a4,0x10
 94c:	00c59a63          	bne	a1,a2,960 <__neorv32_uart_itoa+0xa8>
 950:	000684a3          	sb	zero,9(a3)
 954:	fff68693          	addi	a3,a3,-1
 958:	fe0710e3          	bnez	a4,938 <__neorv32_uart_itoa+0x80>
 95c:	00000793          	li	a5,0
 960:	00f907b3          	add	a5,s2,a5
 964:	00000713          	li	a4,0
 968:	0007c683          	lbu	a3,0(a5)
 96c:	00068c63          	beqz	a3,984 <__neorv32_uart_itoa+0xcc>
 970:	00170613          	addi	a2,a4,1
 974:	00e40733          	add	a4,s0,a4
 978:	00d70023          	sb	a3,0(a4)
 97c:	01061713          	slli	a4,a2,0x10
 980:	01075713          	srli	a4,a4,0x10
 984:	fff78693          	addi	a3,a5,-1
 988:	02f91863          	bne	s2,a5,9b8 <__neorv32_uart_itoa+0x100>
 98c:	00e40433          	add	s0,s0,a4
 990:	00040023          	sb	zero,0(s0)
 994:	02c12083          	lw	ra,44(sp)
 998:	02812403          	lw	s0,40(sp)
 99c:	02412483          	lw	s1,36(sp)
 9a0:	02012903          	lw	s2,32(sp)
 9a4:	01c12983          	lw	s3,28(sp)
 9a8:	01812a03          	lw	s4,24(sp)
 9ac:	01412a83          	lw	s5,20(sp)
 9b0:	03010113          	addi	sp,sp,48
 9b4:	00008067          	ret
 9b8:	00068793          	mv	a5,a3
 9bc:	fadff06f          	j	968 <__neorv32_uart_itoa+0xb0>

000009c0 <__neorv32_uart_tohex>:
 9c0:	00001637          	lui	a2,0x1
 9c4:	00758693          	addi	a3,a1,7
 9c8:	00000713          	li	a4,0
 9cc:	14060613          	addi	a2,a2,320 # 1140 <symbols.0>
 9d0:	02000813          	li	a6,32
 9d4:	00e557b3          	srl	a5,a0,a4
 9d8:	00f7f793          	andi	a5,a5,15
 9dc:	00f607b3          	add	a5,a2,a5
 9e0:	0007c783          	lbu	a5,0(a5)
 9e4:	00470713          	addi	a4,a4,4
 9e8:	fff68693          	addi	a3,a3,-1
 9ec:	00f680a3          	sb	a5,1(a3)
 9f0:	ff0712e3          	bne	a4,a6,9d4 <__neorv32_uart_tohex+0x14>
 9f4:	00058423          	sb	zero,8(a1)
 9f8:	00008067          	ret

000009fc <neorv32_uart0_available>:
 9fc:	fe802503          	lw	a0,-24(zero) # ffffffe8 <__ctr0_io_space_begin+0x1e8>
 a00:	01255513          	srli	a0,a0,0x12
 a04:	00157513          	andi	a0,a0,1
 a08:	00008067          	ret

00000a0c <neorv32_uart0_setup>:
 a0c:	ff010113          	addi	sp,sp,-16
 a10:	00812423          	sw	s0,8(sp)
 a14:	00912223          	sw	s1,4(sp)
 a18:	00112623          	sw	ra,12(sp)
 a1c:	fa002023          	sw	zero,-96(zero) # ffffffa0 <__ctr0_io_space_begin+0x1a0>
 a20:	fe002783          	lw	a5,-32(zero) # ffffffe0 <__ctr0_io_space_begin+0x1e0>
 a24:	00058413          	mv	s0,a1
 a28:	00151593          	slli	a1,a0,0x1
 a2c:	00078513          	mv	a0,a5
 a30:	00060493          	mv	s1,a2
 a34:	28c000ef          	jal	ra,cc0 <__hidden___udivsi3>
 a38:	01051513          	slli	a0,a0,0x10
 a3c:	000017b7          	lui	a5,0x1
 a40:	01055513          	srli	a0,a0,0x10
 a44:	00000713          	li	a4,0
 a48:	ffe78793          	addi	a5,a5,-2 # ffe <__etext+0x1b6>
 a4c:	04a7e463          	bltu	a5,a0,a94 <neorv32_uart0_setup+0x88>
 a50:	0034f493          	andi	s1,s1,3
 a54:	01449493          	slli	s1,s1,0x14
 a58:	00347413          	andi	s0,s0,3
 a5c:	fff50793          	addi	a5,a0,-1
 a60:	0097e7b3          	or	a5,a5,s1
 a64:	01641413          	slli	s0,s0,0x16
 a68:	0087e7b3          	or	a5,a5,s0
 a6c:	01871713          	slli	a4,a4,0x18
 a70:	00c12083          	lw	ra,12(sp)
 a74:	00812403          	lw	s0,8(sp)
 a78:	00e7e7b3          	or	a5,a5,a4
 a7c:	10000737          	lui	a4,0x10000
 a80:	00e7e7b3          	or	a5,a5,a4
 a84:	faf02023          	sw	a5,-96(zero) # ffffffa0 <__ctr0_io_space_begin+0x1a0>
 a88:	00412483          	lw	s1,4(sp)
 a8c:	01010113          	addi	sp,sp,16
 a90:	00008067          	ret
 a94:	ffe70693          	addi	a3,a4,-2 # ffffffe <__crt0_copy_data_src_begin+0xfffee9e>
 a98:	0fd6f693          	andi	a3,a3,253
 a9c:	00069a63          	bnez	a3,ab0 <neorv32_uart0_setup+0xa4>
 aa0:	00355513          	srli	a0,a0,0x3
 aa4:	00170713          	addi	a4,a4,1
 aa8:	0ff77713          	zext.b	a4,a4
 aac:	fa1ff06f          	j	a4c <neorv32_uart0_setup+0x40>
 ab0:	00155513          	srli	a0,a0,0x1
 ab4:	ff1ff06f          	j	aa4 <neorv32_uart0_setup+0x98>

00000ab8 <neorv32_uart0_putc>:
 ab8:	00040737          	lui	a4,0x40
 abc:	fa002783          	lw	a5,-96(zero) # ffffffa0 <__ctr0_io_space_begin+0x1a0>
 ac0:	00e7f7b3          	and	a5,a5,a4
 ac4:	fe079ce3          	bnez	a5,abc <neorv32_uart0_putc+0x4>
 ac8:	faa02223          	sw	a0,-92(zero) # ffffffa4 <__ctr0_io_space_begin+0x1a4>
 acc:	00008067          	ret

00000ad0 <neorv32_uart0_print>:
 ad0:	ff010113          	addi	sp,sp,-16
 ad4:	00812423          	sw	s0,8(sp)
 ad8:	01212023          	sw	s2,0(sp)
 adc:	00112623          	sw	ra,12(sp)
 ae0:	00912223          	sw	s1,4(sp)
 ae4:	00050413          	mv	s0,a0
 ae8:	00a00913          	li	s2,10
 aec:	00044483          	lbu	s1,0(s0)
 af0:	00140413          	addi	s0,s0,1
 af4:	00049e63          	bnez	s1,b10 <neorv32_uart0_print+0x40>
 af8:	00c12083          	lw	ra,12(sp)
 afc:	00812403          	lw	s0,8(sp)
 b00:	00412483          	lw	s1,4(sp)
 b04:	00012903          	lw	s2,0(sp)
 b08:	01010113          	addi	sp,sp,16
 b0c:	00008067          	ret
 b10:	01249663          	bne	s1,s2,b1c <neorv32_uart0_print+0x4c>
 b14:	00d00513          	li	a0,13
 b18:	fa1ff0ef          	jal	ra,ab8 <neorv32_uart0_putc>
 b1c:	00048513          	mv	a0,s1
 b20:	f99ff0ef          	jal	ra,ab8 <neorv32_uart0_putc>
 b24:	fc9ff06f          	j	aec <neorv32_uart0_print+0x1c>

00000b28 <neorv32_uart0_printf>:
 b28:	fa010113          	addi	sp,sp,-96
 b2c:	04f12a23          	sw	a5,84(sp)
 b30:	04410793          	addi	a5,sp,68
 b34:	02812c23          	sw	s0,56(sp)
 b38:	03212823          	sw	s2,48(sp)
 b3c:	03312623          	sw	s3,44(sp)
 b40:	03412423          	sw	s4,40(sp)
 b44:	03512223          	sw	s5,36(sp)
 b48:	03612023          	sw	s6,32(sp)
 b4c:	01712e23          	sw	s7,28(sp)
 b50:	01812c23          	sw	s8,24(sp)
 b54:	02112e23          	sw	ra,60(sp)
 b58:	02912a23          	sw	s1,52(sp)
 b5c:	00050413          	mv	s0,a0
 b60:	04b12223          	sw	a1,68(sp)
 b64:	04c12423          	sw	a2,72(sp)
 b68:	04d12623          	sw	a3,76(sp)
 b6c:	04e12823          	sw	a4,80(sp)
 b70:	05012c23          	sw	a6,88(sp)
 b74:	05112e23          	sw	a7,92(sp)
 b78:	00f12023          	sw	a5,0(sp)
 b7c:	02500993          	li	s3,37
 b80:	00a00a13          	li	s4,10
 b84:	07300913          	li	s2,115
 b88:	07500a93          	li	s5,117
 b8c:	07800b13          	li	s6,120
 b90:	06300b93          	li	s7,99
 b94:	06900c13          	li	s8,105
 b98:	00044483          	lbu	s1,0(s0)
 b9c:	02049a63          	bnez	s1,bd0 <neorv32_uart0_printf+0xa8>
 ba0:	03c12083          	lw	ra,60(sp)
 ba4:	03812403          	lw	s0,56(sp)
 ba8:	03412483          	lw	s1,52(sp)
 bac:	03012903          	lw	s2,48(sp)
 bb0:	02c12983          	lw	s3,44(sp)
 bb4:	02812a03          	lw	s4,40(sp)
 bb8:	02412a83          	lw	s5,36(sp)
 bbc:	02012b03          	lw	s6,32(sp)
 bc0:	01c12b83          	lw	s7,28(sp)
 bc4:	01812c03          	lw	s8,24(sp)
 bc8:	06010113          	addi	sp,sp,96
 bcc:	00008067          	ret
 bd0:	0d349663          	bne	s1,s3,c9c <neorv32_uart0_printf+0x174>
 bd4:	00144483          	lbu	s1,1(s0)
 bd8:	05248263          	beq	s1,s2,c1c <neorv32_uart0_printf+0xf4>
 bdc:	00996e63          	bltu	s2,s1,bf8 <neorv32_uart0_printf+0xd0>
 be0:	05748c63          	beq	s1,s7,c38 <neorv32_uart0_printf+0x110>
 be4:	07848663          	beq	s1,s8,c50 <neorv32_uart0_printf+0x128>
 be8:	02500513          	li	a0,37
 bec:	ecdff0ef          	jal	ra,ab8 <neorv32_uart0_putc>
 bf0:	00048513          	mv	a0,s1
 bf4:	0540006f          	j	c48 <neorv32_uart0_printf+0x120>
 bf8:	09548663          	beq	s1,s5,c84 <neorv32_uart0_printf+0x15c>
 bfc:	ff6496e3          	bne	s1,s6,be8 <neorv32_uart0_printf+0xc0>
 c00:	00012783          	lw	a5,0(sp)
 c04:	00410593          	addi	a1,sp,4
 c08:	0007a503          	lw	a0,0(a5)
 c0c:	00478713          	addi	a4,a5,4
 c10:	00e12023          	sw	a4,0(sp)
 c14:	dadff0ef          	jal	ra,9c0 <__neorv32_uart_tohex>
 c18:	0640006f          	j	c7c <neorv32_uart0_printf+0x154>
 c1c:	00012783          	lw	a5,0(sp)
 c20:	0007a503          	lw	a0,0(a5)
 c24:	00478713          	addi	a4,a5,4
 c28:	00e12023          	sw	a4,0(sp)
 c2c:	ea5ff0ef          	jal	ra,ad0 <neorv32_uart0_print>
 c30:	00240413          	addi	s0,s0,2
 c34:	f65ff06f          	j	b98 <neorv32_uart0_printf+0x70>
 c38:	00012783          	lw	a5,0(sp)
 c3c:	0007c503          	lbu	a0,0(a5)
 c40:	00478713          	addi	a4,a5,4
 c44:	00e12023          	sw	a4,0(sp)
 c48:	e71ff0ef          	jal	ra,ab8 <neorv32_uart0_putc>
 c4c:	fe5ff06f          	j	c30 <neorv32_uart0_printf+0x108>
 c50:	00012783          	lw	a5,0(sp)
 c54:	0007a483          	lw	s1,0(a5)
 c58:	00478713          	addi	a4,a5,4
 c5c:	00e12023          	sw	a4,0(sp)
 c60:	0004d863          	bgez	s1,c70 <neorv32_uart0_printf+0x148>
 c64:	02d00513          	li	a0,45
 c68:	409004b3          	neg	s1,s1
 c6c:	e4dff0ef          	jal	ra,ab8 <neorv32_uart0_putc>
 c70:	00410593          	addi	a1,sp,4
 c74:	00048513          	mv	a0,s1
 c78:	c41ff0ef          	jal	ra,8b8 <__neorv32_uart_itoa>
 c7c:	00410513          	addi	a0,sp,4
 c80:	fadff06f          	j	c2c <neorv32_uart0_printf+0x104>
 c84:	00012783          	lw	a5,0(sp)
 c88:	00410593          	addi	a1,sp,4
 c8c:	00478713          	addi	a4,a5,4
 c90:	0007a503          	lw	a0,0(a5)
 c94:	00e12023          	sw	a4,0(sp)
 c98:	fe1ff06f          	j	c78 <neorv32_uart0_printf+0x150>
 c9c:	01449663          	bne	s1,s4,ca8 <neorv32_uart0_printf+0x180>
 ca0:	00d00513          	li	a0,13
 ca4:	e15ff0ef          	jal	ra,ab8 <neorv32_uart0_putc>
 ca8:	00048513          	mv	a0,s1
 cac:	00140413          	addi	s0,s0,1
 cb0:	e09ff0ef          	jal	ra,ab8 <neorv32_uart0_putc>
 cb4:	ee5ff06f          	j	b98 <neorv32_uart0_printf+0x70>

00000cb8 <__divsi3>:
 cb8:	06054063          	bltz	a0,d18 <__umodsi3+0x10>
 cbc:	0605c663          	bltz	a1,d28 <__umodsi3+0x20>

00000cc0 <__hidden___udivsi3>:
 cc0:	00058613          	mv	a2,a1
 cc4:	00050593          	mv	a1,a0
 cc8:	fff00513          	li	a0,-1
 ccc:	02060c63          	beqz	a2,d04 <__hidden___udivsi3+0x44>
 cd0:	00100693          	li	a3,1
 cd4:	00b67a63          	bgeu	a2,a1,ce8 <__hidden___udivsi3+0x28>
 cd8:	00c05863          	blez	a2,ce8 <__hidden___udivsi3+0x28>
 cdc:	00161613          	slli	a2,a2,0x1
 ce0:	00169693          	slli	a3,a3,0x1
 ce4:	feb66ae3          	bltu	a2,a1,cd8 <__hidden___udivsi3+0x18>
 ce8:	00000513          	li	a0,0
 cec:	00c5e663          	bltu	a1,a2,cf8 <__hidden___udivsi3+0x38>
 cf0:	40c585b3          	sub	a1,a1,a2
 cf4:	00d56533          	or	a0,a0,a3
 cf8:	0016d693          	srli	a3,a3,0x1
 cfc:	00165613          	srli	a2,a2,0x1
 d00:	fe0696e3          	bnez	a3,cec <__hidden___udivsi3+0x2c>
 d04:	00008067          	ret

00000d08 <__umodsi3>:
 d08:	00008293          	mv	t0,ra
 d0c:	fb5ff0ef          	jal	ra,cc0 <__hidden___udivsi3>
 d10:	00058513          	mv	a0,a1
 d14:	00028067          	jr	t0
 d18:	40a00533          	neg	a0,a0
 d1c:	00b04863          	bgtz	a1,d2c <__umodsi3+0x24>
 d20:	40b005b3          	neg	a1,a1
 d24:	f9dff06f          	j	cc0 <__hidden___udivsi3>
 d28:	40b005b3          	neg	a1,a1
 d2c:	00008293          	mv	t0,ra
 d30:	f91ff0ef          	jal	ra,cc0 <__hidden___udivsi3>
 d34:	40a00533          	neg	a0,a0
 d38:	00028067          	jr	t0

00000d3c <__modsi3>:
 d3c:	00008293          	mv	t0,ra
 d40:	0005ca63          	bltz	a1,d54 <__modsi3+0x18>
 d44:	00054c63          	bltz	a0,d5c <__modsi3+0x20>
 d48:	f79ff0ef          	jal	ra,cc0 <__hidden___udivsi3>
 d4c:	00058513          	mv	a0,a1
 d50:	00028067          	jr	t0
 d54:	40b005b3          	neg	a1,a1
 d58:	fe0558e3          	bgez	a0,d48 <__modsi3+0xc>
 d5c:	40a00533          	neg	a0,a0
 d60:	f61ff0ef          	jal	ra,cc0 <__hidden___udivsi3>
 d64:	40b00533          	neg	a0,a1
 d68:	00028067          	jr	t0

00000d6c <memset>:
 d6c:	00f00313          	li	t1,15
 d70:	00050713          	mv	a4,a0
 d74:	02c37e63          	bgeu	t1,a2,db0 <memset+0x44>
 d78:	00f77793          	andi	a5,a4,15
 d7c:	0a079063          	bnez	a5,e1c <memset+0xb0>
 d80:	08059263          	bnez	a1,e04 <memset+0x98>
 d84:	ff067693          	andi	a3,a2,-16
 d88:	00f67613          	andi	a2,a2,15
 d8c:	00e686b3          	add	a3,a3,a4
 d90:	00b72023          	sw	a1,0(a4) # 40000 <__crt0_copy_data_src_begin+0x3eea0>
 d94:	00b72223          	sw	a1,4(a4)
 d98:	00b72423          	sw	a1,8(a4)
 d9c:	00b72623          	sw	a1,12(a4)
 da0:	01070713          	addi	a4,a4,16
 da4:	fed766e3          	bltu	a4,a3,d90 <memset+0x24>
 da8:	00061463          	bnez	a2,db0 <memset+0x44>
 dac:	00008067          	ret
 db0:	40c306b3          	sub	a3,t1,a2
 db4:	00269693          	slli	a3,a3,0x2
 db8:	00000297          	auipc	t0,0x0
 dbc:	005686b3          	add	a3,a3,t0
 dc0:	00c68067          	jr	12(a3)
 dc4:	00b70723          	sb	a1,14(a4)
 dc8:	00b706a3          	sb	a1,13(a4)
 dcc:	00b70623          	sb	a1,12(a4)
 dd0:	00b705a3          	sb	a1,11(a4)
 dd4:	00b70523          	sb	a1,10(a4)
 dd8:	00b704a3          	sb	a1,9(a4)
 ddc:	00b70423          	sb	a1,8(a4)
 de0:	00b703a3          	sb	a1,7(a4)
 de4:	00b70323          	sb	a1,6(a4)
 de8:	00b702a3          	sb	a1,5(a4)
 dec:	00b70223          	sb	a1,4(a4)
 df0:	00b701a3          	sb	a1,3(a4)
 df4:	00b70123          	sb	a1,2(a4)
 df8:	00b700a3          	sb	a1,1(a4)
 dfc:	00b70023          	sb	a1,0(a4)
 e00:	00008067          	ret
 e04:	0ff5f593          	zext.b	a1,a1
 e08:	00859693          	slli	a3,a1,0x8
 e0c:	00d5e5b3          	or	a1,a1,a3
 e10:	01059693          	slli	a3,a1,0x10
 e14:	00d5e5b3          	or	a1,a1,a3
 e18:	f6dff06f          	j	d84 <memset+0x18>
 e1c:	00279693          	slli	a3,a5,0x2
 e20:	00000297          	auipc	t0,0x0
 e24:	005686b3          	add	a3,a3,t0
 e28:	00008293          	mv	t0,ra
 e2c:	fa0680e7          	jalr	-96(a3)
 e30:	00028093          	mv	ra,t0
 e34:	ff078793          	addi	a5,a5,-16
 e38:	40f70733          	sub	a4,a4,a5
 e3c:	00f60633          	add	a2,a2,a5
 e40:	f6c378e3          	bgeu	t1,a2,db0 <memset+0x44>
 e44:	f3dff06f          	j	d80 <memset+0x14>
