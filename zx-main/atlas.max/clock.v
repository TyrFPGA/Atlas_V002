//-------------------------------------------------------------------------------------------------
module clock
//-------------------------------------------------------------------------------------------------
(
	input  wire       i,
	input  wire       model,
	output wire       clock1x,
	output wire       clock2x,
	output wire       clock5x,
	output wire       power,

	output reg        pe7M0,
	output reg        ne7M0,

	output reg        pe3M5,
	output reg        ne3M5
);
//-------------------------------------------------------------------------------------------------

wire c0x1, c0x2, c0x5, l0;

pll Clock0
(
	.inclk0 (i      ),
	.c0     (c0x1   ), //  28.0000 MHz output
	.c1     (c0x2   ), //  56.0000 MHz output
	.c2     (c0x5   ), // 140.0000 MHz output
	.locked (l0     )
);

//-------------------------------------------------------------------------------------------------
/*
wire c1x1, c1x2, c1x5, l1;

pll1 Clock1
(
	.inclk0 (i      ),
	.c0     (c1x1   ), //  28.3752 MHz output
	.c1     (c1x2   ), //  56.7504 MHz output
	.c2     (c1x5   ), // 141.8760 MHz output
	.locked (l1     )
);
*/
//-------------------------------------------------------------------------------------------------

reg[3:0] ce = 4'd1;
always @(negedge clock2x) if(power) begin
	ce <= ce+1'd1;
	pe7M0 <= ~ce[0] & ~ce[1] &  ce[2];
	ne7M0 <= ~ce[0] & ~ce[1] & ~ce[2];
	pe3M5 <= ~ce[0] & ~ce[1] & ~ce[2] &  ce[3];
	ne3M5 <= ~ce[0] & ~ce[1] & ~ce[2] & ~ce[3];
end

//-------------------------------------------------------------------------------------------------

assign clock1x = c0x1;
assign clock2x = c0x2;
assign clock5x = c0x5;

assign power = l0;

//-------------------------------------------------------------------------------------------------
endmodule
//-------------------------------------------------------------------------------------------------
