// Used on posedge of CLK_N to set no operation
// Can only be used when all banks are idle, precharge A10 = 1

module SETUP_REG(
output CKE			,
output RAS			,
output CAS			,
output WE			,
output [1:0] BA		,
output [12:0] ADDR
);

CKE 	<= 1;
RAS 	<= 0;
CAS 	<= 0;
WE 	<= 0;

BA		<= 2'b0;
ADDR	<= 13'b0000000100001; // 2 CAS latency, sequential burst, 2 burst length


endmodule

/* Instance module

SETUP_REG setup_reg_ex(
	.CKE(CKE),
	.RAS(RAS),
	.CAS(CAS),
	.WE(WE),
	.BA(BA),
	.ADDR(ADDR)
);

*/