`timescale 1ns / 1ps
// MT46H32M16LF - 8Meg x 16 x 4 banks
// 8K row addressing ADDR[12:0]
// 1K col address ADDR[9:0]
// 16 bit words DATA[15:0]
// 4 banks BA[1:0]
// PRECHARGE ADDR[10]

module ddr_sdram(
// Clocks
input DDR_CLK			,
output CLK_P			,
output CLK_N			,

// Output Pins
output CKE				,
output WE				,
output CAS				,
output RAS				,
output [1:0] BA			,
output [1:0] DM			,
inout [1:0] DQ			,
inout [15:0] DATA_OUT	,
output [12:0] ADDR_OUT	,

//External Interface
input [1:0] BA_IN		,
inout [15:0] DATA_IN	,
input [22:0] ADDR_IN	, // [22:13] col, [12:0] row
input [1:0] COMMAND	, // [1-read0write1,0-action requested]
output reg ACCEPTED	  	  // output if successful of command - set high after negedge of command issue, set low every posedge
);

reg [12:0] openRowB3; // store open rows in each bank
reg [12:0] openRowB2;
reg [12:0] openRowB1;
reg [12:0] openRowB0;

reg [12:0] ADDR; // store intermediate address how to handle A10?

assign CLK_P = DDR_CLK;
assign CLK_N = ~DDR_CLK;

assign DATA_OUT = status[11] ? DATA_IN : 16'bZ; // out if write, Z otherwise
assign ADDR_OUT = ADDR;
assign DATA_IN = status[10] ? DATA_OUT : 16'bZ; // data if read, Z if Write

assign CKE = COMMAND[0] ? control[9] : 1'b0; // 1 if enable, 0 if disable
assign WE = control[8];
assign CAS = control[7];
assign RAS = control[6];
assign BA[1] = control[5];
assign BA[0] = control[4];
assign DM[1] = control[3];
assign DM[0] = control[2];

assign DQ[1] = status[11] ? control[1] : 2'bZ; // output if writing, input otherwise
assign DQ[0] = status[11] ? control[1] : 2'bZ; // output if writing, input otherwise

reg [9:0] control; // [9-CKE,8-WE,7-CAS,6-RAS,5-BA1,4-BA0,3-DM1,2-DM0,1-DQ1,0-DQ0]
reg [12:0] status;	  // [12-active required,11-writing,10-reading9-pwr,8-init done,7-wr_ready,6-re_ready,5-precharge required,4-mask required,3-openB3,2-openB2,1-openB1,0-openB0]

initial begin
	status <= 13'b0; // clear status reg
	control <= 10'b0; // clear control reg
	
	#200 status[7] <= 1; // wait 200ns after power up before issuing any commands
end

always @ (posedge DDR_CLK) begin
	if (COMMAND[0] == 1'b1) begin // if action required, check for precharge/active requirement
		case (BA) // check if bank/row is open
			2'b00: begin
				if (status[0] && (openRowB0 != ADDR_IN[12:0])) begin // if bank is open and wrong row is open call precharge
					status[5] <= 1'b1; // precharge required
				end
				else if (~status[0]) begin // if bank isnt open call active
					status[12] <= 1'b1; // active required
				end
			end
			2'b01: begin
				if (status[1] && (openRowB1 != ADDR_IN[12:0])) begin // if bank is open and wrong row is open call precharge
					status[5] <= 1'b1; // precharge required
				end
				else if (~status[1]) begin // if bank isnt open call active
					status[12] <= 1'b1; // active required
				end
			end
			2'b10: begin
				if (status[2] && (openRowB2 != ADDR_IN[12:0])) begin // if bank is open and wrong row is open call precharge
					status[5] <= 1'b1; // precharge required
				end
				else if (~status[2]) begin // if bank isnt open call active
					status[12] <= 1'b1; // active required
				end
			end
			2'b11: begin
				if (status[3] && (openRowB3 != ADDR_IN[12:0])) begin // if bank is open and wrong row is open call precharge
					status[5] <= 1'b1; // precharge required
				end
				else if (~status[3]) begin // if bank isnt open call active
					status[12] <= 1'b1; // active required
				end
			end
		endcase
	end
end

always @ (negedge DDR_CLK) begin
	if (status[8:7] == 2'b10) begin // initialize
		control <= 9'b100000XXXX;
		ADDR	<= 13'b0000000100001; // 2 CAS latency, sequential burst, 2 burst length
		status[6] <= 1'b1;
	end
	
	if (status[5]) begin // precharge
		control[9:6] <= 4'b1010;
		control[5:4] <= BA_IN;
		ADDR[10] <= 0; // clear only single bank
		status[5] <= 1'b0; // clear precharge
		status[12] <= 1'b1; // active required
	end
	
	if (status[12]) begin // active
		control[9:6] M= 4'b1110;
		control[5:4] <= BA_IN;
		ADDR <= ADDR_IN[12:0];
		status[12] <= 1'b0; // clear active
	end
	
	// proceed with active/precharge bit checks
	
	if (COMMAND[1]) begin // write command and init done
		
		if (status == 12'bXX110XXXXXXX) begin // not ready for write
			ACCEPTED <= 1'b0;
		end
		
		if (status == 12'bXX110X1XXXXX) begin // precharge required
			ACCEPTED <= 1'b0;
		end

			
		if (status == 12'b1100X1111) begin // good to write
			control[9:6] <= 4'b1100;
			control[5:4] <= BA_IN[1:0];
		
			ACCEPTED <= 1'b1;
		end
		
	end
	
end

		/*
		if (status[5]) begin // need data mask
			control[3:2] <= 2'b11;
		end
		
		if (~status[5]) begin // need no data mask
			control[3:2] <= 2'b00;
		end
		*/

	// if im still writing but dont want to anymore? how to handle data mask
/*

*/
endmodule




/* OLD***********************************************
reg [2:0] command;
reg [15:0] counter;
reg sys_ready;

localparam BL = 2; // burst length
localparam CD = 2; // CAS latency - this means data is available 2 clocks after read request

//##########Define Modules##########



initial begin
	command <= 3'b1; // start in initialize state
	counter <= 16'b0; // general counter
	sys_ready <= 1'b0; // system ready flag
end

// 0 - NOP, 1 - Init on PWR, 2 - setup reg, 3 - activate row in bank
// 4 - precharge a bank into idle, 5 - read from a column, 6 - write to column
// 

always @ (posedge DDR_CLK) begin
	

always @ (negedge DDR_CLK) begin
	case (command) 
		1:	begin // initialize (setup clock on power up)
			counter = counter + 16'b1; // increment counter
			
			if (counter == 0) begin
				CKE <= 1;
			end
			else if (counter == 2) begin
				assign CLK_P = DDR_CLK;
				assign CLK_N = ~DDR_CLK;
			end
			else if (counter == 16'b34000) begin
				sys_ready <= 1'b1;
			end
		end
		2:	begin // setup registers
			LOAD_MODE_REG load_mode_reg_ex(
				.CKE(CKE),
				.RAS(RAS),
				.CAS(CAS),
				.WE(WE)
			);
		end
		3: begin // activate a row in a bank
			ACTIVE #(.row(row), .bank(bank)) active_ex(
				.CKE(CKE),
				.RAS(RAS),
				.CAS(CAS),
				.WE(WE),
				.BA(BA),
				.ADDR(ADDR)
			);
		end
		4: begin // precharge a bank to set into idle
			PRECHARGE #( .bank(bank), .all_bank(all_bank)) precharge_ex(
				.CKE(CKE),
				.RAS(RAS),
				.CAS(CAS),
				.WE(WE),
				.BA(BA),
				.ADDR(ADDR)
			);
		end
		5: begin // read from column
			READ #( .col(col), .bank(bank), .a_pre_chg(a_pre_chg)) read_ex(
				.CKE(CKE),
				.RAS(RAS),
				.CAS(CAS),
				.WE(WE),
				.BA(BA),
				.ADDR(ADDR)
			);
		end
		6: begin
			WRITE #( .col(col), .bank(bank), .a_pre_chg(a_pre_chg), .data_wr(data_wr)) write_ex(
				.CKE(CKE),
				.RAS(RAS),
				.CAS(CAS),
				.WE(WE),
				.BA(BA),
				.ADDR(ADDR),
				.DATA(DATA)
			);
		end
		default: begin // default to NOP
			NOP nop_ex(
				.CKE(CKE),
				.RAS(RAS),
				.CAS(CAS),
				.WE(WE)
			);
		end
	endcase
end
*/
