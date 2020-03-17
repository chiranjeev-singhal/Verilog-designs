// this is half-Subtractor design

module half_sub (diff,brr,a,b);

output diff,brr;
input a,b;

wire w1;

xor x1(diff,a,b);
not n1 (w1,a);
and a1 (brr,w1,b);


endmodule 

module half_sub_top ();

wire diff,brr;
reg a,b;

half_sub h_sub(diff,brr,a,b);

initial
begin
	{a,b} = 2'b00;
	repeat (3) #5 {a,b} = {a,b}+1'b1;
end

initial
	$monitor ("@ %gns a[%b] b[%b]-->diff[%b] brr[%b]",$time,a,b,diff,brr);
endmodule 
