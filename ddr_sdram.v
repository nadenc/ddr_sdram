`timescale 1ns / 1ps
// MT46H32M16LF - 8Meg x 16 x 4 banks
// 8K row addressing ADDR[12:0]
// 1K col address ADDR[9:0]
// 16 bit words DATA[15:0]
// 4 banks BA[1:0]
// PRECHARGE ADDR[10]

/* External Interface
Use COMMAND reg to send read/write request:
	COMMAND[1] is the R/W bit (set 1 for read, set 0 for write)
	COMMAND[0] is the action requested bit (set 1 when read/write is required)

BA is bank address [1:0]
DATA_IN is the data bus [15:0]
ADDR_IN is the address bus [22:0] ([22:13] column address, [12:0] row address)
Use WRITE_LENGTH to specify number of 16-bit words to be written in burst
Use DATA_EDGE to clock in/out data in write/read commands

***NOTE***
Command inputs and buses must remain asserted until a rising edge on ACCEPTED is received
Commands must be asserted in the falling edge of DDR_CLK
*/

module ddr_sdram(
// Clocks
input DDR_CLK			, // 166MHz
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
input [1:0] BL			, // burst length

input [1:0] COMMAND	, // [1-read0write1,0-action requested], this command needs to remain asserted until a posedge of ACCEPTED is sent
input WRITE_LENGTH	, // number of words to be written in burst
output DATA_EDGE , // edge for data bus
output reg ACCEPTED	  	  // output if successful of command - set high after negedge of command issue, set low every posedge
);

reg [12:0] openRowB3; // store open rows in each bank
reg [12:0] openRowB2;
reg [12:0] openRowB1;
reg [12:0] openRowB0;

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

assign DQ[1] = status[11] ? control[1] : 1'bZ; // output if writing, input otherwise
assign DQ[0] = status[11] ? control[0] : 1'bZ; // output if writing, input otherwise
assign DATA_EDGE = control[1]; // data edge 

reg [3:0] counter; // counter for edge counting delays

reg [12:0] ADDR; // store intermediate address how to handle A10?
reg [9:0] control; // [9-CKE,8-WE,7-CAS,6-RAS,5-BA1,4-BA0,3-DM1,2-DM0,1-DQ1,0-DQ0]
reg [12:0] status; // [12-active required,11-writing,10-reading,9-pwr,8-init done,7-wr_ready,6-re_ready,5-precharge required,4-SPARE,3-openB3,2-openB2,1-openB1,0-openB0]

localparam CAS_LAT = 4; // CAS latency clock delay (both edge delay)
localparam BURST_LENGTH = 2; // data burst length

initial begin
	status <= 13'b0; // clear status reg
	control <= 10'b0; // clear control reg
	
	#200 status[9] <= 1'b1; // wait 200ns after power up before issuing any commands, set power on
end

always @ (posedge DDR_CLK) begin
	if (COMMAND[0]) begin // if action required, check for precharge/active requirement
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
	if (status == 13'bXXX10XXXXXXXX) begin // initialize (PWR on and and not yet initialized)
		control[9:6] <= 4'b1000; // set op command 
		ADDR <= 13'b0000000100001; // 2 CAS latency, sequential burst, 2 burst length
		status[8] <= 1'b1; // init done
	end
	
	else if (status == 13'b000X1XX1XXXXX) begin // precharge
		control[9:6] <= 4'b1010; // set op command
		control[5:4] <= BA_IN; // set bank address
		ADDR[10] <= 0; // clear only single bank
		status[5] <= 1'b0; // clear precharge
		status[12] <= 1'b1; // active required
	end
	
	else if (status == 13'b100X1XX0XXXXX) begin // active
		control[9:6] <= 4'b1110; // set op command
		control[5:4] <= BA_IN; // set bank address
		ADDR <= ADDR_IN[12:0]; // set row address
		status[12] <= 1'b0; // active complete
		status[7:6] <= 2'b11; // ready for R/W
		case (BA_IN) // record new open row in bank
			2'b00: openRowB0 <= ADDR_IN[12:0];
			2'b01: openRowB1 <= ADDR_IN[12:0];
			2'b10: openRowB2 <= ADDR_IN[12:0];
			2'b11: openRowB3 <= ADDR_IN[12:0];
		endcase
	end
	
	else if ((COMMAND == 2'b01) && (status == 13'b00011X10XXXXX))begin // read required
		control[9:6] <= 4'b1101; // set op command
		control[5:4] <= BA_IN[1:0]; // set bank address
		control[1:0] <= 2'b0; // set DQs low
		counter <= 4'b0; // reset counter
		status[10] <= 1'b1; // set reading bit
		ADDR[9:0] <= ADDR_IN[22:13]; // set column address
		ADDR[10] <= 1'b0; // set precharge bit low
	end
	
	else if ((COMMAND == 2'b11) && (status == 13'b000111X0XXXXX))begin // write required
		control[9:6] <= 4'b1001; // set op command
		control[5:4] <= BA_IN[1:0]; // set bank address
		control[1:0] <= 2'b0; // set DQs low
		counter <= 4'b0; // reset counter
		status[11] <= 1'b1; // set writing bit
		ADDR[9:0] <= ADDR_IN[22:13]; // set column address
		ADDR[10] <= 1'b0; // set precharge bit low
		control[3:2] <= 2'b00; // clear data mask
	end
	
	else begin // count after read/write command, send NOPs
		control[9:6] <= 4'b0000; // set nop command
		counter <= (counter + 4'b0); // increment counter
	end
end

always @ (posedge DDR_CLK) begin // write data
	if (status[11] && (counter > CAS_LAT) && (counter <= (CAS_LAT + BURST_LENGTH))) begin
		control[1:0] <= ~control[1:0]; // toggle DQS and DATA_EDGE
		ACCEPTED <= 1'b0; // set accepted bit low
		if ((counter == (CAS_LAT + WRITE_LENGTH)) && (counter != (CAS_LAT + BURST_LENGTH))) begin // mask excess writes
			control[3:2] <= 2'b11; // set data mask high
		end
		else if (counter == (CAS_LAT + BURST_LENGTH)) begin // finalizes write
			ACCEPTED <= 1'b1; // set accepted bit low
			status[11] <= 1'b0; // finish write
		end
	end
end

always @ (negedge DDR_CLK) begin // write data
	if (status[11] && (counter > CAS_LAT) && (counter <= (CAS_LAT + BURST_LENGTH))) begin
		control[1:0] <= ~control[1:0]; // toggle DQS and DATA_EDGE
		ACCEPTED <= 1'b0; // set accepted bit low
		if ((counter == (CAS_LAT + WRITE_LENGTH)) && (counter != (CAS_LAT + BURST_LENGTH))) begin // mask excess writes
			control[3:2] <= 2'b11; // set data mask high
		end
		else if (counter == (CAS_LAT + BURST_LENGTH)) begin // finalizes write
			ACCEPTED <= 1'b1; // set accepted bit low
			status[11] <= 1'b0; // finish write
		end
	end
end

always @ (posedge DQ[1]) begin // read data
	if (status[10] && ((counter > CAS_LAT) && (counter <= (CAS_LAT + BURST_LENGTH)))) begin
		control[1:0] <= ~control[1:0]; // toggle DATA_EDGE
		ACCEPTED <= 1'b0; // set accepted bit low
		if (counter == (CAS_LAT + BURST_LENGTH)) begin // finalizes write
			ACCEPTED <= 1'b1; // set accepted bit low
			status[10] <= 1'b0; // finish write
		end
	end
end

always @ (negedge DQ[1]) begin // read data
	if (status[10] && ((counter > CAS_LAT) && (counter <= (CAS_LAT + BURST_LENGTH)))) begin
		control[1:0] <= ~control[1:0]; // toggle DATA_EDGE
		ACCEPTED <= 1'b0; // set accepted bit low
		if (counter == (CAS_LAT + BURST_LENGTH)) begin // finalizes write
			ACCEPTED <= 1'b1; // set accepted bit low
			status[10] <= 1'b0; // finish write
		end
	end
end

endmodule
