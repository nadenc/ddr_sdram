`timescale 1ns / 1ps

module DDR_TB;

	// Inputs
	reg DDR_CLK;
	reg [1:0] BA_IN;
	reg [22:0] ADDR_IN;
	reg [1:0] BL;
	reg [1:0] COMMAND;
	reg WRITE_LENGTH;

	// Outputs
	wire CLK_P;
	wire CLK_N;
	wire CKE;
	wire WE;
	wire CAS;
	wire RAS;
	wire [1:0] BA;
	wire [1:0] DM;
	wire [12:0] ADDR_OUT;
	wire DATA_EDGE;
	wire ACCEPTED;

	// Bidirs
	wire [1:0] DQ;
	wire [15:0] DATA_OUT;
	wire [15:0] DATA_IN;

	// Instantiate the Unit Under Test (UUT)
	ddr_sdram uut (
		.DDR_CLK(DDR_CLK), 
		.CLK_P(CLK_P), 
		.CLK_N(CLK_N), 
		.CKE(CKE), 
		.WE(WE), 
		.CAS(CAS), 
		.RAS(RAS), 
		.BA(BA), 
		.DM(DM), 
		.DQ(DQ), 
		.DATA_OUT(DATA_OUT), 
		.ADDR_OUT(ADDR_OUT), 
		.BA_IN(BA_IN), 
		.DATA_IN(DATA_IN), 
		.ADDR_IN(ADDR_IN), 
		.BL(BL), 
		.COMMAND(COMMAND), 
		.WRITE_LENGTH(WRITE_LENGTH), 
		.DATA_EDGE(DATA_EDGE), 
		.ACCEPTED(ACCEPTED)
	);

	initial begin
		// Initialize Inputs
		DDR_CLK = 0;
		BA_IN = 0;
		ADDR_IN = 0;
		BL = 0;
		COMMAND = 0;
		WRITE_LENGTH = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

