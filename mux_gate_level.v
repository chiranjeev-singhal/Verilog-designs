module mux_gate_level(out,i0,i1,i2,i3,s1,s0);

output out;
input i0,i1,i2,i3;
input s1,s0;

wire out;

wire s1n,s0n;
wire y0,y1,y2,y3;

not n1(s1n,s1);
not n2(s0n,s0);

and a1(y0,i0,s1n,s0n);
and a2(y1,i1,s1n,s0);
and a3(y2,i2,s1,s0n);
and a4(y3,i3,s1,s0);

or o1(out,y0,y1,y2,y3);

endmodule

module mux_gate_level_tb ();

wire out;
reg i0,i1,i2,i3;
reg s1,s0;

mux_gate_level m1(out,i0,i1,i2,i3,s1,s0);

initial
	begin
		i0 = 1'b1; i1 = 1'b0; i2 = 1'b1; i3 = 1'b0;

		{s1,s0} = 2'b00;
		#1 $display ("select lines as %b and output is %b",{s1,s0},out); 
		
		{s1,s0} = 2'b01;
		#1 $display ("select lines as %b and output is %b",{s1,s0},out);

	  	{s1,s0} = 2'b10;
		#1 $display ("select lines as %b and output is %b",{s1,s0},out);

		{s1,s0} = 2'b11;
		#1 $display ("select lines as %b and output is %b",{s1,s0},out);
	end	

endmodule 