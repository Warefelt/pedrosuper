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
  11              		.file	"main.c"
  12              		.text
  13              	.Ltext0:
  14              		.cfi_sections	.debug_frame
  15              		.section	.start_section,"ax",%progbits
  16              		.align	1
  17              		.global	startup
  18              		.syntax unified
  19              		.code	16
  20              		.thumb_func
  21              		.fpu softvfp
  23              	startup:
  24              	.LFB3:
  25              		.file 1 "Z:/MOP/c-code/mop/SuperPedro/main.c"
   1:Z:/MOP/c-code/mop/SuperPedro\main.c **** /*
   2:Z:/MOP/c-code/mop/SuperPedro\main.c ****  * 	startup.c
   3:Z:/MOP/c-code/mop/SuperPedro\main.c ****  *
   4:Z:/MOP/c-code/mop/SuperPedro\main.c ****  
   5:Z:/MOP/c-code/mop/SuperPedro\main.c **** 
   6:Z:/MOP/c-code/mop/SuperPedro\main.c **** 
   7:Z:/MOP/c-code/mop/SuperPedro\main.c **** #####TODO#####
   8:Z:/MOP/c-code/mop/SuperPedro\main.c **** 
   9:Z:/MOP/c-code/mop/SuperPedro\main.c **** -rightshift()
  10:Z:/MOP/c-code/mop/SuperPedro\main.c **** -fixa paprikorna? s.a ej upponer
  11:Z:/MOP/c-code/mop/SuperPedro\main.c **** -includes
  12:Z:/MOP/c-code/mop/SuperPedro\main.c ****  * app init
  13:Z:/MOP/c-code/mop/SuperPedro\main.c ****  * Pedro ska vända sig (spegelvänd bild) 
  14:Z:/MOP/c-code/mop/SuperPedro\main.c ****  * och byta mellan spritesen (animeras)
  15:Z:/MOP/c-code/mop/SuperPedro\main.c **** 
  16:Z:/MOP/c-code/mop/SuperPedro\main.c **** 
  17:Z:/MOP/c-code/mop/SuperPedro\main.c **** 
  18:Z:/MOP/c-code/mop/SuperPedro\main.c **** 
  19:Z:/MOP/c-code/mop/SuperPedro\main.c **** 
  20:Z:/MOP/c-code/mop/SuperPedro\main.c **** 
  21:Z:/MOP/c-code/mop/SuperPedro\main.c **** 
  22:Z:/MOP/c-code/mop/SuperPedro\main.c **** 
  23:Z:/MOP/c-code/mop/SuperPedro\main.c **** 
  24:Z:/MOP/c-code/mop/SuperPedro\main.c **** 
  25:Z:/MOP/c-code/mop/SuperPedro\main.c **** 
  26:Z:/MOP/c-code/mop/SuperPedro\main.c **** 
  27:Z:/MOP/c-code/mop/SuperPedro\main.c **** 
  28:Z:/MOP/c-code/mop/SuperPedro\main.c **** */
  29:Z:/MOP/c-code/mop/SuperPedro\main.c **** 
  30:Z:/MOP/c-code/mop/SuperPedro\main.c **** 
  31:Z:/MOP/c-code/mop/SuperPedro\main.c **** #include "titleScreen.h"
  32:Z:/MOP/c-code/mop/SuperPedro\main.c **** #include "delays.h"
  33:Z:/MOP/c-code/mop/SuperPedro\main.c **** #include "keyfuncs.h"
  34:Z:/MOP/c-code/mop/SuperPedro\main.c **** #include "lcdascii.h"
  35:Z:/MOP/c-code/mop/SuperPedro\main.c **** #include "gpio.h"
  36:Z:/MOP/c-code/mop/SuperPedro\main.c **** #include "pedro.h"
  37:Z:/MOP/c-code/mop/SuperPedro\main.c **** #include "randomNum.h"
  38:Z:/MOP/c-code/mop/SuperPedro\main.c **** 
  39:Z:/MOP/c-code/mop/SuperPedro\main.c **** #include <time.h>
  40:Z:/MOP/c-code/mop/SuperPedro\main.c **** #include <stdlib.h>
  41:Z:/MOP/c-code/mop/SuperPedro\main.c **** #include <stdio.h>
  42:Z:/MOP/c-code/mop/SuperPedro\main.c **** 
  43:Z:/MOP/c-code/mop/SuperPedro\main.c **** 
  44:Z:/MOP/c-code/mop/SuperPedro\main.c **** 
  45:Z:/MOP/c-code/mop/SuperPedro\main.c **** void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );
  46:Z:/MOP/c-code/mop/SuperPedro\main.c **** 
  47:Z:/MOP/c-code/mop/SuperPedro\main.c **** void startup ( void )
  48:Z:/MOP/c-code/mop/SuperPedro\main.c **** {
  26              		.loc 1 48 0
  27              		.cfi_startproc
  28              		@ Naked Function: prologue and epilogue provided by programmer.
  29              		@ args = 0, pretend = 0, frame = 0
  30              		@ frame_needed = 1, uses_anonymous_args = 0
  49:Z:/MOP/c-code/mop/SuperPedro\main.c **** __asm volatile(
  31              		.loc 1 49 0
  32              		.syntax divided
  33              	@ 49 "Z:/MOP/c-code/mop/SuperPedro/main.c" 1
  34 0000 0248     		 LDR R0,=0x2001C000
  35 0002 8546     	 MOV SP,R0
  36 0004 FFF7FEFF 	 BL main
  37 0008 FEE7     	_exit: B .
  38              	
  39              	@ 0 "" 2
  50:Z:/MOP/c-code/mop/SuperPedro\main.c **** 	" LDR R0,=0x2001C000\n"		/* set stack */
  51:Z:/MOP/c-code/mop/SuperPedro\main.c **** 	" MOV SP,R0\n"
  52:Z:/MOP/c-code/mop/SuperPedro\main.c **** 	" BL main\n"				/* call main */
  53:Z:/MOP/c-code/mop/SuperPedro\main.c **** 	"_exit: B .\n"				/* never return */
  54:Z:/MOP/c-code/mop/SuperPedro\main.c **** 	) ;
  55:Z:/MOP/c-code/mop/SuperPedro\main.c **** }
  40              		.loc 1 55 0
  41              		.thumb
  42              		.syntax unified
  43 000a C046     		nop
  44              		.cfi_endproc
  45              	.LFE3:
  47              		.comm	seed,4,4
  48              		.text
  49              		.align	1
  50              		.global	gpioInit
  51              		.syntax unified
  52              		.code	16
  53              		.thumb_func
  54              		.fpu softvfp
  56              	gpioInit:
  57              	.LFB4:
  56:Z:/MOP/c-code/mop/SuperPedro\main.c **** 
  57:Z:/MOP/c-code/mop/SuperPedro\main.c **** 
  58:Z:/MOP/c-code/mop/SuperPedro\main.c **** //GLOBALS
  59:Z:/MOP/c-code/mop/SuperPedro\main.c **** extern char backBuffer[256][8];
  60:Z:/MOP/c-code/mop/SuperPedro\main.c **** uint32_t seed;
  61:Z:/MOP/c-code/mop/SuperPedro\main.c **** 
  62:Z:/MOP/c-code/mop/SuperPedro\main.c **** //#define USBDM
  63:Z:/MOP/c-code/mop/SuperPedro\main.c **** #define NONSIMULATOR
  64:Z:/MOP/c-code/mop/SuperPedro\main.c **** 
  65:Z:/MOP/c-code/mop/SuperPedro\main.c **** void gpioInit(){
  58              		.loc 1 65 0
  59              		.cfi_startproc
  60              		@ args = 0, pretend = 0, frame = 0
  61              		@ frame_needed = 1, uses_anonymous_args = 0
  62 0000 80B5     		push	{r7, lr}
  63              		.cfi_def_cfa_offset 8
  64              		.cfi_offset 7, -8
  65              		.cfi_offset 14, -4
  66 0002 00AF     		add	r7, sp, #0
  67              		.cfi_def_cfa_register 7
  66:Z:/MOP/c-code/mop/SuperPedro\main.c **** 	
  67:Z:/MOP/c-code/mop/SuperPedro\main.c ****     GPIO_E->moder=0x55555555;		//------------------------------------------------------------------
  68              		.loc 1 67 0
  69 0004 104B     		ldr	r3, .L3
  70 0006 114A     		ldr	r2, .L3+4
  71 0008 1A60     		str	r2, [r3]
  68:Z:/MOP/c-code/mop/SuperPedro\main.c ****     GPIO_D->moder = 0x55005555;
  72              		.loc 1 68 0
  73 000a 114B     		ldr	r3, .L3+8
  74 000c 114A     		ldr	r2, .L3+12
  75 000e 1A60     		str	r2, [r3]
  69:Z:/MOP/c-code/mop/SuperPedro\main.c ****     
  70:Z:/MOP/c-code/mop/SuperPedro\main.c **** 	GPIO_D->otyper &= 0xFFFF00FF;
  76              		.loc 1 70 0
  77 0010 0F4B     		ldr	r3, .L3+8
  78 0012 5A68     		ldr	r2, [r3, #4]
  79 0014 0E4B     		ldr	r3, .L3+8
  80 0016 1049     		ldr	r1, .L3+16
  81 0018 0A40     		ands	r2, r1
  82 001a 5A60     		str	r2, [r3, #4]
  71:Z:/MOP/c-code/mop/SuperPedro\main.c **** 	GPIO_D->otyper |= 0x00000F00;
  83              		.loc 1 71 0
  84 001c 0C4B     		ldr	r3, .L3+8
  85 001e 5A68     		ldr	r2, [r3, #4]
  86 0020 0B4B     		ldr	r3, .L3+8
  87 0022 F021     		movs	r1, #240
  88 0024 0901     		lsls	r1, r1, #4
  89 0026 0A43     		orrs	r2, r1
  90 0028 5A60     		str	r2, [r3, #4]
  72:Z:/MOP/c-code/mop/SuperPedro\main.c **** 	// Sätter pinnar 4-0 till "pull-down"
  73:Z:/MOP/c-code/mop/SuperPedro\main.c **** 	GPIO_D->pupdr &= 0x0000FFFF;
  91              		.loc 1 73 0
  92 002a 094B     		ldr	r3, .L3+8
  93 002c DA68     		ldr	r2, [r3, #12]
  94 002e 084B     		ldr	r3, .L3+8
  95 0030 1204     		lsls	r2, r2, #16
  96 0032 120C     		lsrs	r2, r2, #16
  97 0034 DA60     		str	r2, [r3, #12]
  74:Z:/MOP/c-code/mop/SuperPedro\main.c **** 	GPIO_D->pupdr |= 0xFFAA0000;
  98              		.loc 1 74 0
  99 0036 064B     		ldr	r3, .L3+8
 100 0038 DA68     		ldr	r2, [r3, #12]
 101 003a 054B     		ldr	r3, .L3+8
 102 003c 0749     		ldr	r1, .L3+20
 103 003e 0A43     		orrs	r2, r1
 104 0040 DA60     		str	r2, [r3, #12]
  75:Z:/MOP/c-code/mop/SuperPedro\main.c **** 
  76:Z:/MOP/c-code/mop/SuperPedro\main.c **** }
 105              		.loc 1 76 0
 106 0042 C046     		nop
 107 0044 BD46     		mov	sp, r7
 108              		@ sp needed
 109 0046 80BD     		pop	{r7, pc}
 110              	.L4:
 111              		.align	2
 112              	.L3:
 113 0048 00100240 		.word	1073876992
 114 004c 55555555 		.word	1431655765
 115 0050 000C0240 		.word	1073875968
 116 0054 55550055 		.word	1426085205
 117 0058 FF00FFFF 		.word	-65281
 118 005c 0000AAFF 		.word	-5636096
 119              		.cfi_endproc
 120              	.LFE4:
 122              		.align	1
 123              		.global	init
 124              		.syntax unified
 125              		.code	16
 126              		.thumb_func
 127              		.fpu softvfp
 129              	init:
 130              	.LFB5:
  77:Z:/MOP/c-code/mop/SuperPedro\main.c **** 
  78:Z:/MOP/c-code/mop/SuperPedro\main.c **** 
  79:Z:/MOP/c-code/mop/SuperPedro\main.c **** 
  80:Z:/MOP/c-code/mop/SuperPedro\main.c **** void init(){
 131              		.loc 1 80 0
 132              		.cfi_startproc
 133              		@ args = 0, pretend = 0, frame = 0
 134              		@ frame_needed = 1, uses_anonymous_args = 0
 135 0060 80B5     		push	{r7, lr}
 136              		.cfi_def_cfa_offset 8
 137              		.cfi_offset 7, -8
 138              		.cfi_offset 14, -4
 139 0062 00AF     		add	r7, sp, #0
 140              		.cfi_def_cfa_register 7
  81:Z:/MOP/c-code/mop/SuperPedro\main.c ****     #ifdef USBDM
  82:Z:/MOP/c-code/mop/SuperPedro\main.c ****         *((unsigned long*)0x40023830)=0x18;
  83:Z:/MOP/c-code/mop/SuperPedro\main.c ****         *((unsigned long*)0x40023844)|=0x4000;
  84:Z:/MOP/c-code/mop/SuperPedro\main.c ****         //*((unsigned long*)0xE000ED08)=0x2001C000;
  85:Z:/MOP/c-code/mop/SuperPedro\main.c ****         __asm volatile( "LDR R0,=0x08000208\n" "BLX R0\n ");
  86:Z:/MOP/c-code/mop/SuperPedro\main.c ****     #endif
  87:Z:/MOP/c-code/mop/SuperPedro\main.c **** 	
  88:Z:/MOP/c-code/mop/SuperPedro\main.c ****     gpioInit();
 141              		.loc 1 88 0
 142 0064 FFF7FEFF 		bl	gpioInit
  89:Z:/MOP/c-code/mop/SuperPedro\main.c ****     
  90:Z:/MOP/c-code/mop/SuperPedro\main.c ****     ascii_init();
 143              		.loc 1 90 0
 144 0068 FFF7FEFF 		bl	ascii_init
  91:Z:/MOP/c-code/mop/SuperPedro\main.c ****     
  92:Z:/MOP/c-code/mop/SuperPedro\main.c ****     graphic_initialize();
 145              		.loc 1 92 0
 146 006c FFF7FEFF 		bl	graphic_initialize
  93:Z:/MOP/c-code/mop/SuperPedro\main.c ****     
  94:Z:/MOP/c-code/mop/SuperPedro\main.c ****     seed = 1337;
 147              		.loc 1 94 0
 148 0070 084B     		ldr	r3, .L6
 149 0072 094A     		ldr	r2, .L6+4
 150 0074 1A60     		str	r2, [r3]
  95:Z:/MOP/c-code/mop/SuperPedro\main.c ****     seedRng(&seed, seed);
 151              		.loc 1 95 0
 152 0076 074B     		ldr	r3, .L6
 153 0078 1A68     		ldr	r2, [r3]
 154 007a 064B     		ldr	r3, .L6
 155 007c 1100     		movs	r1, r2
 156 007e 1800     		movs	r0, r3
 157 0080 FFF7FEFF 		bl	seedRng
  96:Z:/MOP/c-code/mop/SuperPedro\main.c **** 
  97:Z:/MOP/c-code/mop/SuperPedro\main.c **** 	clear_backBuffer();
 158              		.loc 1 97 0
 159 0084 FFF7FEFF 		bl	clear_backBuffer
  98:Z:/MOP/c-code/mop/SuperPedro\main.c **** 	graphic_draw_screen();
 160              		.loc 1 98 0
 161 0088 FFF7FEFF 		bl	graphic_draw_screen
  99:Z:/MOP/c-code/mop/SuperPedro\main.c **** 
 100:Z:/MOP/c-code/mop/SuperPedro\main.c **** }
 162              		.loc 1 100 0
 163 008c C046     		nop
 164 008e BD46     		mov	sp, r7
 165              		@ sp needed
 166 0090 80BD     		pop	{r7, pc}
 167              	.L7:
 168 0092 C046     		.align	2
 169              	.L6:
 170 0094 00000000 		.word	seed
 171 0098 39050000 		.word	1337
 172              		.cfi_endproc
 173              	.LFE5:
 175              		.align	1
 176              		.global	loop
 177              		.syntax unified
 178              		.code	16
 179              		.thumb_func
 180              		.fpu softvfp
 182              	loop:
 183              	.LFB6:
 101:Z:/MOP/c-code/mop/SuperPedro\main.c **** 
 102:Z:/MOP/c-code/mop/SuperPedro\main.c **** 
 103:Z:/MOP/c-code/mop/SuperPedro\main.c **** 
 104:Z:/MOP/c-code/mop/SuperPedro\main.c **** 
 105:Z:/MOP/c-code/mop/SuperPedro\main.c **** 
 106:Z:/MOP/c-code/mop/SuperPedro\main.c **** 
 107:Z:/MOP/c-code/mop/SuperPedro\main.c **** 
 108:Z:/MOP/c-code/mop/SuperPedro\main.c **** 
 109:Z:/MOP/c-code/mop/SuperPedro\main.c **** 
 110:Z:/MOP/c-code/mop/SuperPedro\main.c **** 
 111:Z:/MOP/c-code/mop/SuperPedro\main.c **** 
 112:Z:/MOP/c-code/mop/SuperPedro\main.c **** void loop(){
 184              		.loc 1 112 0
 185              		.cfi_startproc
 186              		@ args = 0, pretend = 0, frame = 0
 187              		@ frame_needed = 1, uses_anonymous_args = 0
 188 009c 80B5     		push	{r7, lr}
 189              		.cfi_def_cfa_offset 8
 190              		.cfi_offset 7, -8
 191              		.cfi_offset 14, -4
 192 009e 00AF     		add	r7, sp, #0
 193              		.cfi_def_cfa_register 7
 194              	.L13:
 195              	.LBB2:
 113:Z:/MOP/c-code/mop/SuperPedro\main.c **** 	//(splash start)	
 114:Z:/MOP/c-code/mop/SuperPedro\main.c ****     /*
 115:Z:/MOP/c-code/mop/SuperPedro\main.c ****     while(1){
 116:Z:/MOP/c-code/mop/SuperPedro\main.c ****         if(keyb() != 0xFF){
 117:Z:/MOP/c-code/mop/SuperPedro\main.c ****             break;
 118:Z:/MOP/c-code/mop/SuperPedro\main.c ****         }
 119:Z:/MOP/c-code/mop/SuperPedro\main.c ****         drawTitleScreen();
 120:Z:/MOP/c-code/mop/SuperPedro\main.c ****     }    
 121:Z:/MOP/c-code/mop/SuperPedro\main.c ****     */
 122:Z:/MOP/c-code/mop/SuperPedro\main.c **** 	//
 123:Z:/MOP/c-code/mop/SuperPedro\main.c **** 	//	
 124:Z:/MOP/c-code/mop/SuperPedro\main.c ****     //drawGround(64, 191);
 125:Z:/MOP/c-code/mop/SuperPedro\main.c **** 	
 126:Z:/MOP/c-code/mop/SuperPedro\main.c **** 	while(1){
 127:Z:/MOP/c-code/mop/SuperPedro\main.c **** 		//
 128:Z:/MOP/c-code/mop/SuperPedro\main.c **** 		//ändra Pedros properties
 129:Z:/MOP/c-code/mop/SuperPedro\main.c **** 		if(getDistance() % 64 == 0 && getVelx < 0){
 196              		.loc 1 129 0
 197 00a0 FFF7FEFF 		bl	getDistance
 130:Z:/MOP/c-code/mop/SuperPedro\main.c **** 			loadNewLevelSegmentLeft();
 131:Z:/MOP/c-code/mop/SuperPedro\main.c **** 		}
 132:Z:/MOP/c-code/mop/SuperPedro\main.c **** 		if(getDistance() % 64 == 0 && getVelx >= 0){
 198              		.loc 1 132 0
 199 00a4 FFF7FEFF 		bl	getDistance
 200 00a8 0300     		movs	r3, r0
 201 00aa 1A00     		movs	r2, r3
 202 00ac 3F23     		movs	r3, #63
 203 00ae 1340     		ands	r3, r2
 204 00b0 01D1     		bne	.L9
 205              	.LBB3:
 133:Z:/MOP/c-code/mop/SuperPedro\main.c **** 			loadNewLevelSegmentRight();
 206              		.loc 1 133 0
 207 00b2 FFF7FEFF 		bl	loadNewLevelSegmentRight
 208              	.L9:
 209              	.LBE3:
 134:Z:/MOP/c-code/mop/SuperPedro\main.c **** 		}
 135:Z:/MOP/c-code/mop/SuperPedro\main.c **** 		
 136:Z:/MOP/c-code/mop/SuperPedro\main.c **** 		move();			//flyttar hela skärmen så det ser ut som att Pedro rör sig
 210              		.loc 1 136 0
 211 00b6 FFF7FEFF 		bl	move
 137:Z:/MOP/c-code/mop/SuperPedro\main.c ****         
 138:Z:/MOP/c-code/mop/SuperPedro\main.c ****         showDistance();
 212              		.loc 1 138 0
 213 00ba FFF7FEFF 		bl	showDistance
 139:Z:/MOP/c-code/mop/SuperPedro\main.c ****         
 140:Z:/MOP/c-code/mop/SuperPedro\main.c **** 		//win/loss
 141:Z:/MOP/c-code/mop/SuperPedro\main.c ****         
 142:Z:/MOP/c-code/mop/SuperPedro\main.c ****         if(isResetKey()){
 214              		.loc 1 142 0
 215 00be FFF7FEFF 		bl	isResetKey
 216 00c2 031E     		subs	r3, r0, #0
 217 00c4 03D0     		beq	.L10
 143:Z:/MOP/c-code/mop/SuperPedro\main.c ****             init();
 218              		.loc 1 143 0
 219 00c6 FFF7FEFF 		bl	init
 144:Z:/MOP/c-code/mop/SuperPedro\main.c ****             resetPedro();
 220              		.loc 1 144 0
 221 00ca FFF7FEFF 		bl	resetPedro
 222              	.L10:
 145:Z:/MOP/c-code/mop/SuperPedro\main.c ****         }
 146:Z:/MOP/c-code/mop/SuperPedro\main.c **** 		if(touchesPepper() == 1){
 223              		.loc 1 146 0
 224 00ce FFF7FEFF 		bl	touchesPepper
 225 00d2 0300     		movs	r3, r0
 226 00d4 012B     		cmp	r3, #1
 227 00d6 E3D1     		bne	.L13
 147:Z:/MOP/c-code/mop/SuperPedro\main.c ****             init();
 228              		.loc 1 147 0
 229 00d8 FFF7FEFF 		bl	init
 148:Z:/MOP/c-code/mop/SuperPedro\main.c ****             resetPedro();
 230              		.loc 1 148 0
 231 00dc FFF7FEFF 		bl	resetPedro
 149:Z:/MOP/c-code/mop/SuperPedro\main.c **** 			break;		//startar om spelet från början
 232              		.loc 1 149 0
 233 00e0 C046     		nop
 234              	.LBE2:
 150:Z:/MOP/c-code/mop/SuperPedro\main.c **** 		}
 151:Z:/MOP/c-code/mop/SuperPedro\main.c **** 		/*if(Pedro.distance == ){
 152:Z:/MOP/c-code/mop/SuperPedro\main.c **** 			onWin();
 153:Z:/MOP/c-code/mop/SuperPedro\main.c **** 		}*/
 154:Z:/MOP/c-code/mop/SuperPedro\main.c **** 	}
 155:Z:/MOP/c-code/mop/SuperPedro\main.c **** 	
 156:Z:/MOP/c-code/mop/SuperPedro\main.c **** }
 235              		.loc 1 156 0
 236 00e2 C046     		nop
 237 00e4 BD46     		mov	sp, r7
 238              		@ sp needed
 239 00e6 80BD     		pop	{r7, pc}
 240              		.cfi_endproc
 241              	.LFE6:
 243              		.align	1
 244              		.global	loadNewLevelSegmentLeft
 245              		.syntax unified
 246              		.code	16
 247              		.thumb_func
 248              		.fpu softvfp
 250              	loadNewLevelSegmentLeft:
 251              	.LFB7:
 157:Z:/MOP/c-code/mop/SuperPedro\main.c **** 
 158:Z:/MOP/c-code/mop/SuperPedro\main.c **** 
 159:Z:/MOP/c-code/mop/SuperPedro\main.c **** 
 160:Z:/MOP/c-code/mop/SuperPedro\main.c **** void loadNewLevelSegmentLeft(){
 252              		.loc 1 160 0
 253              		.cfi_startproc
 254              		@ args = 0, pretend = 0, frame = 0
 255              		@ frame_needed = 1, uses_anonymous_args = 0
 256 00e8 80B5     		push	{r7, lr}
 257              		.cfi_def_cfa_offset 8
 258              		.cfi_offset 7, -8
 259              		.cfi_offset 14, -4
 260 00ea 00AF     		add	r7, sp, #0
 261              		.cfi_def_cfa_register 7
 161:Z:/MOP/c-code/mop/SuperPedro\main.c ****     loadLvl(0);  //64px wide
 262              		.loc 1 161 0
 263 00ec 0020     		movs	r0, #0
 264 00ee FFF7FEFF 		bl	loadLvl
 162:Z:/MOP/c-code/mop/SuperPedro\main.c **** }
 265              		.loc 1 162 0
 266 00f2 C046     		nop
 267 00f4 BD46     		mov	sp, r7
 268              		@ sp needed
 269 00f6 80BD     		pop	{r7, pc}
 270              		.cfi_endproc
 271              	.LFE7:
 273              		.align	1
 274              		.global	loadNewLevelSegmentRight
 275              		.syntax unified
 276              		.code	16
 277              		.thumb_func
 278              		.fpu softvfp
 280              	loadNewLevelSegmentRight:
 281              	.LFB8:
 163:Z:/MOP/c-code/mop/SuperPedro\main.c **** 
 164:Z:/MOP/c-code/mop/SuperPedro\main.c **** void loadNewLevelSegmentRight(){
 282              		.loc 1 164 0
 283              		.cfi_startproc
 284              		@ args = 0, pretend = 0, frame = 0
 285              		@ frame_needed = 1, uses_anonymous_args = 0
 286 00f8 80B5     		push	{r7, lr}
 287              		.cfi_def_cfa_offset 8
 288              		.cfi_offset 7, -8
 289              		.cfi_offset 14, -4
 290 00fa 00AF     		add	r7, sp, #0
 291              		.cfi_def_cfa_register 7
 165:Z:/MOP/c-code/mop/SuperPedro\main.c ****     loadLvl(192);
 292              		.loc 1 165 0
 293 00fc C020     		movs	r0, #192
 294 00fe FFF7FEFF 		bl	loadLvl
 166:Z:/MOP/c-code/mop/SuperPedro\main.c **** }
 295              		.loc 1 166 0
 296 0102 C046     		nop
 297 0104 BD46     		mov	sp, r7
 298              		@ sp needed
 299 0106 80BD     		pop	{r7, pc}
 300              		.cfi_endproc
 301              	.LFE8:
 303              		.section	.rodata
 304              		.align	2
 305              	.LC0:
 306 0000 F8       		.byte	-8
 307 0001 07       		.byte	7
 308 0002 0C       		.byte	12
 309 0003 1C       		.byte	28
 310 0004 04       		.byte	4
 311 0005 30       		.byte	48
 312 0006 0C       		.byte	12
 313 0007 E0       		.byte	-32
 314 0008 E8       		.byte	-24
 315 0009 87       		.byte	-121
 316 000a 1C       		.byte	28
 317 000b D8       		.byte	-40
 318 000c 06       		.byte	6
 319 000d 60       		.byte	96
 320 000e 07       		.byte	7
 321 000f 20       		.byte	32
 322 0010 0F       		.byte	15
 323 0011 20       		.byte	32
 324 0012 0B       		.byte	11
 325 0013 60       		.byte	96
 326 0014 39       		.byte	57
 327 0015 D0       		.byte	-48
 328 0016 CD       		.byte	-51
 329 0017 8F       		.byte	-113
 330 0018 04       		.byte	4
 331 0019 C0       		.byte	-64
 332 001a 04       		.byte	4
 333 001b 60       		.byte	96
 334 001c 0C       		.byte	12
 335 001d 30       		.byte	48
 336 001e F8       		.byte	-8
 337 001f 1F       		.byte	31
 338              		.text
 339              		.align	1
 340              		.global	loadPepperAt
 341              		.syntax unified
 342              		.code	16
 343              		.thumb_func
 344              		.fpu softvfp
 346              	loadPepperAt:
 347              	.LFB9:
 167:Z:/MOP/c-code/mop/SuperPedro\main.c **** 
 168:Z:/MOP/c-code/mop/SuperPedro\main.c **** 
 169:Z:/MOP/c-code/mop/SuperPedro\main.c **** //bör fungera
 170:Z:/MOP/c-code/mop/SuperPedro\main.c **** void loadPepperAt(int addr, int page){
 348              		.loc 1 170 0
 349              		.cfi_startproc
 350              		@ args = 0, pretend = 0, frame = 48
 351              		@ frame_needed = 1, uses_anonymous_args = 0
 352 0108 90B5     		push	{r4, r7, lr}
 353              		.cfi_def_cfa_offset 12
 354              		.cfi_offset 4, -12
 355              		.cfi_offset 7, -8
 356              		.cfi_offset 14, -4
 357 010a 8DB0     		sub	sp, sp, #52
 358              		.cfi_def_cfa_offset 64
 359 010c 00AF     		add	r7, sp, #0
 360              		.cfi_def_cfa_register 7
 361 010e 7860     		str	r0, [r7, #4]
 362 0110 3960     		str	r1, [r7]
 171:Z:/MOP/c-code/mop/SuperPedro\main.c **** 		char b[][2]= 
 363              		.loc 1 171 0
 364 0112 0823     		movs	r3, #8
 365 0114 FB18     		adds	r3, r7, r3
 366 0116 174A     		ldr	r2, .L22
 367 0118 13CA     		ldmia	r2!, {r0, r1, r4}
 368 011a 13C3     		stmia	r3!, {r0, r1, r4}
 369 011c 13CA     		ldmia	r2!, {r0, r1, r4}
 370 011e 13C3     		stmia	r3!, {r0, r1, r4}
 371 0120 03CA     		ldmia	r2!, {r0, r1}
 372 0122 03C3     		stmia	r3!, {r0, r1}
 373              	.LBB4:
 172:Z:/MOP/c-code/mop/SuperPedro\main.c **** 				{
 173:Z:/MOP/c-code/mop/SuperPedro\main.c **** 				{0b11111000, 0b00000111}, 
 174:Z:/MOP/c-code/mop/SuperPedro\main.c **** 				{0b00001100, 0b00011100}, 
 175:Z:/MOP/c-code/mop/SuperPedro\main.c **** 				{0b00000100, 0b00110000},
 176:Z:/MOP/c-code/mop/SuperPedro\main.c **** 				{0b00001100, 0b11100000},
 177:Z:/MOP/c-code/mop/SuperPedro\main.c **** 				{0b11101000, 0b10000111},
 178:Z:/MOP/c-code/mop/SuperPedro\main.c **** 				{0b00011100, 0b11011000},
 179:Z:/MOP/c-code/mop/SuperPedro\main.c **** 				{0b00000110, 0b01100000}, 
 180:Z:/MOP/c-code/mop/SuperPedro\main.c **** 				{0b00000111, 0b00100000},
 181:Z:/MOP/c-code/mop/SuperPedro\main.c **** 				{0b00001111, 0b00100000},
 182:Z:/MOP/c-code/mop/SuperPedro\main.c **** 				{0b00001011, 0b01100000},
 183:Z:/MOP/c-code/mop/SuperPedro\main.c **** 				{0b00111001, 0b11010000}, 
 184:Z:/MOP/c-code/mop/SuperPedro\main.c **** 				{0b11001101, 0b10001111},
 185:Z:/MOP/c-code/mop/SuperPedro\main.c **** 				{0b00000100, 0b11000000}, 
 186:Z:/MOP/c-code/mop/SuperPedro\main.c **** 				{0b00000100, 0b01100000},
 187:Z:/MOP/c-code/mop/SuperPedro\main.c **** 				{0b00001100, 0b00110000},
 188:Z:/MOP/c-code/mop/SuperPedro\main.c **** 				{0b11111000, 0b00011111}
 189:Z:/MOP/c-code/mop/SuperPedro\main.c **** 				};
 190:Z:/MOP/c-code/mop/SuperPedro\main.c ****      
 191:Z:/MOP/c-code/mop/SuperPedro\main.c **** 		for(int j = 0; j < 2; j++){
 374              		.loc 1 191 0
 375 0124 0023     		movs	r3, #0
 376 0126 FB62     		str	r3, [r7, #44]
 377 0128 1CE0     		b	.L18
 378              	.L21:
 379              	.LBB5:
 192:Z:/MOP/c-code/mop/SuperPedro\main.c **** 			for(int i = 0; i < 16; i++){
 380              		.loc 1 192 0
 381 012a 0023     		movs	r3, #0
 382 012c BB62     		str	r3, [r7, #40]
 383 012e 13E0     		b	.L19
 384              	.L20:
 193:Z:/MOP/c-code/mop/SuperPedro\main.c **** 				byteToBuffer(addr + i, page + j, b[i][j]);
 385              		.loc 1 193 0 discriminator 3
 386 0130 7A68     		ldr	r2, [r7, #4]
 387 0132 BB6A     		ldr	r3, [r7, #40]
 388 0134 D018     		adds	r0, r2, r3
 389 0136 3A68     		ldr	r2, [r7]
 390 0138 FB6A     		ldr	r3, [r7, #44]
 391 013a D118     		adds	r1, r2, r3
 392 013c 0823     		movs	r3, #8
 393 013e FA18     		adds	r2, r7, r3
 394 0140 BB6A     		ldr	r3, [r7, #40]
 395 0142 5B00     		lsls	r3, r3, #1
 396 0144 D218     		adds	r2, r2, r3
 397 0146 FB6A     		ldr	r3, [r7, #44]
 398 0148 D318     		adds	r3, r2, r3
 399 014a 1B78     		ldrb	r3, [r3]
 400 014c 1A00     		movs	r2, r3
 401 014e FFF7FEFF 		bl	byteToBuffer
 192:Z:/MOP/c-code/mop/SuperPedro\main.c **** 			for(int i = 0; i < 16; i++){
 402              		.loc 1 192 0 discriminator 3
 403 0152 BB6A     		ldr	r3, [r7, #40]
 404 0154 0133     		adds	r3, r3, #1
 405 0156 BB62     		str	r3, [r7, #40]
 406              	.L19:
 192:Z:/MOP/c-code/mop/SuperPedro\main.c **** 			for(int i = 0; i < 16; i++){
 407              		.loc 1 192 0 is_stmt 0 discriminator 1
 408 0158 BB6A     		ldr	r3, [r7, #40]
 409 015a 0F2B     		cmp	r3, #15
 410 015c E8DD     		ble	.L20
 411              	.LBE5:
 191:Z:/MOP/c-code/mop/SuperPedro\main.c **** 			for(int i = 0; i < 16; i++){
 412              		.loc 1 191 0 is_stmt 1 discriminator 2
 413 015e FB6A     		ldr	r3, [r7, #44]
 414 0160 0133     		adds	r3, r3, #1
 415 0162 FB62     		str	r3, [r7, #44]
 416              	.L18:
 191:Z:/MOP/c-code/mop/SuperPedro\main.c **** 			for(int i = 0; i < 16; i++){
 417              		.loc 1 191 0 is_stmt 0 discriminator 1
 418 0164 FB6A     		ldr	r3, [r7, #44]
 419 0166 012B     		cmp	r3, #1
 420 0168 DFDD     		ble	.L21
 421              	.LBE4:
 194:Z:/MOP/c-code/mop/SuperPedro\main.c **** 			}
 195:Z:/MOP/c-code/mop/SuperPedro\main.c **** 		}
 196:Z:/MOP/c-code/mop/SuperPedro\main.c **** }
 422              		.loc 1 196 0 is_stmt 1
 423 016a C046     		nop
 424 016c BD46     		mov	sp, r7
 425 016e 0DB0     		add	sp, sp, #52
 426              		@ sp needed
 427 0170 90BD     		pop	{r4, r7, pc}
 428              	.L23:
 429 0172 C046     		.align	2
 430              	.L22:
 431 0174 00000000 		.word	.LC0
 432              		.cfi_endproc
 433              	.LFE9:
 435              		.align	1
 436              		.global	loadPepperStrip
 437              		.syntax unified
 438              		.code	16
 439              		.thumb_func
 440              		.fpu softvfp
 442              	loadPepperStrip:
 443              	.LFB10:
 197:Z:/MOP/c-code/mop/SuperPedro\main.c **** 
 198:Z:/MOP/c-code/mop/SuperPedro\main.c **** 
 199:Z:/MOP/c-code/mop/SuperPedro\main.c **** //bör fungera
 200:Z:/MOP/c-code/mop/SuperPedro\main.c **** void loadPepperStrip(int start, char type){
 444              		.loc 1 200 0
 445              		.cfi_startproc
 446              		@ args = 0, pretend = 0, frame = 8
 447              		@ frame_needed = 1, uses_anonymous_args = 0
 448 0178 80B5     		push	{r7, lr}
 449              		.cfi_def_cfa_offset 8
 450              		.cfi_offset 7, -8
 451              		.cfi_offset 14, -4
 452 017a 82B0     		sub	sp, sp, #8
 453              		.cfi_def_cfa_offset 16
 454 017c 00AF     		add	r7, sp, #0
 455              		.cfi_def_cfa_register 7
 456 017e 7860     		str	r0, [r7, #4]
 457 0180 0A00     		movs	r2, r1
 458 0182 FB1C     		adds	r3, r7, #3
 459 0184 1A70     		strb	r2, [r3]
 201:Z:/MOP/c-code/mop/SuperPedro\main.c **** 	
 202:Z:/MOP/c-code/mop/SuperPedro\main.c **** 	switch(type){
 460              		.loc 1 202 0
 461 0186 FB1C     		adds	r3, r7, #3
 462 0188 1B78     		ldrb	r3, [r3]
 463 018a 5F2B     		cmp	r3, #95
 464 018c 15D0     		beq	.L29
 465 018e 6F2B     		cmp	r3, #111
 466 0190 02D0     		beq	.L27
 467 0192 382B     		cmp	r3, #56
 468 0194 06D0     		beq	.L28
 203:Z:/MOP/c-code/mop/SuperPedro\main.c **** 		case '_': 
 204:Z:/MOP/c-code/mop/SuperPedro\main.c **** 			break;
 205:Z:/MOP/c-code/mop/SuperPedro\main.c **** 		case 'o': 
 206:Z:/MOP/c-code/mop/SuperPedro\main.c **** 			loadPepperAt(start, 6);
 207:Z:/MOP/c-code/mop/SuperPedro\main.c **** 			break;
 208:Z:/MOP/c-code/mop/SuperPedro\main.c **** 		case '8':
 209:Z:/MOP/c-code/mop/SuperPedro\main.c **** 			loadPepperAt(start, 6);
 210:Z:/MOP/c-code/mop/SuperPedro\main.c **** 			loadPepperAt(start, 4);
 211:Z:/MOP/c-code/mop/SuperPedro\main.c **** 			break;
 212:Z:/MOP/c-code/mop/SuperPedro\main.c **** 			
 213:Z:/MOP/c-code/mop/SuperPedro\main.c **** 	}
 214:Z:/MOP/c-code/mop/SuperPedro\main.c **** }
 469              		.loc 1 214 0
 470 0196 11E0     		b	.L30
 471              	.L27:
 206:Z:/MOP/c-code/mop/SuperPedro\main.c **** 			break;
 472              		.loc 1 206 0
 473 0198 7B68     		ldr	r3, [r7, #4]
 474 019a 0621     		movs	r1, #6
 475 019c 1800     		movs	r0, r3
 476 019e FFF7FEFF 		bl	loadPepperAt
 207:Z:/MOP/c-code/mop/SuperPedro\main.c **** 		case '8':
 477              		.loc 1 207 0
 478 01a2 0BE0     		b	.L25
 479              	.L28:
 209:Z:/MOP/c-code/mop/SuperPedro\main.c **** 			loadPepperAt(start, 4);
 480              		.loc 1 209 0
 481 01a4 7B68     		ldr	r3, [r7, #4]
 482 01a6 0621     		movs	r1, #6
 483 01a8 1800     		movs	r0, r3
 484 01aa FFF7FEFF 		bl	loadPepperAt
 210:Z:/MOP/c-code/mop/SuperPedro\main.c **** 			break;
 485              		.loc 1 210 0
 486 01ae 7B68     		ldr	r3, [r7, #4]
 487 01b0 0421     		movs	r1, #4
 488 01b2 1800     		movs	r0, r3
 489 01b4 FFF7FEFF 		bl	loadPepperAt
 211:Z:/MOP/c-code/mop/SuperPedro\main.c **** 			
 490              		.loc 1 211 0
 491 01b8 00E0     		b	.L25
 492              	.L29:
 204:Z:/MOP/c-code/mop/SuperPedro\main.c **** 		case 'o': 
 493              		.loc 1 204 0
 494 01ba C046     		nop
 495              	.L25:
 496              	.L30:
 497              		.loc 1 214 0
 498 01bc C046     		nop
 499 01be BD46     		mov	sp, r7
 500 01c0 02B0     		add	sp, sp, #8
 501              		@ sp needed
 502 01c2 80BD     		pop	{r7, pc}
 503              		.cfi_endproc
 504              	.LFE10:
 506              		.global	__aeabi_uidivmod
 507              		.section	.rodata
 508              		.align	2
 509              	.LC1:
 510 0020 5F5F5F5F 		.ascii	"____"
 511 0024 5F6F6F5F 		.ascii	"_oo_"
 512 0028 5F385F5F 		.ascii	"_8__"
 513 002c 5F6F5F6F 		.ascii	"_o_o"
 514 0030 6F5F5F6F 		.ascii	"o__o"
 515 0034 5F6F5F5F 		.ascii	"_o__"
 516 0038 5F5F385F 		.ascii	"__8_"
 517 003c 5F6F385F 		.ascii	"_o8_"
 518 0040 5F5F6F5F 		.ascii	"__o_"
 519 0044 5F5F5F5F 		.ascii	"____"
 520 0048 5F5F5F5F 		.ascii	"____"
 521 004c 6F5F5F5F 		.ascii	"o___"
 522 0050 5F5F5F6F 		.ascii	"___o"
 523 0054 6F5F6F5F 		.ascii	"o_o_"
 524 0058 5F386F5F 		.ascii	"_8o_"
 525 005c 5F6F5F5F 		.ascii	"_o__"
 526 0060 5F5F6F5F 		.ascii	"__o_"
 527 0064 6F5F5F5F 		.ascii	"o___"
 528 0068 5F5F5F6F 		.ascii	"___o"
 529 006c 5F5F5F5F 		.ascii	"____"
 530              		.text
 531              		.align	1
 532              		.global	loadLvl
 533              		.syntax unified
 534              		.code	16
 535              		.thumb_func
 536              		.fpu softvfp
 538              	loadLvl:
 539              	.LFB11:
 215:Z:/MOP/c-code/mop/SuperPedro\main.c **** 
 216:Z:/MOP/c-code/mop/SuperPedro\main.c **** 
 217:Z:/MOP/c-code/mop/SuperPedro\main.c **** void loadLvl(int start){        //loads a 64px wide levelstrip of new peppers into the backBuffer (
 540              		.loc 1 217 0
 541              		.cfi_startproc
 542              		@ args = 0, pretend = 0, frame = 96
 543              		@ frame_needed = 1, uses_anonymous_args = 0
 544 01c4 80B5     		push	{r7, lr}
 545              		.cfi_def_cfa_offset 8
 546              		.cfi_offset 7, -8
 547              		.cfi_offset 14, -4
 548 01c6 98B0     		sub	sp, sp, #96
 549              		.cfi_def_cfa_offset 104
 550 01c8 00AF     		add	r7, sp, #0
 551              		.cfi_def_cfa_register 7
 552 01ca 7860     		str	r0, [r7, #4]
 218:Z:/MOP/c-code/mop/SuperPedro\main.c **** 	//int seed = getDistance();
 219:Z:/MOP/c-code/mop/SuperPedro\main.c ****     int rand = (nextRnd(&seed) % 19);
 553              		.loc 1 219 0
 554 01cc 174B     		ldr	r3, .L34
 555 01ce 1800     		movs	r0, r3
 556 01d0 FFF7FEFF 		bl	nextRnd
 557 01d4 0300     		movs	r3, r0
 558 01d6 1321     		movs	r1, #19
 559 01d8 1800     		movs	r0, r3
 560 01da FFF7FEFF 		bl	__aeabi_uidivmod
 561              	.LVL0:
 562 01de 0B00     		movs	r3, r1
 563 01e0 BB65     		str	r3, [r7, #88]
 220:Z:/MOP/c-code/mop/SuperPedro\main.c **** 	//int type = nextRnd() % 20;      // Returns a pseudo-random integer between 0 and 10, några olik
 221:Z:/MOP/c-code/mop/SuperPedro\main.c ****     char PepperStrips[][4] = { "____", "_oo_", "_8__", "_o_o", "o__o", "_o__", "__8_", "_o8_", "__o
 564              		.loc 1 221 0
 565 01e2 0823     		movs	r3, #8
 566 01e4 FA18     		adds	r2, r7, r3
 567 01e6 124B     		ldr	r3, .L34+4
 568 01e8 1000     		movs	r0, r2
 569 01ea 1900     		movs	r1, r3
 570 01ec 5023     		movs	r3, #80
 571 01ee 1A00     		movs	r2, r3
 572 01f0 FFF7FEFF 		bl	memcpy
 573              	.LBB6:
 222:Z:/MOP/c-code/mop/SuperPedro\main.c **** 	
 223:Z:/MOP/c-code/mop/SuperPedro\main.c **** 	
 224:Z:/MOP/c-code/mop/SuperPedro\main.c **** 	for(int i = 0; i < 4; i++){
 574              		.loc 1 224 0
 575 01f4 0023     		movs	r3, #0
 576 01f6 FB65     		str	r3, [r7, #92]
 577 01f8 11E0     		b	.L32
 578              	.L33:
 225:Z:/MOP/c-code/mop/SuperPedro\main.c **** 		loadPepperStrip(start + i*16, PepperStrips[rand][i]);
 579              		.loc 1 225 0 discriminator 3
 580 01fa FB6D     		ldr	r3, [r7, #92]
 581 01fc 1A01     		lsls	r2, r3, #4
 582 01fe 7B68     		ldr	r3, [r7, #4]
 583 0200 D018     		adds	r0, r2, r3
 584 0202 0823     		movs	r3, #8
 585 0204 FA18     		adds	r2, r7, r3
 586 0206 BB6D     		ldr	r3, [r7, #88]
 587 0208 9B00     		lsls	r3, r3, #2
 588 020a D218     		adds	r2, r2, r3
 589 020c FB6D     		ldr	r3, [r7, #92]
 590 020e D318     		adds	r3, r2, r3
 591 0210 1B78     		ldrb	r3, [r3]
 592 0212 1900     		movs	r1, r3
 593 0214 FFF7FEFF 		bl	loadPepperStrip
 224:Z:/MOP/c-code/mop/SuperPedro\main.c **** 		loadPepperStrip(start + i*16, PepperStrips[rand][i]);
 594              		.loc 1 224 0 discriminator 3
 595 0218 FB6D     		ldr	r3, [r7, #92]
 596 021a 0133     		adds	r3, r3, #1
 597 021c FB65     		str	r3, [r7, #92]
 598              	.L32:
 224:Z:/MOP/c-code/mop/SuperPedro\main.c **** 		loadPepperStrip(start + i*16, PepperStrips[rand][i]);
 599              		.loc 1 224 0 is_stmt 0 discriminator 1
 600 021e FB6D     		ldr	r3, [r7, #92]
 601 0220 032B     		cmp	r3, #3
 602 0222 EADD     		ble	.L33
 603              	.LBE6:
 226:Z:/MOP/c-code/mop/SuperPedro\main.c **** 	}
 227:Z:/MOP/c-code/mop/SuperPedro\main.c **** 	//drawGround(start, start+63);
 228:Z:/MOP/c-code/mop/SuperPedro\main.c ****     
 229:Z:/MOP/c-code/mop/SuperPedro\main.c **** }
 604              		.loc 1 229 0 is_stmt 1
 605 0224 C046     		nop
 606 0226 BD46     		mov	sp, r7
 607 0228 18B0     		add	sp, sp, #96
 608              		@ sp needed
 609 022a 80BD     		pop	{r7, pc}
 610              	.L35:
 611              		.align	2
 612              	.L34:
 613 022c 00000000 		.word	seed
 614 0230 20000000 		.word	.LC1
 615              		.cfi_endproc
 616              	.LFE11:
 618              		.align	1
 619              		.global	onWin
 620              		.syntax unified
 621              		.code	16
 622              		.thumb_func
 623              		.fpu softvfp
 625              	onWin:
 626              	.LFB12:
 230:Z:/MOP/c-code/mop/SuperPedro\main.c **** 
 231:Z:/MOP/c-code/mop/SuperPedro\main.c **** /*
 232:Z:/MOP/c-code/mop/SuperPedro\main.c **** void drawGround(int from, int to){
 233:Z:/MOP/c-code/mop/SuperPedro\main.c ****     char c = 0b10000000;
 234:Z:/MOP/c-code/mop/SuperPedro\main.c ****     for(from; from <= to; from++){
 235:Z:/MOP/c-code/mop/SuperPedro\main.c ****         backBuffer[from][7] |= c;
 236:Z:/MOP/c-code/mop/SuperPedro\main.c ****     }
 237:Z:/MOP/c-code/mop/SuperPedro\main.c **** }
 238:Z:/MOP/c-code/mop/SuperPedro\main.c **** */
 239:Z:/MOP/c-code/mop/SuperPedro\main.c **** 
 240:Z:/MOP/c-code/mop/SuperPedro\main.c **** 
 241:Z:/MOP/c-code/mop/SuperPedro\main.c **** void onWin(){
 627              		.loc 1 241 0
 628              		.cfi_startproc
 629              		@ args = 0, pretend = 0, frame = 0
 630              		@ frame_needed = 1, uses_anonymous_args = 0
 631 0234 80B5     		push	{r7, lr}
 632              		.cfi_def_cfa_offset 8
 633              		.cfi_offset 7, -8
 634              		.cfi_offset 14, -4
 635 0236 00AF     		add	r7, sp, #0
 636              		.cfi_def_cfa_register 7
 242:Z:/MOP/c-code/mop/SuperPedro\main.c **** 	//ska vi ha med denna?
 243:Z:/MOP/c-code/mop/SuperPedro\main.c **** }
 637              		.loc 1 243 0
 638 0238 C046     		nop
 639 023a BD46     		mov	sp, r7
 640              		@ sp needed
 641 023c 80BD     		pop	{r7, pc}
 642              		.cfi_endproc
 643              	.LFE12:
 645              		.align	1
 646              		.global	showDistance
 647              		.syntax unified
 648              		.code	16
 649              		.thumb_func
 650              		.fpu softvfp
 652              	showDistance:
 653              	.LFB13:
 244:Z:/MOP/c-code/mop/SuperPedro\main.c **** 
 245:Z:/MOP/c-code/mop/SuperPedro\main.c **** 
 246:Z:/MOP/c-code/mop/SuperPedro\main.c **** 
 247:Z:/MOP/c-code/mop/SuperPedro\main.c **** void showDistance(){
 654              		.loc 1 247 0
 655              		.cfi_startproc
 656              		@ args = 0, pretend = 0, frame = 8
 657              		@ frame_needed = 1, uses_anonymous_args = 0
 658 023e 80B5     		push	{r7, lr}
 659              		.cfi_def_cfa_offset 8
 660              		.cfi_offset 7, -8
 661              		.cfi_offset 14, -4
 662 0240 82B0     		sub	sp, sp, #8
 663              		.cfi_def_cfa_offset 16
 664 0242 00AF     		add	r7, sp, #0
 665              		.cfi_def_cfa_register 7
 666              	.LBB7:
 248:Z:/MOP/c-code/mop/SuperPedro\main.c ****     static char buffer[20];
 249:Z:/MOP/c-code/mop/SuperPedro\main.c ****     for(int i = 0; i < 20; i++){
 667              		.loc 1 249 0
 668 0244 0023     		movs	r3, #0
 669 0246 7B60     		str	r3, [r7, #4]
 670 0248 07E0     		b	.L38
 671              	.L39:
 250:Z:/MOP/c-code/mop/SuperPedro\main.c ****         buffer[i] = 0;
 672              		.loc 1 250 0 discriminator 3
 673 024a 104A     		ldr	r2, .L40
 674 024c 7B68     		ldr	r3, [r7, #4]
 675 024e D318     		adds	r3, r2, r3
 676 0250 0022     		movs	r2, #0
 677 0252 1A70     		strb	r2, [r3]
 249:Z:/MOP/c-code/mop/SuperPedro\main.c ****         buffer[i] = 0;
 678              		.loc 1 249 0 discriminator 3
 679 0254 7B68     		ldr	r3, [r7, #4]
 680 0256 0133     		adds	r3, r3, #1
 681 0258 7B60     		str	r3, [r7, #4]
 682              	.L38:
 249:Z:/MOP/c-code/mop/SuperPedro\main.c ****         buffer[i] = 0;
 683              		.loc 1 249 0 is_stmt 0 discriminator 1
 684 025a 7B68     		ldr	r3, [r7, #4]
 685 025c 132B     		cmp	r3, #19
 686 025e F4DD     		ble	.L39
 687              	.LBE7:
 251:Z:/MOP/c-code/mop/SuperPedro\main.c ****     }
 252:Z:/MOP/c-code/mop/SuperPedro\main.c ****     int d = getDistance();
 688              		.loc 1 252 0 is_stmt 1
 689 0260 FFF7FEFF 		bl	getDistance
 690 0264 0300     		movs	r3, r0
 691 0266 3B60     		str	r3, [r7]
 253:Z:/MOP/c-code/mop/SuperPedro\main.c ****     itoa(d, buffer, 10);
 692              		.loc 1 253 0
 693 0268 0849     		ldr	r1, .L40
 694 026a 3B68     		ldr	r3, [r7]
 695 026c 0A22     		movs	r2, #10
 696 026e 1800     		movs	r0, r3
 697 0270 FFF7FEFF 		bl	itoa
 254:Z:/MOP/c-code/mop/SuperPedro\main.c ****     ascii_clear_disp();
 698              		.loc 1 254 0
 699 0274 FFF7FEFF 		bl	ascii_clear_disp
 255:Z:/MOP/c-code/mop/SuperPedro\main.c ****     stringToAscii(buffer, 1, 1);
 700              		.loc 1 255 0
 701 0278 044B     		ldr	r3, .L40
 702 027a 0122     		movs	r2, #1
 703 027c 0121     		movs	r1, #1
 704 027e 1800     		movs	r0, r3
 705 0280 FFF7FEFF 		bl	stringToAscii
 256:Z:/MOP/c-code/mop/SuperPedro\main.c **** }
 706              		.loc 1 256 0
 707 0284 C046     		nop
 708 0286 BD46     		mov	sp, r7
 709 0288 02B0     		add	sp, sp, #8
 710              		@ sp needed
 711 028a 80BD     		pop	{r7, pc}
 712              	.L41:
 713              		.align	2
 714              	.L40:
 715 028c 00000000 		.word	buffer.5307
 716              		.cfi_endproc
 717              	.LFE13:
 719              		.align	1
 720              		.global	main
 721              		.syntax unified
 722              		.code	16
 723              		.thumb_func
 724              		.fpu softvfp
 726              	main:
 727              	.LFB14:
 257:Z:/MOP/c-code/mop/SuperPedro\main.c **** 
 258:Z:/MOP/c-code/mop/SuperPedro\main.c **** 
 259:Z:/MOP/c-code/mop/SuperPedro\main.c **** 
 260:Z:/MOP/c-code/mop/SuperPedro\main.c **** 
 261:Z:/MOP/c-code/mop/SuperPedro\main.c **** 
 262:Z:/MOP/c-code/mop/SuperPedro\main.c **** 
 263:Z:/MOP/c-code/mop/SuperPedro\main.c **** 
 264:Z:/MOP/c-code/mop/SuperPedro\main.c **** 
 265:Z:/MOP/c-code/mop/SuperPedro\main.c **** 
 266:Z:/MOP/c-code/mop/SuperPedro\main.c **** 
 267:Z:/MOP/c-code/mop/SuperPedro\main.c **** 
 268:Z:/MOP/c-code/mop/SuperPedro\main.c **** 
 269:Z:/MOP/c-code/mop/SuperPedro\main.c **** 
 270:Z:/MOP/c-code/mop/SuperPedro\main.c **** 
 271:Z:/MOP/c-code/mop/SuperPedro\main.c **** 
 272:Z:/MOP/c-code/mop/SuperPedro\main.c **** 
 273:Z:/MOP/c-code/mop/SuperPedro\main.c **** 
 274:Z:/MOP/c-code/mop/SuperPedro\main.c **** 
 275:Z:/MOP/c-code/mop/SuperPedro\main.c **** 
 276:Z:/MOP/c-code/mop/SuperPedro\main.c **** 
 277:Z:/MOP/c-code/mop/SuperPedro\main.c **** void main(void){
 728              		.loc 1 277 0
 729              		.cfi_startproc
 730              		@ args = 0, pretend = 0, frame = 32
 731              		@ frame_needed = 1, uses_anonymous_args = 0
 732 0290 80B5     		push	{r7, lr}
 733              		.cfi_def_cfa_offset 8
 734              		.cfi_offset 7, -8
 735              		.cfi_offset 14, -4
 736 0292 88B0     		sub	sp, sp, #32
 737              		.cfi_def_cfa_offset 40
 738 0294 00AF     		add	r7, sp, #0
 739              		.cfi_def_cfa_register 7
 278:Z:/MOP/c-code/mop/SuperPedro\main.c ****     init();
 740              		.loc 1 278 0
 741 0296 FFF7FEFF 		bl	init
 279:Z:/MOP/c-code/mop/SuperPedro\main.c ****     
 280:Z:/MOP/c-code/mop/SuperPedro\main.c ****     char buffer[20];
 281:Z:/MOP/c-code/mop/SuperPedro\main.c ****     int a = 10;
 742              		.loc 1 281 0
 743 029a 0A23     		movs	r3, #10
 744 029c FB61     		str	r3, [r7, #28]
 282:Z:/MOP/c-code/mop/SuperPedro\main.c ****     itoa(a, buffer, 10);
 745              		.loc 1 282 0
 746 029e 391D     		adds	r1, r7, #4
 747 02a0 FB69     		ldr	r3, [r7, #28]
 748 02a2 0A22     		movs	r2, #10
 749 02a4 1800     		movs	r0, r3
 750 02a6 FFF7FEFF 		bl	itoa
 283:Z:/MOP/c-code/mop/SuperPedro\main.c ****     stringToAscii(buffer, 1, 1);
 751              		.loc 1 283 0
 752 02aa 3B1D     		adds	r3, r7, #4
 753 02ac 0122     		movs	r2, #1
 754 02ae 0121     		movs	r1, #1
 755 02b0 1800     		movs	r0, r3
 756 02b2 FFF7FEFF 		bl	stringToAscii
 284:Z:/MOP/c-code/mop/SuperPedro\main.c ****     int p = 0;
 757              		.loc 1 284 0
 758 02b6 0023     		movs	r3, #0
 759 02b8 BB61     		str	r3, [r7, #24]
 760              	.L43:
 285:Z:/MOP/c-code/mop/SuperPedro\main.c **** #if 0
 286:Z:/MOP/c-code/mop/SuperPedro\main.c ****     while(1) {
 287:Z:/MOP/c-code/mop/SuperPedro\main.c ****         ascii_gotoxy( p % 20 + 1, p / 20 % 2 + 1);
 288:Z:/MOP/c-code/mop/SuperPedro\main.c ****         ascii_write_char(p % 29 + 'a');
 289:Z:/MOP/c-code/mop/SuperPedro\main.c ****         ascii_write_char((p + 7) % 29 + 'a');
 290:Z:/MOP/c-code/mop/SuperPedro\main.c ****         delaymicros(100 * 1000);
 291:Z:/MOP/c-code/mop/SuperPedro\main.c ****         p++;
 292:Z:/MOP/c-code/mop/SuperPedro\main.c ****     }
 293:Z:/MOP/c-code/mop/SuperPedro\main.c **** #endif
 294:Z:/MOP/c-code/mop/SuperPedro\main.c **** 	while(1){
 295:Z:/MOP/c-code/mop/SuperPedro\main.c **** 		loop();
 761              		.loc 1 295 0 discriminator 1
 762 02ba FFF7FEFF 		bl	loop
 763 02be FCE7     		b	.L43
 764              		.cfi_endproc
 765              	.LFE14:
 767              		.bss
 768              		.align	2
 769              	buffer.5307:
 770 0000 00000000 		.space	20
 770      00000000 
 770      00000000 
 770      00000000 
 770      00000000 
 772              		.text
 773              	.Letext0:
 774              		.file 2 "c:\\cseapp\\codelite\\tools\\gcc-arm\\arm-none-eabi\\include\\machine\\_default_types.h"
 775              		.file 3 "c:\\cseapp\\codelite\\tools\\gcc-arm\\arm-none-eabi\\include\\sys\\_stdint.h"
 776              		.file 4 "Z:/MOP/c-code/mop/SuperPedro/gpio.h"
 777              		.file 5 "c:\\cseapp\\codelite\\tools\\gcc-arm\\arm-none-eabi\\include\\sys\\lock.h"
 778              		.file 6 "c:\\cseapp\\codelite\\tools\\gcc-arm\\arm-none-eabi\\include\\sys\\_types.h"
 779              		.file 7 "c:\\cseapp\\codelite\\tools\\gcc-arm\\lib\\gcc\\arm-none-eabi\\7.2.1\\include\\stddef.h"
 780              		.file 8 "c:\\cseapp\\codelite\\tools\\gcc-arm\\arm-none-eabi\\include\\sys\\reent.h"
