// 1 bit adder 
module half_adder (s,c,a,b);

output s,c;
input a,b;

assign s = a ^ b;	//bit wise xor operation
assign c = a & b;	//bit wise and operation

endmodule

module full_adder (sum,carry,a,b,cin);

output sum,carry;
input a,b,cin;

wire w1,w2,w3;

half_adder ha1(w1,w2,a,b);
half_adder ha2(sum,w3,w1,cin);
or or1(carry,w2,w3);

endmodule  

module adder_top ();

wire sum,carry;
reg a,b,cin;

full_adder f1 (sum,carry,a,b,cin);

initial
begin
	a=0;b=0;cin=0;
	repeat (7) #5 {a,b,cin} = {a,b,cin} +1;

end

initial begin
	$dumpfile ("adder_out.vcd");
	$dumpvars(0,adder_top);
end
endmodule 