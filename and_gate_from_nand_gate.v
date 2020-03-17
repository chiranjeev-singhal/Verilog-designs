//and gate from nand gate

module and_gate_from_nand_gate(fout, x ,y);

output fout;
input x,y;
wire w1;

nand n1(w1, x,y);
nand n2(fout,w1,w1);

endmodule 

module test_and_gate_from_nand_gate();

wire fout;
reg x,y,w1;

and_gate_from_nand_gate A1(.x(x), .y(y),.fout(fout));

initial 
	begin
		 x = 1'b0; y =1'b0;
		#5 x = 1'b0; y =1'b1;
		#5 x = 1'b1; y =1'b0;
		#5 x = 1'b1; y =1'b1;
		#10 $stop;
	end
endmodule



	



