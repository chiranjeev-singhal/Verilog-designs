// this is a design of a FullAdder using timing delays

module full_adder_delay (sum,carry,a,b,cin);

output sum,carry;
input a,b,cin;

wire w1,w2,w3;

xor #(1:2:3,4:5:6) x1  (w1,a,b);
and #(1:2:3,4:5:6) a1  (w2,a,b);

xor #(1:2:3,4:5:6) x2  (sum,w1,cin);
and #(1:2:3,4:5:6) a2  (w3,w1,cin);

or #(1:2:3,4:5:6) o1 (carry,w2,w3); 

endmodule 


module full_adder_delay_top();

wire sum,carry;
reg a,b,cin;

full_adder_delay fa(sum,carry,a,b,cin);

initial
begin
	{a,b,cin} = 3'b000;
	repeat (7) #5 {a,b,cin} = {a,b,cin} + 1'b1;

end

initial
	$monitor ("@ %gns a[%b] b[%b] cin[%b] ---> sum[%b] carry[%b]",$time,a,b,cin,sum,carry);
endmodule 