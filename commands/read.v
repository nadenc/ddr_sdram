// Used on posedge of CLK_N to select a column to read 

module READ #(
parameter col = 0,
parameter bank = 0,
parameter a_pre_chg = 0 // default disable auto precharge
)(
output CKE			,
output RAS			,
output CAS			,
output WE			,
output [1:0] BA		,
output [12:0] ADDR
);

assign	CKE 		= 1;
assign	RAS 		= 1;
assign	CAS 		= 0;
assign	WE 		= 1;
assign	BA			= bank;
assign ADDR[9:0]	= col[9:0];
assign ADDR[10]	= a_pre_chg;

endmodule

/* Instance module

READ #( .col(col), .bank(bank), .a_pre_chg(a_pre_chg)) read_ex(
	.CKE(CKE),
	.RAS(RAS),
	.CAS(CAS),
	.WE(WE),
	.BA(BA),
	.ADDR(ADDR)
);

*/