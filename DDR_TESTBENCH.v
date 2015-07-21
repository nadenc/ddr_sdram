// DDR TEST BENCH

ddr_sdram test(
	.DDR_CLK()	, // sys clk
	.CLK_P()	,
	.CLK_N()	,
	
	// Command bits to DDR
	.CKE()		,
	.WE()		,
	.CAS()		,
	.RAS()		,
	.BA()		, // 2 bits bank address
	.DM()		, // 2 bits data mask
	.DQ()		, // 2 bits DQ
	.DATA_OUT()	, // 16 bits DATA
	.ADDR_OUT()	, // 13 bits address
	
	// Command bits from master
	.BA_IN()	, // 2 bits bank address
	.DATA_IN()	, // 16 bits data
	.ADDR_IN()	, // 23 bits address (22:13 col, 12:0 row)
	.COMMAND()	, // 2 bits for command ([1] - 1=write,0=read, [0] - action requested)
	.WRITE_LENGTH()	, // 2 bits for number of words to write
	.DATA_EDGE(), // edge for data bus 
	.ACCEPTED()	, // 
);