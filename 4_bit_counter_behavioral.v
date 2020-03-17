module bit_counter_4_behavioral (q,clock, clear);

output [3:0] q;
input clock, clear;

reg [3:0] q;

always @(posedge clear or negedge clock) // trigger based delay 
	begin
		if ( clear )
			q = 4'd0;
		else
			q = (q + 1) % 16;//modulo 16 means it will count till 15 from 0 to 15, i.e. 16.
	end
endmodule

module bit_counter_4_behavioral_stimulus ();

wire [3:0] q;
reg clock, clear;

bit_counter_4_behavioral bc1(q,clock, clear);

initial 
	begin
		clear = 0;
		clock = 0;
		#2 clear = 1;
		#1 clear = 0;
	end
always 	
	#5 clock = ~ clock;
initial
	$monitor($time, " : count is --%d ", q );
endmodule   