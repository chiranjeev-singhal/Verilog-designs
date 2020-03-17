module 	eight_bit_ALU (yout, ain, bin, sel);

output 	reg [7:0]yout;
input	[15:0]ain,bin;
input	[2:0]sel;

always	@(ain,bin,sel)
	case(sel)
		3'b000:	yout = 8'b0;
		3'b001: yout = ain & bin;
		3'b010: yout = ain | bin;
		3'b011: yout = ain ^ bin;		 
		3'b100: yout = ~ain;
		3'b101: yout = ain - bin;
		3'b110: yout = ain + bin;
		3'b111: yout = 8'hFF;
	endcase
endmodule

