module mux4_1_behavioral (out, i0,i1,i2,i3,s1,s0);

output out;
input i0,i1,i2,i3;
input s1,s0;

reg out; //in behavorial modelling LHS is always a reg

// all the ports which cause a change in out must go in as sensitivity list

always @ (*)
	begin: mux_design
		case ({s1,s0})
			2'b00 : out = i0;
			2'b01 : out = i1;
			2'b10 : out = i2;
			2'b11 : out = i3;		
		endcase
	end
endmodule 

module mux4_1_behavioral_stimnulus ();

wire out;
reg i0,i1,i2,i3;
reg s1,s0;

mux4_1_behavioral mb1(out, i0,i1,i2,i3,s1,s0);

initial
	begin
		{i0,i1,i2,i3} = 4'b1101;
		#5 {s1,s0} = 2'b00;
		repeat (3) #5 {s1,s0} = {s1,s0} + 1; 
				
	end

initial
	$monitor($time, " : s1,s0--%b-----> out--%b ",{s1,s0},out);
endmodule 