// DDR TESTBENCH

module DDR_TESTBENCH;

	// Clocks
	reg CLK;
	wire CP;
	wire CN;
	
	// Outputs to mem
	wire CKE;
	wire WE;
	wire CAS;
	wire RAS;
	wire [1:0] BA;
	wire [1:0] DM;
	wire [1:0] DQ;
	wire [15:0] DO;
	wire [12:0] AO;

	// Interface
	reg [1:0] BI;
	reg [15:0] DIreg;
	wire [15:0] DI;
	reg [22:0] AI;
	reg [1:0] COMMAND;
	reg [1:0] WL;
	wire DE;
	wire ACCEPTED;
	
	ddr_sdram uut(
		.DDR_CLK(CLK)	, // sys clk
		.CLK_P(CP)	,
		.CLK_N(CN)	,
		
		// Command bits to DDR
		.CKE(CKE)		,
		.WE(WE)		,
		.CAS(CAS)		,
		.RAS(RAS)		,
		.BA(BA)		, // 2 bits bank address
		.DM(DM)		, // 2 bits data mask
		.DQ(DQ)		, // 2 bits DQ
		.DATA_OUT(DO)	, // 16 bits DATA
		.ADDR_OUT(AO)	, // 13 bits address
		
		// Command bits from master
		.BA_IN(BI)	, // 2 bits bank address
		.DATA_IN(DI)	, // 16 bits data
		.ADDR_IN(AI)	, // 23 bits address (22:13 col, 12:0 row)
		.COMMAND(COMMAND)	, // 2 bits for command ([1] - 1=write,0=read, [0] - action requested)
		.WRITE_LENGTH(WL)	, // 2 bits for number of words to write
		.DATA_EDGE(DE), // edge for data bus 
		.ACCEPTED(ACCEPTED) // complete task rising edge
	);
	
	initial begin
	
	end
	
endmodule
