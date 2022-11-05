#include <stdio.h>
#include <string.h>

#include "interrupts.h"
#include "spi.h"
#include "minfat.h"

#include "acsi.h"

#undef ACSI_DEBUG

#define disk_inserted(x) diskimg[x].file.size

#define DISKLED_ON
#define DISKLED_OFF


typedef struct {
	char acsi_img[2][64];
	char sd_direct;
} tos_config_t;

static tos_config_t config;


//unsigned char spi_speed;
//unsigned char spi_newspeed;
#if 1
static const char *acsi_cmd_name(int cmd) {
	static const char *cmdname[] = {
		"Test Drive Ready", "Restore to Zero", "Cmd $2", "Request Sense",
		"Format Drive", "Read Block limits", "Reassign Blocks", "Cmd $7", 
		"Read Sector", "Cmd $9", "Write Sector", "Seek Block", 
		"Cmd $C", "Cmd $D", "Cmd $E", "Cmd $F", 
		"Cmd $10", "Cmd $11", "Inquiry", "Verify", 
		"Cmd $14", "Mode Select", "Cmd $16", "Cmd $17", 
		"Cmd $18", "Cmd $19", "Mode Sense", "Start/Stop Unit", 
		"Cmd $1C", "Cmd $1D", "Cmd $1E", "Cmd $1F",
		// extended commands supported by ICD feature:
		"Cmd $20", "Cmd $21", "Cmd $22", 
		"Read Format Capacities", "Cmd $24", "Read Capacity (10)",
		"Cmd $26", "Cmd $27", "Read (10)", "Read Generation", 
		"Write (10)", "Seek (10)"
	};

	if(cmd > 0x2b) return NULL;

	return cmdname[cmd];
}
#endif

static void mist_memory_set_address(unsigned long a, unsigned char s, char rw) {
	//	iprintf("set addr = %x, %d, %d\n", a, s, rw);

	a |= rw?0x1000000:0;
	a >>= 1;

	EnableFpga();
	SPI(MIST_SET_ADDRESS);
	SPI(s);
	SPI((a >> 16) & 0xff);
	SPI((a >>	8) & 0xff);
	SPI((a >>	0) & 0xff);
	DisableFpga();
}

static void mist_set_control(unsigned long ctrl) {
	EnableFpga();
	SPI(MIST_SET_CONTROL);
	SPI((ctrl >> 24) & 0xff);
	SPI((ctrl >> 16) & 0xff);
	SPI((ctrl >>	8) & 0xff);
	SPI((ctrl >>	0) & 0xff);
	DisableFpga();
}

static void mist_memory_read(char *data, unsigned long words) {
	EnableFpga();
	SPI(MIST_READ_MEMORY);

	// transmitted bytes must be multiple of 2 (-> words)
	while(words--) {
		*data++ = SPI(0);
		*data++ = SPI(0);
	}

	DisableFpga();
}
#if 0
static void mist2_spi_set_speed(unsigned char speed)
{
	if (user_io_core_type() == CORE_TYPE_MIST2) spi_set_speed(speed);
}
#endif

static void mist_memory_write(char *data, unsigned long words) {
	EnableFpga();
	SPI(MIST_WRITE_MEMORY);

	while(words--) {
		SPI(*data++);
		SPI(*data++);
	}

	DisableFpga();
}

static void mist_memory_read_block(char *data) {
//	spi_speed = spi_get_speed();
//	mist2_spi_set_speed(spi_newspeed);
	EnableFpga();
	SPI(MIST_READ_MEMORY);

	spi_read(data,512);

	DisableFpga();
//	mist2_spi_set_speed(spi_speed);
}

static void mist_memory_write_block(char *data) {
	EnableFpga();
	SPI(MIST_WRITE_MEMORY);

	spi_write(data,512);

	DisableFpga();
}

void mist_memory_set(char data, unsigned long words) {
	EnableFpga();
	SPI(MIST_WRITE_MEMORY);

	while(words--) {
		SPI(data);
		SPI(data);
	}

	DisableFpga();
}


static void dma_ack(unsigned char status) {
	EnableFpga();
	SPI(MIST_ACK_DMA);
	SPI(status);
	DisableFpga();
}

static void dma_nak(void) {
	EnableFpga();
	SPI(MIST_NAK_DMA);
	DisableFpga();
}

void handle_acsi(unsigned char *buffer) {
	static unsigned char asc[2] = { 0,0 };
	int target = buffer[10] >> 5;
	int device = buffer[1] >> 5;
	int cmd = buffer[0];
	unsigned int lba = 256 * 256 * (buffer[1] & 0x1f) +
		256 * buffer[2] + buffer[3];
	unsigned int length = buffer[4];
	if(length == 0) length = 256;

#ifdef ACSI_DEBUG
	printf("ACSI: target %x.%x, cmd %s, (%x),", target, device, acsi_cmd_name(cmd), cmd);
	printf(" lba (%x), length %x\n", lba, length);
#endif

	// only a harddisk on ACSI 0/1 is supported
	// ACSI 0/1 is only supported if a image is loaded
	// ACSI 0 is only supported for direct IO

	if( (target < 2) && disk_inserted(target+2))
	{
		unsigned int blocks = diskimg[target+2].file.size / 512;

		// only lun0 is fully supported
		switch(cmd) {
			case 0x25:
				if(device == 0) {
					memset(sector_buffer, 0, 512);
					sector_buffer[0] = (blocks-1) >> 24;
					sector_buffer[1] = (blocks-1) >> 16;
					sector_buffer[2] = (blocks-1) >> 8;
					sector_buffer[3] = (blocks-1) >> 0;
					sector_buffer[6] = 2;	// 512 bytes per block

					mist_memory_write(sector_buffer, 4);

					dma_ack(0x00);
					asc[target] = 0x00;
				} else {
					dma_ack(0x02);
					asc[target] = 0x25;
				}
				break;

			case 0x00: // test drive ready
			case 0x04: // format
				if(device == 0) {
					asc[target] = 0x00;
					dma_ack(0x00);
				} else {
					asc[target] = 0x25;
					dma_ack(0x02);
				}
				break;

			case 0x03: // request sense
				if(device != 0)
					asc[target] = 0x25;

				memset(sector_buffer, 0, 512);
				sector_buffer[7] = 0x0b;
				if(asc[target] != 0) {
					sector_buffer[2] = 0x05;
					sector_buffer[12] = asc[target];
				}
				mist_memory_write(sector_buffer, 9); // 18 bytes
				dma_ack(0x00);
				asc[target] = 0x00;
				break;

			case 0x08: // read sector
			case 0x28: // read (10)
				if(device == 0) {
					if(cmd == 0x28) {
						lba = 
							256 * 256 * 256 * buffer[2] +
							256 * 256 * buffer[3] +
							256 * buffer[4] + 
							buffer[5];

						length = 256 * buffer[7] + buffer[8];
//						printf("READ(10) %x, %x\n", lba, length);
					}

					if(lba+length <= blocks) {
						DISKLED_ON;
						// SD-Card -> FPGA direct SPI transfer on MIST2
						FileSeek(&diskimg[target+2].file, lba<<9);
						while(length--)
						{
							FileReadSector(&diskimg[target+2].file,0);
							FileNextSector(&diskimg[target+2].file,1);
						}
						DISKLED_OFF;
						dma_ack(0x00);
						asc[target] = 0x00;
					} else {
//						puts("ACSI: read beyond end of device");
#ifdef ACSI_DEBUG
						printf("ACSI: read (%x+%x) exceeds device limits (%x)", 
							lba, length, blocks);
#endif
						dma_ack(0x02);
						asc[target] = 0x21;
					}
				} else {
					dma_ack(0x02);
					asc[target] = 0x25;
				}
				break;

			case 0x0a: // write sector
			case 0x2a: // write (10)
				if(device == 0) {
					if(cmd == 0x2a) {
						lba = 
							256 * 256 * 256 * buffer[2] +
							256 * 256 * buffer[3] +
							256 * buffer[4] + 
							buffer[5];

						length = 256 * buffer[7] + buffer[8];
					}

					if(lba+length <= blocks) {
						DISKLED_ON;
						while(length) {
							FileSeek(&diskimg[target+2].file, lba<<9);
							mist_memory_read_block(sector_buffer);
							FileWriteSector(&diskimg[target+2].file, sector_buffer);
							FileNextSector(&diskimg[target+2].file,1);
							lba++;
							length--;
						}
						DISKLED_OFF;
						dma_ack(0x00);
						asc[target] = 0x00;
					} else {
//						puts("ACSI: write beyond end of device");
#ifdef ACSI_DEBUG
						printf("ACSI: write (%x+%x) exceeds device limits (%x)", 
							lba, length, blocks);
#endif
						dma_ack(0x02);
						asc[target] = 0x21;
					}
				} else {
					dma_ack(0x02);
					asc[target] = 0x25;
				}
				break;

			case 0x12: // inquiry
//			printf("ACSI: Inquiry target %d", target);
				memset(sector_buffer, 0, 512);
				sector_buffer[2] = 2;																	 // SCSI-2
				sector_buffer[4] = length-5;														// len
				memcpy(sector_buffer+8,	"TC64    ", 8);								// Vendor
				memcpy(sector_buffer+16, "DeMiSTify HDD 0 ",16);
				sector_buffer[30]='0'+target;
				memcpy(sector_buffer+32, "832 ", 4);										// Product revision
				memcpy(sector_buffer+36, "20120929	", 8);								// Serial number
				if(device != 0) sector_buffer[0] = 0x7f;
				mist_memory_write(sector_buffer, length/2);
				dma_ack(0x00);
				asc[target] = 0x00;
				break;

			case 0x1a: // mode sense
				if(device == 0) {
//					printf("ACSI: mode sense, blocks = 0x%x", blocks);
					memset(sector_buffer, 0, 512);
					sector_buffer[3] = 8;						// size of extent descriptor list
					sector_buffer[5] = blocks >> 16;
					sector_buffer[6] = blocks >> 8;
					sector_buffer[7] = blocks;
					sector_buffer[10] = 2;					 // byte 1 of block size in bytes (512)
					mist_memory_write(sector_buffer, length/2);
					dma_ack(0x00);
					asc[target] = 0x00;
				} else {
					asc[target] = 0x25;
					dma_ack(0x02);
				}
				break;

	#if 0
			case 0x1f: // ICD command?
				printf("ACSI: ICD command %s ($%02x)",
					acsi_cmd_name(buffer[1] & 0x1f), buffer[1] & 0x1f);
				asc[target] = 0x05;
				dma_ack(0x02);
				break;
	#endif

			default:
//				puts("ACSI: Unsupported command");
				asc[target] = 0x20;
				dma_ack(0x02);
				break;
		}
	} else {
#ifdef ACSI_DEBUG
		printf("ACSI: Request for unsupported target");
#endif
//		puts("ACSI: Unsupported target");
		// tell acsi state machine that io controller is done 
		// but don't generate a acsi irq
		dma_nak();
	}
}


void mist_get_dmastate() {
	unsigned char buffer[32];
	unsigned int dma_address;
	unsigned char scnt;

//	DisableInterrupts();
	EnableFpga();
	SPI(MIST_GET_DMASTATE);
	spi_read(buffer, 16);
	DisableFpga();

	// CORE_TYPE_MIST2
	if(buffer[10] & 0x01) {
//		spi_newspeed = SPI_MMC_CLK_VALUE;
		handle_acsi(buffer);
	}
//	EnableInterrupts();
}


static unsigned long get_long(char *buffer, int offset) {
	unsigned long retval = 0;
	int i;

	for(i=0;i<4;i++)
		retval = (retval << 8) + *(unsigned char*)(buffer+offset+i);

	return retval;
}

