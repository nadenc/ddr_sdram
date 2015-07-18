// Used on posedge of CLK_N to precharge a bank's open row

module PRECHARGE#(
parameter bank = 0;
parameter all_bank = 0; // set high to precharge all banks
)(
input reg

output reg CKE			,
output reg RAS			,
output reg CAS			,
output reg WE			,
output reg [1:0] BA		,
output reg [12:0] ADDR
);

assign	CKE 		= 1;
assign	RAS 		= 0;
assign	CAS 		= 1;
assign	WE 			= 0;
assign	BA			= bank;
assign	ADDR[10]	= all_bank;

endmodule

/* Instance module

PRECHARGE #( .bank(bank), .all_bank(all_bank)) precharge_ex(
	.CKE(CKE),
	.RAS(RAS),
	.CAS(CAS),
	.WE(WE),
	.BA(BA),
	.ADDR(ADDR)
);

*/