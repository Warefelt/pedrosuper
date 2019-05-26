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
  11              		.file	"LcdAscii.c"
  12              		.text
  13              	.Ltext0:
  14              		.cfi_sections	.debug_frame
  15              		.comm	backBuffer,2048,4
  16              		.align	1
  17              		.syntax unified
  18              		.code	16
  19              		.thumb_func
  20              		.fpu softvfp
  22              	graphic_ctrl_bit_set:
  23              	.LFB0:
  24              		.file 1 "Z:/MOP/c-code/mop/SuperPedro/LcdAscii.c"
   1:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c **** #include "LcdAscii.h"
   2:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c **** #include "gpio.h"
   3:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c **** 
   4:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c **** 
   5:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c **** 
   6:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c **** 
   7:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c **** uint8_t backBuffer[256][8]; // 256 * 64 / 8
   8:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c **** 
   9:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c **** 
  10:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c **** void graphic_ctrl_bit_set(unsigned char x){
  25              		.loc 1 10 0
  26              		.cfi_startproc
  27              		@ args = 0, pretend = 0, frame = 16
  28              		@ frame_needed = 1, uses_anonymous_args = 0
  29 0000 80B5     		push	{r7, lr}
  30              		.cfi_def_cfa_offset 8
  31              		.cfi_offset 7, -8
  32              		.cfi_offset 14, -4
  33 0002 84B0     		sub	sp, sp, #16
  34              		.cfi_def_cfa_offset 24
  35 0004 00AF     		add	r7, sp, #0
  36              		.cfi_def_cfa_register 7
  37 0006 0200     		movs	r2, r0
  38 0008 FB1D     		adds	r3, r7, #7
  39 000a 1A70     		strb	r2, [r3]
  11:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****     char c;
  12:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****     c = GPIO_E->odrLow;
  40              		.loc 1 12 0
  41 000c 0C4A     		ldr	r2, .L2
  42 000e 0F20     		movs	r0, #15
  43 0010 3B18     		adds	r3, r7, r0
  44 0012 127D     		ldrb	r2, [r2, #20]
  45 0014 1A70     		strb	r2, [r3]
  13:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****     c |= x;
  46              		.loc 1 13 0
  47 0016 3B18     		adds	r3, r7, r0
  48 0018 3918     		adds	r1, r7, r0
  49 001a FA1D     		adds	r2, r7, #7
  50 001c 0978     		ldrb	r1, [r1]
  51 001e 1278     		ldrb	r2, [r2]
  52 0020 0A43     		orrs	r2, r1
  53 0022 1A70     		strb	r2, [r3]
  14:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c **** 	c &= ~B_SELECT;
  54              		.loc 1 14 0
  55 0024 3B18     		adds	r3, r7, r0
  56 0026 3A18     		adds	r2, r7, r0
  57 0028 1278     		ldrb	r2, [r2]
  58 002a 0421     		movs	r1, #4
  59 002c 8A43     		bics	r2, r1
  60 002e 1A70     		strb	r2, [r3]
  15:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****     GPIO_E->odrLow = c;
  61              		.loc 1 15 0
  62 0030 034A     		ldr	r2, .L2
  63 0032 3B18     		adds	r3, r7, r0
  64 0034 1B78     		ldrb	r3, [r3]
  65 0036 1375     		strb	r3, [r2, #20]
  16:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c **** }
  66              		.loc 1 16 0
  67 0038 C046     		nop
  68 003a BD46     		mov	sp, r7
  69 003c 04B0     		add	sp, sp, #16
  70              		@ sp needed
  71 003e 80BD     		pop	{r7, pc}
  72              	.L3:
  73              		.align	2
  74              	.L2:
  75 0040 00100240 		.word	1073876992
  76              		.cfi_endproc
  77              	.LFE0:
  79              		.align	1
  80              		.syntax unified
  81              		.code	16
  82              		.thumb_func
  83              		.fpu softvfp
  85              	graphic_ctrl_bit_clear:
  86              	.LFB1:
  17:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c **** 
  18:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c **** void graphic_ctrl_bit_clear(unsigned char x){
  87              		.loc 1 18 0
  88              		.cfi_startproc
  89              		@ args = 0, pretend = 0, frame = 16
  90              		@ frame_needed = 1, uses_anonymous_args = 0
  91 0044 80B5     		push	{r7, lr}
  92              		.cfi_def_cfa_offset 8
  93              		.cfi_offset 7, -8
  94              		.cfi_offset 14, -4
  95 0046 84B0     		sub	sp, sp, #16
  96              		.cfi_def_cfa_offset 24
  97 0048 00AF     		add	r7, sp, #0
  98              		.cfi_def_cfa_register 7
  99 004a 0200     		movs	r2, r0
 100 004c FB1D     		adds	r3, r7, #7
 101 004e 1A70     		strb	r2, [r3]
  19:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****     char c;
  20:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****     c = GPIO_E->odrLow;
 102              		.loc 1 20 0
 103 0050 0F4A     		ldr	r2, .L5
 104 0052 0F21     		movs	r1, #15
 105 0054 7B18     		adds	r3, r7, r1
 106 0056 127D     		ldrb	r2, [r2, #20]
 107 0058 1A70     		strb	r2, [r3]
  21:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****     c &= ~x;
 108              		.loc 1 21 0
 109 005a FB1D     		adds	r3, r7, #7
 110 005c 1B78     		ldrb	r3, [r3]
 111 005e 5BB2     		sxtb	r3, r3
 112 0060 DB43     		mvns	r3, r3
 113 0062 5BB2     		sxtb	r3, r3
 114 0064 7A18     		adds	r2, r7, r1
 115 0066 1278     		ldrb	r2, [r2]
 116 0068 52B2     		sxtb	r2, r2
 117 006a 1340     		ands	r3, r2
 118 006c 5AB2     		sxtb	r2, r3
 119 006e 7B18     		adds	r3, r7, r1
 120 0070 1A70     		strb	r2, [r3]
  22:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c **** 	c &= ~B_SELECT;
 121              		.loc 1 22 0
 122 0072 7B18     		adds	r3, r7, r1
 123 0074 0800     		movs	r0, r1
 124 0076 7A18     		adds	r2, r7, r1
 125 0078 1278     		ldrb	r2, [r2]
 126 007a 0421     		movs	r1, #4
 127 007c 8A43     		bics	r2, r1
 128 007e 1A70     		strb	r2, [r3]
  23:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****     GPIO_E->odrLow = c;
 129              		.loc 1 23 0
 130 0080 034A     		ldr	r2, .L5
 131 0082 3B18     		adds	r3, r7, r0
 132 0084 1B78     		ldrb	r3, [r3]
 133 0086 1375     		strb	r3, [r2, #20]
  24:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c **** }
 134              		.loc 1 24 0
 135 0088 C046     		nop
 136 008a BD46     		mov	sp, r7
 137 008c 04B0     		add	sp, sp, #16
 138              		@ sp needed
 139 008e 80BD     		pop	{r7, pc}
 140              	.L6:
 141              		.align	2
 142              	.L5:
 143 0090 00100240 		.word	1073876992
 144              		.cfi_endproc
 145              	.LFE1:
 147              		.align	1
 148              		.syntax unified
 149              		.code	16
 150              		.thumb_func
 151              		.fpu softvfp
 153              	select_controller:
 154              	.LFB2:
  25:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c **** 
  26:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c **** static void select_controller(uint8_t controller){  //@param controller - 0/B_CS1/B_CS2/both
 155              		.loc 1 26 0
 156              		.cfi_startproc
 157              		@ args = 0, pretend = 0, frame = 8
 158              		@ frame_needed = 1, uses_anonymous_args = 0
 159 0094 80B5     		push	{r7, lr}
 160              		.cfi_def_cfa_offset 8
 161              		.cfi_offset 7, -8
 162              		.cfi_offset 14, -4
 163 0096 82B0     		sub	sp, sp, #8
 164              		.cfi_def_cfa_offset 16
 165 0098 00AF     		add	r7, sp, #0
 166              		.cfi_def_cfa_register 7
 167 009a 0200     		movs	r2, r0
 168 009c FB1D     		adds	r3, r7, #7
 169 009e 1A70     		strb	r2, [r3]
  27:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****     switch(controller){
 170              		.loc 1 27 0
 171 00a0 FB1D     		adds	r3, r7, #7
 172 00a2 1B78     		ldrb	r3, [r3]
 173 00a4 082B     		cmp	r3, #8
 174 00a6 0CD0     		beq	.L9
 175 00a8 02DC     		bgt	.L10
 176 00aa 002B     		cmp	r3, #0
 177 00ac 05D0     		beq	.L11
  28:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****         case 0:             //none
  29:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****             graphic_ctrl_bit_clear(B_CS1|B_CS2);
  30:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****             break;
  31:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****         case B_CS1 :        //CS1
  32:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****             graphic_ctrl_bit_set(B_CS1);
  33:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****             graphic_ctrl_bit_clear(B_CS2);
  34:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****             break;
  35:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****         case B_CS2 :        //CS2
  36:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****             graphic_ctrl_bit_set(B_CS2);
  37:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****             graphic_ctrl_bit_clear(B_CS1);
  38:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****             break;
  39:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****         case B_CS1|B_CS2 :  //both
  40:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****             graphic_ctrl_bit_set(B_CS1|B_CS2);
  41:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****             break;
  42:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****     }
  43:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c **** }
 178              		.loc 1 43 0
 179 00ae 1AE0     		b	.L14
 180              	.L10:
  27:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****     switch(controller){
 181              		.loc 1 27 0
 182 00b0 102B     		cmp	r3, #16
 183 00b2 0DD0     		beq	.L12
 184 00b4 182B     		cmp	r3, #24
 185 00b6 12D0     		beq	.L13
 186              		.loc 1 43 0
 187 00b8 15E0     		b	.L14
 188              	.L11:
  29:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****             break;
 189              		.loc 1 29 0
 190 00ba 1820     		movs	r0, #24
 191 00bc FFF7C2FF 		bl	graphic_ctrl_bit_clear
  30:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****         case B_CS1 :        //CS1
 192              		.loc 1 30 0
 193 00c0 11E0     		b	.L8
 194              	.L9:
  32:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****             graphic_ctrl_bit_clear(B_CS2);
 195              		.loc 1 32 0
 196 00c2 0820     		movs	r0, #8
 197 00c4 FFF79CFF 		bl	graphic_ctrl_bit_set
  33:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****             break;
 198              		.loc 1 33 0
 199 00c8 1020     		movs	r0, #16
 200 00ca FFF7BBFF 		bl	graphic_ctrl_bit_clear
  34:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****         case B_CS2 :        //CS2
 201              		.loc 1 34 0
 202 00ce 0AE0     		b	.L8
 203              	.L12:
  36:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****             graphic_ctrl_bit_clear(B_CS1);
 204              		.loc 1 36 0
 205 00d0 1020     		movs	r0, #16
 206 00d2 FFF795FF 		bl	graphic_ctrl_bit_set
  37:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****             break;
 207              		.loc 1 37 0
 208 00d6 0820     		movs	r0, #8
 209 00d8 FFF7B4FF 		bl	graphic_ctrl_bit_clear
  38:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****         case B_CS1|B_CS2 :  //both
 210              		.loc 1 38 0
 211 00dc 03E0     		b	.L8
 212              	.L13:
  40:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****             break;
 213              		.loc 1 40 0
 214 00de 1820     		movs	r0, #24
 215 00e0 FFF78EFF 		bl	graphic_ctrl_bit_set
  41:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****     }
 216              		.loc 1 41 0
 217 00e4 C046     		nop
 218              	.L8:
 219              	.L14:
 220              		.loc 1 43 0
 221 00e6 C046     		nop
 222 00e8 BD46     		mov	sp, r7
 223 00ea 02B0     		add	sp, sp, #8
 224              		@ sp needed
 225 00ec 80BD     		pop	{r7, pc}
 226              		.cfi_endproc
 227              	.LFE2:
 229              		.align	1
 230              		.global	graphic_initialize
 231              		.syntax unified
 232              		.code	16
 233              		.thumb_func
 234              		.fpu softvfp
 236              	graphic_initialize:
 237              	.LFB3:
  44:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c **** 
  45:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c **** void graphic_initialize(void) {
 238              		.loc 1 45 0
 239              		.cfi_startproc
 240              		@ args = 0, pretend = 0, frame = 0
 241              		@ frame_needed = 1, uses_anonymous_args = 0
 242 00ee 80B5     		push	{r7, lr}
 243              		.cfi_def_cfa_offset 8
 244              		.cfi_offset 7, -8
 245              		.cfi_offset 14, -4
 246 00f0 00AF     		add	r7, sp, #0
 247              		.cfi_def_cfa_register 7
  46:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****     graphic_ctrl_bit_set(B_E);
 248              		.loc 1 46 0
 249 00f2 4020     		movs	r0, #64
 250 00f4 FFF784FF 		bl	graphic_ctrl_bit_set
  47:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****     delaymicros(10);
 251              		.loc 1 47 0
 252 00f8 0A20     		movs	r0, #10
 253 00fa FFF7FEFF 		bl	delaymicros
  48:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****     graphic_ctrl_bit_clear(B_CS1|B_CS2|B_RST|B_E);
 254              		.loc 1 48 0
 255 00fe 7820     		movs	r0, #120
 256 0100 FFF7A0FF 		bl	graphic_ctrl_bit_clear
  49:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****     delaymillis(30);
 257              		.loc 1 49 0
 258 0104 1E20     		movs	r0, #30
 259 0106 FFF7FEFF 		bl	delaymillis
  50:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****     graphic_ctrl_bit_set(B_RST);
 260              		.loc 1 50 0
 261 010a 2020     		movs	r0, #32
 262 010c FFF778FF 		bl	graphic_ctrl_bit_set
  51:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****     delaymillis(100);
 263              		.loc 1 51 0
 264 0110 6420     		movs	r0, #100
 265 0112 FFF7FEFF 		bl	delaymillis
  52:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****     graphic_write_command(LCD_OFF, B_CS1|B_CS2);    //cmd: LCD_OFF
 266              		.loc 1 52 0
 267 0116 1821     		movs	r1, #24
 268 0118 3E20     		movs	r0, #62
 269 011a FFF7FEFF 		bl	graphic_write_command
  53:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****     graphic_write_command(LCD_OFF, B_CS1|B_CS2);    //cmd: LCD_OFF
 270              		.loc 1 53 0
 271 011e 1821     		movs	r1, #24
 272 0120 3E20     		movs	r0, #62
 273 0122 FFF7FEFF 		bl	graphic_write_command
  54:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****     graphic_write_command(LCD_ON, B_CS1|B_CS2);     //...
 274              		.loc 1 54 0
 275 0126 1821     		movs	r1, #24
 276 0128 3F20     		movs	r0, #63
 277 012a FFF7FEFF 		bl	graphic_write_command
  55:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****     graphic_write_command(LCD_DISP_START, B_CS1|B_CS2);
 278              		.loc 1 55 0
 279 012e 1821     		movs	r1, #24
 280 0130 C020     		movs	r0, #192
 281 0132 FFF7FEFF 		bl	graphic_write_command
  56:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****     graphic_write_command(LCD_SET_ADD, B_CS1|B_CS2);
 282              		.loc 1 56 0
 283 0136 1821     		movs	r1, #24
 284 0138 4020     		movs	r0, #64
 285 013a FFF7FEFF 		bl	graphic_write_command
  57:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****     graphic_write_command(LCD_SET_PAGE, B_CS1|B_CS2);
 286              		.loc 1 57 0
 287 013e 1821     		movs	r1, #24
 288 0140 B820     		movs	r0, #184
 289 0142 FFF7FEFF 		bl	graphic_write_command
  58:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****     select_controller(0);       //choose neither CS1/CS2
 290              		.loc 1 58 0
 291 0146 0020     		movs	r0, #0
 292 0148 FFF7A4FF 		bl	select_controller
  59:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c **** }
 293              		.loc 1 59 0
 294 014c C046     		nop
 295 014e BD46     		mov	sp, r7
 296              		@ sp needed
 297 0150 80BD     		pop	{r7, pc}
 298              		.cfi_endproc
 299              	.LFE3:
 301              		.align	1
 302              		.syntax unified
 303              		.code	16
 304              		.thumb_func
 305              		.fpu softvfp
 307              	graphic_wait_ready:
 308              	.LFB4:
  60:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c **** 
  61:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c **** static void graphic_wait_ready(void) {
 309              		.loc 1 61 0
 310              		.cfi_startproc
 311              		@ args = 0, pretend = 0, frame = 8
 312              		@ frame_needed = 1, uses_anonymous_args = 0
 313 0152 80B5     		push	{r7, lr}
 314              		.cfi_def_cfa_offset 8
 315              		.cfi_offset 7, -8
 316              		.cfi_offset 14, -4
 317 0154 82B0     		sub	sp, sp, #8
 318              		.cfi_def_cfa_offset 16
 319 0156 00AF     		add	r7, sp, #0
 320              		.cfi_def_cfa_register 7
  62:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****     uint8_t c;
  63:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****     graphic_ctrl_bit_clear(B_E);
 321              		.loc 1 63 0
 322 0158 4020     		movs	r0, #64
 323 015a FFF773FF 		bl	graphic_ctrl_bit_clear
  64:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****     GPIO_E->moder = 0x00005555; // 15-8 inputs, 7-0 outputs
 324              		.loc 1 64 0
 325 015e 144B     		ldr	r3, .L22
 326 0160 144A     		ldr	r2, .L22+4
 327 0162 1A60     		str	r2, [r3]
  65:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****     graphic_ctrl_bit_clear(B_RS);
 328              		.loc 1 65 0
 329 0164 0120     		movs	r0, #1
 330 0166 FFF76DFF 		bl	graphic_ctrl_bit_clear
  66:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****     graphic_ctrl_bit_set(B_RW);
 331              		.loc 1 66 0
 332 016a 0220     		movs	r0, #2
 333 016c FFF748FF 		bl	graphic_ctrl_bit_set
  67:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****     delay_500ns();
 334              		.loc 1 67 0
 335 0170 FFF7FEFF 		bl	delay_500ns
 336              	.L19:
  68:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****     while(1) {
  69:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****         graphic_ctrl_bit_set(B_E);
 337              		.loc 1 69 0
 338 0174 4020     		movs	r0, #64
 339 0176 FFF743FF 		bl	graphic_ctrl_bit_set
  70:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****         delay_500ns();
 340              		.loc 1 70 0
 341 017a FFF7FEFF 		bl	delay_500ns
  71:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****         c = GPIO_E->idrHigh & LCD_BUSY;
 342              		.loc 1 71 0
 343 017e 0C4B     		ldr	r3, .L22
 344 0180 5B7C     		ldrb	r3, [r3, #17]
 345 0182 DAB2     		uxtb	r2, r3
 346 0184 FB1D     		adds	r3, r7, #7
 347 0186 7F21     		movs	r1, #127
 348 0188 8A43     		bics	r2, r1
 349 018a 1A70     		strb	r2, [r3]
  72:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****         graphic_ctrl_bit_clear(B_E);
 350              		.loc 1 72 0
 351 018c 4020     		movs	r0, #64
 352 018e FFF759FF 		bl	graphic_ctrl_bit_clear
  73:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****         delay_500ns();
 353              		.loc 1 73 0
 354 0192 FFF7FEFF 		bl	delay_500ns
  74:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****         if( c == 0 ) break;
 355              		.loc 1 74 0
 356 0196 FB1D     		adds	r3, r7, #7
 357 0198 1B78     		ldrb	r3, [r3]
 358 019a 002B     		cmp	r3, #0
 359 019c 00D0     		beq	.L21
  69:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****         delay_500ns();
 360              		.loc 1 69 0
 361 019e E9E7     		b	.L19
 362              	.L21:
 363              		.loc 1 74 0
 364 01a0 C046     		nop
  75:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****     }
  76:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****     GPIO_E->moder = 0x55555555; // 15-0 outputs
 365              		.loc 1 76 0
 366 01a2 034B     		ldr	r3, .L22
 367 01a4 044A     		ldr	r2, .L22+8
 368 01a6 1A60     		str	r2, [r3]
  77:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c **** }
 369              		.loc 1 77 0
 370 01a8 C046     		nop
 371 01aa BD46     		mov	sp, r7
 372 01ac 02B0     		add	sp, sp, #8
 373              		@ sp needed
 374 01ae 80BD     		pop	{r7, pc}
 375              	.L23:
 376              		.align	2
 377              	.L22:
 378 01b0 00100240 		.word	1073876992
 379 01b4 55550000 		.word	21845
 380 01b8 55555555 		.word	1431655765
 381              		.cfi_endproc
 382              	.LFE4:
 384              		.align	1
 385              		.syntax unified
 386              		.code	16
 387              		.thumb_func
 388              		.fpu softvfp
 390              	graphic_read:
 391              	.LFB5:
  78:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c **** 
  79:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c **** static uint8_t graphic_read(uint8_t controller) {
 392              		.loc 1 79 0
 393              		.cfi_startproc
 394              		@ args = 0, pretend = 0, frame = 16
 395              		@ frame_needed = 1, uses_anonymous_args = 0
 396 01bc 80B5     		push	{r7, lr}
 397              		.cfi_def_cfa_offset 8
 398              		.cfi_offset 7, -8
 399              		.cfi_offset 14, -4
 400 01be 84B0     		sub	sp, sp, #16
 401              		.cfi_def_cfa_offset 24
 402 01c0 00AF     		add	r7, sp, #0
 403              		.cfi_def_cfa_register 7
 404 01c2 0200     		movs	r2, r0
 405 01c4 FB1D     		adds	r3, r7, #7
 406 01c6 1A70     		strb	r2, [r3]
  80:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****     uint8_t c;
  81:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****     graphic_ctrl_bit_clear(B_E);
 407              		.loc 1 81 0
 408 01c8 4020     		movs	r0, #64
 409 01ca FFF73BFF 		bl	graphic_ctrl_bit_clear
  82:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****     GPIO_E->moder = 0x00005555; // 15-8 inputs, 7-0 outputs
 410              		.loc 1 82 0
 411 01ce 1C4B     		ldr	r3, .L28
 412 01d0 1C4A     		ldr	r2, .L28+4
 413 01d2 1A60     		str	r2, [r3]
  83:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****     graphic_ctrl_bit_set(B_RS|B_RW);
 414              		.loc 1 83 0
 415 01d4 0320     		movs	r0, #3
 416 01d6 FFF713FF 		bl	graphic_ctrl_bit_set
  84:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****     select_controller(controller);
 417              		.loc 1 84 0
 418 01da FB1D     		adds	r3, r7, #7
 419 01dc 1B78     		ldrb	r3, [r3]
 420 01de 1800     		movs	r0, r3
 421 01e0 FFF758FF 		bl	select_controller
  85:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****     delay_500ns();
 422              		.loc 1 85 0
 423 01e4 FFF7FEFF 		bl	delay_500ns
  86:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****     graphic_ctrl_bit_set(B_E);
 424              		.loc 1 86 0
 425 01e8 4020     		movs	r0, #64
 426 01ea FFF709FF 		bl	graphic_ctrl_bit_set
  87:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****     delay_500ns();
 427              		.loc 1 87 0
 428 01ee FFF7FEFF 		bl	delay_500ns
  88:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****     c = GPIO_E->idrHigh;
 429              		.loc 1 88 0
 430 01f2 134A     		ldr	r2, .L28
 431 01f4 0F23     		movs	r3, #15
 432 01f6 FB18     		adds	r3, r7, r3
 433 01f8 527C     		ldrb	r2, [r2, #17]
 434 01fa 1A70     		strb	r2, [r3]
  89:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****     graphic_ctrl_bit_clear(B_E);
 435              		.loc 1 89 0
 436 01fc 4020     		movs	r0, #64
 437 01fe FFF721FF 		bl	graphic_ctrl_bit_clear
  90:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****     GPIO_E->moder = 0x55555555; // 15-0 outputs
 438              		.loc 1 90 0
 439 0202 0F4B     		ldr	r3, .L28
 440 0204 104A     		ldr	r2, .L28+8
 441 0206 1A60     		str	r2, [r3]
  91:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c **** 
  92:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****     if( controller & B_CS1 ) {
 442              		.loc 1 92 0
 443 0208 FB1D     		adds	r3, r7, #7
 444 020a 1B78     		ldrb	r3, [r3]
 445 020c 0822     		movs	r2, #8
 446 020e 1340     		ands	r3, r2
 447 0210 04D0     		beq	.L25
  93:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****         select_controller(B_CS1);
 448              		.loc 1 93 0
 449 0212 0820     		movs	r0, #8
 450 0214 FFF73EFF 		bl	select_controller
  94:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****         graphic_wait_ready();
 451              		.loc 1 94 0
 452 0218 FFF79BFF 		bl	graphic_wait_ready
 453              	.L25:
  95:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****     }
  96:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****     if( controller & B_CS2 ) {
 454              		.loc 1 96 0
 455 021c FB1D     		adds	r3, r7, #7
 456 021e 1B78     		ldrb	r3, [r3]
 457 0220 1022     		movs	r2, #16
 458 0222 1340     		ands	r3, r2
 459 0224 04D0     		beq	.L26
  97:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****         select_controller(B_CS2);
 460              		.loc 1 97 0
 461 0226 1020     		movs	r0, #16
 462 0228 FFF734FF 		bl	select_controller
  98:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****         graphic_wait_ready();
 463              		.loc 1 98 0
 464 022c FFF791FF 		bl	graphic_wait_ready
 465              	.L26:
  99:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****     }
 100:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****     return c;
 466              		.loc 1 100 0
 467 0230 0F23     		movs	r3, #15
 468 0232 FB18     		adds	r3, r7, r3
 469 0234 1B78     		ldrb	r3, [r3]
 101:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c **** }
 470              		.loc 1 101 0
 471 0236 1800     		movs	r0, r3
 472 0238 BD46     		mov	sp, r7
 473 023a 04B0     		add	sp, sp, #16
 474              		@ sp needed
 475 023c 80BD     		pop	{r7, pc}
 476              	.L29:
 477 023e C046     		.align	2
 478              	.L28:
 479 0240 00100240 		.word	1073876992
 480 0244 55550000 		.word	21845
 481 0248 55555555 		.word	1431655765
 482              		.cfi_endproc
 483              	.LFE5:
 485              		.align	1
 486              		.syntax unified
 487              		.code	16
 488              		.thumb_func
 489              		.fpu softvfp
 491              	graphic_read_data:
 492              	.LFB6:
 102:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c **** 
 103:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c **** static uint8_t graphic_read_data(uint8_t controller) {
 493              		.loc 1 103 0
 494              		.cfi_startproc
 495              		@ args = 0, pretend = 0, frame = 8
 496              		@ frame_needed = 1, uses_anonymous_args = 0
 497 024c 80B5     		push	{r7, lr}
 498              		.cfi_def_cfa_offset 8
 499              		.cfi_offset 7, -8
 500              		.cfi_offset 14, -4
 501 024e 82B0     		sub	sp, sp, #8
 502              		.cfi_def_cfa_offset 16
 503 0250 00AF     		add	r7, sp, #0
 504              		.cfi_def_cfa_register 7
 505 0252 0200     		movs	r2, r0
 506 0254 FB1D     		adds	r3, r7, #7
 507 0256 1A70     		strb	r2, [r3]
 104:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****     graphic_read(controller);
 508              		.loc 1 104 0
 509 0258 FB1D     		adds	r3, r7, #7
 510 025a 1B78     		ldrb	r3, [r3]
 511 025c 1800     		movs	r0, r3
 512 025e FFF7ADFF 		bl	graphic_read
 105:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****     return graphic_read(controller);
 513              		.loc 1 105 0
 514 0262 FB1D     		adds	r3, r7, #7
 515 0264 1B78     		ldrb	r3, [r3]
 516 0266 1800     		movs	r0, r3
 517 0268 FFF7A8FF 		bl	graphic_read
 518 026c 0300     		movs	r3, r0
 106:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c **** }
 519              		.loc 1 106 0
 520 026e 1800     		movs	r0, r3
 521 0270 BD46     		mov	sp, r7
 522 0272 02B0     		add	sp, sp, #8
 523              		@ sp needed
 524 0274 80BD     		pop	{r7, pc}
 525              		.cfi_endproc
 526              	.LFE6:
 528              		.align	1
 529              		.global	graphic_write
 530              		.syntax unified
 531              		.code	16
 532              		.thumb_func
 533              		.fpu softvfp
 535              	graphic_write:
 536              	.LFB7:
 107:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c **** 
 108:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c **** void graphic_write(uint8_t value, uint8_t controller){
 537              		.loc 1 108 0
 538              		.cfi_startproc
 539              		@ args = 0, pretend = 0, frame = 8
 540              		@ frame_needed = 1, uses_anonymous_args = 0
 541 0276 80B5     		push	{r7, lr}
 542              		.cfi_def_cfa_offset 8
 543              		.cfi_offset 7, -8
 544              		.cfi_offset 14, -4
 545 0278 82B0     		sub	sp, sp, #8
 546              		.cfi_def_cfa_offset 16
 547 027a 00AF     		add	r7, sp, #0
 548              		.cfi_def_cfa_register 7
 549 027c 0200     		movs	r2, r0
 550 027e FB1D     		adds	r3, r7, #7
 551 0280 1A70     		strb	r2, [r3]
 552 0282 BB1D     		adds	r3, r7, #6
 553 0284 0A1C     		adds	r2, r1, #0
 554 0286 1A70     		strb	r2, [r3]
 109:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****     GPIO_E->odrHigh = value;
 555              		.loc 1 109 0
 556 0288 174A     		ldr	r2, .L35
 557 028a FB1D     		adds	r3, r7, #7
 558 028c 1B78     		ldrb	r3, [r3]
 559 028e 5375     		strb	r3, [r2, #21]
 110:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****     delay_500ns();
 560              		.loc 1 110 0
 561 0290 FFF7FEFF 		bl	delay_500ns
 111:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****     graphic_ctrl_bit_set(B_E);
 562              		.loc 1 111 0
 563 0294 4020     		movs	r0, #64
 564 0296 FFF7B3FE 		bl	graphic_ctrl_bit_set
 112:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****     delay_500ns();
 565              		.loc 1 112 0
 566 029a FFF7FEFF 		bl	delay_500ns
 113:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****     graphic_ctrl_bit_clear(B_E);
 567              		.loc 1 113 0
 568 029e 4020     		movs	r0, #64
 569 02a0 FFF7D0FE 		bl	graphic_ctrl_bit_clear
 114:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****     
 115:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****     if(controller & B_CS1){
 570              		.loc 1 115 0
 571 02a4 BB1D     		adds	r3, r7, #6
 572 02a6 1B78     		ldrb	r3, [r3]
 573 02a8 0822     		movs	r2, #8
 574 02aa 1340     		ands	r3, r2
 575 02ac 04D0     		beq	.L33
 116:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****         select_controller(B_CS1);
 576              		.loc 1 116 0
 577 02ae 0820     		movs	r0, #8
 578 02b0 FFF7F0FE 		bl	select_controller
 117:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****         graphic_wait_ready();
 579              		.loc 1 117 0
 580 02b4 FFF74DFF 		bl	graphic_wait_ready
 581              	.L33:
 118:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****     }
 119:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****     if(controller & B_CS2){
 582              		.loc 1 119 0
 583 02b8 BB1D     		adds	r3, r7, #6
 584 02ba 1B78     		ldrb	r3, [r3]
 585 02bc 1022     		movs	r2, #16
 586 02be 1340     		ands	r3, r2
 587 02c0 04D0     		beq	.L34
 120:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****         select_controller(B_CS2);
 588              		.loc 1 120 0
 589 02c2 1020     		movs	r0, #16
 590 02c4 FFF7E6FE 		bl	select_controller
 121:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****         graphic_wait_ready();
 591              		.loc 1 121 0
 592 02c8 FFF743FF 		bl	graphic_wait_ready
 593              	.L34:
 122:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****     }
 123:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****         
 124:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****     GPIO_E->odrHigh = 0;
 594              		.loc 1 124 0
 595 02cc 064B     		ldr	r3, .L35
 596 02ce 0022     		movs	r2, #0
 597 02d0 5A75     		strb	r2, [r3, #21]
 125:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****     graphic_ctrl_bit_set(B_E);
 598              		.loc 1 125 0
 599 02d2 4020     		movs	r0, #64
 600 02d4 FFF794FE 		bl	graphic_ctrl_bit_set
 126:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****     select_controller(0);    
 601              		.loc 1 126 0
 602 02d8 0020     		movs	r0, #0
 603 02da FFF7DBFE 		bl	select_controller
 127:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****     
 128:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c **** }
 604              		.loc 1 128 0
 605 02de C046     		nop
 606 02e0 BD46     		mov	sp, r7
 607 02e2 02B0     		add	sp, sp, #8
 608              		@ sp needed
 609 02e4 80BD     		pop	{r7, pc}
 610              	.L36:
 611 02e6 C046     		.align	2
 612              	.L35:
 613 02e8 00100240 		.word	1073876992
 614              		.cfi_endproc
 615              	.LFE7:
 617              		.align	1
 618              		.global	graphic_write_command
 619              		.syntax unified
 620              		.code	16
 621              		.thumb_func
 622              		.fpu softvfp
 624              	graphic_write_command:
 625              	.LFB8:
 129:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c **** void graphic_write_command(uint8_t command, uint8_t controller){
 626              		.loc 1 129 0
 627              		.cfi_startproc
 628              		@ args = 0, pretend = 0, frame = 8
 629              		@ frame_needed = 1, uses_anonymous_args = 0
 630 02ec 80B5     		push	{r7, lr}
 631              		.cfi_def_cfa_offset 8
 632              		.cfi_offset 7, -8
 633              		.cfi_offset 14, -4
 634 02ee 82B0     		sub	sp, sp, #8
 635              		.cfi_def_cfa_offset 16
 636 02f0 00AF     		add	r7, sp, #0
 637              		.cfi_def_cfa_register 7
 638 02f2 0200     		movs	r2, r0
 639 02f4 FB1D     		adds	r3, r7, #7
 640 02f6 1A70     		strb	r2, [r3]
 641 02f8 BB1D     		adds	r3, r7, #6
 642 02fa 0A1C     		adds	r2, r1, #0
 643 02fc 1A70     		strb	r2, [r3]
 130:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****     graphic_ctrl_bit_clear(B_E);
 644              		.loc 1 130 0
 645 02fe 4020     		movs	r0, #64
 646 0300 FFF7A0FE 		bl	graphic_ctrl_bit_clear
 131:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****     select_controller(controller);
 647              		.loc 1 131 0
 648 0304 BB1D     		adds	r3, r7, #6
 649 0306 1B78     		ldrb	r3, [r3]
 650 0308 1800     		movs	r0, r3
 651 030a FFF7C3FE 		bl	select_controller
 132:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****     graphic_ctrl_bit_clear(B_RS | B_RW);
 652              		.loc 1 132 0
 653 030e 0320     		movs	r0, #3
 654 0310 FFF798FE 		bl	graphic_ctrl_bit_clear
 133:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****     graphic_write(command, controller);
 655              		.loc 1 133 0
 656 0314 BB1D     		adds	r3, r7, #6
 657 0316 1A78     		ldrb	r2, [r3]
 658 0318 FB1D     		adds	r3, r7, #7
 659 031a 1B78     		ldrb	r3, [r3]
 660 031c 1100     		movs	r1, r2
 661 031e 1800     		movs	r0, r3
 662 0320 FFF7FEFF 		bl	graphic_write
 134:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c **** }
 663              		.loc 1 134 0
 664 0324 C046     		nop
 665 0326 BD46     		mov	sp, r7
 666 0328 02B0     		add	sp, sp, #8
 667              		@ sp needed
 668 032a 80BD     		pop	{r7, pc}
 669              		.cfi_endproc
 670              	.LFE8:
 672              		.align	1
 673              		.global	graphic_write_data
 674              		.syntax unified
 675              		.code	16
 676              		.thumb_func
 677              		.fpu softvfp
 679              	graphic_write_data:
 680              	.LFB9:
 135:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c **** void graphic_write_data(uint8_t data, uint8_t controller){
 681              		.loc 1 135 0
 682              		.cfi_startproc
 683              		@ args = 0, pretend = 0, frame = 8
 684              		@ frame_needed = 1, uses_anonymous_args = 0
 685 032c 80B5     		push	{r7, lr}
 686              		.cfi_def_cfa_offset 8
 687              		.cfi_offset 7, -8
 688              		.cfi_offset 14, -4
 689 032e 82B0     		sub	sp, sp, #8
 690              		.cfi_def_cfa_offset 16
 691 0330 00AF     		add	r7, sp, #0
 692              		.cfi_def_cfa_register 7
 693 0332 0200     		movs	r2, r0
 694 0334 FB1D     		adds	r3, r7, #7
 695 0336 1A70     		strb	r2, [r3]
 696 0338 BB1D     		adds	r3, r7, #6
 697 033a 0A1C     		adds	r2, r1, #0
 698 033c 1A70     		strb	r2, [r3]
 136:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****     graphic_ctrl_bit_clear(B_E);
 699              		.loc 1 136 0
 700 033e 4020     		movs	r0, #64
 701 0340 FFF780FE 		bl	graphic_ctrl_bit_clear
 137:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****     select_controller(controller);
 702              		.loc 1 137 0
 703 0344 BB1D     		adds	r3, r7, #6
 704 0346 1B78     		ldrb	r3, [r3]
 705 0348 1800     		movs	r0, r3
 706 034a FFF7A3FE 		bl	select_controller
 138:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****     graphic_ctrl_bit_clear(B_RW);
 707              		.loc 1 138 0
 708 034e 0220     		movs	r0, #2
 709 0350 FFF778FE 		bl	graphic_ctrl_bit_clear
 139:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****     graphic_ctrl_bit_set(B_RS);
 710              		.loc 1 139 0
 711 0354 0120     		movs	r0, #1
 712 0356 FFF753FE 		bl	graphic_ctrl_bit_set
 140:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****     graphic_write(data, controller);
 713              		.loc 1 140 0
 714 035a BB1D     		adds	r3, r7, #6
 715 035c 1A78     		ldrb	r2, [r3]
 716 035e FB1D     		adds	r3, r7, #7
 717 0360 1B78     		ldrb	r3, [r3]
 718 0362 1100     		movs	r1, r2
 719 0364 1800     		movs	r0, r3
 720 0366 FFF7FEFF 		bl	graphic_write
 141:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c **** }
 721              		.loc 1 141 0
 722 036a C046     		nop
 723 036c BD46     		mov	sp, r7
 724 036e 02B0     		add	sp, sp, #8
 725              		@ sp needed
 726 0370 80BD     		pop	{r7, pc}
 727              		.cfi_endproc
 728              	.LFE9:
 730              		.align	1
 731              		.global	graphic_clear_screen
 732              		.syntax unified
 733              		.code	16
 734              		.thumb_func
 735              		.fpu softvfp
 737              	graphic_clear_screen:
 738              	.LFB10:
 142:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c **** void graphic_clear_screen(void){
 739              		.loc 1 142 0
 740              		.cfi_startproc
 741              		@ args = 0, pretend = 0, frame = 8
 742              		@ frame_needed = 1, uses_anonymous_args = 0
 743 0372 80B5     		push	{r7, lr}
 744              		.cfi_def_cfa_offset 8
 745              		.cfi_offset 7, -8
 746              		.cfi_offset 14, -4
 747 0374 82B0     		sub	sp, sp, #8
 748              		.cfi_def_cfa_offset 16
 749 0376 00AF     		add	r7, sp, #0
 750              		.cfi_def_cfa_register 7
 751              	.LBB2:
 143:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****     for(int i = 1; i <= 128; i++){
 752              		.loc 1 143 0
 753 0378 0123     		movs	r3, #1
 754 037a 7B60     		str	r3, [r7, #4]
 755 037c 11E0     		b	.L40
 756              	.L43:
 757              	.LBB3:
 144:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c **** 		for(int j = 1; j <= 64; j++){
 758              		.loc 1 144 0
 759 037e 0123     		movs	r3, #1
 760 0380 3B60     		str	r3, [r7]
 761 0382 08E0     		b	.L41
 762              	.L42:
 145:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c **** 			pixel(i, j, 0);
 763              		.loc 1 145 0 discriminator 3
 764 0384 3968     		ldr	r1, [r7]
 765 0386 7B68     		ldr	r3, [r7, #4]
 766 0388 0022     		movs	r2, #0
 767 038a 1800     		movs	r0, r3
 768 038c FFF7FEFF 		bl	pixel
 144:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c **** 		for(int j = 1; j <= 64; j++){
 769              		.loc 1 144 0 discriminator 3
 770 0390 3B68     		ldr	r3, [r7]
 771 0392 0133     		adds	r3, r3, #1
 772 0394 3B60     		str	r3, [r7]
 773              	.L41:
 144:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c **** 		for(int j = 1; j <= 64; j++){
 774              		.loc 1 144 0 is_stmt 0 discriminator 1
 775 0396 3B68     		ldr	r3, [r7]
 776 0398 402B     		cmp	r3, #64
 777 039a F3DD     		ble	.L42
 778              	.LBE3:
 143:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****     for(int i = 1; i <= 128; i++){
 779              		.loc 1 143 0 is_stmt 1 discriminator 2
 780 039c 7B68     		ldr	r3, [r7, #4]
 781 039e 0133     		adds	r3, r3, #1
 782 03a0 7B60     		str	r3, [r7, #4]
 783              	.L40:
 143:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****     for(int i = 1; i <= 128; i++){
 784              		.loc 1 143 0 is_stmt 0 discriminator 1
 785 03a2 7B68     		ldr	r3, [r7, #4]
 786 03a4 802B     		cmp	r3, #128
 787 03a6 EADD     		ble	.L43
 788              	.LBE2:
 146:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c **** 		}
 147:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c **** 	}
 148:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c **** }
 789              		.loc 1 148 0 is_stmt 1
 790 03a8 C046     		nop
 791 03aa BD46     		mov	sp, r7
 792 03ac 02B0     		add	sp, sp, #8
 793              		@ sp needed
 794 03ae 80BD     		pop	{r7, pc}
 795              		.cfi_endproc
 796              	.LFE10:
 798              		.align	1
 799              		.global	clear_backBuffer
 800              		.syntax unified
 801              		.code	16
 802              		.thumb_func
 803              		.fpu softvfp
 805              	clear_backBuffer:
 806              	.LFB11:
 149:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c **** 
 150:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c **** 
 151:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c **** void clear_backBuffer() {
 807              		.loc 1 151 0
 808              		.cfi_startproc
 809              		@ args = 0, pretend = 0, frame = 8
 810              		@ frame_needed = 1, uses_anonymous_args = 0
 811 03b0 80B5     		push	{r7, lr}
 812              		.cfi_def_cfa_offset 8
 813              		.cfi_offset 7, -8
 814              		.cfi_offset 14, -4
 815 03b2 82B0     		sub	sp, sp, #8
 816              		.cfi_def_cfa_offset 16
 817 03b4 00AF     		add	r7, sp, #0
 818              		.cfi_def_cfa_register 7
 819              	.LBB4:
 152:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****     for (int i = 0; i < 256; i++){
 820              		.loc 1 152 0
 821 03b6 0023     		movs	r3, #0
 822 03b8 7B60     		str	r3, [r7, #4]
 823 03ba 13E0     		b	.L45
 824              	.L48:
 825              	.LBB5:
 153:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****         for(int j = 0; j < 8; j++)
 826              		.loc 1 153 0
 827 03bc 0023     		movs	r3, #0
 828 03be 3B60     		str	r3, [r7]
 829 03c0 0AE0     		b	.L46
 830              	.L47:
 154:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c **** 			 backBuffer[i][j] = 0;
 831              		.loc 1 154 0 discriminator 3
 832 03c2 0C4A     		ldr	r2, .L49
 833 03c4 7B68     		ldr	r3, [r7, #4]
 834 03c6 DB00     		lsls	r3, r3, #3
 835 03c8 D218     		adds	r2, r2, r3
 836 03ca 3B68     		ldr	r3, [r7]
 837 03cc D318     		adds	r3, r2, r3
 838 03ce 0022     		movs	r2, #0
 839 03d0 1A70     		strb	r2, [r3]
 153:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****         for(int j = 0; j < 8; j++)
 840              		.loc 1 153 0 discriminator 3
 841 03d2 3B68     		ldr	r3, [r7]
 842 03d4 0133     		adds	r3, r3, #1
 843 03d6 3B60     		str	r3, [r7]
 844              	.L46:
 153:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****         for(int j = 0; j < 8; j++)
 845              		.loc 1 153 0 is_stmt 0 discriminator 1
 846 03d8 3B68     		ldr	r3, [r7]
 847 03da 072B     		cmp	r3, #7
 848 03dc F1DD     		ble	.L47
 849              	.LBE5:
 152:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****     for (int i = 0; i < 256; i++){
 850              		.loc 1 152 0 is_stmt 1 discriminator 2
 851 03de 7B68     		ldr	r3, [r7, #4]
 852 03e0 0133     		adds	r3, r3, #1
 853 03e2 7B60     		str	r3, [r7, #4]
 854              	.L45:
 152:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****     for (int i = 0; i < 256; i++){
 855              		.loc 1 152 0 is_stmt 0 discriminator 1
 856 03e4 7B68     		ldr	r3, [r7, #4]
 857 03e6 FF2B     		cmp	r3, #255
 858 03e8 E8DD     		ble	.L48
 859              	.LBE4:
 155:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c **** 	}
 156:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c **** }
 860              		.loc 1 156 0 is_stmt 1
 861 03ea C046     		nop
 862 03ec BD46     		mov	sp, r7
 863 03ee 02B0     		add	sp, sp, #8
 864              		@ sp needed
 865 03f0 80BD     		pop	{r7, pc}
 866              	.L50:
 867 03f2 C046     		.align	2
 868              	.L49:
 869 03f4 00000000 		.word	backBuffer
 870              		.cfi_endproc
 871              	.LFE11:
 873              		.align	1
 874              		.global	pixel
 875              		.syntax unified
 876              		.code	16
 877              		.thumb_func
 878              		.fpu softvfp
 880              	pixel:
 881              	.LFB12:
 157:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c **** 
 158:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c **** void pixel(int x, int y, int set) {
 882              		.loc 1 158 0
 883              		.cfi_startproc
 884              		@ args = 0, pretend = 0, frame = 24
 885              		@ frame_needed = 1, uses_anonymous_args = 0
 886 03f8 80B5     		push	{r7, lr}
 887              		.cfi_def_cfa_offset 8
 888              		.cfi_offset 7, -8
 889              		.cfi_offset 14, -4
 890 03fa 86B0     		sub	sp, sp, #24
 891              		.cfi_def_cfa_offset 32
 892 03fc 00AF     		add	r7, sp, #0
 893              		.cfi_def_cfa_register 7
 894 03fe F860     		str	r0, [r7, #12]
 895 0400 B960     		str	r1, [r7, #8]
 896 0402 7A60     		str	r2, [r7, #4]
 159:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****     
 160:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****     uint8_t mask = 1 << ((y-1)%8);
 897              		.loc 1 160 0
 898 0404 BB68     		ldr	r3, [r7, #8]
 899 0406 013B     		subs	r3, r3, #1
 900 0408 264A     		ldr	r2, .L58
 901 040a 1340     		ands	r3, r2
 902 040c 04D5     		bpl	.L52
 903 040e 013B     		subs	r3, r3, #1
 904 0410 0822     		movs	r2, #8
 905 0412 5242     		rsbs	r2, r2, #0
 906 0414 1343     		orrs	r3, r2
 907 0416 0133     		adds	r3, r3, #1
 908              	.L52:
 909 0418 1A00     		movs	r2, r3
 910 041a 0123     		movs	r3, #1
 911 041c 9340     		lsls	r3, r3, r2
 912 041e 1A00     		movs	r2, r3
 913 0420 1723     		movs	r3, #23
 914 0422 FB18     		adds	r3, r7, r3
 915 0424 1A70     		strb	r2, [r3]
 161:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****     
 162:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****     if(set){
 916              		.loc 1 162 0
 917 0426 7B68     		ldr	r3, [r7, #4]
 918 0428 002B     		cmp	r3, #0
 919 042a 19D0     		beq	.L53
 163:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****         backBuffer[64+(y-1)][(x-1)/8] |= mask;
 920              		.loc 1 163 0
 921 042c BB68     		ldr	r3, [r7, #8]
 922 042e 3F33     		adds	r3, r3, #63
 923 0430 1A00     		movs	r2, r3
 924 0432 FB68     		ldr	r3, [r7, #12]
 925 0434 013B     		subs	r3, r3, #1
 926 0436 002B     		cmp	r3, #0
 927 0438 00DA     		bge	.L54
 928 043a 0733     		adds	r3, r3, #7
 929              	.L54:
 930 043c DB10     		asrs	r3, r3, #3
 931 043e 1A49     		ldr	r1, .L58+4
 932 0440 D200     		lsls	r2, r2, #3
 933 0442 8A18     		adds	r2, r1, r2
 934 0444 D05C     		ldrb	r0, [r2, r3]
 935 0446 BA68     		ldr	r2, [r7, #8]
 936 0448 3F32     		adds	r2, r2, #63
 937 044a 1721     		movs	r1, #23
 938 044c 7918     		adds	r1, r7, r1
 939 044e 0978     		ldrb	r1, [r1]
 940 0450 0143     		orrs	r1, r0
 941 0452 C8B2     		uxtb	r0, r1
 942 0454 1449     		ldr	r1, .L58+4
 943 0456 D200     		lsls	r2, r2, #3
 944 0458 8A18     		adds	r2, r1, r2
 945 045a 011C     		adds	r1, r0, #0
 946 045c D154     		strb	r1, [r2, r3]
 164:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****     }
 165:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****     else{
 166:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****         backBuffer[64+(y-1)][(x-1)/8] &= ~mask;
 167:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****     }
 168:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c **** }
 947              		.loc 1 168 0
 948 045e 1DE0     		b	.L57
 949              	.L53:
 166:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****     }
 950              		.loc 1 166 0
 951 0460 BB68     		ldr	r3, [r7, #8]
 952 0462 3F33     		adds	r3, r3, #63
 953 0464 1A00     		movs	r2, r3
 954 0466 FB68     		ldr	r3, [r7, #12]
 955 0468 013B     		subs	r3, r3, #1
 956 046a 002B     		cmp	r3, #0
 957 046c 00DA     		bge	.L56
 958 046e 0733     		adds	r3, r3, #7
 959              	.L56:
 960 0470 DB10     		asrs	r3, r3, #3
 961 0472 0D49     		ldr	r1, .L58+4
 962 0474 D200     		lsls	r2, r2, #3
 963 0476 8A18     		adds	r2, r1, r2
 964 0478 D25C     		ldrb	r2, [r2, r3]
 965 047a 52B2     		sxtb	r2, r2
 966 047c 1721     		movs	r1, #23
 967 047e 7918     		adds	r1, r7, r1
 968 0480 0978     		ldrb	r1, [r1]
 969 0482 49B2     		sxtb	r1, r1
 970 0484 C943     		mvns	r1, r1
 971 0486 49B2     		sxtb	r1, r1
 972 0488 0A40     		ands	r2, r1
 973 048a 51B2     		sxtb	r1, r2
 974 048c BA68     		ldr	r2, [r7, #8]
 975 048e 3F32     		adds	r2, r2, #63
 976 0490 C8B2     		uxtb	r0, r1
 977 0492 0549     		ldr	r1, .L58+4
 978 0494 D200     		lsls	r2, r2, #3
 979 0496 8A18     		adds	r2, r1, r2
 980 0498 011C     		adds	r1, r0, #0
 981 049a D154     		strb	r1, [r2, r3]
 982              	.L57:
 983              		.loc 1 168 0
 984 049c C046     		nop
 985 049e BD46     		mov	sp, r7
 986 04a0 06B0     		add	sp, sp, #24
 987              		@ sp needed
 988 04a2 80BD     		pop	{r7, pc}
 989              	.L59:
 990              		.align	2
 991              	.L58:
 992 04a4 07000080 		.word	-2147483641
 993 04a8 00000000 		.word	backBuffer
 994              		.cfi_endproc
 995              	.LFE12:
 997              		.align	1
 998              		.global	byteToBuffer
 999              		.syntax unified
 1000              		.code	16
 1001              		.thumb_func
 1002              		.fpu softvfp
 1004              	byteToBuffer:
 1005              	.LFB13:
 169:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c **** 
 170:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c **** void byteToBuffer(int addr, int page, char c){
 1006              		.loc 1 170 0
 1007              		.cfi_startproc
 1008              		@ args = 0, pretend = 0, frame = 16
 1009              		@ frame_needed = 1, uses_anonymous_args = 0
 1010 04ac 80B5     		push	{r7, lr}
 1011              		.cfi_def_cfa_offset 8
 1012              		.cfi_offset 7, -8
 1013              		.cfi_offset 14, -4
 1014 04ae 84B0     		sub	sp, sp, #16
 1015              		.cfi_def_cfa_offset 24
 1016 04b0 00AF     		add	r7, sp, #0
 1017              		.cfi_def_cfa_register 7
 1018 04b2 F860     		str	r0, [r7, #12]
 1019 04b4 B960     		str	r1, [r7, #8]
 1020 04b6 FB1D     		adds	r3, r7, #7
 1021 04b8 1A70     		strb	r2, [r3]
 171:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c **** 	backBuffer[addr][page] = c;
 1022              		.loc 1 171 0
 1023 04ba 064A     		ldr	r2, .L61
 1024 04bc FB68     		ldr	r3, [r7, #12]
 1025 04be DB00     		lsls	r3, r3, #3
 1026 04c0 D218     		adds	r2, r2, r3
 1027 04c2 BB68     		ldr	r3, [r7, #8]
 1028 04c4 D318     		adds	r3, r2, r3
 1029 04c6 FA1D     		adds	r2, r7, #7
 1030 04c8 1278     		ldrb	r2, [r2]
 1031 04ca 1A70     		strb	r2, [r3]
 172:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c **** }
 1032              		.loc 1 172 0
 1033 04cc C046     		nop
 1034 04ce BD46     		mov	sp, r7
 1035 04d0 04B0     		add	sp, sp, #16
 1036              		@ sp needed
 1037 04d2 80BD     		pop	{r7, pc}
 1038              	.L62:
 1039              		.align	2
 1040              	.L61:
 1041 04d4 00000000 		.word	backBuffer
 1042              		.cfi_endproc
 1043              	.LFE13:
 1045              		.align	1
 1046              		.global	byteToScreenBuffer
 1047              		.syntax unified
 1048              		.code	16
 1049              		.thumb_func
 1050              		.fpu softvfp
 1052              	byteToScreenBuffer:
 1053              	.LFB14:
 173:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c **** void byteToScreenBuffer(int addr, int page, char c){
 1054              		.loc 1 173 0
 1055              		.cfi_startproc
 1056              		@ args = 0, pretend = 0, frame = 16
 1057              		@ frame_needed = 1, uses_anonymous_args = 0
 1058 04d8 80B5     		push	{r7, lr}
 1059              		.cfi_def_cfa_offset 8
 1060              		.cfi_offset 7, -8
 1061              		.cfi_offset 14, -4
 1062 04da 84B0     		sub	sp, sp, #16
 1063              		.cfi_def_cfa_offset 24
 1064 04dc 00AF     		add	r7, sp, #0
 1065              		.cfi_def_cfa_register 7
 1066 04de F860     		str	r0, [r7, #12]
 1067 04e0 B960     		str	r1, [r7, #8]
 1068 04e2 FB1D     		adds	r3, r7, #7
 1069 04e4 1A70     		strb	r2, [r3]
 174:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c **** 	backBuffer[64+addr][page] = c;
 1070              		.loc 1 174 0
 1071 04e6 FB68     		ldr	r3, [r7, #12]
 1072 04e8 4033     		adds	r3, r3, #64
 1073 04ea 064A     		ldr	r2, .L64
 1074 04ec DB00     		lsls	r3, r3, #3
 1075 04ee D218     		adds	r2, r2, r3
 1076 04f0 BB68     		ldr	r3, [r7, #8]
 1077 04f2 D318     		adds	r3, r2, r3
 1078 04f4 FA1D     		adds	r2, r7, #7
 1079 04f6 1278     		ldrb	r2, [r2]
 1080 04f8 1A70     		strb	r2, [r3]
 175:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c **** }
 1081              		.loc 1 175 0
 1082 04fa C046     		nop
 1083 04fc BD46     		mov	sp, r7
 1084 04fe 04B0     		add	sp, sp, #16
 1085              		@ sp needed
 1086 0500 80BD     		pop	{r7, pc}
 1087              	.L65:
 1088 0502 C046     		.align	2
 1089              	.L64:
 1090 0504 00000000 		.word	backBuffer
 1091              		.cfi_endproc
 1092              	.LFE14:
 1094              		.align	1
 1095              		.global	graphic_draw_screen
 1096              		.syntax unified
 1097              		.code	16
 1098              		.thumb_func
 1099              		.fpu softvfp
 1101              	graphic_draw_screen:
 1102              	.LFB15:
 176:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c **** 
 177:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c **** void graphic_draw_screen(void) {
 1103              		.loc 1 177 0
 1104              		.cfi_startproc
 1105              		@ args = 0, pretend = 0, frame = 16
 1106              		@ frame_needed = 1, uses_anonymous_args = 0
 1107 0508 90B5     		push	{r4, r7, lr}
 1108              		.cfi_def_cfa_offset 12
 1109              		.cfi_offset 4, -12
 1110              		.cfi_offset 7, -8
 1111              		.cfi_offset 14, -4
 1112 050a 85B0     		sub	sp, sp, #20
 1113              		.cfi_def_cfa_offset 32
 1114 050c 00AF     		add	r7, sp, #0
 1115              		.cfi_def_cfa_register 7
 178:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****     uint8_t i, j, controller, c;
 179:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****     unsigned int k = 0;
 1116              		.loc 1 179 0
 1117 050e 0023     		movs	r3, #0
 1118 0510 BB60     		str	r3, [r7, #8]
 180:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****     for(c = 0; c < 2; c++) {
 1119              		.loc 1 180 0
 1120 0512 0D23     		movs	r3, #13
 1121 0514 FB18     		adds	r3, r7, r3
 1122 0516 0022     		movs	r2, #0
 1123 0518 1A70     		strb	r2, [r3]
 1124 051a 5AE0     		b	.L67
 1125              	.L74:
 181:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****         controller = (c == 0) ? B_CS1 : B_CS2;
 1126              		.loc 1 181 0
 1127 051c 0D23     		movs	r3, #13
 1128 051e FB18     		adds	r3, r7, r3
 1129 0520 1B78     		ldrb	r3, [r3]
 1130 0522 002B     		cmp	r3, #0
 1131 0524 01D1     		bne	.L68
 1132              		.loc 1 181 0 is_stmt 0 discriminator 1
 1133 0526 0822     		movs	r2, #8
 1134 0528 00E0     		b	.L69
 1135              	.L68:
 1136              		.loc 1 181 0 discriminator 2
 1137 052a 1022     		movs	r2, #16
 1138              	.L69:
 1139              		.loc 1 181 0 discriminator 4
 1140 052c FB1D     		adds	r3, r7, #7
 1141 052e 1A70     		strb	r2, [r3]
 182:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****         for(j = 0; j < 8; j++) {
 1142              		.loc 1 182 0 is_stmt 1 discriminator 4
 1143 0530 0E23     		movs	r3, #14
 1144 0532 FB18     		adds	r3, r7, r3
 1145 0534 0022     		movs	r2, #0
 1146 0536 1A70     		strb	r2, [r3]
 1147 0538 40E0     		b	.L70
 1148              	.L73:
 183:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****             graphic_write_command(LCD_SET_PAGE | j, controller);
 1149              		.loc 1 183 0
 1150 053a 0E23     		movs	r3, #14
 1151 053c FB18     		adds	r3, r7, r3
 1152 053e 1B78     		ldrb	r3, [r3]
 1153 0540 4822     		movs	r2, #72
 1154 0542 5242     		rsbs	r2, r2, #0
 1155 0544 1343     		orrs	r3, r2
 1156 0546 DAB2     		uxtb	r2, r3
 1157 0548 FB1D     		adds	r3, r7, #7
 1158 054a 1B78     		ldrb	r3, [r3]
 1159 054c 1900     		movs	r1, r3
 1160 054e 1000     		movs	r0, r2
 1161 0550 FFF7FEFF 		bl	graphic_write_command
 184:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****             graphic_write_command(LCD_SET_ADD | 0, controller);
 1162              		.loc 1 184 0
 1163 0554 FB1D     		adds	r3, r7, #7
 1164 0556 1B78     		ldrb	r3, [r3]
 1165 0558 1900     		movs	r1, r3
 1166 055a 4020     		movs	r0, #64
 1167 055c FFF7FEFF 		bl	graphic_write_command
 185:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****             for(i = 0; i <= 63; i++, k++) {
 1168              		.loc 1 185 0
 1169 0560 0F23     		movs	r3, #15
 1170 0562 FB18     		adds	r3, r7, r3
 1171 0564 0022     		movs	r2, #0
 1172 0566 1A70     		strb	r2, [r3]
 1173 0568 1DE0     		b	.L71
 1174              	.L72:
 186:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****                 graphic_write_data(backBuffer[64+c*64 + i][j], controller);
 1175              		.loc 1 186 0 discriminator 3
 1176 056a 0D23     		movs	r3, #13
 1177 056c FB18     		adds	r3, r7, r3
 1178 056e 1B78     		ldrb	r3, [r3]
 1179 0570 0133     		adds	r3, r3, #1
 1180 0572 9A01     		lsls	r2, r3, #6
 1181 0574 0F24     		movs	r4, #15
 1182 0576 3B19     		adds	r3, r7, r4
 1183 0578 1B78     		ldrb	r3, [r3]
 1184 057a D218     		adds	r2, r2, r3
 1185 057c 0E23     		movs	r3, #14
 1186 057e FB18     		adds	r3, r7, r3
 1187 0580 1B78     		ldrb	r3, [r3]
 1188 0582 1849     		ldr	r1, .L75
 1189 0584 D200     		lsls	r2, r2, #3
 1190 0586 8A18     		adds	r2, r1, r2
 1191 0588 D25C     		ldrb	r2, [r2, r3]
 1192 058a FB1D     		adds	r3, r7, #7
 1193 058c 1B78     		ldrb	r3, [r3]
 1194 058e 1900     		movs	r1, r3
 1195 0590 1000     		movs	r0, r2
 1196 0592 FFF7FEFF 		bl	graphic_write_data
 185:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****             for(i = 0; i <= 63; i++, k++) {
 1197              		.loc 1 185 0 discriminator 3
 1198 0596 3B19     		adds	r3, r7, r4
 1199 0598 1A78     		ldrb	r2, [r3]
 1200 059a 3B19     		adds	r3, r7, r4
 1201 059c 0132     		adds	r2, r2, #1
 1202 059e 1A70     		strb	r2, [r3]
 1203 05a0 BB68     		ldr	r3, [r7, #8]
 1204 05a2 0133     		adds	r3, r3, #1
 1205 05a4 BB60     		str	r3, [r7, #8]
 1206              	.L71:
 185:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****             for(i = 0; i <= 63; i++, k++) {
 1207              		.loc 1 185 0 is_stmt 0 discriminator 1
 1208 05a6 0F23     		movs	r3, #15
 1209 05a8 FB18     		adds	r3, r7, r3
 1210 05aa 1B78     		ldrb	r3, [r3]
 1211 05ac 3F2B     		cmp	r3, #63
 1212 05ae DCD9     		bls	.L72
 182:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****             graphic_write_command(LCD_SET_PAGE | j, controller);
 1213              		.loc 1 182 0 is_stmt 1 discriminator 2
 1214 05b0 0E21     		movs	r1, #14
 1215 05b2 7B18     		adds	r3, r7, r1
 1216 05b4 1A78     		ldrb	r2, [r3]
 1217 05b6 7B18     		adds	r3, r7, r1
 1218 05b8 0132     		adds	r2, r2, #1
 1219 05ba 1A70     		strb	r2, [r3]
 1220              	.L70:
 182:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****             graphic_write_command(LCD_SET_PAGE | j, controller);
 1221              		.loc 1 182 0 is_stmt 0 discriminator 1
 1222 05bc 0E23     		movs	r3, #14
 1223 05be FB18     		adds	r3, r7, r3
 1224 05c0 1B78     		ldrb	r3, [r3]
 1225 05c2 072B     		cmp	r3, #7
 1226 05c4 B9D9     		bls	.L73
 180:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****         controller = (c == 0) ? B_CS1 : B_CS2;
 1227              		.loc 1 180 0 is_stmt 1 discriminator 2
 1228 05c6 0D21     		movs	r1, #13
 1229 05c8 7B18     		adds	r3, r7, r1
 1230 05ca 1A78     		ldrb	r2, [r3]
 1231 05cc 7B18     		adds	r3, r7, r1
 1232 05ce 0132     		adds	r2, r2, #1
 1233 05d0 1A70     		strb	r2, [r3]
 1234              	.L67:
 180:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****         controller = (c == 0) ? B_CS1 : B_CS2;
 1235              		.loc 1 180 0 is_stmt 0 discriminator 1
 1236 05d2 0D23     		movs	r3, #13
 1237 05d4 FB18     		adds	r3, r7, r3
 1238 05d6 1B78     		ldrb	r3, [r3]
 1239 05d8 012B     		cmp	r3, #1
 1240 05da 9FD9     		bls	.L74
 187:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****             }
 188:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****         }
 189:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****     }
 190:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c **** }
 1241              		.loc 1 190 0 is_stmt 1
 1242 05dc C046     		nop
 1243 05de BD46     		mov	sp, r7
 1244 05e0 05B0     		add	sp, sp, #20
 1245              		@ sp needed
 1246 05e2 90BD     		pop	{r4, r7, pc}
 1247              	.L76:
 1248              		.align	2
 1249              	.L75:
 1250 05e4 00000000 		.word	backBuffer
 1251              		.cfi_endproc
 1252              	.LFE15:
 1254              		.align	1
 1255              		.global	shiftRight
 1256              		.syntax unified
 1257              		.code	16
 1258              		.thumb_func
 1259              		.fpu softvfp
 1261              	shiftRight:
 1262              	.LFB16:
 191:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c **** 
 192:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c **** /*
 193:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c **** void pixel(int x, int y, int set) {
 194:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****     uint8_t mask, c, controller;
 195:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****     int index;
 196:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****     if((x < 1) || (y < 1) || (x > 128) || (y > 64)) return;
 197:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****     index = (y-1)/8;
 198:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****     
 199:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****     mask = 1 << ((y-1)%8);
 200:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****     
 201:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****     if(set == 0)
 202:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****         mask = ~mask;
 203:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****     if(x > 64){
 204:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****         controller = B_CS2;
 205:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****         x = x - 65;
 206:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****     } else {
 207:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****         controller = B_CS1;
 208:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****         x = x-1;
 209:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****     }
 210:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****     graphic_write_command(LCD_SET_ADD | x, controller );
 211:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****     graphic_write_command(LCD_SET_PAGE | index, controller );
 212:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****     c = graphic_read_data(controller);
 213:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****     graphic_write_command(LCD_SET_ADD | x, controller);
 214:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****     if(set)
 215:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****         mask = mask | c;
 216:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****     else
 217:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****         mask = mask & c;
 218:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****     graphic_write_data(mask, controller);
 219:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c **** }
 220:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c **** 
 221:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c **** 
 222:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c **** */
 223:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c **** 
 224:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c **** 
 225:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c **** void shiftRight(){
 1263              		.loc 1 225 0
 1264              		.cfi_startproc
 1265              		@ args = 0, pretend = 0, frame = 16
 1266              		@ frame_needed = 1, uses_anonymous_args = 0
 1267 05e8 80B5     		push	{r7, lr}
 1268              		.cfi_def_cfa_offset 8
 1269              		.cfi_offset 7, -8
 1270              		.cfi_offset 14, -4
 1271 05ea 84B0     		sub	sp, sp, #16
 1272              		.cfi_def_cfa_offset 24
 1273 05ec 00AF     		add	r7, sp, #0
 1274              		.cfi_def_cfa_register 7
 1275              	.LBB6:
 226:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c **** 	for(int i = 255; i > 0; i--){
 1276              		.loc 1 226 0
 1277 05ee FF23     		movs	r3, #255
 1278 05f0 FB60     		str	r3, [r7, #12]
 1279 05f2 1BE0     		b	.L78
 1280              	.L81:
 1281              	.LBB7:
 227:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c **** 		for(int j = 0; j < 8; j++){
 1282              		.loc 1 227 0
 1283 05f4 0023     		movs	r3, #0
 1284 05f6 BB60     		str	r3, [r7, #8]
 1285 05f8 12E0     		b	.L79
 1286              	.L80:
 228:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c **** 			backBuffer[i][j] = backBuffer[i-1][j];
 1287              		.loc 1 228 0 discriminator 3
 1288 05fa FB68     		ldr	r3, [r7, #12]
 1289 05fc 013B     		subs	r3, r3, #1
 1290 05fe 164A     		ldr	r2, .L84
 1291 0600 DB00     		lsls	r3, r3, #3
 1292 0602 D218     		adds	r2, r2, r3
 1293 0604 BB68     		ldr	r3, [r7, #8]
 1294 0606 D318     		adds	r3, r2, r3
 1295 0608 1978     		ldrb	r1, [r3]
 1296 060a 134A     		ldr	r2, .L84
 1297 060c FB68     		ldr	r3, [r7, #12]
 1298 060e DB00     		lsls	r3, r3, #3
 1299 0610 D218     		adds	r2, r2, r3
 1300 0612 BB68     		ldr	r3, [r7, #8]
 1301 0614 D318     		adds	r3, r2, r3
 1302 0616 0A1C     		adds	r2, r1, #0
 1303 0618 1A70     		strb	r2, [r3]
 227:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c **** 		for(int j = 0; j < 8; j++){
 1304              		.loc 1 227 0 discriminator 3
 1305 061a BB68     		ldr	r3, [r7, #8]
 1306 061c 0133     		adds	r3, r3, #1
 1307 061e BB60     		str	r3, [r7, #8]
 1308              	.L79:
 227:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c **** 		for(int j = 0; j < 8; j++){
 1309              		.loc 1 227 0 is_stmt 0 discriminator 1
 1310 0620 BB68     		ldr	r3, [r7, #8]
 1311 0622 072B     		cmp	r3, #7
 1312 0624 E9DD     		ble	.L80
 1313              	.LBE7:
 226:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c **** 	for(int i = 255; i > 0; i--){
 1314              		.loc 1 226 0 is_stmt 1 discriminator 2
 1315 0626 FB68     		ldr	r3, [r7, #12]
 1316 0628 013B     		subs	r3, r3, #1
 1317 062a FB60     		str	r3, [r7, #12]
 1318              	.L78:
 226:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c **** 	for(int i = 255; i > 0; i--){
 1319              		.loc 1 226 0 is_stmt 0 discriminator 1
 1320 062c FB68     		ldr	r3, [r7, #12]
 1321 062e 002B     		cmp	r3, #0
 1322 0630 E0DC     		bgt	.L81
 1323              	.LBE6:
 1324              	.LBB8:
 229:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c **** 		}
 230:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c **** 	}	
 231:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****     for(int j = 0; j < 8; j++){
 1325              		.loc 1 231 0 is_stmt 1
 1326 0632 0023     		movs	r3, #0
 1327 0634 7B60     		str	r3, [r7, #4]
 1328 0636 07E0     		b	.L82
 1329              	.L83:
 232:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****         backBuffer[0][j] = 0; 
 1330              		.loc 1 232 0 discriminator 3
 1331 0638 074A     		ldr	r2, .L84
 1332 063a 7B68     		ldr	r3, [r7, #4]
 1333 063c D318     		adds	r3, r2, r3
 1334 063e 0022     		movs	r2, #0
 1335 0640 1A70     		strb	r2, [r3]
 231:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****         backBuffer[0][j] = 0; 
 1336              		.loc 1 231 0 discriminator 3
 1337 0642 7B68     		ldr	r3, [r7, #4]
 1338 0644 0133     		adds	r3, r3, #1
 1339 0646 7B60     		str	r3, [r7, #4]
 1340              	.L82:
 231:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****         backBuffer[0][j] = 0; 
 1341              		.loc 1 231 0 is_stmt 0 discriminator 1
 1342 0648 7B68     		ldr	r3, [r7, #4]
 1343 064a 072B     		cmp	r3, #7
 1344 064c F4DD     		ble	.L83
 1345              	.LBE8:
 233:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****     }
 234:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c **** }
 1346              		.loc 1 234 0 is_stmt 1
 1347 064e C046     		nop
 1348 0650 BD46     		mov	sp, r7
 1349 0652 04B0     		add	sp, sp, #16
 1350              		@ sp needed
 1351 0654 80BD     		pop	{r7, pc}
 1352              	.L85:
 1353 0656 C046     		.align	2
 1354              	.L84:
 1355 0658 00000000 		.word	backBuffer
 1356              		.cfi_endproc
 1357              	.LFE16:
 1359              		.align	1
 1360              		.global	shiftLeft
 1361              		.syntax unified
 1362              		.code	16
 1363              		.thumb_func
 1364              		.fpu softvfp
 1366              	shiftLeft:
 1367              	.LFB17:
 235:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c **** void shiftLeft(){
 1368              		.loc 1 235 0
 1369              		.cfi_startproc
 1370              		@ args = 0, pretend = 0, frame = 16
 1371              		@ frame_needed = 1, uses_anonymous_args = 0
 1372 065c 80B5     		push	{r7, lr}
 1373              		.cfi_def_cfa_offset 8
 1374              		.cfi_offset 7, -8
 1375              		.cfi_offset 14, -4
 1376 065e 84B0     		sub	sp, sp, #16
 1377              		.cfi_def_cfa_offset 24
 1378 0660 00AF     		add	r7, sp, #0
 1379              		.cfi_def_cfa_register 7
 1380              	.LBB9:
 236:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c **** 	for(int i = 0; i < 255; i++){
 1381              		.loc 1 236 0
 1382 0662 0023     		movs	r3, #0
 1383 0664 FB60     		str	r3, [r7, #12]
 1384 0666 1BE0     		b	.L87
 1385              	.L90:
 1386              	.LBB10:
 237:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c **** 		for(int j = 0; j < 8; j++){
 1387              		.loc 1 237 0
 1388 0668 0023     		movs	r3, #0
 1389 066a BB60     		str	r3, [r7, #8]
 1390 066c 12E0     		b	.L88
 1391              	.L89:
 238:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c **** 			backBuffer[i][j] = backBuffer[i+1][j];
 1392              		.loc 1 238 0 discriminator 3
 1393 066e FB68     		ldr	r3, [r7, #12]
 1394 0670 0133     		adds	r3, r3, #1
 1395 0672 174A     		ldr	r2, .L93
 1396 0674 DB00     		lsls	r3, r3, #3
 1397 0676 D218     		adds	r2, r2, r3
 1398 0678 BB68     		ldr	r3, [r7, #8]
 1399 067a D318     		adds	r3, r2, r3
 1400 067c 1978     		ldrb	r1, [r3]
 1401 067e 144A     		ldr	r2, .L93
 1402 0680 FB68     		ldr	r3, [r7, #12]
 1403 0682 DB00     		lsls	r3, r3, #3
 1404 0684 D218     		adds	r2, r2, r3
 1405 0686 BB68     		ldr	r3, [r7, #8]
 1406 0688 D318     		adds	r3, r2, r3
 1407 068a 0A1C     		adds	r2, r1, #0
 1408 068c 1A70     		strb	r2, [r3]
 237:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c **** 		for(int j = 0; j < 8; j++){
 1409              		.loc 1 237 0 discriminator 3
 1410 068e BB68     		ldr	r3, [r7, #8]
 1411 0690 0133     		adds	r3, r3, #1
 1412 0692 BB60     		str	r3, [r7, #8]
 1413              	.L88:
 237:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c **** 		for(int j = 0; j < 8; j++){
 1414              		.loc 1 237 0 is_stmt 0 discriminator 1
 1415 0694 BB68     		ldr	r3, [r7, #8]
 1416 0696 072B     		cmp	r3, #7
 1417 0698 E9DD     		ble	.L89
 1418              	.LBE10:
 236:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c **** 	for(int i = 0; i < 255; i++){
 1419              		.loc 1 236 0 is_stmt 1 discriminator 2
 1420 069a FB68     		ldr	r3, [r7, #12]
 1421 069c 0133     		adds	r3, r3, #1
 1422 069e FB60     		str	r3, [r7, #12]
 1423              	.L87:
 236:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c **** 	for(int i = 0; i < 255; i++){
 1424              		.loc 1 236 0 is_stmt 0 discriminator 1
 1425 06a0 FB68     		ldr	r3, [r7, #12]
 1426 06a2 FE2B     		cmp	r3, #254
 1427 06a4 E0DD     		ble	.L90
 1428              	.LBE9:
 1429              	.LBB11:
 239:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c **** 		}
 240:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c **** 	}	
 241:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****     for(int j = 0; j < 8; j++){
 1430              		.loc 1 241 0 is_stmt 1
 1431 06a6 0023     		movs	r3, #0
 1432 06a8 7B60     		str	r3, [r7, #4]
 1433 06aa 0AE0     		b	.L91
 1434              	.L92:
 242:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****         backBuffer[255][j] = 0; 
 1435              		.loc 1 242 0 discriminator 3
 1436 06ac 0849     		ldr	r1, .L93
 1437 06ae FF23     		movs	r3, #255
 1438 06b0 DB00     		lsls	r3, r3, #3
 1439 06b2 7A68     		ldr	r2, [r7, #4]
 1440 06b4 8A18     		adds	r2, r1, r2
 1441 06b6 D318     		adds	r3, r2, r3
 1442 06b8 0022     		movs	r2, #0
 1443 06ba 1A70     		strb	r2, [r3]
 241:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****         backBuffer[255][j] = 0; 
 1444              		.loc 1 241 0 discriminator 3
 1445 06bc 7B68     		ldr	r3, [r7, #4]
 1446 06be 0133     		adds	r3, r3, #1
 1447 06c0 7B60     		str	r3, [r7, #4]
 1448              	.L91:
 241:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****         backBuffer[255][j] = 0; 
 1449              		.loc 1 241 0 is_stmt 0 discriminator 1
 1450 06c2 7B68     		ldr	r3, [r7, #4]
 1451 06c4 072B     		cmp	r3, #7
 1452 06c6 F1DD     		ble	.L92
 1453              	.LBE11:
 243:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c ****     }
 244:Z:/MOP/c-code/mop/SuperPedro\LcdAscii.c **** }...
 1454              		.loc 1 244 0 is_stmt 1
 1455 06c8 C046     		nop
 1456 06ca BD46     		mov	sp, r7
 1457 06cc 04B0     		add	sp, sp, #16
 1458              		@ sp needed
 1459 06ce 80BD     		pop	{r7, pc}
 1460              	.L94:
 1461              		.align	2
 1462              	.L93:
 1463 06d0 00000000 		.word	backBuffer
 1464              		.cfi_endproc
 1465              	.LFE17:
 1467              	.Letext0:
 1468              		.file 2 "c:\\cseapp\\codelite\\tools\\gcc-arm\\arm-none-eabi\\include\\machine\\_default_types.h"
 1469              		.file 3 "c:\\cseapp\\codelite\\tools\\gcc-arm\\arm-none-eabi\\include\\sys\\_stdint.h"
 1470              		.file 4 "Z:/MOP/c-code/mop/SuperPedro/gpio.h"
