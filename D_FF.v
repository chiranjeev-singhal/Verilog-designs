//modelling D-FF at gate level as per the given schematic
//we need to model the synchronous and asynuchornous resets also
//this given circuit is a latch
//either we should use Master-Slave configuration
//or the edge detector 

module d_ff(q,qbar,d,clk);
output qbar,q;
input d,clk;

nand n1(w1,clk,d);
nand n2(w2,w1,clk);
nand n3(q,w1,qbar);
nand n4(qbar,q,w2);



endmodule 

module d_ff_tb_lab();
wire q,qbar;
reg d,clk;

d_ff d1(q,qbar,d,clk);

initial
begin
d=0;
clk=0;
#14 d=1;
end

always
#5 clk = ~clk; 
endmodule 
