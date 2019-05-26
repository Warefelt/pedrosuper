   1              		.arch armv6-m
   2              		.eabi_attribute 20, 1
   3              		.eabi_attribute 21, 1
   4              		.eabi_attribute 23, 3
   5              		.eabi_attribute 24, 1
   6              		.eabi_attribute 25, 1
   7              		.eabi_attribute 26, 1
   8              		.eabi_attribute 30, 6
   9              		.eabi_attribute 34, 0
  10              		.eabi_attribute 18, 4
  11              		.file	"keyFuncs.c"
  12              		.text
  13              	.Ltext0:
  14              		.cfi_sections	.debug_frame
  15              		.align	1
  16              		.global	kbdActivate
  17              		.syntax unified
  18              		.code	16
  19              		.thumb_func
  20              		.fpu softvfp
  22              	kbdActivate:
  23              	.LFB0:
  24              		.file 1 "Z:/MOP/c-code/mop/SuperPedro/keyFuncs.c"
   1:Z:/MOP/c-code/mop/SuperPedro\keyFuncs.c **** #include "keyfuncs.h"
   2:Z:/MOP/c-code/mop/SuperPedro\keyFuncs.c **** #include "gpio.h"
   3:Z:/MOP/c-code/mop/SuperPedro\keyFuncs.c **** 
   4:Z:/MOP/c-code/mop/SuperPedro\keyFuncs.c **** void kbdActivate(unsigned int row){
  25              		.loc 1 4 0
  26              		.cfi_startproc
  27              		@ args = 0, pretend = 0, frame = 8
  28              		@ frame_needed = 1, uses_anonymous_args = 0
  29 0000 80B5     		push	{r7, lr}
  30              		.cfi_def_cfa_offset 8
  31              		.cfi_offset 7, -8
  32              		.cfi_offset 14, -4
  33 0002 82B0     		sub	sp, sp, #8
  34              		.cfi_def_cfa_offset 16
  35 0004 00AF     		add	r7, sp, #0
  36              		.cfi_def_cfa_register 7
  37 0006 7860     		str	r0, [r7, #4]
   5:Z:/MOP/c-code/mop/SuperPedro\keyFuncs.c ****     switch(row){
  38              		.loc 1 5 0
  39 0008 7B68     		ldr	r3, [r7, #4]
  40 000a 022B     		cmp	r3, #2
  41 000c 0CD0     		beq	.L3
  42 000e 02D8     		bhi	.L4
  43 0010 012B     		cmp	r3, #1
  44 0012 05D0     		beq	.L5
  45 0014 14E0     		b	.L2
  46              	.L4:
  47 0016 032B     		cmp	r3, #3
  48 0018 0AD0     		beq	.L6
  49 001a 042B     		cmp	r3, #4
  50 001c 0CD0     		beq	.L7
  51 001e 0FE0     		b	.L2
  52              	.L5:
   6:Z:/MOP/c-code/mop/SuperPedro\keyFuncs.c ****         case 1: 
   7:Z:/MOP/c-code/mop/SuperPedro\keyFuncs.c ****             GPIO_D->odrHigh = 0x10;
  53              		.loc 1 7 0
  54 0020 0B4B     		ldr	r3, .L9
  55 0022 1022     		movs	r2, #16
  56 0024 5A75     		strb	r2, [r3, #21]
   8:Z:/MOP/c-code/mop/SuperPedro\keyFuncs.c ****             break;
  57              		.loc 1 8 0
  58 0026 0EE0     		b	.L8
  59              	.L3:
   9:Z:/MOP/c-code/mop/SuperPedro\keyFuncs.c ****         case 2: 
  10:Z:/MOP/c-code/mop/SuperPedro\keyFuncs.c ****             GPIO_D->odrHigh = 0x20;
  60              		.loc 1 10 0
  61 0028 094B     		ldr	r3, .L9
  62 002a 2022     		movs	r2, #32
  63 002c 5A75     		strb	r2, [r3, #21]
  11:Z:/MOP/c-code/mop/SuperPedro\keyFuncs.c ****             break;
  64              		.loc 1 11 0
  65 002e 0AE0     		b	.L8
  66              	.L6:
  12:Z:/MOP/c-code/mop/SuperPedro\keyFuncs.c ****         case 3: 
  13:Z:/MOP/c-code/mop/SuperPedro\keyFuncs.c ****             GPIO_D->odrHigh = 0x40;
  67              		.loc 1 13 0
  68 0030 074B     		ldr	r3, .L9
  69 0032 4022     		movs	r2, #64
  70 0034 5A75     		strb	r2, [r3, #21]
  14:Z:/MOP/c-code/mop/SuperPedro\keyFuncs.c ****             break;
  71              		.loc 1 14 0
  72 0036 06E0     		b	.L8
  73              	.L7:
  15:Z:/MOP/c-code/mop/SuperPedro\keyFuncs.c ****         case 4: 
  16:Z:/MOP/c-code/mop/SuperPedro\keyFuncs.c ****             GPIO_D->odrHigh = 0x80;
  74              		.loc 1 16 0
  75 0038 054B     		ldr	r3, .L9
  76 003a 8022     		movs	r2, #128
  77 003c 5A75     		strb	r2, [r3, #21]
  17:Z:/MOP/c-code/mop/SuperPedro\keyFuncs.c ****             break;
  78              		.loc 1 17 0
  79 003e 02E0     		b	.L8
  80              	.L2:
  18:Z:/MOP/c-code/mop/SuperPedro\keyFuncs.c ****         default: 
  19:Z:/MOP/c-code/mop/SuperPedro\keyFuncs.c ****             GPIO_D->odrHigh = 0;
  81              		.loc 1 19 0
  82 0040 034B     		ldr	r3, .L9
  83 0042 0022     		movs	r2, #0
  84 0044 5A75     		strb	r2, [r3, #21]
  85              	.L8:
  20:Z:/MOP/c-code/mop/SuperPedro\keyFuncs.c ****     }
  21:Z:/MOP/c-code/mop/SuperPedro\keyFuncs.c **** }
  86              		.loc 1 21 0
  87 0046 C046     		nop
  88 0048 BD46     		mov	sp, r7
  89 004a 02B0     		add	sp, sp, #8
  90              		@ sp needed
  91 004c 80BD     		pop	{r7, pc}
  92              	.L10:
  93 004e C046     		.align	2
  94              	.L9:
  95 0050 000C0240 		.word	1073875968
  96              		.cfi_endproc
  97              	.LFE0:
  99              		.align	1
 100              		.global	kbdGetCol
 101              		.syntax unified
 102              		.code	16
 103              		.thumb_func
 104              		.fpu softvfp
 106              	kbdGetCol:
 107              	.LFB1:
  22:Z:/MOP/c-code/mop/SuperPedro\keyFuncs.c **** 
  23:Z:/MOP/c-code/mop/SuperPedro\keyFuncs.c **** int kbdGetCol(){                    
 108              		.loc 1 23 0
 109              		.cfi_startproc
 110              		@ args = 0, pretend = 0, frame = 0
 111              		@ frame_needed = 1, uses_anonymous_args = 0
 112 0054 80B5     		push	{r7, lr}
 113              		.cfi_def_cfa_offset 8
 114              		.cfi_offset 7, -8
 115              		.cfi_offset 14, -4
 116 0056 00AF     		add	r7, sp, #0
 117              		.cfi_def_cfa_register 7
  24:Z:/MOP/c-code/mop/SuperPedro\keyFuncs.c ****     if(GPIO_D->idrHigh & 8) 
 118              		.loc 1 24 0
 119 0058 134B     		ldr	r3, .L17
 120 005a 5B7C     		ldrb	r3, [r3, #17]
 121 005c DBB2     		uxtb	r3, r3
 122 005e 1A00     		movs	r2, r3
 123 0060 0823     		movs	r3, #8
 124 0062 1340     		ands	r3, r2
 125 0064 01D0     		beq	.L12
  25:Z:/MOP/c-code/mop/SuperPedro\keyFuncs.c ****         return 4;
 126              		.loc 1 25 0
 127 0066 0423     		movs	r3, #4
 128 0068 1BE0     		b	.L13
 129              	.L12:
  26:Z:/MOP/c-code/mop/SuperPedro\keyFuncs.c ****     if(GPIO_D->idrHigh & 4) 
 130              		.loc 1 26 0
 131 006a 0F4B     		ldr	r3, .L17
 132 006c 5B7C     		ldrb	r3, [r3, #17]
 133 006e DBB2     		uxtb	r3, r3
 134 0070 1A00     		movs	r2, r3
 135 0072 0423     		movs	r3, #4
 136 0074 1340     		ands	r3, r2
 137 0076 01D0     		beq	.L14
  27:Z:/MOP/c-code/mop/SuperPedro\keyFuncs.c ****         return 3;
 138              		.loc 1 27 0
 139 0078 0323     		movs	r3, #3
 140 007a 12E0     		b	.L13
 141              	.L14:
  28:Z:/MOP/c-code/mop/SuperPedro\keyFuncs.c ****     if(GPIO_D->idrHigh & 2) 
 142              		.loc 1 28 0
 143 007c 0A4B     		ldr	r3, .L17
 144 007e 5B7C     		ldrb	r3, [r3, #17]
 145 0080 DBB2     		uxtb	r3, r3
 146 0082 1A00     		movs	r2, r3
 147 0084 0223     		movs	r3, #2
 148 0086 1340     		ands	r3, r2
 149 0088 01D0     		beq	.L15
  29:Z:/MOP/c-code/mop/SuperPedro\keyFuncs.c ****         return 2;
 150              		.loc 1 29 0
 151 008a 0223     		movs	r3, #2
 152 008c 09E0     		b	.L13
 153              	.L15:
  30:Z:/MOP/c-code/mop/SuperPedro\keyFuncs.c ****     if(GPIO_D->idrHigh & 1) 
 154              		.loc 1 30 0
 155 008e 064B     		ldr	r3, .L17
 156 0090 5B7C     		ldrb	r3, [r3, #17]
 157 0092 DBB2     		uxtb	r3, r3
 158 0094 1A00     		movs	r2, r3
 159 0096 0123     		movs	r3, #1
 160 0098 1340     		ands	r3, r2
 161 009a 01D0     		beq	.L16
  31:Z:/MOP/c-code/mop/SuperPedro\keyFuncs.c ****         return 1;
 162              		.loc 1 31 0
 163 009c 0123     		movs	r3, #1
 164 009e 00E0     		b	.L13
 165              	.L16:
  32:Z:/MOP/c-code/mop/SuperPedro\keyFuncs.c ****     return 0;
 166              		.loc 1 32 0
 167 00a0 0023     		movs	r3, #0
 168              	.L13:
  33:Z:/MOP/c-code/mop/SuperPedro\keyFuncs.c **** }
 169              		.loc 1 33 0
 170 00a2 1800     		movs	r0, r3
 171 00a4 BD46     		mov	sp, r7
 172              		@ sp needed
 173 00a6 80BD     		pop	{r7, pc}
 174              	.L18:
 175              		.align	2
 176              	.L17:
 177 00a8 000C0240 		.word	1073875968
 178              		.cfi_endproc
 179              	.LFE1:
 181              		.align	1
 182              		.global	isUpKey
 183              		.syntax unified
 184              		.code	16
 185              		.thumb_func
 186              		.fpu softvfp
 188              	isUpKey:
 189              	.LFB2:
  34:Z:/MOP/c-code/mop/SuperPedro\keyFuncs.c **** 
  35:Z:/MOP/c-code/mop/SuperPedro\keyFuncs.c **** 
  36:Z:/MOP/c-code/mop/SuperPedro\keyFuncs.c **** char isUpKey(){
 190              		.loc 1 36 0
 191              		.cfi_startproc
 192              		@ args = 0, pretend = 0, frame = 0
 193              		@ frame_needed = 1, uses_anonymous_args = 0
 194 00ac 80B5     		push	{r7, lr}
 195              		.cfi_def_cfa_offset 8
 196              		.cfi_offset 7, -8
 197              		.cfi_offset 14, -4
 198 00ae 00AF     		add	r7, sp, #0
 199              		.cfi_def_cfa_register 7
  37:Z:/MOP/c-code/mop/SuperPedro\keyFuncs.c **** 	kbdActivate(3);	//row3
 200              		.loc 1 37 0
 201 00b0 0320     		movs	r0, #3
 202 00b2 FFF7FEFF 		bl	kbdActivate
  38:Z:/MOP/c-code/mop/SuperPedro\keyFuncs.c **** 	kbdActivate(4);         //power off kbd-rows
 203              		.loc 1 38 0
 204 00b6 0420     		movs	r0, #4
 205 00b8 FFF7FEFF 		bl	kbdActivate
  39:Z:/MOP/c-code/mop/SuperPedro\keyFuncs.c **** 	if(kbdGetCol() == 3){
 206              		.loc 1 39 0
 207 00bc FFF7FEFF 		bl	kbdGetCol
 208 00c0 0300     		movs	r3, r0
 209 00c2 032B     		cmp	r3, #3
 210 00c4 04D1     		bne	.L20
  40:Z:/MOP/c-code/mop/SuperPedro\keyFuncs.c **** 		kbdActivate(0);         //power off kbd-rows
 211              		.loc 1 40 0
 212 00c6 0020     		movs	r0, #0
 213 00c8 FFF7FEFF 		bl	kbdActivate
  41:Z:/MOP/c-code/mop/SuperPedro\keyFuncs.c **** 		return 1;
 214              		.loc 1 41 0
 215 00cc 0123     		movs	r3, #1
 216 00ce 00E0     		b	.L21
 217              	.L20:
  42:Z:/MOP/c-code/mop/SuperPedro\keyFuncs.c **** 	}
  43:Z:/MOP/c-code/mop/SuperPedro\keyFuncs.c **** 	return 0;
 218              		.loc 1 43 0
 219 00d0 0023     		movs	r3, #0
 220              	.L21:
  44:Z:/MOP/c-code/mop/SuperPedro\keyFuncs.c **** }
 221              		.loc 1 44 0
 222 00d2 1800     		movs	r0, r3
 223 00d4 BD46     		mov	sp, r7
 224              		@ sp needed
 225 00d6 80BD     		pop	{r7, pc}
 226              		.cfi_endproc
 227              	.LFE2:
 229              		.align	1
 230              		.global	isRightKey
 231              		.syntax unified
 232              		.code	16
 233              		.thumb_func
 234              		.fpu softvfp
 236              	isRightKey:
 237              	.LFB3:
  45:Z:/MOP/c-code/mop/SuperPedro\keyFuncs.c **** char isRightKey(){
 238              		.loc 1 45 0
 239              		.cfi_startproc
 240              		@ args = 0, pretend = 0, frame = 0
 241              		@ frame_needed = 1, uses_anonymous_args = 0
 242 00d8 80B5     		push	{r7, lr}
 243              		.cfi_def_cfa_offset 8
 244              		.cfi_offset 7, -8
 245              		.cfi_offset 14, -4
 246 00da 00AF     		add	r7, sp, #0
 247              		.cfi_def_cfa_register 7
  46:Z:/MOP/c-code/mop/SuperPedro\keyFuncs.c **** 	kbdActivate(4);
 248              		.loc 1 46 0
 249 00dc 0420     		movs	r0, #4
 250 00de FFF7FEFF 		bl	kbdActivate
  47:Z:/MOP/c-code/mop/SuperPedro\keyFuncs.c **** 	if(kbdGetCol() == 4){
 251              		.loc 1 47 0
 252 00e2 FFF7FEFF 		bl	kbdGetCol
 253 00e6 0300     		movs	r3, r0
 254 00e8 042B     		cmp	r3, #4
 255 00ea 04D1     		bne	.L23
  48:Z:/MOP/c-code/mop/SuperPedro\keyFuncs.c **** 		kbdActivate(0);         //power off kbd-rows
 256              		.loc 1 48 0
 257 00ec 0020     		movs	r0, #0
 258 00ee FFF7FEFF 		bl	kbdActivate
  49:Z:/MOP/c-code/mop/SuperPedro\keyFuncs.c **** 		return 1;
 259              		.loc 1 49 0
 260 00f2 0123     		movs	r3, #1
 261 00f4 00E0     		b	.L24
 262              	.L23:
  50:Z:/MOP/c-code/mop/SuperPedro\keyFuncs.c **** 	}
  51:Z:/MOP/c-code/mop/SuperPedro\keyFuncs.c **** return 0;
 263              		.loc 1 51 0
 264 00f6 0023     		movs	r3, #0
 265              	.L24:
  52:Z:/MOP/c-code/mop/SuperPedro\keyFuncs.c **** 	
  53:Z:/MOP/c-code/mop/SuperPedro\keyFuncs.c **** }
 266              		.loc 1 53 0
 267 00f8 1800     		movs	r0, r3
 268 00fa BD46     		mov	sp, r7
 269              		@ sp needed
 270 00fc 80BD     		pop	{r7, pc}
 271              		.cfi_endproc
 272              	.LFE3:
 274              		.align	1
 275              		.global	isLeftKey
 276              		.syntax unified
 277              		.code	16
 278              		.thumb_func
 279              		.fpu softvfp
 281              	isLeftKey:
 282              	.LFB4:
  54:Z:/MOP/c-code/mop/SuperPedro\keyFuncs.c **** char isLeftKey(){
 283              		.loc 1 54 0
 284              		.cfi_startproc
 285              		@ args = 0, pretend = 0, frame = 0
 286              		@ frame_needed = 1, uses_anonymous_args = 0
 287 00fe 80B5     		push	{r7, lr}
 288              		.cfi_def_cfa_offset 8
 289              		.cfi_offset 7, -8
 290              		.cfi_offset 14, -4
 291 0100 00AF     		add	r7, sp, #0
 292              		.cfi_def_cfa_register 7
  55:Z:/MOP/c-code/mop/SuperPedro\keyFuncs.c **** 	kbdActivate(4);
 293              		.loc 1 55 0
 294 0102 0420     		movs	r0, #4
 295 0104 FFF7FEFF 		bl	kbdActivate
  56:Z:/MOP/c-code/mop/SuperPedro\keyFuncs.c **** 	if(kbdGetCol() == 2){
 296              		.loc 1 56 0
 297 0108 FFF7FEFF 		bl	kbdGetCol
 298 010c 0300     		movs	r3, r0
 299 010e 022B     		cmp	r3, #2
 300 0110 04D1     		bne	.L26
  57:Z:/MOP/c-code/mop/SuperPedro\keyFuncs.c **** 		kbdActivate(0);         //power off kbd-rows
 301              		.loc 1 57 0
 302 0112 0020     		movs	r0, #0
 303 0114 FFF7FEFF 		bl	kbdActivate
  58:Z:/MOP/c-code/mop/SuperPedro\keyFuncs.c **** 		return 1;
 304              		.loc 1 58 0
 305 0118 0123     		movs	r3, #1
 306 011a 00E0     		b	.L27
 307              	.L26:
  59:Z:/MOP/c-code/mop/SuperPedro\keyFuncs.c **** 	}
  60:Z:/MOP/c-code/mop/SuperPedro\keyFuncs.c **** 	return 0;
 308              		.loc 1 60 0
 309 011c 0023     		movs	r3, #0
 310              	.L27:
  61:Z:/MOP/c-code/mop/SuperPedro\keyFuncs.c **** 	
  62:Z:/MOP/c-code/mop/SuperPedro\keyFuncs.c **** }
 311              		.loc 1 62 0
 312 011e 1800     		movs	r0, r3
 313 0120 BD46     		mov	sp, r7
 314              		@ sp needed
 315 0122 80BD     		pop	{r7, pc}
 316              		.cfi_endproc
 317              	.LFE4:
 319              	.Letext0:
 320              		.file 2 "Z:/MOP/c-code/mop/SuperPedro/gpio.h"
