//D_ff with Synch reset

module d_ff_syn(q,qbar,d,clk,reset);
output q,qbar;
input d,clk,reset;

not #2 nt(w0,clk); //edge detector

//Synch reset logic
and a0(w,d,reset);

//FF
and a1(w1,clk,w0);
nand n1(w2,w,w1);
nand n2(w3,w1,w2);
nand n3(q,qbar,w2);
nand n4(qbar,q,w3);


endmodule 

module d_ff_syn_tb();
wire q,qbar;
reg d,clk,reset;

d_ff_syn d2(q,qbar,d,clk,reset);

always #5 clk = ~clk;

initial
begin
d=1;
clk=0;
reset=1;
#7 d=0;
#3 reset =0;
#1 reset=1;
#14 d=1;
reset =0;
#2 reset=1;
end


endmodule 