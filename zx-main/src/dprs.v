//-------------------------------------------------------------------------------------------------
module dprs
//-------------------------------------------------------------------------------------------------
#
(
	parameter KB = 0,
	parameter FN = ""
)
(
	input  wire                      clock,
	input  wire                      ce1,
	input  wire[$clog2(KB*1024)-1:0] a1,
	output reg [                7:0] q1,
	input  wire                      ce2,
	input  wire                      we2,
	input  wire[$clog2(KB*1024)-1:0] a2,
	input  wire[                7:0] d2
);
//-------------------------------------------------------------------------------------------------

reg[7:0] dpr[(KB*1024)-1:0];
initial if(FN != "") $readmemh(FN, dpr, 0);

always @(posedge clock) if(ce1) q1 <= dpr[a1];
always @(posedge clock) if(ce2) if(we2) dpr[a2] <= d2;

//-------------------------------------------------------------------------------------------------
endmodule
//-------------------------------------------------------------------------------------------------