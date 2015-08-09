`timescale 1ns / 1ps
// MT46H32M16LF - 8Meg x 16 x 4 banks
// 8K row addressing ADDR[12:0]
// 1K col address ADDR[9:0]
// 16 bit words DATA[15:0]
// 4 banks BA[1:0]
// PRECHARGE ADDR[10]

/* External Interface
Set WRITE or READ inputs high to initialize a command


BA is bank address [1:0]
DATA_IN is the data bus [15:0]
ADDR_ROW_IN is the row address for the first word in the burst
ADDR_COL_IN is the column address
Use WRITE_LENGTH to specify number of 16-bit words to be written in burst
*/

module ddr_sdram(
// Clocks
input SYS_CLK_100M, // 100MHz
output CLK_P,
output CLK_N,

// Output Pins
output CKE,
output WE,
output CAS,
output RAS,
output reg [1:0] BA,
output reg [1:0] DM,
inout [1:0] DQS,
inout [15:0] DATA_RAM,
output [12:0] ADDR_RAM,

//External Interface
input [1:0] BA_IN,
inout [(16*BURST_LENGTH-1):0] DATA_IN,
input [12:0] ADDR_ROW_IN, // start of burst row address
input [9:0] ADDR_COL_IN, // column address
input [1:0] BL, // burst length

input WRITE,
input READ,

input WRITE_LENGTH, // number of words to be written in burst
output reg BUSY // busy status to broadcast 
);

// Clocking
assign CLK_P = DDR_CLK_166M;
assign CLK_N = !DDR_CLK_166M;

reg CLK_RESET;
wire CLK_LOCKED;

// MEM Bank
reg [12:0] openRowB3; // store open rows in each bank
reg [12:0] openRowB2;
reg [12:0] openRowB1;
reg [12:0] openRowB0;

reg [3:0] BANK_STATUS; // 3-b3open,2-b2open,1-b1open,0-b0open

// Data/Address wire maps
reg [31:0] DATA_BUF_WR[BURST_LENGTH-2:0];
reg [31:0] DATA_BUF_RE[BURST_LENGTH-2:0];
reg [15:0] DATA_WR;
reg [15:0] DATA_RE;
assign DATA_RAM = (STATUS == S_WRITE) ? DATA_WR : 16'bZ; // out if write, Z otherwise
assign DATA_IN = (STATUS == S_READ) ? DATA_RE : 256'bZ; // data if read, Z otherwise

reg [12:0] ADDR; // store intermediate address how to handle A10?
assign ADDR_RAM = ADDR;

// Data strobes
reg WR_STROBE;

assign DQS[1] = (STATUS == S_WRITE) ? WR_STROBE : 1'bZ; // output if writing, input otherwise
assign DQS[0] = (STATUS == S_WRITE) ? WR_STROBE : 1'bZ; // output if writing, input otherwise

// Status registers
reg PWR_ON;
reg INITIALIZED;

reg [2:0] STATUS;

// Status states
localparam S_IDLE	= 3'h0;
localparam S_WRITE	= 3'h1;
localparam S_READ	= 3'h2;
localparam S_PRE	= 3'h3;
localparam S_ACTIVE	= 3'h4;

// Command register
reg [3:0] COMMAND;

assign CKE = COMMAND[3];
assign WE = COMMAND[2];
assign CAS = COMMAND[1];
assign RAS = COMMAND[0];

// Commands
localparam C_INIT	= 4'b1000;
localparam C_PRE	= 4'b1010;
localparam C_ACTIVE	= 4'b1110;
localparam C_READ	= 4'b1101;
localparam C_WRITE	= 4'b1001;
localparam C_NOP	= 4'b0000;

// System parameters
localparam CAS_LAT = 3; // CAS latency clock delay (both edge delay)
localparam BURST_LENGTH = 16; // data burst length, 2,4,8,16 available

// Counters
reg [4:0] wr_count;
reg [3:0] re_count;
reg [4:0] BUSY_COUNT;

// module instances
ddr_clk_mod ddr_clocks (
	.SYS_CLK_100M(SYS_CLK_100M),
	.DDR_CLK_166M(DDR_CLK_166M),
	.WR_CLK_333M(WR_CLK_333M),	// double freq of DDR_CLK_166M to be used for both writes
	.RESET(CLK_RESET),
	.LOCKED(CLK_LOCKED)
);

initial begin
	BUSY <= 1'b1;
	BUSY_COUNT <= 3'b0;
	STATUS <= S_IDLE;
	CLK_RESET <= 1'b1; // hold clocks in reset
	
	wr_count <= 5'b0;
	re_count <= 4'b0;
	
	#200 PWR_ON <= 1'b1; // wait 200ns after power up before issuing any commands, set power on
	CLK_RESET <= 1'b0; // release clocks from reset
end

/*
always @ (posedge DDR_CLK_166M) begin // check request for active/precharge requirement
	
end

always @ (negedge DDR_CLK_166M) begin // command pass

end
*/

always @ (posedge WR_CLK_333M) begin

	//////////////////////////////// PRECHARGE/ACTIVE CHECK ////////////////////////////////
	if ((READ || WRITE) && PWR_ON && INITIALIZED && !BUSY && DDR_CLK_166M) begin // if action required and not currently acting, check for precharge/active requirement
		case (BA) // check if bank/row is open
			2'b00: begin
				if (BANK_STATUS[0] && (openRowB0 != ADDR_ROW_IN[12:0])) begin // if bank is open and wrong row is open call precharge
					STATUS <= S_PRE; // precharge required
				end
				else if (!BANK_STATUS[0]) begin // if bank isnt open call active
					STATUS <= S_ACTIVE; // active required
				end
			end
			2'b01: begin
				if (BANK_STATUS[1] && (openRowB1 != ADDR_ROW_IN[12:0])) begin // if bank is open and wrong row is open call precharge
					STATUS <= S_PRE; // precharge required
				end
				else if (!BANK_STATUS[1]) begin // if bank isnt open call active
					STATUS <= S_ACTIVE; // active required
				end
			end
			2'b10: begin
				if (BANK_STATUS[2] && (openRowB2 != ADDR_ROW_IN[12:0])) begin // if bank is open and wrong row is open call precharge
					STATUS <= S_PRE; // precharge required
				end
				else if (!BANK_STATUS[2]) begin // if bank isnt open call active
					STATUS <= S_ACTIVE; // active required
				end
			end
			2'b11: begin
				if (BANK_STATUS[3] && (openRowB3 != ADDR_ROW_IN[12:0])) begin // if bank is open and wrong row is open call precharge
					STATUS <= S_PRE; // precharge required
				end
				else if (!BANK_STATUS[3]) begin // if bank isnt open call active
					STATUS <= S_ACTIVE; // active required
				end
			end
		endcase
	end
	
	//////////////////////////////// COMMAND PASS ////////////////////////////////
	if (!DDR_CLK_166M) begin
		if (PWR_ON && !INITIALIZED && CLK_LOCKED) begin // initialize once clk locked and power on
			COMMAND <= C_INIT; // set op command 
			ADDR[12:7] <= 6'b0;
			ADDR[6:4] <= CAS_LAT;
			ADDR[4] <= 1'b0;
			case (BURST_LENGTH)
				2: ADDR[2:0] <= 3'h1;
				4: ADDR[2:0] <= 3'h2;
				8: ADDR[2:0] <= 3'h3;
				16: ADDR[2:0] <= 3'h4;
			endcase
			BUSY <= 1'b0;
			INITIALIZED <= 1'b1;
		end
		else if (STATUS == S_PRE && !BUSY) begin // precharge
			COMMAND <= C_PRE; // set op command
			BA <= BA_IN; // set bank address
			ADDR[10] <= 0; // clear only single bank
			STATUS <= S_ACTIVE; // require precharge
		end
		else if (STATUS == S_ACTIVE && !BUSY) begin // active
			COMMAND <= C_ACTIVE; // set op command
			BA <= BA_IN; // set bank address
			ADDR <= ADDR_ROW_IN[12:0]; // set row address
			
			case (BA_IN) // record new open row in bank
				2'b00: openRowB0 <= ADDR_ROW_IN[12:0];
				2'b01: openRowB1 <= ADDR_ROW_IN[12:0];
				2'b10: openRowB2 <= ADDR_ROW_IN[12:0];
				2'b11: openRowB3 <= ADDR_ROW_IN[12:0];
			endcase
			
			if (READ) begin
				STATUS <= S_READ;
			end else if (WRITE) begin
				STATUS <= S_WRITE;
			end else begin
				STATUS <= S_IDLE;
			end
			
		end
		else if (STATUS == S_READ && READ && !BUSY)begin // read required
			COMMAND <= C_READ; // set op command
			BA <= BA_IN[1:0]; // set bank address
			ADDR[9:0] <= ADDR_COL_IN[9:0]; // set column address
			ADDR[10] <= 1'b0; // set precharge bit low
			
			BUSY <= 1'b1; // busy
			BUSY_COUNT <= (CAS_LAT + BURST_LENGTH); // set busy for length
		end
		else if (STATUS == S_WRITE && WRITE && !BUSY)begin // write required
			COMMAND <= C_WRITE; // set op command
			BA <= BA_IN[1:0]; // set bank address
			ADDR[9:0] <= ADDR_COL_IN[9:0]; // set column address
			ADDR[10] <= 1'b0; // set precharge bit low
			
			BUSY <= 1'b1; // busy
			BUSY_COUNT <= (CAS_LAT + BURST_LENGTH); // set busy for length
			
			DATA_BUF_WR[0] <= DATA_IN[31:0];
			if (BURST_LENGTH > 2) DATA_BUF_WR[1] <= DATA_IN[63:32];
			if (BURST_LENGTH > 4) DATA_BUF_WR[2] <= DATA_IN[95:64];
			if (BURST_LENGTH > 4) DATA_BUF_WR[3] <= DATA_IN[127:96];
			if (BURST_LENGTH > 8) DATA_BUF_WR[4] <= DATA_IN[159:128];
			if (BURST_LENGTH > 8) DATA_BUF_WR[5] <= DATA_IN[191:160];
			if (BURST_LENGTH > 8) DATA_BUF_WR[6] <= DATA_IN[223:192];
			if (BURST_LENGTH > 8) DATA_BUF_WR[7] <= DATA_IN[255:224];
		end
		else begin // count after read/write command, send NOPs
			COMMAND <= C_NOP; // set nop command
			
			// count down busy timer
			if (BUSY_COUNT > 3'h0) begin // if busy in wr/re
				if (BUSY_COUNT == 3'h2) begin
					BUSY <= 1'b0;
					STATUS <= S_IDLE; // clear status
				end
				BUSY_COUNT <= (BUSY_COUNT - 3'h2); // -2 since half clk
			end
		end
	end
	
	//////////////////////////////// WRITE DATA ////////////////////////////////
	if (STATUS == S_WRITE) begin
		if (wr_count == CAS_LAT + BURST_LENGTH-1) begin
			wr_count <= 5'b0;
		end else begin
			wr_count <= wr_count + 5'b1;
		end
		
		if (wr_count > CAS_LAT) begin // write data when ready
			WR_STROBE <= !WR_STROBE; // toggle DQS

			case (wr_count)
				CAS_LAT+5'h0: DATA_WR <= DATA_BUF_WR[0][15:0];
				CAS_LAT+5'h1: DATA_WR <= DATA_BUF_WR[0][31:16];
				CAS_LAT+5'h2: if (BURST_LENGTH > 2) DATA_WR <= DATA_BUF_WR[1][15:0];
				CAS_LAT+5'h3: if (BURST_LENGTH > 2) DATA_WR <= DATA_BUF_WR[1][31:16];
				CAS_LAT+5'h4: if (BURST_LENGTH > 4) DATA_WR <= DATA_BUF_WR[2][15:0];
				CAS_LAT+5'h5: if (BURST_LENGTH > 4) DATA_WR <= DATA_BUF_WR[2][31:16];
				CAS_LAT+5'h6: if (BURST_LENGTH > 4) DATA_WR <= DATA_BUF_WR[3][15:0];
				CAS_LAT+5'h7: if (BURST_LENGTH > 4) DATA_WR <= DATA_BUF_WR[3][31:16];
				CAS_LAT+5'h8: if (BURST_LENGTH > 8) DATA_WR <= DATA_BUF_WR[4][15:0];
				CAS_LAT+5'h9: if (BURST_LENGTH > 8) DATA_WR <= DATA_BUF_WR[4][31:16];
				CAS_LAT+5'hA: if (BURST_LENGTH > 8) DATA_WR <= DATA_BUF_WR[5][15:0];
				CAS_LAT+5'hB: if (BURST_LENGTH > 8) DATA_WR <= DATA_BUF_WR[5][31:16];
				CAS_LAT+5'hC: if (BURST_LENGTH > 8) DATA_WR <= DATA_BUF_WR[6][15:0];
				CAS_LAT+5'hD: if (BURST_LENGTH > 8) DATA_WR <= DATA_BUF_WR[6][31:16];
				CAS_LAT+5'hE: if (BURST_LENGTH > 8) DATA_WR <= DATA_BUF_WR[7][15:0];
				CAS_LAT+5'hF: if (BURST_LENGTH > 8) DATA_WR <= DATA_BUF_WR[7][31:16];
			endcase
			
			if (wr_count >= CAS_LAT + WRITE_LENGTH - 1) begin // mask excess writes
				DM <= 2'b11; // set data mask high
			end	else begin
				DM <= 2'b00; // clear any data mask
			end
		end
	end
end

	//////////////////////////////// READ DATA ////////////////////////////////
always @ (posedge DQS[1]) begin	
	POS_DQS <= 1;
	#1 POS_DQS <= 0;
end

always @ (negedge DQS[1]) begin	
	NEG_DQS <= 1;
	#1 NEG_DQS <= 0;
end

reg POS_DQS, NEG_DQS;
wire re_strobe;

assign re_strobe = POS_DQS | NEG_DQS;

always @ (posedge re_strobe) begin // read data
	if (STATUS == S_READ) begin
		if (re_count == BURST_LENGTH-1) begin
			re_count <= 4'b0;
		end else begin
			re_count <= re_count + 4'b1;
		end
		
		case (re_count)
			4'h0: DATA_BUF_RE[0][15:0] <= DATA_RAM;
			4'h1: DATA_BUF_RE[0][31:16] <= DATA_RAM;
			4'h2: DATA_BUF_RE[1][15:0] <= DATA_RAM;
			4'h3: DATA_BUF_RE[1][31:16] <= DATA_RAM;
			4'h4: DATA_BUF_RE[2][15:0] <= DATA_RAM;
			4'h5: DATA_BUF_RE[2][31:16] <= DATA_RAM;
			4'h6: DATA_BUF_RE[3][15:0] <= DATA_RAM;
			4'h7: DATA_BUF_RE[3][31:16] <= DATA_RAM;
			4'h8: DATA_BUF_RE[4][15:0] <= DATA_RAM;
			4'h9: DATA_BUF_RE[4][31:16] <= DATA_RAM;
			4'hA: DATA_BUF_RE[5][15:0] <= DATA_RAM;
			4'hB: DATA_BUF_RE[5][31:16] <= DATA_RAM;
			4'hC: DATA_BUF_RE[6][15:0] <= DATA_RAM;
			4'hD: DATA_BUF_RE[6][31:16] <= DATA_RAM;
			4'hE: DATA_BUF_RE[7][15:0] <= DATA_RAM;
			4'hF: DATA_BUF_RE[7][31:16] <= DATA_RAM;
		endcase
		
	end
end

endmodule
