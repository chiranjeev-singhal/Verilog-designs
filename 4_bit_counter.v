// module declaration with all the ports 
module four_bit_counter (counter_out, rst, clk, en);

//output port as a 4 bit bus
output [3:0] counter_out;

// input ports
input rst, clk, en;

// input port data type, all internal wires or input ports are declared as wire, which is a class of 'net' data type.
wire rst, clk, en;

//output port data type, since here the output can hold data so it is declared as register data type
reg [3:0] counter_out;

/* behavioral description of the counter. which is if asynchronous reset is high then 
counter output is 0. if not then the counter resumes its normal operation. also, if enable is asserted
only then the counter would start counting. being a 4-bit counter it can count upto
16 distinct states. it is a posedge triggered clk*/

always @(negedge clk) //since the clk is recurring thing so it is decalred in always block so that it can run time and time again till the simulation ends. 
	begin:COUNTER
		//if the reset is inserted,  that is before every clk pulse, then output is loaded with 4'b0.
		
		if (rst == 1'b1) begin
			counter_out <= #1 4'b0000;
		end
		
		//if enable is high then the counter starts counting
		
		else if (en == 1'b1) begin 
		
			counter_out <= #1 counter_out + 4'b0001;
		end
 
		
	end

endmodule
