// Used on posedge of CLK_N to select a column to write

module WRITE (
input reg [9:0] COL		,
input reg [1:0] BANK		,
input reg PRECHARGE		, // SET 1 FOR PRECHARGE
input reg DATA_IN			,

output reg CKE				,
output reg RAS				,
output reg CAS				,
output reg WE				,
output reg [1:0] BA		,
output reg [12:0] ADDR	,
output reg [15:0] DATA
);

always begin
	CKE 			<= 1'b1;
	RAS 			<= 1'b1;
	CAS 			<= 1'b0;
	WE 			<= 1'b0;
	BA				<= BANK;
	ADDR[9:0]	<= COL[9:0];
	ADDR[10]		<= PRECHG;
	DATA			<= DATA_IN;
end

endmodule

/* Instance module

WRITE write_ex (
// INPUTS
	.COL(COL),
	.BANK(BANK),
	.PRECHG(PRECHG),
	.DATA_WR,

// OUTPUTS
	.CKE(CKE),
	.RAS(RAS),
	.CAS(CAS),
	.WE(WE),
	.BA(BA),
	.ADDR(ADDR),
	.DATA(DATA)
);

*/