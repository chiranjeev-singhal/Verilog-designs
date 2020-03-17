// this is a design for 2 - 4 DECODER at DataFlow level

module dec_2_4_df (data,in);

output [3:0] data;
input [1:0] in;

assign data[0] = ~in[1] & ~in[0];
assign data[1] = ~in[1] & in[0];
assign data[2] = in[1] & ~in[0];
assign data[3] = in[1] & in[0]; 

endmodule 

module dec_2_4_df_top ();

wire [3:0] data;
reg [1:0] in;

dec_2_4_df deco(data,in);

initial
begin
	in = 2'b00;
	repeat (3) #5 in = in + 1'b1;

end

initial
	$monitor("@ %gns in1[%b] in0[%b] ---> data0[%b] data1[%b] data2[%b] data3[%b]",$time,in[1],in[0],data[0],data[1],data[2],data[3]);
endmodule 
