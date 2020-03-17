// jk-ff udp

primitive jk_udp (q,j,k,clk,clr);

output reg q;
input j,k,clk,clr;

initial
	q = 0;

table 
	//	j k clk clr : cs : ns
		? ? ? 1 : ? : 0; //if clr is high reset
		? ? ? f : ? : -; //igonre the falling edge on clr
		0 1 (01) 0 : ? : 0; //reset condition
		1 0 (01) 0 : ? : 1; //set condition	
		0 0 (01) 0 : ? : -; //memory condition
		1 1 (01) 0 : 0 : 1; //toggle
		1 1 (01) 0 : 1 : 0; //toggle
		? ? (10) 0 : ? : -; //ignore the falling edge of clk

endtable

endprimitive 

module jk_ff_udp (q,j,k,clk,clr);

output q;
input j,k,clk,clr;


jk_udp udp1(q,j,k,clk,clr);


endmodule 

module jk_ff_udp_tb();

wire q;
reg j,k,clk,clr;

jk_ff_udp udp2(q,j,k,clk,clr);

initial
begin
	clk = 0;
	clr = 0;
	#2 clr = 1;
	#1 clr = 0;

end

initial
begin
	$monitor (" @%gns j--%b k--%b ----> q --%b",$time,j,k,q);
	#5 {j,k} = 2'b10;
	#10 {j,k} = 2'b00;
	#10 {j,k} = 2'b01;
	#10 {j,k} = 2'b00;
	#10 {j,k} = 2'b11;
	#10 {j,k} = 2'b00;
end

always 
	#5 clk = ~clk;
endmodule 