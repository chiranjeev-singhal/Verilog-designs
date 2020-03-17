module rs_latch_nor (q,qbar,reset,set);

output q,qbar;
input reset,set;

nor #1 n1(q,reset,qbar);
nor #1 n2(qbar,q,set);

endmodule 

module rs_latch_tb();

wire q,qbar;
reg reset,set;

rs_latch_nor latch1(q,qbar,reset,set);

initial
	begin
		
		{reset,set} = 2'b10;
		#5 {reset,set} = 2'b00;
		#5 {reset,set} = 2'b01;
		#5 {reset,set} = 2'b00;
		#5 {reset,set} = 2'b11;  

	end

initial
	$monitor ($time, ": reset--%b set--%b and output--%b",reset,set,q);
endmodule 