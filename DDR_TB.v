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
	wire EXT_DQS;

	// Bidirs
	wire [1:0] DQS; // wire
	wire [15:0] DATA_RAM; // wire
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
	
	// Parameters
	parameter BURST_LENGTH = 5'd8;

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
		.EXT_DQS(EXT_DQS),

		.WRITE(WRITE),
		.READ(READ),
		
		.WRITE_LENGTH(WRITE_LENGTH), 
		.BUSY(BUSY)
	);
	
	reg [15:0] DATA [7:0];

	initial begin
		// Initialize Inputs
		SYS_CLK_100M <= 1'b0;
		//WRITE <= 1'b0;
		//READ <= 1'b0;
		
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
		
		DATA[0] <= 32'h7654;//3210;
		DATA[1] <= 32'hFEDC;//BA98;
		DATA[2] <= 32'h9876;//5432;
		DATA[3] <= 32'h10FE;//DCBA;
		DATA[4] <= 32'hBA98;//7654;
		DATA[5] <= 32'h3210;//FEDC;
		DATA[6] <= 32'hDCBA;//9876;
		DATA[7] <= 32'h5432;//10FE;
	
	end
	
	always begin
		#5 SYS_CLK_100M <= ~SYS_CLK_100M;
	end

	parameter TEST_MODE = 2; // 1 = Read, 2 = Write


always @ (negedge BUSY) begin
	if (TEST_MODE == 2) begin // write test
		if (writing) wr_req <= 1'b0;
		else wr_req <= 1'b1;
		
		WRITE_LENGTH <= BURST_LENGTH - 4'd2;		// test data masks
		
		if (BA_IN == 2'b11) begin
			BA_IN <= 2'b00;
			if (ADDR_COL_IN == (10'd1024 - BURST_LENGTH)) begin
				ADDR_COL_IN <= 10'b0;
				if (ADDR_ROW_IN == 13'b1111111111111) ADDR_ROW_IN <= 13'b0;
				else ADDR_ROW_IN <= ADDR_ROW_IN + 13'b1;
			end
			else ADDR_COL_IN <= ADDR_COL_IN + BURST_LENGTH;
		end
		//else BA_IN <= BA_IN + 2'b1;
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

reg [15:0] DATA_BUFF;
assign DATA_IN = RW ? DATA_BUFF : 16'bZ;

always @ (posedge EXT_DQS) begin // data strobe
	
	if (RW) begin // write
	
		DATA_BUFF <= DATA[count];
		if (count == BURST_LENGTH - 1) count <= 4'b0;
		else count <= count + 4'b1;
		
	end
	
	else begin // read
		
	end
	
end
	
endmodule

