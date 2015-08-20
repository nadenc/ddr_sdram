`timescale 1ns / 1ps

module DDR_TB;

	// Inputs
	reg SYS_CLK_100M;
	reg [1:0] BA_IN;
	reg [12:0] ADDR_ROW_IN;
	reg [9:0] ADDR_COL_IN;
	reg WRITE;
	reg READ;
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

	// Bidirs
	reg [1:0] DQS; // wire
	reg [15:0] DATA_RAM; // wire
	wire [12:0] ADDR_RAM;
	wire [(16*BURST_LENGTH-1):0] DATA_IN;
	
	// Parameters
	parameter BURST_LENGTH = 5'd16;

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

		.WRITE(WRITE),
		.READ(READ),
		
		.WRITE_LENGTH(WRITE_LENGTH), 
		.BUSY(BUSY)
	);
	
	reg [31:0] DATA0;
	reg [31:0] DATA1;
	reg [31:0] DATA2;
	reg [31:0] DATA3;
	reg [31:0] DATA4;
	reg [31:0] DATA5;
	reg [31:0] DATA6;
	reg [31:0] DATA7;
	
	assign DATA_IN[31:0] = DATA0;
	if (BURST_LENGTH > 2) assign DATA_IN[63:32] = DATA1;
	if (BURST_LENGTH > 4) assign DATA_IN[95:64] = DATA2;
	if (BURST_LENGTH > 4) assign DATA_IN[127:96] = DATA3;
	if (BURST_LENGTH > 8) assign DATA_IN[159:128] = DATA4;
	if (BURST_LENGTH > 8) assign DATA_IN[191:160] = DATA5;
	if (BURST_LENGTH > 8) assign DATA_IN[223:192] = DATA6;
	if (BURST_LENGTH > 8) assign DATA_IN[255:224] = DATA7;
	
	reg READY_FLAG;

	initial begin
		// Initialize Inputs
		SYS_CLK_100M <= 1'b0;
		WRITE <= 1'b0;
		READ <= 1'b0;
		
		BA_IN <= 2'b00;
		ADDR_COL_IN <= 10'b0;
		ADDR_ROW_IN <= 13'b0;
		
		DQS <= 2'b0;
		
		DATA0 <= 32'h76543210;
		DATA1 <= 32'hFEDCBA98;
		DATA2 <= 32'h98765432;
		DATA3 <= 32'h10FEDCBA;
		DATA4 <= 32'hBA987654;
		DATA5 <= 32'h3210FEDC;
		DATA6 <= 32'hDCBA9876;
		DATA7 <= 32'h543210FE;
	
	end
	
	always begin
		#5 SYS_CLK_100M <= ~SYS_CLK_100M;
	end

	parameter TEST_MODE = 2; // 1 = Read, 2 = Write

always @ (posedge SYS_CLK_100M) begin
	if (TEST_MODE == 1) begin // Read tests
		if (!BUSY) begin
			if (!READ) begin
				READ <= 1'b1;
				BA_IN <= BA_IN + 2'b1;
				DATA_RAM <= 16'hFFFF;
			end
				
			WRITE_LENGTH <= BURST_LENGTH - 4'b1;
			if (BA_IN == 2'b11 && !READ) begin
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
		if (BUSY) begin 
			READ <= 1'b0;
			DATA_RAM <= DATA_RAM - 1'h1;
			DQS <= ~DQS;
		end
	end
	
	if (TEST_MODE == 2) begin // Write tests
		if (!BUSY) begin
			if (!WRITE) begin
				WRITE <= 1'b1;
				BA_IN <= BA_IN + 2'b1;
			end
				
			WRITE_LENGTH <= BURST_LENGTH - 4'b1;
			if (BA_IN == 2'b11 && !WRITE) begin
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
		if (BUSY) WRITE <= 1'b0;
	end

end
	
endmodule

