//-------------------------------------------------------------------------------------------------
module hdmi
//-------------------------------------------------------------------------------------------------
(
	input  wire       clock5x,
	input  wire       clock1x,

	input  wire       blank,
	input  wire[ 1:0] sync,
	input  wire[23:0] rgb,

	output wire[ 7:0] tmds
);
//-------------------------------------------------------------------------------------------------

wire[7:0] r = rgb[23:16];
wire[7:0] g = rgb[15: 8];
wire[7:0] b = rgb[ 7: 0];

wire[9:0] re;
wire[9:0] ge;
wire[9:0] be;

encoder EncoderR
(
	.clock  (clock1x),
	.blank  (blank  ),
	.c      (2'b00  ),
	.d      (r      ),
	.q      (re     )
);
encoder EncoderG
(
	.clock  (clock1x),
	.blank  (blank  ),
	.c      (2'b00  ),
	.d      (g      ),
	.q      (ge     )
);
encoder EncoderB
(
	.clock  (clock1x),
	.blank  (blank  ),
	.c      (sync   ),
	.d      (b      ),
	.q      (be     )
);

//-------------------------------------------------------------------------------------------------

wire[29:0] txi = {
	re[0], re[1], re[2], re[3], re[4], re[5], re[6], re[7], re[8], re[9],
	ge[0], ge[1], ge[2], ge[3], ge[4], ge[5], ge[6], ge[7], ge[8], ge[9],
	be[0], be[1], be[2], be[3], be[4], be[5], be[6], be[7], be[8], be[9]
};

wire[2:0] txo;

serializer Serializer
(
	.tx_inclock  (clock5x),
	.tx_syncclock(clock1x),
	.tx_in       (txi    ),
	.tx_out      (txo    )
);

//-------------------------------------------------------------------------------------------------

assign tmds = { txo[2], 1'b0, txo[1], 1'b0, txo[0], 1'b0, clock1x, 1'b0 };

//-------------------------------------------------------------------------------------------------
endmodule
//-------------------------------------------------------------------------------------------------