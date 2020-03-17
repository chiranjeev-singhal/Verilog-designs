module ripple_counter_dataflow (q,clock,clear);

output [3:0]q;
input clock, clear;

tff t1(q[0],clock,clear);
tff t2(q[1],q[0],clear);
tff t3(q[2],q[1],clear);
tff t4(q[3],q[2],clear);

endmodule 

module tff (q,clk,reset);

output q;
input clk,reset;

dff d1(q,,~q,clk,reset);

endmodule 

module dff ( q,qbar,d,clk,clear	);

output q,qbar;
input d,clear,clk;

wire sbar,cbar,s,r,rbar;

assign cbar = ~clear;

assign sbar = ~(rbar & s), s = ~(sbar & cbar & ~clk ), r = ~(s & ~clk & rbar ),
	  rbar = ~(r & cbar & d );

assign q = ~(s & qbar ),
	qbar = ~(q & cbar & r); 	  

endmodule 

module ripple_counter_dataflow_tb ();

wire [3:0] q;
reg clk, reset;

ripple_counter_dataflow rc1(q,clk,reset);

initial
	begin
		reset = 1'b1;
		#34 reset = 1'b0;
		#200 reset = 1'b1;
		#50 reset = 1'b0;
	end

initial
	begin
		clk = 1'b0;
		forever #10 clk = ~clk;
	end

initial
	begin
	$monitor ($time, ": Count--%d Clear--%b", q[3:0],reset);
	#400 $stop;
	end

endmodule 