//modelling a buffer with capacitive storage
//it should be a tri-stated gate
//other gates cannot be driven into z as per LRM
//only gated swithces and gates can use them
//perfect buffer b <= #5 a;
module buffer();
reg in; //input
reg enable;  //enable
trireg (large) #(0,0,50) out;

bufif1 b1(out,in,enable);

initial
begin
 in=1;
enable=1;
#30 enable =0;

end

endmodule

  
