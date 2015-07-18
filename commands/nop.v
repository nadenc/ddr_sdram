// Used on posedge of CLK_N to set no operation

module NOP(
output CKE			,
output RAS			,
output CAS			,
output WE
);

assign	CKE 	= 1;
assign	RAS 	= 1;
assign	CAS 	= 1;
assign	WE		= 1;

endmodule

/* Instance module

NOP nop_ex(
	.CKE(CKE),
	.RAS(RAS),
	.CAS(CAS),
	.WE(WE)
);

*/