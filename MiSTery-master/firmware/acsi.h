#ifndef ACSI_H
#define ACSI_H

// FPGA spi cmommands
#define MIST_INVALID      0x00

// memory interface
#define MIST_SET_ADDRESS  0x01
#define MIST_WRITE_MEMORY 0x02
#define MIST_READ_MEMORY  0x03
#define MIST_SET_CONTROL  0x04
#define MIST_GET_DMASTATE 0x05   // reads state of dma and floppy controller
#define MIST_ACK_DMA      0x06   // acknowledge a dma command
#define MIST_BUS_REQ      0x07   // request bus
#define MIST_BUS_REL      0x08   // release bus
#define MIST_SET_VADJ     0x09
#define MIST_NAK_DMA      0x0a   // reject a dma command

// up to eight acsi devices can be enabled
#define TOS_ACSI0_ENABLE          0x00000400
#define TOS_ACSI1_ENABLE          0x00000800
#define TOS_ACSI2_ENABLE          0x00001000
#define TOS_ACSI3_ENABLE          0x00002000
#define TOS_ACSI4_ENABLE          0x00004000
#define TOS_ACSI5_ENABLE          0x00008000
#define TOS_ACSI6_ENABLE          0x00010000
#define TOS_ACSI7_ENABLE          0x00020000

#endif

