module nbit_xor 
	#(parameter size = 16) 
	(input [size-1:0] a,b, output [size-1:0] y);

genvar i;

generate 
	
	for (i=0;i<size;i=i+1)
		xor uxor(y[i],a[i],b[i]);

endgenerate

endmodule  