// this is a 4 by 1 MUX

module mux_4_1 (out,sel,a);

output out;
input [1:0] sel;
input [3:0] a;

wire w1,w2,w3,w4,nsel0,nsel1;

not n1 (nsel0,sel[0]);
not n2 (nsel1,sel[1]);

and a1 (w1,nsel0,nsel1,a[3]);
and a2 (w2,nsel0,sel[1],a[2]);
and a3 (w3,sel[0],nsel1,a[1]);
and a4 (w4,sel[0],sel[1],a[0]);

or o1 (out,w1,w2,w3,w4);

endmodule 

module mux_4_1_top ();

wire out;
reg [1:0] sel;
reg [3:0] a;

mux_4_1 mux3 (out,sel,a);

initial
begin
	a[3] = 1; a[2] = 0; a[1] = 1; a[0] = 0;
	#5 sel=2'b00;
	#5 sel=2'b01;
	#5 sel=2'b10;
	#5 sel=2'b11;
end

initial
	$monitor ("@ %gns sel0[%b] sel1[%b]--->a0[%b] a1[%b] a2[%b] a3[%b]--->out[%b]",$time,sel[0],sel[1],a[0],a[1],a[2],a[3],out);
endmodule 