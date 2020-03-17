// this is a design for 2-1 MUX at dataflow level

module mux_2_1 (out,sel,in);

output out;
input sel;
input [1:0] in;

assign out = sel ? in[0] : in[1];

endmodule 

module mux_2_1_df_top ();

wire out;
reg [1:0] in;
reg sel;

mux_2_1 mux(out,sel,in);

initial
begin
	in = 2'b10;
	#5 sel = 0; //out = 1
	#5 sel = 1; //out = 0	

end

initial
	$monitor("@ %gns out[%b] ----> sel[%b] and in0[%b] in1[%b]",$time,out,sel,in[0],in[1]);
endmodule 
