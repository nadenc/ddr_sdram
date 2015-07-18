// Used on posedge of CLK_N to set no operation
// Can only be used when all banks are idle, precharge A10 = 1

module LOAD_MODE_REG(
output CKE			,
output RAS			,
output CAS			,
output WE
);

assign	CKE 	= 1;
assign	RAS 	= 0;
assign	CAS 	= 0;
assign	WE		= 0;

endmodule

/* Instance module

LOAD_MODE_REG load_mode_reg_ex(
	.CKE(CKE),
	.RAS(RAS),
	.CAS(CAS),
	.WE(WE)
);

*/