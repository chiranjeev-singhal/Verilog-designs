//modelling D-FF at gate level using async reset
//using edge detector as the circuit given in the diagram is a latch

module d_ff_a(q,qbar,d,clk,reset);
output qbar,q;
input d,clk;
input reset;

not #2 nt(w0,clk); //edge detector
and a1(w1,clk,w0);
nand n1(w2,d,w1);
nand n2(w3,w1,w2);
nand n3(q,qbar,w2);
nand n4(qbar,q,w3,reset);

endmodule 

module d_ff_tb_asyn();
wire q,qbar;
reg d,clk,reset;

d_ff_a d1(q,qbar,d,clk,reset);

always #5 clk =~clk;

initial
begin
d=1;
clk=0;
reset=1;
#7 d=0;
#3 reset =0;
#1 reset=1;
#14 d=1;
end

endmodule 
