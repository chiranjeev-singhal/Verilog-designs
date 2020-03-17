module mux2_1_buf (out,in1,in0,s);

output out;
input in1,in0,s;

bufif0 #(1:3:5,2:4:6,5:6:7) b1(out,in0,~s);
bufif1 #(1:3:5,2:4:6,5:6:7) b2(out,in1,s);

endmodule 

module mux2_1buf_tb();

wire out;
reg in1,in0,s;

mux2_1_buf mux1(out,in1,in0,s);

initial
	begin
		in1 = 1'b1; in0=1'b0;
		s = 1'b0;
		#5 s = 1'b1;


	end
initial
	$monitor ($time, ": sel--%b in1--%b in0--%b and output is--%b",s,in0,in1,out);

endmodule 