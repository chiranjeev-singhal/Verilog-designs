module up_counter_1 ( out,clk,reset);

output [4:0] out;
input clk,reset;

reg[4:0] out;


always @ (posedge clk)
	if (reset)		
		out <= 0;
	else
		out <= out + 1;

endmodule 

module up_counter_1_tb ();

wire [4:0] out;
reg clk,reset;

up_counter_1 upcounter1( out,clk,reset);

initial
begin
	clk = 0;
	#5 reset = 1;
	#2 reset = 0;

end
always 
	#5 clk = ~clk;
initial
	$monitor ($time, "out--%d",out);


endmodule 