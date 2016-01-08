`timescale 1ns / 1ps

module DDR_TB;

	// Inputs
	reg SYS_CLK_100M;
	reg [1:0] BA_IN;
	reg [12:0] ADDR_ROW_IN;
	reg [9:0] ADDR_COL_IN;
	wire WRITE;
	wire READ;
	reg [3:0] WRITE_LENGTH;

	// Outputs
	wire CLK_P;
	wire CLK_N;
	wire CKE;
	wire WE;
	wire CAS;
	wire RAS;
	wire [1:0] BA;
	wire [1:0] DM;
	wire BUSY;
	wire PWR_ON;
	wire WR_DQS;
	wire RE_DQS;

	//Write
	wire [1:0] DQS;
	wire [15:0] DATA_RAM;
	
	//Read
	//reg [1:0] DQS;
	//reg [15:0] DATA_RAM;

	// Bidirs
	wire [12:0] ADDR_RAM;
	wire [15:0] DATA_IN;
	
	// Read/Write status
	reg wr_req;
	reg writing;
	assign WRITE = (wr_req ^ writing);

	reg re_req;
	reg reading;
	assign READ = (re_req ^ reading);

	reg RW; // read = 0, write = 1

	reg [3:0] count;
	
	// DATA IN handling
	assign DATA_IN = RW ? (WR_DQS ? DATA[count + 4'b1] : DATA[count]) : 16'bZ;

	// Parameters
	parameter BURST_LENGTH = 5'd2;

	parameter TEST_MODE = 2; // 1 = Read, 2 = Write

	// Instantiate the Unit Under Test (UUT)
	ddr_sdram #(
		.BURST_LENGTH(BURST_LENGTH)
	)
	uut (
		.SYS_CLK_100M(SYS_CLK_100M), 
		.CLK_P(CLK_P),
		.CLK_N(CLK_N),
		
		.CKE(CKE), 
		.WE(WE), 
		.CAS(CAS), 
		.RAS(RAS), 
		.BA(BA), 
		.DM(DM), 
		.DQS(DQS), 
		.DATA_RAM(DATA_RAM), 
		.ADDR_RAM(ADDR_RAM), 
		
		.BA_IN(BA_IN), 
		.DATA_IN(DATA_IN), 
		.ADDR_ROW_IN(ADDR_ROW_IN), 
		.ADDR_COL_IN(ADDR_COL_IN), 
		.WR_DQS(WR_DQS),
		.RE_DQS(RE_DQS),

		.WRITE(WRITE),
		.READ(READ),
		
		.WRITE_LENGTH(WRITE_LENGTH), 
		.BUSY(BUSY),
		.PWR_ON(PWR_ON)
	);
	
	reg [15:0] DATA [15:0];

	initial begin
		// Initialize Inputs
		SYS_CLK_100M <= 1'b0;
		
		BA_IN <= 2'b00;
		ADDR_COL_IN <= 10'b0;
		ADDR_ROW_IN <= 13'b0;
		
		wr_req <= 1'b0;
		writing <= 1'b0;
		re_req <= 1'b0;
		reading <= 1'b0;
		RW <= 1'b0;
		count <= 4'b0;
		
		//DQS <= 2'b0; // comment out for write tests
		
		DATA[0] <= 16'h7654;
		DATA[1] <= 16'hFEDC;
		DATA[2] <= 16'h9876;
		DATA[3] <= 16'h10FE;
		DATA[4] <= 16'hBA98;
		DATA[5] <= 16'h3210;
		DATA[6] <= 16'hDCBA;
		DATA[7] <= 16'h5432;
		DATA[8] <= 16'h7654;
		DATA[9] <= 16'hFEDC;
		DATA[10] <= 16'h9876;
		DATA[11] <= 16'h10FE;
		DATA[12] <= 16'hBA98;
		DATA[13] <= 16'h3210;
		DATA[14] <= 16'hDCBA;
		DATA[15] <= 16'h5432;
	
	end
	
	always begin
		#5 SYS_CLK_100M <= ~SYS_CLK_100M;
	end

always @ (negedge BUSY) begin
	if (TEST_MODE == 1) begin // read test
		if (reading) re_req <= 1'b0;
		else re_req <= 1'b1;
		
		if (BA_IN == 2'b11) begin
			BA_IN <= 2'b00;
			if (ADDR_COL_IN == (10'd1024 - BURST_LENGTH)) begin
				ADDR_COL_IN <= 10'b0;
				if (ADDR_ROW_IN == 13'b1111111111111) ADDR_ROW_IN <= 13'b0;
				else ADDR_ROW_IN <= ADDR_ROW_IN + 13'b1;
			end
			else ADDR_COL_IN <= ADDR_COL_IN + BURST_LENGTH;
		end
		else BA_IN <= BA_IN + 2'b1;
	end

	if (TEST_MODE == 2) begin // write test
		if (writing) wr_req <= 1'b0;
		else wr_req <= 1'b1;
		
		WRITE_LENGTH <= BURST_LENGTH - 4'd2;		// test data masks
		
		if (BA_IN == 2'b11) begin // test addresses
			BA_IN <= 2'b00;
			if (ADDR_COL_IN == (10'd1024 - BURST_LENGTH)) begin
				ADDR_COL_IN <= 10'b0;
				if (ADDR_ROW_IN == 13'b1111111111111) ADDR_ROW_IN <= 13'b0;
				else ADDR_ROW_IN <= ADDR_ROW_IN + 13'b1;
			end
			else ADDR_COL_IN <= ADDR_COL_IN + BURST_LENGTH;
		end
		else BA_IN <= BA_IN + 2'b1;
	end
end 

always @ (posedge BUSY) begin // clear write/read after command starts

	if (WRITE) begin
		writing <= !writing;
		RW <= 1'b1;
	end
	
	if (READ) begin
		reading <= !reading;
		RW <= 1'b0;
	end
	
end

/////////////////////// WRITE TESTS ////////////////////////
always @ (negedge WR_DQS) begin
	
	if (count < BURST_LENGTH - 4'd2 && PWR_ON) count <= count + 4'd2;
	else count <= 4'b0;
	
end
	
endmodule
