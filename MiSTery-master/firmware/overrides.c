#include <stdarg.h>
#include <stdio.h>
#include <string.h>

#include "config.h"

#include "configstring.h"
#include "keyboard.h"
#include "uart.h"
#include "spi.h"
#include "minfat.h"
#include "interrupts.h"
#include "ps2.h"
#include "user_io.h"
#include "osd.h"
#include "menu.h"
#include "font.h"
#include "cue_parser.h"
#include "pcecd.h"
#include "timer.h"
#include "diskimg.h"
#include "spi_sd.h"
#include "user_io.h"

#undef DEBUG

#include "c64keys.c"
#include "acsi.c"

#define MIST_SET_CONTROL 0x04


struct mistery_config
{
	char version;
	char scandouble;
	char pad[2];
	int status;
	uint32_t romdir;
	uint32_t hdddir[2];
	char romname[12]; /* Must be null-terminated */
	char hddname[2][12]; /* Must be null-terminated */
};

struct mistery_config configfile_data;


extern unsigned int statusword; /* So we can toggle the write-protect bits and provoke diskchanges. */

/* Override this since the status is sent to dataio, not userio */
void sendstatus()
{
	configfile_data.status=statusword;
	SPI(0xff);
	SPI_ENABLE(HW_SPI_FPGA);
	SPI(MIST_SET_CONTROL);
	SPI(statusword>>24);
	SPI(statusword>>16);
	SPI(statusword>>8);
	SPI(statusword);
	SPI_DISABLE(HW_SPI_FPGA);
}

// STe always has a blitter
// wire       viking_en = system_ctrl[28];
// wire [8:0] acsi_enable = system_ctrl[17:10];

// 00000000000000001111111111111111
// 0123456789ABCDEF0123456789ABCDEF
// 0123456789ABCDEFGHIJKLMNOPQRSTUV

char *configstring="Atari ST;;"
	"P1,Storage;"
	"P1S0U,ST ,Floppy A:;"
	"P1S1U,ST ,Floppy B:;"
	"P1O67,Write protect,Off,A:,B:,Both;"
//	"O45,CPU,68000,68020;"
	"P1OAB,Hard disks,None,Unit 0,Unit 1,Both;"
	"P1S2U,HDFVHD,Hardfile 0;"
	"P1S3U,HDFVHD,Hardfile 1;"
	"P2,System;"
	"P2ONO,Chipset,ST,STE,MegaSTE,STEroids;"
	"P2OJ,ST Blitter,Off,On;"
	"P2O13,RAM (need Hard Reset),512K,1MB,2MB,4MB,8MB,14MB;"
	"P2F,IMGROM,Load ROM;"
	"P2F,BINSTC,Load Cartridge;"
	"P3,Sound & Video;"
	"P3O8,Video mode,Mono,Colour;"
	"P3OS,Viking/SM194,Off,On;"
	"P3OKL,Scanlines,Off,25%,50%,75%;"
	"P3OT,Composite blend,Off,On;"
	"P3OM,Stereo sound,Off,On;"
	"P3OU,Steinberg dongle,Off,On;"
	"SC,CFG,Load config;"
	"SD,CFG,Save config;"
	"T0,Reset (Hold for hard reset);"
	"V,v3.40.";
static char *cfgptr;

int configstring_next()
{
	char result=0;
	if(cfgptr)
		result=*cfgptr++;
	if(!result)
		cfgptr=0;
	return(result);
}

void configstring_begin()
{
	cfgptr=configstring;
}


/* Key -> gamepad mapping.  We override this to swap buttons A and B for NES. */

unsigned char joy_keymap[]=
{
	KEY_CAPSLOCK,
	KEY_LSHIFT,
	KEY_LCTRL,
	KEY_ALT,
	KEY_W,
	KEY_S,
	KEY_A,
	KEY_D,
	KEY_ENTER,
	KEY_RSHIFT,
	KEY_RCTRL,
	KEY_ALTGR,
	KEY_UPARROW,
	KEY_DOWNARROW,
	KEY_LEFTARROW,
	KEY_RIGHTARROW,
};

#define DIRECTUPLOAD 0x10

/* Initial ROM */
int LoadROM(const char *fn);
extern unsigned char romtype;
extern fileTYPE file;

void clearram(int size,int idx)
{
	int i;
	SPI_ENABLE(HW_SPI_FPGA);
	SPI(SPI_FPGA_FILE_INDEX);
	SPI(idx); /* Memory clear */
	SPI_DISABLE(HW_SPI_FPGA);

	SPI_ENABLE(HW_SPI_FPGA);
	SPI(SPI_FPGA_FILE_TX);
	SPI(0x1); /* Upload */
	SPI_DISABLE(HW_SPI_FPGA);

	SPI_ENABLE_FAST_INT(HW_SPI_FPGA);
	SPI(SPI_FPGA_FILE_TX_DAT);
	for(i=0;i<size;++i)
		SPI(0x00);
	SPI_DISABLE(HW_SPI_FPGA);

	SPI_ENABLE(HW_SPI_FPGA);
	SPI(SPI_FPGA_FILE_TX);
	SPI(0x00); /* End Upload */
	SPI_DISABLE(HW_SPI_FPGA);
}


void setromtype(const char *filename)
{
	if(romtype<2 && FileOpen(&file,filename))
	{
		switch(file.size>>10)
		{
			case 256:
				romtype=0;
//				puts("256k");
				break;
			case 192:
//				puts("192k");
				romtype=1;
				break;
			default:
				break;
		}
	}
}


void buildmenu(int offset);

unsigned char initmouse[]=
{	
	0x1,0xff, // Send 1 byte reset sequence
	0x82,	// Wait for two bytes in return (in addition to the normal acknowledge byte)
//	1,0xf4,0, // Uncomment this line to leave the mouse in 3-byte mode
	8,0xf3,200,0xf3,100,0xf3,80,0xf2,1, // Send PS/2 wheel mode knock sequence...
	0x81,	// Receive device ID (should be 3 for wheel mice)
	1,0xf4,0	// Enable reporting.
};

void handlemouse(int reset)
{
	int byte;
	static int delay=0;
	static int timeout;
	static int init=0;
	static int idx=0;
	static int txcount=0;
	static int rxcount=0;
	if(reset)
		idx=0;

	if(!CheckTimer(delay))
		return;
	delay=GetTimer(20);

	if(!idx)
	{
		while(PS2MouseRead()>-1)
			; // Drain the buffer;
		txcount=initmouse[idx++];
		rxcount=0;
	}
	else
	{
		if(rxcount)
		{
			int q=PS2MouseRead();
			if(q>-1)
			{
//				printf("Received %x\n",q);
				--rxcount;
			}
			else if(CheckTimer(timeout))
			{
				/* Clear the mouse buffer on timeout, to avoid blocking if no mouse if connected */
				ps2_ringbuffer_init(&mousebuffer);
				idx=0;
			}
	
			if(!txcount && !rxcount)
			{
				int next=initmouse[idx++];
				if(next&0x80)
				{
					rxcount=next&0x7f;
//					printf("Receiving %x bytes",rxcount);
				}
				else
				{
					txcount=next;
//					printf("Sending %x bytes",txcount);
				}
			}
		}
		else if(txcount)
		{
			PS2MouseWrite(initmouse[idx++]);
			--txcount;
			rxcount=1;
			timeout=GetTimer(3500);	//3.5 seconds
		}
	}
}
#if 0
void DebugRow(int row, char *info)
{
	OsdWriteStart(row,0,0);
	OsdPutChar(' ');
	OsdPuts(info);
	OsdWriteEnd();
}

char debugtxt[32];

#define HEXDIGIT(x) ('0'+(x) + ((x)>9 ? 'A'-'9'-1 : 0))

void DebugMouse()
{
	int txcount;
	int rxcount;
	int debugrow;
	int timeout;
	int timedout;
	int timeouts=9;
	char *debugptr;

	Menu_ShowHide(1);

	while(PS2MouseRead()>-1)
		; // Drain the buffer;

	while(timeouts)
	{
		char *ptr=initmouse;

		strcpy(debugtxt,"  Mouse Debug: ");
		debugtxt[0]=HEXDIGIT(timeouts);
		DebugRow(0,debugtxt);
		memset(debugtxt,0,32);
		debugrow=1;

		debugptr=debugtxt;
		txcount=*ptr++;
		timedout=0;
		--timeouts;
		while(txcount && !timedout)
		{
			PS2MouseWrite(*ptr++);
			--txcount;
			rxcount=1;

			timeout=GetTimer(3500);	//3.5 seconds
			while(rxcount)
			{
				int q=PS2MouseRead();
				if(q>-1)
				{
					printf("Received %x\n",q);
					*debugptr++=HEXDIGIT(q>>4);
					*debugptr++=HEXDIGIT(q&15);
					--rxcount;
				}
				else if(CheckTimer(timeout))
				{
					timedout=1;
					*debugptr++='T';
					--rxcount;
				}
	
				printf("Debug text: %s\n",debugtxt);
				DebugRow(debugrow,debugtxt);
				printf("tx %d, rx %d\n",txcount,rxcount);
				if(!txcount && !rxcount)
				{
					int next=*ptr++;
					if(next&0x80)
					{
						rxcount=next&0x7f;
						printf("Receiving %x bytes",rxcount);
					}
					else
					{
						txcount=next;
						++debugrow;
						debugptr=debugtxt;
						memset(debugptr,0,32);
						printf("Sending %x bytes",txcount);
					}
					if(!txcount && !rxcount)
						timeouts=0;
				}
			}
		}
	}
}
#endif

void cycle(int row);
void toggle(int row)
{
	cycle(row);
	if(menu_longpress)
		clearram(16384,3);
	cycle(row);
}

#define STATUS_WP_UNIT0 6
#define STATUS_WP_UNIT1 7

void toggle_wp(int unit)
{
	unsigned int s=statusword;
	if(unit)
		s^=1<<STATUS_WP_UNIT1;
	else
		s^=1<<STATUS_WP_UNIT0;

	sendstatus();

	s=GetTimer(500);
	while(!CheckTimer(s))
		;
}

int loadimage(const char *filename,int unit);

int loadconfig(const char *filename)
{
	int result=0;
	char *err=0;
	uint32_t currentdir=CurrentDirectory();
	if(!filename)
		return(result);

	romtype=1;

	if(FileOpen(&file,filename))
	{
		int hdddir[2]; /* Cache these to avoid multiple reloads of the conig */
		struct mistery_config *dat=(struct mistery_config *)sector_buffer;
		statusword|=1;
		sendstatus(); /* Put the core in reset */
		FileReadSector(&file,sector_buffer);

		hdddir[0]=dat->hdddir[0];
		hdddir[1]=dat->hdddir[1];

		/* Load the config file to sector_buffer */

		if(dat->version==1)
		{
//			printf("config version OK\n");
			statusword=dat->status|1; /* Core will be in reset when status is next written */
			statusword&=~(TOS_ACSI0_ENABLE|TOS_ACSI1_ENABLE); /* Disable hard drives, will be re-enabled if HDF opens successfully. */
			scandouble=dat->scandouble;

			if(ValidateDirectory(dat->romdir))
			{
				FileReadSector(&file,sector_buffer);
				ChangeDirectoryByCluster(dat->romdir);
				result=loadimage(dat->romname,0);
			}
#ifdef DEBUG
			else
				printf("ROM directory failed validation\n");
#endif

			/* Loading the ROM file will have overwritten the config, so reload it */
			ChangeDirectoryByCluster(currentdir);
			FileOpen(&file,filename);

			if(ValidateDirectory(hdddir[0]))
			{
				FileReadSector(&file,sector_buffer);
				ChangeDirectoryByCluster(dat->hdddir[0]);
				loadimage(dat->hddname[0],'2');
			}
#ifdef DEBUG
			else
				printf("HDDDir[0] bad\n");
#endif

			/* Reload the config again */

			ChangeDirectoryByCluster(currentdir);
			FileOpen(&file,filename);

			if(ValidateDirectory(hdddir[1]))
			{
				FileReadSector(&file,sector_buffer);
				ChangeDirectoryByCluster(dat->hdddir[1]);
				loadimage(dat->hddname[1],'3');
			}
#ifdef DEBUG
			else
				printf("HDDDir[1] bad\n");
#endif
		}
	}
//	else
//		err="Can't open file";
	if(err)
	{
// FIXME - error handling.
//		menu[7].label=err;
//		Menu_Draw(7);
//		Menu_ShowHide(1);
	}
	clearram(16384,2); /* Force hard reset */
	clearram(16384,3); /* Clear cartridge memory */
	statusword&=~1; /* Release reset */
	sendstatus();
	SetScandouble(scandouble);
	return(result);
}


int saveconfig(const char *filename)
{
	putchar('\n');
	if(FileOpen(&file,filename))
	{
		configfile_data.version=1;
		configfile_data.scandouble=scandouble;
		configfile_data.status=statusword;
		/* Ensure null-termination of filenames */
		configfile_data.romname[11]=0;
		configfile_data.hddname[0][11]=0;
		configfile_data.hddname[1][11]=0;
		FileWriteSector(&file,(char *)&configfile_data);
		return(1);
	}
	return(0);
}


int loadimage(const char *filename,int unit)
{
	int result=0;
	int u=unit-'0';

	switch(unit)
	{
		/* ROM images */
		case 0:
			if(filename && filename[0])
			{
				clearram(16384,2); /* Clear cartridge memory */
				strncpy(configfile_data.romname,filename,11);
				configfile_data.romname[11]=0;
				configfile_data.romdir=CurrentDirectory();
				statusword|=1;
				sendstatus();
				setromtype(configfile_data.romname);
				LoadROM(configfile_data.romname);
				result=1;
			}
			break;
		/* Floppy images */
		case '0':
		case '1':
			diskimg_mount(0,u);
			toggle_wp(u);
			diskimg_mount(filename,u);
			result=diskimg[u].file.size;
			break;
		/* Hard disk images */
		case '2':
		case '3':
			diskimg[u].file.size=0;
			if(filename)// && filename[0])
			{
				strncpy(configfile_data.hddname[u-2],filename,11);
				configfile_data.hddname[u-2][11]=0;
				FileOpen(&diskimg[u].file,configfile_data.hddname[u-2]);
			}
			else
				configfile_data.hddname[u-2][0]=0;
			configfile_data.hdddir[u-2]=CurrentDirectory();

			if(diskimg[u].file.size)
				statusword|=(TOS_ACSI0_ENABLE<<(u-2));
			else
				statusword&=~(TOS_ACSI0_ENABLE<<(u-2));
			result=diskimg[u].file.size;
			break;
		/* Configuration files */
		case 'C': /* Load config */
			result=loadconfig(filename);
			break;
		case 'D': /* Save config */
			result=saveconfig(filename);
			break;
	}
	statusword&=~1;
	sendstatus();
	return(result);
}


const char *bootrom_name="TOS     IMG";
const char *bootcfg_name="MISTERY CFG";

#if 0
static void interrupthandler()
{
	handlec64keys();
	PS2Handler();
}
#endif

char *autoboot()
{
	char *result=0;
	int s;
	statusword=1;

	romtype=1;
	configstring_index=0;

	sendstatus();
	clearram(16384,3);
	clearram(16384,2); /* Clear cartridge memory */

	if(!loadconfig(bootcfg_name))
	{
		sendstatus();
		setromtype(bootrom_name);
		LoadROM(bootrom_name);
		statusword&=~1;
		sendstatus();
		s=GetTimer(400);
		while(!CheckTimer(s))
			;
		statusword|=1;
		sendstatus();
		s=GetTimer(100);
		while(!CheckTimer(s))
			;
	}
	statusword&=~1;
	sendstatus();

	initc64keys();
	/* Override the interrupt handler previously set in PS2Init() */
/*	SetIntHandler(&interrupthandler); */

	/* Initialise the PS/2 mouse */
	EnableInterrupts();
	handlemouse(1);

	return(result);
}


char *get_rtc();

int UpdateKeys(int blockkeys)
{
	handlec64keys();
	return(HandlePS2RawCodes(blockkeys));
}

__weak void mainloop()
{
	int framecounter;
	while(1)
	{
		handlemouse(0);
		Menu_Run();
		diskimg_poll();
		mist_get_dmastate();
		if((framecounter++&8191)==0)
			user_io_send_rtc(get_rtc());
	}
}

