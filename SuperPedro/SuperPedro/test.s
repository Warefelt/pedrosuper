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
  24              	.LFB0:
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
  31:Z:/MOP/c-code/mop/SuperPedro\main.c **** 
  32:Z:/MOP/c-code/mop/SuperPedro\main.c **** #include "delays.h"
  33:Z:/MOP/c-code/mop/SuperPedro\main.c **** #include "keyfuncs.h"
  34:Z:/MOP/c-code/mop/SuperPedro\main.c **** #include "lcdascii.h"
  35:Z:/MOP/c-code/mop/SuperPedro\main.c **** #include "gpio.h"
  36:Z:/MOP/c-code/mop/SuperPedro\main.c **** #include "pedro.h"
  37:Z:/MOP/c-code/mop/SuperPedro\main.c **** #include "randomNum.h"
  38:Z:/MOP/c-code/mop/SuperPedro\main.c **** 
  39:Z:/MOP/c-code/mop/SuperPedro\main.c **** #include <time.h>
  40:Z:/MOP/c-code/mop/SuperPedro\main.c **** #include <stdlib.h>
  41:Z:/MOP/c-code/mop/SuperPedro\main.c **** 
  42:Z:/MOP/c-code/mop/SuperPedro\main.c **** 
  43:Z:/MOP/c-code/mop/SuperPedro\main.c **** void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );
  44:Z:/MOP/c-code/mop/SuperPedro\main.c **** 
  45:Z:/MOP/c-code/mop/SuperPedro\main.c **** void startup ( void )
  46:Z:/MOP/c-code/mop/SuperPedro\main.c **** {
  26              		.loc 1 46 0
  27              		.cfi_startproc
  28              		@ Naked Function: prologue and epilogue provided by programmer.
  29              		@ args = 0, pretend = 0, frame = 0
  30              		@ frame_needed = 1, uses_anonymous_args = 0
  47:Z:/MOP/c-code/mop/SuperPedro\main.c **** __asm volatile(
  31              		.loc 1 47 0
  32              		.syntax divided
  33              	@ 47 "Z:/MOP/c-code/mop/SuperPedro/main.c" 1
  34 0000 0248     		 LDR R0,=0x2001C000
  35 0002 8546     	 MOV SP,R0
  36 0004 FFF7FEFF 	 BL main
  37 0008 FEE7     	_exit: B .
  38              	
  39              	@ 0 "" 2
  48:Z:/MOP/c-code/mop/SuperPedro\main.c **** 	" LDR R0,=0x2001C000\n"		/* set stack */
  49:Z:/MOP/c-code/mop/SuperPedro\main.c **** 	" MOV SP,R0\n"
  50:Z:/MOP/c-code/mop/SuperPedro\main.c **** 	" BL main\n"				/* call main */
  51:Z:/MOP/c-code/mop/SuperPedro\main.c **** 	"_exit: B .\n"				/* never return */
  52:Z:/MOP/c-code/mop/SuperPedro\main.c **** 	) ;
  53:Z:/MOP/c-code/mop/SuperPedro\main.c **** }
  40              		.loc 1 53 0
  41              		.thumb
  42              		.syntax unified
  43 000a C046     		nop
  44              		.cfi_endproc
  45              	.LFE0:
  47              		.comm	seed,4,4
  48              		.text
  49              		.align	1
  50              		.global	gpioInit
  51              		.syntax unified
  52              		.code	16
  53              		.thumb_func
  54              		.fpu softvfp
  56              	gpioInit:
  57              	.LFB1:
  54:Z:/MOP/c-code/mop/SuperPedro\main.c **** 
  55:Z:/MOP/c-code/mop/SuperPedro\main.c **** 
  56:Z:/MOP/c-code/mop/SuperPedro\main.c **** //GLOBALS
  57:Z:/MOP/c-code/mop/SuperPedro\main.c **** extern char backBuffer[256][8];
  58:Z:/MOP/c-code/mop/SuperPedro\main.c **** uint32_t seed;
  59:Z:/MOP/c-code/mop/SuperPedro\main.c **** 
  60:Z:/MOP/c-code/mop/SuperPedro\main.c **** //#define USBDM
  61:Z:/MOP/c-code/mop/SuperPedro\main.c **** #define NONSIMULATOR
  62:Z:/MOP/c-code/mop/SuperPedro\main.c **** 
  63:Z:/MOP/c-code/mop/SuperPedro\main.c **** void gpioInit(){
  58              		.loc 1 63 0
  59              		.cfi_startproc
  60              		@ args = 0, pretend = 0, frame = 0
  61              		@ frame_needed = 1, uses_anonymous_args = 0
  62 0000 80B5     		push	{r7, lr}
  63              		.cfi_def_cfa_offset 8
  64              		.cfi_offset 7, -8
  65              		.cfi_offset 14, -4
  66 0002 00AF     		add	r7, sp, #0
  67              		.cfi_def_cfa_register 7
  64:Z:/MOP/c-code/mop/SuperPedro\main.c **** 	
  65:Z:/MOP/c-code/mop/SuperPedro\main.c ****     GPIO_E->moder=0x55555555;		//------------------------------------------------------------------
  68              		.loc 1 65 0
  69 0004 104B     		ldr	r3, .L3
  70 0006 114A     		ldr	r2, .L3+4
  71 0008 1A60     		str	r2, [r3]
  66:Z:/MOP/c-code/mop/SuperPedro\main.c ****     GPIO_D->moder = 0x55005555;
  72              		.loc 1 66 0
  73 000a 114B     		ldr	r3, .L3+8
  74 000c 114A     		ldr	r2, .L3+12
  75 000e 1A60     		str	r2, [r3]
  67:Z:/MOP/c-code/mop/SuperPedro\main.c ****     
  68:Z:/MOP/c-code/mop/SuperPedro\main.c **** 	GPIO_D->otyper &= 0xFFFF00FF;
  76              		.loc 1 68 0
  77 0010 0F4B     		ldr	r3, .L3+8
  78 0012 5A68     		ldr	r2, [r3, #4]
  79 0014 0E4B     		ldr	r3, .L3+8
  80 0016 1049     		ldr	r1, .L3+16
  81 0018 0A40     		ands	r2, r1
  82 001a 5A60     		str	r2, [r3, #4]
  69:Z:/MOP/c-code/mop/SuperPedro\main.c **** 	GPIO_D->otyper |= 0x00000F00;
  83              		.loc 1 69 0
  84 001c 0C4B     		ldr	r3, .L3+8
  85 001e 5A68     		ldr	r2, [r3, #4]
  86 0020 0B4B     		ldr	r3, .L3+8
  87 0022 F021     		movs	r1, #240
  88 0024 0901     		lsls	r1, r1, #4
  89 0026 0A43     		orrs	r2, r1
  90 0028 5A60     		str	r2, [r3, #4]
  70:Z:/MOP/c-code/mop/SuperPedro\main.c **** 	// Sätter pinnar 4-0 till "pull-down"
  71:Z:/MOP/c-code/mop/SuperPedro\main.c **** 	GPIO_D->pupdr &= 0x0000FFFF;
  91              		.loc 1 71 0
  92 002a 094B     		ldr	r3, .L3+8
  93 002c DA68     		ldr	r2, [r3, #12]
  94 002e 084B     		ldr	r3, .L3+8
  95 0030 1204     		lsls	r2, r2, #16
  96 0032 120C     		lsrs	r2, r2, #16
  97 0034 DA60     		str	r2, [r3, #12]
  72:Z:/MOP/c-code/mop/SuperPedro\main.c **** 	GPIO_D->pupdr |= 0xFFAA0000;
  98              		.loc 1 72 0
  99 0036 064B     		ldr	r3, .L3+8
 100 0038 DA68     		ldr	r2, [r3, #12]
 101 003a 054B     		ldr	r3, .L3+8
 102 003c 0749     		ldr	r1, .L3+20
 103 003e 0A43     		orrs	r2, r1
 104 0040 DA60     		str	r2, [r3, #12]
  73:Z:/MOP/c-code/mop/SuperPedro\main.c **** 
  74:Z:/MOP/c-code/mop/SuperPedro\main.c **** }
 105              		.loc 1 74 0
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
 120              	.LFE1:
 122              		.align	1
 123              		.global	init
 124              		.syntax unified
 125              		.code	16
 126              		.thumb_func
 127              		.fpu softvfp
 129              	init:
 130              	.LFB2:
  75:Z:/MOP/c-code/mop/SuperPedro\main.c **** 
  76:Z:/MOP/c-code/mop/SuperPedro\main.c **** 
  77:Z:/MOP/c-code/mop/SuperPedro\main.c **** 
  78:Z:/MOP/c-code/mop/SuperPedro\main.c **** void init(){
 131              		.loc 1 78 0
 132              		.cfi_startproc
 133              		@ args = 0, pretend = 0, frame = 0
 134              		@ frame_needed = 1, uses_anonymous_args = 0
 135 0060 80B5     		push	{r7, lr}
 136              		.cfi_def_cfa_offset 8
 137              		.cfi_offset 7, -8
 138              		.cfi_offset 14, -4
 139 0062 00AF     		add	r7, sp, #0
 140              		.cfi_def_cfa_register 7
  79:Z:/MOP/c-code/mop/SuperPedro\main.c ****     #ifdef USBDM
  80:Z:/MOP/c-code/mop/SuperPedro\main.c **** 		*((unsigned long*)0x40023830)=0x18;
  81:Z:/MOP/c-code/mop/SuperPedro\main.c ****     #endif
  82:Z:/MOP/c-code/mop/SuperPedro\main.c **** 	
  83:Z:/MOP/c-code/mop/SuperPedro\main.c ****     gpioInit();
 141              		.loc 1 83 0
 142 0064 FFF7FEFF 		bl	gpioInit
  84:Z:/MOP/c-code/mop/SuperPedro\main.c ****     
  85:Z:/MOP/c-code/mop/SuperPedro\main.c ****     graphic_initialize();
 143              		.loc 1 85 0
 144 0068 FFF7FEFF 		bl	graphic_initialize
  86:Z:/MOP/c-code/mop/SuperPedro\main.c ****     //ascii_init();     //todo?
  87:Z:/MOP/c-code/mop/SuperPedro\main.c ****     
  88:Z:/MOP/c-code/mop/SuperPedro\main.c ****     seed = 1337;
 145              		.loc 1 88 0
 146 006c 084B     		ldr	r3, .L6
 147 006e 094A     		ldr	r2, .L6+4
 148 0070 1A60     		str	r2, [r3]
  89:Z:/MOP/c-code/mop/SuperPedro\main.c ****     seedRng(&seed, seed);
 149              		.loc 1 89 0
 150 0072 074B     		ldr	r3, .L6
 151 0074 1A68     		ldr	r2, [r3]
 152 0076 064B     		ldr	r3, .L6
 153 0078 1100     		movs	r1, r2
 154 007a 1800     		movs	r0, r3
 155 007c FFF7FEFF 		bl	seedRng
  90:Z:/MOP/c-code/mop/SuperPedro\main.c **** 
  91:Z:/MOP/c-code/mop/SuperPedro\main.c **** 	clear_backBuffer();
 156              		.loc 1 91 0
 157 0080 FFF7FEFF 		bl	clear_backBuffer
  92:Z:/MOP/c-code/mop/SuperPedro\main.c **** 	graphic_draw_screen();
 158              		.loc 1 92 0
 159 0084 FFF7FEFF 		bl	graphic_draw_screen
  93:Z:/MOP/c-code/mop/SuperPedro\main.c **** 
  94:Z:/MOP/c-code/mop/SuperPedro\main.c **** }
 160              		.loc 1 94 0
 161 0088 C046     		nop
 162 008a BD46     		mov	sp, r7
 163              		@ sp needed
 164 008c 80BD     		pop	{r7, pc}
 165              	.L7:
 166 008e C046     		.align	2
 167              	.L6:
 168 0090 00000000 		.word	seed
 169 0094 39050000 		.word	1337
 170              		.cfi_endproc
 171              	.LFE2:
 173              		.align	1
 174              		.global	loop
 175              		.syntax unified
 176              		.code	16
 177              		.thumb_func
 178              		.fpu softvfp
 180              	loop:
 181              	.LFB3:
  95:Z:/MOP/c-code/mop/SuperPedro\main.c **** 
  96:Z:/MOP/c-code/mop/SuperPedro\main.c **** 
  97:Z:/MOP/c-code/mop/SuperPedro\main.c **** 
  98:Z:/MOP/c-code/mop/SuperPedro\main.c **** 
  99:Z:/MOP/c-code/mop/SuperPedro\main.c **** 
 100:Z:/MOP/c-code/mop/SuperPedro\main.c **** 
 101:Z:/MOP/c-code/mop/SuperPedro\main.c **** 
 102:Z:/MOP/c-code/mop/SuperPedro\main.c **** 
 103:Z:/MOP/c-code/mop/SuperPedro\main.c **** 
 104:Z:/MOP/c-code/mop/SuperPedro\main.c **** 
 105:Z:/MOP/c-code/mop/SuperPedro\main.c **** 
 106:Z:/MOP/c-code/mop/SuperPedro\main.c **** void loop(){
 182              		.loc 1 106 0
 183              		.cfi_startproc
 184              		@ args = 0, pretend = 0, frame = 0
 185              		@ frame_needed = 1, uses_anonymous_args = 0
 186 0098 80B5     		push	{r7, lr}
 187              		.cfi_def_cfa_offset 8
 188              		.cfi_offset 7, -8
 189              		.cfi_offset 14, -4
 190 009a 00AF     		add	r7, sp, #0
 191              		.cfi_def_cfa_register 7
 192              	.L12:
 107:Z:/MOP/c-code/mop/SuperPedro\main.c **** 	//(splash start)	
 108:Z:/MOP/c-code/mop/SuperPedro\main.c ****     
 109:Z:/MOP/c-code/mop/SuperPedro\main.c **** 	//
 110:Z:/MOP/c-code/mop/SuperPedro\main.c **** 	//	
 111:Z:/MOP/c-code/mop/SuperPedro\main.c ****     //drawGround(64, 191);
 112:Z:/MOP/c-code/mop/SuperPedro\main.c **** 	
 113:Z:/MOP/c-code/mop/SuperPedro\main.c **** 	while(1){
 114:Z:/MOP/c-code/mop/SuperPedro\main.c **** 		//
 115:Z:/MOP/c-code/mop/SuperPedro\main.c **** 		//ändra Pedros properties
 116:Z:/MOP/c-code/mop/SuperPedro\main.c **** 		if(getDistance() % 32 == 0 && getVelx < 0){
 193              		.loc 1 116 0
 194 009c FFF7FEFF 		bl	getDistance
 117:Z:/MOP/c-code/mop/SuperPedro\main.c **** 			loadNewLevelSegmentLeft();
 118:Z:/MOP/c-code/mop/SuperPedro\main.c **** 		}
 119:Z:/MOP/c-code/mop/SuperPedro\main.c **** 		if(getDistance() % 32 == 0 && getVelx >= 0){
 195              		.loc 1 119 0
 196 00a0 FFF7FEFF 		bl	getDistance
 197 00a4 0300     		movs	r3, r0
 198 00a6 1A00     		movs	r2, r3
 199 00a8 1F23     		movs	r3, #31
 200 00aa 1340     		ands	r3, r2
 201 00ac 01D1     		bne	.L9
 202              	.LBB2:
 120:Z:/MOP/c-code/mop/SuperPedro\main.c **** 			loadNewLevelSegmentRight();
 203              		.loc 1 120 0
 204 00ae FFF7FEFF 		bl	loadNewLevelSegmentRight
 205              	.L9:
 206              	.LBE2:
 121:Z:/MOP/c-code/mop/SuperPedro\main.c **** 		}
 122:Z:/MOP/c-code/mop/SuperPedro\main.c **** 		
 123:Z:/MOP/c-code/mop/SuperPedro\main.c **** 		move();			//flyttar hela skärmen så det ser ut som att Pedro rör sig
 207              		.loc 1 123 0
 208 00b2 FFF7FEFF 		bl	move
 124:Z:/MOP/c-code/mop/SuperPedro\main.c ****         
 125:Z:/MOP/c-code/mop/SuperPedro\main.c **** //        char* buffer;
 126:Z:/MOP/c-code/mop/SuperPedro\main.c **** //        itoa(getDistance(), buffer, 10);
 127:Z:/MOP/c-code/mop/SuperPedro\main.c **** //        stringToAscii();
 128:Z:/MOP/c-code/mop/SuperPedro\main.c **** 			
 129:Z:/MOP/c-code/mop/SuperPedro\main.c **** 		//win/loss
 130:Z:/MOP/c-code/mop/SuperPedro\main.c **** 		if(touchesPepper() == 1){
 209              		.loc 1 130 0
 210 00b6 FFF7FEFF 		bl	touchesPepper
 211 00ba 0300     		movs	r3, r0
 212 00bc 012B     		cmp	r3, #1
 213 00be 00D0     		beq	.L14
 116:Z:/MOP/c-code/mop/SuperPedro\main.c **** 			loadNewLevelSegmentLeft();
 214              		.loc 1 116 0
 215 00c0 ECE7     		b	.L12
 216              	.L14:
 131:Z:/MOP/c-code/mop/SuperPedro\main.c **** 			break;		//startar om spelet från början
 217              		.loc 1 131 0
 218 00c2 C046     		nop
 132:Z:/MOP/c-code/mop/SuperPedro\main.c **** 		}
 133:Z:/MOP/c-code/mop/SuperPedro\main.c **** 		/*if(Pedro.distance == ){
 134:Z:/MOP/c-code/mop/SuperPedro\main.c **** 			onWin();
 135:Z:/MOP/c-code/mop/SuperPedro\main.c **** 		}*/
 136:Z:/MOP/c-code/mop/SuperPedro\main.c **** 	}
 137:Z:/MOP/c-code/mop/SuperPedro\main.c **** 	
 138:Z:/MOP/c-code/mop/SuperPedro\main.c **** }
 219              		.loc 1 138 0
 220 00c4 C046     		nop
 221 00c6 BD46     		mov	sp, r7
 222              		@ sp needed
 223 00c8 80BD     		pop	{r7, pc}
 224              		.cfi_endproc
 225              	.LFE3:
 227              		.align	1
 228              		.global	loadNewLevelSegmentLeft
 229              		.syntax unified
 230              		.code	16
 231              		.thumb_func
 232              		.fpu softvfp
 234              	loadNewLevelSegmentLeft:
 235              	.LFB4:
 139:Z:/MOP/c-code/mop/SuperPedro\main.c **** 
 140:Z:/MOP/c-code/mop/SuperPedro\main.c **** 
 141:Z:/MOP/c-code/mop/SuperPedro\main.c **** 
 142:Z:/MOP/c-code/mop/SuperPedro\main.c **** void loadNewLevelSegmentLeft(){
 236              		.loc 1 142 0
 237              		.cfi_startproc
 238              		@ args = 0, pretend = 0, frame = 0
 239              		@ frame_needed = 1, uses_anonymous_args = 0
 240 00ca 80B5     		push	{r7, lr}
 241              		.cfi_def_cfa_offset 8
 242              		.cfi_offset 7, -8
 243              		.cfi_offset 14, -4
 244 00cc 00AF     		add	r7, sp, #0
 245              		.cfi_def_cfa_register 7
 143:Z:/MOP/c-code/mop/SuperPedro\main.c ****     loadLvl(0);  //64px wide
 246              		.loc 1 143 0
 247 00ce 0020     		movs	r0, #0
 248 00d0 FFF7FEFF 		bl	loadLvl
 144:Z:/MOP/c-code/mop/SuperPedro\main.c **** }
 249              		.loc 1 144 0
 250 00d4 C046     		nop
 251 00d6 BD46     		mov	sp, r7
 252              		@ sp needed
 253 00d8 80BD     		pop	{r7, pc}
 254              		.cfi_endproc
 255              	.LFE4:
 257              		.align	1
 258              		.global	loadNewLevelSegmentRight
 259              		.syntax unified
 260              		.code	16
 261              		.thumb_func
 262              		.fpu softvfp
 264              	loadNewLevelSegmentRight:
 265              	.LFB5:
 145:Z:/MOP/c-code/mop/SuperPedro\main.c **** 
 146:Z:/MOP/c-code/mop/SuperPedro\main.c **** void loadNewLevelSegmentRight(){
 266              		.loc 1 146 0
 267              		.cfi_startproc
 268              		@ args = 0, pretend = 0, frame = 0
 269              		@ frame_needed = 1, uses_anonymous_args = 0
 270 00da 80B5     		push	{r7, lr}
 271              		.cfi_def_cfa_offset 8
 272              		.cfi_offset 7, -8
 273              		.cfi_offset 14, -4
 274 00dc 00AF     		add	r7, sp, #0
 275              		.cfi_def_cfa_register 7
 147:Z:/MOP/c-code/mop/SuperPedro\main.c ****     loadLvl(192);
 276              		.loc 1 147 0
 277 00de C020     		movs	r0, #192
 278 00e0 FFF7FEFF 		bl	loadLvl
 148:Z:/MOP/c-code/mop/SuperPedro\main.c **** }
 279              		.loc 1 148 0
 280 00e4 C046     		nop
 281 00e6 BD46     		mov	sp, r7
 282              		@ sp needed
 283 00e8 80BD     		pop	{r7, pc}
 284              		.cfi_endproc
 285              	.LFE5:
 287              		.section	.rodata
 288              		.align	2
 289              	.LC0:
 290 0000 F8       		.byte	-8
 291 0001 07       		.byte	7
 292 0002 0C       		.byte	12
 293 0003 1C       		.byte	28
 294 0004 04       		.byte	4
 295 0005 30       		.byte	48
 296 0006 0C       		.byte	12
 297 0007 E0       		.byte	-32
 298 0008 E8       		.byte	-24
 299 0009 87       		.byte	-121
 300 000a 1C       		.byte	28
 301 000b D8       		.byte	-40
 302 000c 06       		.byte	6
 303 000d 60       		.byte	96
 304 000e 07       		.byte	7
 305 000f 20       		.byte	32
 306 0010 0F       		.byte	15
 307 0011 20       		.byte	32
 308 0012 0B       		.byte	11
 309 0013 60       		.byte	96
 310 0014 39       		.byte	57
 311 0015 D0       		.byte	-48
 312 0016 CD       		.byte	-51
 313 0017 8F       		.byte	-113
 314 0018 04       		.byte	4
 315 0019 C0       		.byte	-64
 316 001a 04       		.byte	4
 317 001b 60       		.byte	96
 318 001c 0C       		.byte	12
 319 001d 30       		.byte	48
 320 001e F8       		.byte	-8
 321 001f 1F       		.byte	31
 322              		.text
 323              		.align	1
 324              		.global	loadPepperAt
 325              		.syntax unified
 326              		.code	16
 327              		.thumb_func
 328              		.fpu softvfp
 330              	loadPepperAt:
 331              	.LFB6:
 149:Z:/MOP/c-code/mop/SuperPedro\main.c **** 
 150:Z:/MOP/c-code/mop/SuperPedro\main.c **** 
 151:Z:/MOP/c-code/mop/SuperPedro\main.c **** //bör fungera
 152:Z:/MOP/c-code/mop/SuperPedro\main.c **** void loadPepperAt(int addr, int page){
 332              		.loc 1 152 0
 333              		.cfi_startproc
 334              		@ args = 0, pretend = 0, frame = 48
 335              		@ frame_needed = 1, uses_anonymous_args = 0
 336 00ea 90B5     		push	{r4, r7, lr}
 337              		.cfi_def_cfa_offset 12
 338              		.cfi_offset 4, -12
 339              		.cfi_offset 7, -8
 340              		.cfi_offset 14, -4
 341 00ec 8DB0     		sub	sp, sp, #52
 342              		.cfi_def_cfa_offset 64
 343 00ee 00AF     		add	r7, sp, #0
 344              		.cfi_def_cfa_register 7
 345 00f0 7860     		str	r0, [r7, #4]
 346 00f2 3960     		str	r1, [r7]
 153:Z:/MOP/c-code/mop/SuperPedro\main.c **** 		char b[][2]= 
 347              		.loc 1 153 0
 348 00f4 0823     		movs	r3, #8
 349 00f6 FB18     		adds	r3, r7, r3
 350 00f8 164A     		ldr	r2, .L22
 351 00fa 13CA     		ldmia	r2!, {r0, r1, r4}
 352 00fc 13C3     		stmia	r3!, {r0, r1, r4}
 353 00fe 13CA     		ldmia	r2!, {r0, r1, r4}
 354 0100 13C3     		stmia	r3!, {r0, r1, r4}
 355 0102 03CA     		ldmia	r2!, {r0, r1}
 356 0104 03C3     		stmia	r3!, {r0, r1}
 357              	.LBB3:
 154:Z:/MOP/c-code/mop/SuperPedro\main.c **** 				{
 155:Z:/MOP/c-code/mop/SuperPedro\main.c **** 				{0b11111000, 0b00000111}, 
 156:Z:/MOP/c-code/mop/SuperPedro\main.c **** 				{0b00001100, 0b00011100}, 
 157:Z:/MOP/c-code/mop/SuperPedro\main.c **** 				{0b00000100, 0b00110000},
 158:Z:/MOP/c-code/mop/SuperPedro\main.c **** 				{0b00001100, 0b11100000},
 159:Z:/MOP/c-code/mop/SuperPedro\main.c **** 				{0b11101000, 0b10000111},
 160:Z:/MOP/c-code/mop/SuperPedro\main.c **** 				{0b00011100, 0b11011000},
 161:Z:/MOP/c-code/mop/SuperPedro\main.c **** 				{0b00000110, 0b01100000}, 
 162:Z:/MOP/c-code/mop/SuperPedro\main.c **** 				{0b00000111, 0b00100000},
 163:Z:/MOP/c-code/mop/SuperPedro\main.c **** 				{0b00001111, 0b00100000},
 164:Z:/MOP/c-code/mop/SuperPedro\main.c **** 				{0b00001011, 0b01100000},
 165:Z:/MOP/c-code/mop/SuperPedro\main.c **** 				{0b00111001, 0b11010000}, 
 166:Z:/MOP/c-code/mop/SuperPedro\main.c **** 				{0b11001101, 0b10001111},
 167:Z:/MOP/c-code/mop/SuperPedro\main.c **** 				{0b00000100, 0b11000000}, 
 168:Z:/MOP/c-code/mop/SuperPedro\main.c **** 				{0b00000100, 0b01100000},
 169:Z:/MOP/c-code/mop/SuperPedro\main.c **** 				{0b00001100, 0b00110000},
 170:Z:/MOP/c-code/mop/SuperPedro\main.c **** 				{0b11111000, 0b00011111}
 171:Z:/MOP/c-code/mop/SuperPedro\main.c **** 				};
 172:Z:/MOP/c-code/mop/SuperPedro\main.c ****      
 173:Z:/MOP/c-code/mop/SuperPedro\main.c **** 		for(int j = 0; j < 2; j++){
 358              		.loc 1 173 0
 359 0106 0023     		movs	r3, #0
 360 0108 FB62     		str	r3, [r7, #44]
 361 010a 1CE0     		b	.L18
 362              	.L21:
 363              	.LBB4:
 174:Z:/MOP/c-code/mop/SuperPedro\main.c **** 			for(int i = 0; i < 16; i++){
 364              		.loc 1 174 0
 365 010c 0023     		movs	r3, #0
 366 010e BB62     		str	r3, [r7, #40]
 367 0110 13E0     		b	.L19
 368              	.L20:
 175:Z:/MOP/c-code/mop/SuperPedro\main.c **** 				byteToBuffer(addr + i, page + j, b[i][j]);
 369              		.loc 1 175 0 discriminator 3
 370 0112 7A68     		ldr	r2, [r7, #4]
 371 0114 BB6A     		ldr	r3, [r7, #40]
 372 0116 D018     		adds	r0, r2, r3
 373 0118 3A68     		ldr	r2, [r7]
 374 011a FB6A     		ldr	r3, [r7, #44]
 375 011c D118     		adds	r1, r2, r3
 376 011e 0823     		movs	r3, #8
 377 0120 FA18     		adds	r2, r7, r3
 378 0122 BB6A     		ldr	r3, [r7, #40]
 379 0124 5B00     		lsls	r3, r3, #1
 380 0126 D218     		adds	r2, r2, r3
 381 0128 FB6A     		ldr	r3, [r7, #44]
 382 012a D318     		adds	r3, r2, r3
 383 012c 1B78     		ldrb	r3, [r3]
 384 012e 1A00     		movs	r2, r3
 385 0130 FFF7FEFF 		bl	byteToBuffer
 174:Z:/MOP/c-code/mop/SuperPedro\main.c **** 			for(int i = 0; i < 16; i++){
 386              		.loc 1 174 0 discriminator 3
 387 0134 BB6A     		ldr	r3, [r7, #40]
 388 0136 0133     		adds	r3, r3, #1
 389 0138 BB62     		str	r3, [r7, #40]
 390              	.L19:
 174:Z:/MOP/c-code/mop/SuperPedro\main.c **** 			for(int i = 0; i < 16; i++){
 391              		.loc 1 174 0 is_stmt 0 discriminator 1
 392 013a BB6A     		ldr	r3, [r7, #40]
 393 013c 0F2B     		cmp	r3, #15
 394 013e E8DD     		ble	.L20
 395              	.LBE4:
 173:Z:/MOP/c-code/mop/SuperPedro\main.c **** 			for(int i = 0; i < 16; i++){
 396              		.loc 1 173 0 is_stmt 1 discriminator 2
 397 0140 FB6A     		ldr	r3, [r7, #44]
 398 0142 0133     		adds	r3, r3, #1
 399 0144 FB62     		str	r3, [r7, #44]
 400              	.L18:
 173:Z:/MOP/c-code/mop/SuperPedro\main.c **** 			for(int i = 0; i < 16; i++){
 401              		.loc 1 173 0 is_stmt 0 discriminator 1
 402 0146 FB6A     		ldr	r3, [r7, #44]
 403 0148 012B     		cmp	r3, #1
 404 014a DFDD     		ble	.L21
 405              	.LBE3:
 176:Z:/MOP/c-code/mop/SuperPedro\main.c **** 			}
 177:Z:/MOP/c-code/mop/SuperPedro\main.c **** 		}
 178:Z:/MOP/c-code/mop/SuperPedro\main.c **** }
 406              		.loc 1 178 0 is_stmt 1
 407 014c C046     		nop
 408 014e BD46     		mov	sp, r7
 409 0150 0DB0     		add	sp, sp, #52
 410              		@ sp needed
 411 0152 90BD     		pop	{r4, r7, pc}
 412              	.L23:
 413              		.align	2
 414              	.L22:
 415 0154 00000000 		.word	.LC0
 416              		.cfi_endproc
 417              	.LFE6:
 419              		.align	1
 420              		.global	loadPepperStrip
 421              		.syntax unified
 422              		.code	16
 423              		.thumb_func
 424              		.fpu softvfp
 426              	loadPepperStrip:
 427              	.LFB7:
 179:Z:/MOP/c-code/mop/SuperPedro\main.c **** 
 180:Z:/MOP/c-code/mop/SuperPedro\main.c **** 
 181:Z:/MOP/c-code/mop/SuperPedro\main.c **** //bör fungera
 182:Z:/MOP/c-code/mop/SuperPedro\main.c **** void loadPepperStrip(int start, char type){
 428              		.loc 1 182 0
 429              		.cfi_startproc
 430              		@ args = 0, pretend = 0, frame = 8
 431              		@ frame_needed = 1, uses_anonymous_args = 0
 432 0158 80B5     		push	{r7, lr}
 433              		.cfi_def_cfa_offset 8
 434              		.cfi_offset 7, -8
 435              		.cfi_offset 14, -4
 436 015a 82B0     		sub	sp, sp, #8
 437              		.cfi_def_cfa_offset 16
 438 015c 00AF     		add	r7, sp, #0
 439              		.cfi_def_cfa_register 7
 440 015e 7860     		str	r0, [r7, #4]
 441 0160 0A00     		movs	r2, r1
 442 0162 FB1C     		adds	r3, r7, #3
 443 0164 1A70     		strb	r2, [r3]
 183:Z:/MOP/c-code/mop/SuperPedro\main.c **** 	
 184:Z:/MOP/c-code/mop/SuperPedro\main.c **** 	switch(type){
 444              		.loc 1 184 0
 445 0166 FB1C     		adds	r3, r7, #3
 446 0168 1B78     		ldrb	r3, [r3]
 447 016a 5F2B     		cmp	r3, #95
 448 016c 15D0     		beq	.L29
 449 016e 6F2B     		cmp	r3, #111
 450 0170 02D0     		beq	.L27
 451 0172 382B     		cmp	r3, #56
 452 0174 06D0     		beq	.L28
 185:Z:/MOP/c-code/mop/SuperPedro\main.c **** 		case '_': 
 186:Z:/MOP/c-code/mop/SuperPedro\main.c **** 			break;
 187:Z:/MOP/c-code/mop/SuperPedro\main.c **** 		case 'o': 
 188:Z:/MOP/c-code/mop/SuperPedro\main.c **** 			loadPepperAt(start, 6);
 189:Z:/MOP/c-code/mop/SuperPedro\main.c **** 			break;
 190:Z:/MOP/c-code/mop/SuperPedro\main.c **** 		case '8':
 191:Z:/MOP/c-code/mop/SuperPedro\main.c **** 			loadPepperAt(start, 6);
 192:Z:/MOP/c-code/mop/SuperPedro\main.c **** 			loadPepperAt(start, 4);
 193:Z:/MOP/c-code/mop/SuperPedro\main.c **** 			break;
 194:Z:/MOP/c-code/mop/SuperPedro\main.c **** 			
 195:Z:/MOP/c-code/mop/SuperPedro\main.c **** 	}
 196:Z:/MOP/c-code/mop/SuperPedro\main.c **** }
 453              		.loc 1 196 0
 454 0176 11E0     		b	.L30
 455              	.L27:
 188:Z:/MOP/c-code/mop/SuperPedro\main.c **** 			break;
 456              		.loc 1 188 0
 457 0178 7B68     		ldr	r3, [r7, #4]
 458 017a 0621     		movs	r1, #6
 459 017c 1800     		movs	r0, r3
 460 017e FFF7FEFF 		bl	loadPepperAt
 189:Z:/MOP/c-code/mop/SuperPedro\main.c **** 		case '8':
 461              		.loc 1 189 0
 462 0182 0BE0     		b	.L25
 463              	.L28:
 191:Z:/MOP/c-code/mop/SuperPedro\main.c **** 			loadPepperAt(start, 4);
 464              		.loc 1 191 0
 465 0184 7B68     		ldr	r3, [r7, #4]
 466 0186 0621     		movs	r1, #6
 467 0188 1800     		movs	r0, r3
 468 018a FFF7FEFF 		bl	loadPepperAt
 192:Z:/MOP/c-code/mop/SuperPedro\main.c **** 			break;
 469              		.loc 1 192 0
 470 018e 7B68     		ldr	r3, [r7, #4]
 471 0190 0421     		movs	r1, #4
 472 0192 1800     		movs	r0, r3
 473 0194 FFF7FEFF 		bl	loadPepperAt
 193:Z:/MOP/c-code/mop/SuperPedro\main.c **** 			
 474              		.loc 1 193 0
 475 0198 00E0     		b	.L25
 476              	.L29:
 186:Z:/MOP/c-code/mop/SuperPedro\main.c **** 		case 'o': 
 477              		.loc 1 186 0
 478 019a C046     		nop
 479              	.L25:
 480              	.L30:
 481              		.loc 1 196 0
 482 019c C046     		nop
 483 019e BD46     		mov	sp, r7
 484 01a0 02B0     		add	sp, sp, #8
 485              		@ sp needed
 486 01a2 80BD     		pop	{r7, pc}
 487              		.cfi_endproc
 488              	.LFE7:
 490              		.global	__aeabi_uidivmod
 491              		.section	.rodata
 492              		.align	2
 493              	.LC1:
 494 0020 5F5F5F5F 		.ascii	"____"
 495 0024 5F6F6F5F 		.ascii	"_oo_"
 496 0028 5F385F5F 		.ascii	"_8__"
 497 002c 5F6F5F6F 		.ascii	"_o_o"
 498 0030 6F5F5F6F 		.ascii	"o__o"
 499 0034 5F6F5F5F 		.ascii	"_o__"
 500 0038 5F5F385F 		.ascii	"__8_"
 501 003c 5F6F385F 		.ascii	"_o8_"
 502 0040 5F5F6F5F 		.ascii	"__o_"
 503 0044 5F5F5F5F 		.ascii	"____"
 504 0048 5F5F5F5F 		.ascii	"____"
 505 004c 6F5F5F5F 		.ascii	"o___"
 506 0050 5F5F5F6F 		.ascii	"___o"
 507 0054 6F5F6F5F 		.ascii	"o_o_"
 508 0058 5F386F5F 		.ascii	"_8o_"
 509 005c 5F6F5F5F 		.ascii	"_o__"
 510 0060 5F5F6F5F 		.ascii	"__o_"
 511 0064 6F5F5F5F 		.ascii	"o___"
 512 0068 5F5F5F6F 		.ascii	"___o"
 513 006c 5F5F5F5F 		.ascii	"____"
 514              		.text
 515              		.align	1
 516              		.global	loadLvl
 517              		.syntax unified
 518              		.code	16
 519              		.thumb_func
 520              		.fpu softvfp
 522              	loadLvl:
 523              	.LFB8:
 197:Z:/MOP/c-code/mop/SuperPedro\main.c **** 
 198:Z:/MOP/c-code/mop/SuperPedro\main.c **** 
 199:Z:/MOP/c-code/mop/SuperPedro\main.c **** void loadLvl(int start){        //loads a 64px wide levelstrip of new peppers into the backBuffer (
 524              		.loc 1 199 0
 525              		.cfi_startproc
 526              		@ args = 0, pretend = 0, frame = 96
 527              		@ frame_needed = 1, uses_anonymous_args = 0
 528 01a4 80B5     		push	{r7, lr}
 529              		.cfi_def_cfa_offset 8
 530              		.cfi_offset 7, -8
 531              		.cfi_offset 14, -4
 532 01a6 98B0     		sub	sp, sp, #96
 533              		.cfi_def_cfa_offset 104
 534 01a8 00AF     		add	r7, sp, #0
 535              		.cfi_def_cfa_register 7
 536 01aa 7860     		str	r0, [r7, #4]
 200:Z:/MOP/c-code/mop/SuperPedro\main.c **** 	//int seed = getDistance();
 201:Z:/MOP/c-code/mop/SuperPedro\main.c ****     int rand = (nextRnd(&seed) % 19);
 537              		.loc 1 201 0
 538 01ac 174B     		ldr	r3, .L34
 539 01ae 1800     		movs	r0, r3
 540 01b0 FFF7FEFF 		bl	nextRnd
 541 01b4 0300     		movs	r3, r0
 542 01b6 1321     		movs	r1, #19
 543 01b8 1800     		movs	r0, r3
 544 01ba FFF7FEFF 		bl	__aeabi_uidivmod
 545              	.LVL0:
 546 01be 0B00     		movs	r3, r1
 547 01c0 BB65     		str	r3, [r7, #88]
 202:Z:/MOP/c-code/mop/SuperPedro\main.c **** 	//int type = nextRnd() % 20;      // Returns a pseudo-random integer between 0 and 10, några olik
 203:Z:/MOP/c-code/mop/SuperPedro\main.c ****     char PepperStrips[][4] = { "____", "_oo_", "_8__", "_o_o", "o__o", "_o__", "__8_", "_o8_", "__o
 548              		.loc 1 203 0
 549 01c2 0823     		movs	r3, #8
 550 01c4 FA18     		adds	r2, r7, r3
 551 01c6 124B     		ldr	r3, .L34+4
 552 01c8 1000     		movs	r0, r2
 553 01ca 1900     		movs	r1, r3
 554 01cc 5023     		movs	r3, #80
 555 01ce 1A00     		movs	r2, r3
 556 01d0 FFF7FEFF 		bl	memcpy
 557              	.LBB5:
 204:Z:/MOP/c-code/mop/SuperPedro\main.c **** 	
 205:Z:/MOP/c-code/mop/SuperPedro\main.c **** 	
 206:Z:/MOP/c-code/mop/SuperPedro\main.c **** 	for(int i = 0; i < 4; i++){
 558              		.loc 1 206 0
 559 01d4 0023     		movs	r3, #0
 560 01d6 FB65     		str	r3, [r7, #92]
 561 01d8 11E0     		b	.L32
 562              	.L33:
 207:Z:/MOP/c-code/mop/SuperPedro\main.c **** 		loadPepperStrip(start + i*16, PepperStrips[rand][i]);
 563              		.loc 1 207 0 discriminator 3
 564 01da FB6D     		ldr	r3, [r7, #92]
 565 01dc 1A01     		lsls	r2, r3, #4
 566 01de 7B68     		ldr	r3, [r7, #4]
 567 01e0 D018     		adds	r0, r2, r3
 568 01e2 0823     		movs	r3, #8
 569 01e4 FA18     		adds	r2, r7, r3
 570 01e6 BB6D     		ldr	r3, [r7, #88]
 571 01e8 9B00     		lsls	r3, r3, #2
 572 01ea D218     		adds	r2, r2, r3
 573 01ec FB6D     		ldr	r3, [r7, #92]
 574 01ee D318     		adds	r3, r2, r3
 575 01f0 1B78     		ldrb	r3, [r3]
 576 01f2 1900     		movs	r1, r3
 577 01f4 FFF7FEFF 		bl	loadPepperStrip
 206:Z:/MOP/c-code/mop/SuperPedro\main.c **** 		loadPepperStrip(start + i*16, PepperStrips[rand][i]);
 578              		.loc 1 206 0 discriminator 3
 579 01f8 FB6D     		ldr	r3, [r7, #92]
 580 01fa 0133     		adds	r3, r3, #1
 581 01fc FB65     		str	r3, [r7, #92]
 582              	.L32:
 206:Z:/MOP/c-code/mop/SuperPedro\main.c **** 		loadPepperStrip(start + i*16, PepperStrips[rand][i]);
 583              		.loc 1 206 0 is_stmt 0 discriminator 1
 584 01fe FB6D     		ldr	r3, [r7, #92]
 585 0200 032B     		cmp	r3, #3
 586 0202 EADD     		ble	.L33
 587              	.LBE5:
 208:Z:/MOP/c-code/mop/SuperPedro\main.c **** 	}
 209:Z:/MOP/c-code/mop/SuperPedro\main.c **** 	//drawGround(start, start+63);
 210:Z:/MOP/c-code/mop/SuperPedro\main.c ****     
 211:Z:/MOP/c-code/mop/SuperPedro\main.c **** }
 588              		.loc 1 211 0 is_stmt 1
 589 0204 C046     		nop
 590 0206 BD46     		mov	sp, r7
 591 0208 18B0     		add	sp, sp, #96
 592              		@ sp needed
 593 020a 80BD     		pop	{r7, pc}
 594              	.L35:
 595              		.align	2
 596              	.L34:
 597 020c 00000000 		.word	seed
 598 0210 20000000 		.word	.LC1
 599              		.cfi_endproc
 600              	.LFE8:
 602              		.align	1
 603              		.global	onWin
 604              		.syntax unified
 605              		.code	16
 606              		.thumb_func
 607              		.fpu softvfp
 609              	onWin:
 610              	.LFB9:
 212:Z:/MOP/c-code/mop/SuperPedro\main.c **** 
 213:Z:/MOP/c-code/mop/SuperPedro\main.c **** /*
 214:Z:/MOP/c-code/mop/SuperPedro\main.c **** void drawGround(int from, int to){
 215:Z:/MOP/c-code/mop/SuperPedro\main.c ****     char c = 0b10000000;
 216:Z:/MOP/c-code/mop/SuperPedro\main.c ****     for(from; from <= to; from++){
 217:Z:/MOP/c-code/mop/SuperPedro\main.c ****         backBuffer[from][7] |= c;
 218:Z:/MOP/c-code/mop/SuperPedro\main.c ****     }
 219:Z:/MOP/c-code/mop/SuperPedro\main.c **** }
 220:Z:/MOP/c-code/mop/SuperPedro\main.c **** */
 221:Z:/MOP/c-code/mop/SuperPedro\main.c **** 
 222:Z:/MOP/c-code/mop/SuperPedro\main.c **** 
 223:Z:/MOP/c-code/mop/SuperPedro\main.c **** void onWin(){
 611              		.loc 1 223 0
 612              		.cfi_startproc
 613              		@ args = 0, pretend = 0, frame = 0
 614              		@ frame_needed = 1, uses_anonymous_args = 0
 615 0214 80B5     		push	{r7, lr}
 616              		.cfi_def_cfa_offset 8
 617              		.cfi_offset 7, -8
 618              		.cfi_offset 14, -4
 619 0216 00AF     		add	r7, sp, #0
 620              		.cfi_def_cfa_register 7
 224:Z:/MOP/c-code/mop/SuperPedro\main.c **** 	//ska vi ha med denna?
 225:Z:/MOP/c-code/mop/SuperPedro\main.c **** }
 621              		.loc 1 225 0
 622 0218 C046     		nop
 623 021a BD46     		mov	sp, r7
 624              		@ sp needed
 625 021c 80BD     		pop	{r7, pc}
 626              		.cfi_endproc
 627              	.LFE9:
 629              		.align	1
 630              		.global	main
 631              		.syntax unified
 632              		.code	16
 633              		.thumb_func
 634              		.fpu softvfp
 636              	main:
 637              	.LFB10:
 226:Z:/MOP/c-code/mop/SuperPedro\main.c **** 
 227:Z:/MOP/c-code/mop/SuperPedro\main.c **** 
 228:Z:/MOP/c-code/mop/SuperPedro\main.c **** 
 229:Z:/MOP/c-code/mop/SuperPedro\main.c **** 
 230:Z:/MOP/c-code/mop/SuperPedro\main.c **** 
 231:Z:/MOP/c-code/mop/SuperPedro\main.c **** 
 232:Z:/MOP/c-code/mop/SuperPedro\main.c **** 
 233:Z:/MOP/c-code/mop/SuperPedro\main.c **** 
 234:Z:/MOP/c-code/mop/SuperPedro\main.c **** 
 235:Z:/MOP/c-code/mop/SuperPedro\main.c **** 
 236:Z:/MOP/c-code/mop/SuperPedro\main.c **** 
 237:Z:/MOP/c-code/mop/SuperPedro\main.c **** 
 238:Z:/MOP/c-code/mop/SuperPedro\main.c **** 
 239:Z:/MOP/c-code/mop/SuperPedro\main.c **** 
 240:Z:/MOP/c-code/mop/SuperPedro\main.c **** 
 241:Z:/MOP/c-code/mop/SuperPedro\main.c **** 
 242:Z:/MOP/c-code/mop/SuperPedro\main.c **** 
 243:Z:/MOP/c-code/mop/SuperPedro\main.c **** 
 244:Z:/MOP/c-code/mop/SuperPedro\main.c **** 
 245:Z:/MOP/c-code/mop/SuperPedro\main.c **** 
 246:Z:/MOP/c-code/mop/SuperPedro\main.c **** 
 247:Z:/MOP/c-code/mop/SuperPedro\main.c **** 
 248:Z:/MOP/c-code/mop/SuperPedro\main.c **** 
 249:Z:/MOP/c-code/mop/SuperPedro\main.c **** 
 250:Z:/MOP/c-code/mop/SuperPedro\main.c **** void main(void){
 638              		.loc 1 250 0
 639              		.cfi_startproc
 640              		@ args = 0, pretend = 0, frame = 0
 641              		@ frame_needed = 1, uses_anonymous_args = 0
 642 021e 80B5     		push	{r7, lr}
 643              		.cfi_def_cfa_offset 8
 644              		.cfi_offset 7, -8
 645              		.cfi_offset 14, -4
 646 0220 00AF     		add	r7, sp, #0
 647              		.cfi_def_cfa_register 7
 251:Z:/MOP/c-code/mop/SuperPedro\main.c ****     init();
 648              		.loc 1 251 0
 649 0222 FFF7FEFF 		bl	init
 650              	.L38:
 252:Z:/MOP/c-code/mop/SuperPedro\main.c **** 	while(1){
 253:Z:/MOP/c-code/mop/SuperPedro\main.c **** 		loop();
 651              		.loc 1 253 0 discriminator 1
 652 0226 FFF7FEFF 		bl	loop
 653 022a FCE7     		b	.L38
 654              		.cfi_endproc
 655              	.LFE10:
 657              	.Letext0:
 658              		.file 2 "c:\\cseapp\\codelite\\tools\\gcc-arm\\arm-none-eabi\\include\\machine\\_default_types.h"
 659              		.file 3 "c:\\cseapp\\codelite\\tools\\gcc-arm\\arm-none-eabi\\include\\sys\\_stdint.h"
 660              		.file 4 "Z:/MOP/c-code/mop/SuperPedro/gpio.h"
 661              		.file 5 "c:\\cseapp\\codelite\\tools\\gcc-arm\\arm-none-eabi\\include\\sys\\lock.h"
 662              		.file 6 "c:\\cseapp\\codelite\\tools\\gcc-arm\\arm-none-eabi\\include\\sys\\_types.h"
 663              		.file 7 "c:\\cseapp\\codelite\\tools\\gcc-arm\\lib\\gcc\\arm-none-eabi\\7.2.1\\include\\stddef.h"
 664              		.file 8 "c:\\cseapp\\codelite\\tools\\gcc-arm\\arm-none-eabi\\include\\sys\\reent.h"
