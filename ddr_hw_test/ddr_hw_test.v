// DDR HW Test
/*
sw0 set upper
sw1 set lower
sw2 write to address
sw3 read from address
sw4 show upper
sw5 show lower
*/

module ddr_hw_test (
//input				CLK_100M		,
input [7:0] 		DPSwitch    	,
input [7:0] 		Switch    		,
output reg [7:0]	LED
);

parameter BURST_LENGTH = 2;

reg [15:0] write_data;
reg [15:0] read_data;

reg [1:0] BA_IN;
wire [(16*BURST_LENGTH-1):0] DATA_IN;
assign DATA_IN = WRITE ? write_data : 256'bZ;
reg [12:0] ADDR_ROW_IN;
reg [9:0] ADDR_COL_IN;
reg WRITE;
reg READ;

reg [3:0] WRITE_LENGTH;

// Pins
//wire CLK_P;
//wire CLK_N;
//wire CKE;
//wire WE;
//wire CAS;
//wire RAS;
//wire [1:0] BA;
//wire [1:0] DM;
//wire [1:0] DQS;
//wire [15:0] DATA_RAM;
//wire [12:0] ADDR_RAM;
//wire BUSY;

// Instantiate the ddr driver
	ddr_sdram #(
		.BURST_LENGTH(BURST_LENGTH)
	) ddr_sdram (
		//.SYS_CLK_100M(CLK_100M), // in
		//.CLK_P(CLK_P), // out
		//.CLK_N(CLK_N), // out
		
		//.CKE(CKE), // out
		//.WE(WE), // out
		//.CAS(CAS), // out
		//.RAS(RAS), // out
		//.BA(BA), // out
		//.DM(DM), // out
		//.DQS(DQS), // out
		//.DATA_RAM(DATA_RAM), // out
		//.ADDR_RAM(ADDR_RAM), // out
		
		.BA_IN(BA_IN), // in
		.DATA_IN(DATA_IN), // inout
		.ADDR_ROW_IN(ADDR_ROW_IN), // in
		.ADDR_COL_IN(ADDR_COL_IN), // in

		.WRITE(WRITE), // in
		.READ(READ), // in
		
		.WRITE_LENGTH(WRITE_LENGTH), // in
		.BUSY(BUSY) // out
	);

initial begin
	WRITE <= 1'b0;
	READ <= 1'b0;
	WRITE_LENGTH <= 4'd1;
end

always @ (posedge Switch[0]) begin
	write_data[15:8] <= DPSwitch;
end

always @ (posedge Switch[1]) begin
	write_data[7:0] <= DPSwitch;
end

always @ (posedge Switch[2]) begin
	WRITE <= 1'b1;
	#20 WRITE <= 1'b0;
end

always @ (posedge Switch[3]) begin
	READ <= 1'b1;
	#20 READ <= 1'b0;
end

always @ (posedge Switch[4]) begin
	LED <= read_data[15:8];
end

always @ (posedge Switch[5]) begin
	//LED <= read_data[7:0];
end
	
always @ (negedge BUSY) begin
	read_data <= DATA_IN[15:0];
end

endmodule
