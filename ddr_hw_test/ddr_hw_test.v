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
// DDR Pins
input					SYS_CLK_100M		,
output CLK_P,
output CLK_N,

// Output Pins
output CKE,
output WE,
output CAS,
output RAS,
output [1:0] BA,
output [1:0] DM,
inout [1:0] DQS,
inout [15:0] DATA_RAM,
output [12:0] ADDR_RAM,
	
// HW Interface
input [7:0] 		DPSwitch    	,
input [5:0] 		Switch    		,
output reg [7:0]	LED
);

parameter BURST_LENGTH = 2;

reg [15:0] write_data;
reg [15:0] read_data;

reg [1:0] BA_IN;
wire [15:0] DATA_IN;
assign DATA_IN = RW ? write_data : 16'bZ;
reg [12:0] ADDR_ROW_IN;
reg [9:0] ADDR_COL_IN;
reg WRITE;
reg READ;

reg re;
reg wr;
wire RW; // read = 0, write = 1
assign RW = (re ^ wr);

reg [3:0] WRITE_LENGTH;
wire EXT_DQS;
wire BUSY;

// Instantiate the ddr driver
ddr_sdram #(
	.BURST_LENGTH(BURST_LENGTH)
) ddr_sdram (
	.SYS_CLK_100M(SYS_CLK_100M), // in
	
	// DDR Interface
	.CLK_P(CLK_P), // out
	.CLK_N(CLK_N), // out
	
	.CKE(CKE), // out
	.WE(WE), // out
	.CAS(CAS), // out
	.RAS(RAS), // out
	.BA(BA), // out
	.DM(DM), // out
	.DQS(DQS), // inout
	.DATA_RAM(DATA_RAM), // inout
	.ADDR_RAM(ADDR_RAM), // out
	
	.BA_IN(BA_IN), // in
	.DATA_IN(DATA_IN), // inout
	.ADDR_ROW_IN(ADDR_ROW_IN), // in
	.ADDR_COL_IN(ADDR_COL_IN), // in
	.EXT_DQS(EXT_DQS), // in

	.WRITE(WRITE), // in
	.READ(READ), // in
	
	.WRITE_LENGTH(WRITE_LENGTH), // in
	.BUSY(BUSY) // out
);

initial begin
	WRITE <= 1'b0;
	READ <= 1'b0;
	re <= 1'b0;
	wr <= 1'b0;
	BA_IN <= 2'b0;
	ADDR_ROW_IN <= 13'b0;
	ADDR_COL_IN <= 10'b0;
	WRITE_LENGTH <= 4'd1;
end

always @ (posedge Switch[0] or posedge Switch[1]) begin
	if (Switch[0]) write_data[15:8] <= DPSwitch;
	if (Switch[1]) write_data[7:0] <= DPSwitch;
	
	if (Switch[0]) wr <= !re;
	if (Switch[1]) wr <= !re;
end

always @ (posedge Switch[2]) begin
	if (!BUSY) begin
		WRITE <= 1'b1;
		#20 WRITE <= 1'b0;
	end
end

always @ (posedge Switch[3]) begin
	if (!BUSY) begin
		READ <= 1'b1;
		#20 READ <= 1'b0;
	end
end

always @ (posedge Switch[4] or posedge Switch[5]) begin
	if (Switch[4]) LED <= read_data[15:8];
	if (Switch[5]) LED <= read_data[7:0];
end
	
always @ (posedge EXT_DQS) begin
	read_data <= DATA_IN[15:0];
end

endmodule
