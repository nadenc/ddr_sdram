`timescale 1ns / 1ps
// LPDDR3 SDRAM driver for Spartan 6
// By Chad Plesa-Naden
// Created: July 2015

// Device Info:
// MT46H32M16LF - 8Meg x 16 x 4 banks
// Speed Grade -6 (MAX 166MHz)
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
	input SYS_CLK_100M, // 100MHz system clock
	output CLK_P,
	output CLK_N,

	// Output Pins
	output CKE,
	output WE,
	output CAS,
	output RAS,
	output [1:0] BA,
	output reg [1:0] DM,
	inout [1:0] DQS,
	inout [15:0] DATA_RAM,
	output [12:0] ADDR_RAM,

	//External Interface
	input [1:0] BA_IN,
	inout [15:0] DATA_IN,
	input [12:0] ADDR_ROW_IN,		// start of burst row address
	input [9:0] ADDR_COL_IN,		// column address
	output reg WR_DQS,						// write data strobe
	output reg RE_DQS,						// read data strobe

	input WRITE,
	input READ,

	input [3:0] WRITE_LENGTH,		// number of words to be written in burst
	output reg BUSY,					// busy status to broadcast 
	output PWR_ON						// idicate controller is on
	
);

// Clocking
reg CLK_RESET;
wire CLK_LOCKED;

// MEM Bank
reg [12:0] openRowB3;		// store open rows in each bank
reg [12:0] openRowB2;
reg [12:0] openRowB1;
reg [12:0] openRowB0;

reg [3:0] BANK_STATUS;		// 3-b3open,2-b2open,1-b1open,0-b0open

assign BA = BA_IN;

// Data Flow Control
assign DATA_RAM = (STATUS == S_WRITE) ? DATA_IN : 16'bZ;		// out if write, Z otherwise
assign DATA_IN = (STATUS == S_WRITE) ? 16'bZ : DATA_RAM;		// input when writing

// Address Registers
reg [12:0] ADDR;
assign ADDR_RAM = ADDR;

// Status registers
reg PWR_ON;
reg INITIALIZED;

reg [2:0] STATUS;

// Status states
localparam S_IDLE	= 3'h0;
localparam S_WRITE = 3'h1;
localparam S_READ	= 3'h2;
localparam S_PRE = 3'h3;
localparam S_ACTIVE = 3'h4;

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
localparam CAS_LAT = 3;				// CAS latency clock delay
parameter BURST_LENGTH = 5'd16;		// data burst length, 2,4,8,16 available

// Counters
reg [4:0] wr_count;
reg [3:0] re_count;
reg [4:0] BUSY_COUNT;
reg [16:0] init_cnt; // counter for initialization

// Data strobes
assign DQS[1] = (STATUS == S_WRITE) ? WR_DQS : 1'bZ;		// output if writing, input otherwise
assign DQS[0] = (STATUS == S_WRITE) ? WR_DQS : 1'bZ;		// output if writing, input otherwise

// module instances
ddr_clk_mod ddr_clocks (
	.SYS_CLK_100M(SYS_CLK_100M),
	.DDR_CLK_166M(DDR_CLK_166M),
	.WR_CLK_333M(WR_CLK_333M),		// double freq of DDR_CLK_166M to be used for both writes
	.RESET(CLK_RESET),
	.LOCKED(CLK_LOCKED)
);

OBUFDS diff_clk_buff(
	.O(CLK_P),
	.OB(CLK_N),
	.I(DDR_CLK_166M)
);

initial begin

	BUSY <= 1'b1;
	BUSY_COUNT <= 5'b0;
	STATUS <= S_IDLE;
	PWR_ON <= 1'b0;
	CLK_RESET <= 1'b1;			// hold clocks in reset
	INITIALIZED <= 1'b0;
	
	BANK_STATUS <= 4'b0;			// clear banks
	
	wr_count <= 5'b0;				// reset counters
	re_count <= 4'b0;
	init_cnt <= 17'b0;
	
	WR_DQS <= 1'b0;				// initialize data strobes
	RE_DQS <= 1'b0;
	
	DM <= 2'b0;						// clear data mask
	
end

always @ (posedge SYS_CLK_100M) begin // Initialization counter
	
	if (init_cnt < 17'd20) init_cnt <= init_cnt + 17'b1; // wait 20000 clk cycles for >200us
	
	else begin
		PWR_ON <= 1'b1;			// set power on
		CLK_RESET <= 1'b0;		// release clocks from reset
	end

end

always @ (posedge WR_CLK_333M) begin  // Command Handling Controller

	//////////////////////////////// PRECHARGE/ACTIVE CHECK ////////////////////////////////
	if ((READ || WRITE) && PWR_ON && INITIALIZED && !BUSY && DDR_CLK_166M) begin 	// if action required and not currently acting, check for precharge/active requirement
		
		case (BA) // check if bank/row is open
		
			2'b00: begin
				if (BANK_STATUS[0] && (openRowB0 != ADDR_ROW_IN[12:0])) STATUS <= S_PRE;	// if bank is open and wrong row is open call precharge
				else if (!BANK_STATUS[0]) STATUS <= S_ACTIVE;		// if bank isnt open call active
				else begin
					if (WRITE) STATUS <= S_WRITE;
					if (READ) STATUS <= S_READ;
				end
			end
			
			2'b01: begin
				if (BANK_STATUS[1] && (openRowB1 != ADDR_ROW_IN[12:0])) STATUS <= S_PRE;		// if bank is open and wrong row is open call precharge
				else if (!BANK_STATUS[1]) STATUS <= S_ACTIVE;		// if bank isnt open call active
				else begin
					if (WRITE) STATUS <= S_WRITE;
					if (READ) STATUS <= S_READ;
				end
			end
			
			2'b10: begin
				if (BANK_STATUS[2] && (openRowB2 != ADDR_ROW_IN[12:0])) STATUS <= S_PRE;		// if bank is open and wrong row is open call precharge
				else if (!BANK_STATUS[2]) STATUS <= S_ACTIVE;		// if bank isnt open call active
				else begin
					if (WRITE) STATUS <= S_WRITE;
					if (READ) STATUS <= S_READ;
				end
			end
			
			2'b11: begin
				if (BANK_STATUS[3] && (openRowB3 != ADDR_ROW_IN[12:0])) STATUS <= S_PRE;		// if bank is open and wrong row is open call precharge
				else if (!BANK_STATUS[3]) STATUS <= S_ACTIVE;		// if bank isnt open call active
				else begin
					if (WRITE) STATUS <= S_WRITE;
					if (READ) STATUS <= S_READ;
				end
			end
			
		endcase
		
	end
	
	//////////////////////////////// COMMAND PASS ////////////////////////////////
	if (!DDR_CLK_166M) begin // pass on falling edges
	
		if (PWR_ON && !INITIALIZED && CLK_LOCKED) begin // initialize once clk locked and power on
			
			COMMAND <= C_INIT;			// set op command 
			ADDR[12:7] <= 6'b0;
			ADDR[6:4] <= CAS_LAT;		// set CAS_LAT
			ADDR[3] <= 1'b0;			// set burst to sequential
			
			case (BURST_LENGTH) // set burst length
			
				2: ADDR[2:0] <= 3'h1;
				4: ADDR[2:0] <= 3'h2;
				8: ADDR[2:0] <= 3'h3;
				16: ADDR[2:0] <= 3'h4;
				
			endcase
			
			INITIALIZED <= 1'b1;
			BUSY <= 1'b0;
			
		end
		
		else if (STATUS == S_PRE && !BUSY) begin // precharge
		
			COMMAND <= C_PRE;		// set op command
			ADDR[10] <= 0;			// clear only single bank
			STATUS <= S_ACTIVE;		// require precharge
			
			case (BA) // close banks
			
				2'b00: begin
					BANK_STATUS[0] <= 1'b0;
					openRowB0 <= 13'h1FFF;		// set address to last address in bank - this address should never be accessed at the start of burst
				end
					
				2'b01: begin
					BANK_STATUS[1] <= 1'b0;
					openRowB1 <= 13'h1FFF;		// set address to last address in bank - this address should never be accessed at the start of burst
				end
					
				2'b10: begin
					BANK_STATUS[2] <= 1'b0;
					openRowB2 <= 13'h1FFF;		// set address to last address in bank - this address should never be accessed at the start of burst
				end
					
				2'b11: begin
					BANK_STATUS[3] <= 1'b0;
					openRowB3 <= 13'h1FFF;		// set address to last address in bank - this address should never be accessed at the start of burst
				end
					
			endcase
			
		end
		
		else if (STATUS == S_ACTIVE && !BUSY) begin // active
		
			COMMAND <= C_ACTIVE;			// set op command
			ADDR <= ADDR_ROW_IN[12:0];		// set row address
			
			case (BA) // record new open row in bank
			
				2'b00: begin
					BANK_STATUS[0] <= 1'b1;
					openRowB0 <= ADDR_ROW_IN[12:0];
				end
					
				2'b01: begin
					BANK_STATUS[1] <= 1'b1;
					openRowB1 <= ADDR_ROW_IN[12:0];
				end
					
				2'b10: begin
					BANK_STATUS[2] <= 1'b1;
					openRowB2 <= ADDR_ROW_IN[12:0];
				end
					
				2'b11: begin
					BANK_STATUS[3] <= 1'b1;
					openRowB3 <= ADDR_ROW_IN[12:0];
				end
					
			endcase
			
			STATUS <= S_IDLE;
						
		end
		
		else if (STATUS == S_READ && READ && !BUSY)begin // read required
		
			COMMAND <= C_READ;					// set op command
			ADDR[9:0] <= ADDR_COL_IN[9:0];		// set column address
			ADDR[10] <= 1'b0;					// set precharge bit low
			
		end
		
		else if (STATUS == S_WRITE && WRITE && !BUSY)begin // write required
		
			COMMAND <= C_WRITE;					// set op command
			ADDR[9:0] <= ADDR_COL_IN[9:0];		// set column address
			ADDR[10] <= 1'b0;					// set precharge bit low
			BUSY <= 1'b1;
			
		end
		
		else begin // count after read/write command, send NOPs
		
			COMMAND <= C_NOP;		// set nop command
		
		end
		
	end
	
	//////////////////////////////// SET/CLR BUSY ////////////////////////////////
	if ((STATUS == S_READ && re_count == 4'b0) || (STATUS == S_WRITE && wr_count == 4'b0)) begin // set busy at start of command
		
		//BUSY <= 1'b1;
		
	end
	
	else if ((re_count == BURST_LENGTH) || ( wr_count == BURST_LENGTH + CAS_LAT*2)) begin // clear busy and reset at end of burst
	
		BUSY <= 1'b0;
		STATUS <= S_IDLE;
	
	end
	
end

//////////////////////////////// WRITE DATA ////////////////////////////////
always @ (negedge WR_CLK_333M) begin

	if (STATUS == S_WRITE) begin

		if (wr_count < BURST_LENGTH + CAS_LAT*2) begin // during write period
		
			wr_count <= wr_count + 4'b1; 		// increment write counter
						
			if (wr_count >= CAS_LAT*2) begin // write data when ready
				
				WR_DQS <= !WR_DQS;		// toggle write strobe
				
				if (wr_count >= CAS_LAT*2 + WRITE_LENGTH) begin // mask excess writes
				
					DM <= 2'b11;		// set data mask high
					
				end 
				
				else begin
					
					DM <= 2'b0;		// clear any data mask
				
				end
		
			end
		
		end
		
	end
	
	//if (wr_count == BURST_LENGTH + CAS_LAT*2) begin
	else begin
		DM <= 2'b0;				// clear data mask at the end of a burst
		wr_count <= 5'b0;		// reset counter
		
	end

end

//////////////////////////////// READ DATA ////////////////////////////////
always @ (posedge DQS[1]) begin

	if (STATUS == S_READ) begin // if in read
		
		RE_DQS <= !RE_DQS; // edge on which data is read
		
		re_count <= re_count + 4'b1;	// increment read counter
		
		if (re_count == BURST_LENGTH) re_count <= 4'b0;

	end

end

endmodule
