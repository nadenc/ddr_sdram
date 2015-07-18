// Used on posedge of CLK_N to select row in idle bank

module ACTIVE #(
parameter row = 0,
parameter bank = 0
)
(
output CKE			,
output RAS			,
output CAS			,
output WE			,
output [1:0] BA		,
output [12:0] ADDR
);


assign	CKE 	= 1;
assign	RAS 	= 0;
assign	CAS 	= 1;
assign	WE 	= 1;
assign	BA		= bank;
assign	ADDR	= row;

endmodule

/* Instance module

ACTIVE #( .row(row), .bank(bank)) active_ex(
	.CKE(CKE),
	.RAS(RAS),
	.CAS(CAS),
	.WE(WE),
	.BA(BA),
	.ADDR(ADDR)
);

*/