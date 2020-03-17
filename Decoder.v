module decoder(enable,in,out1,out2);
input [10:0]in;
input enable;
output reg[2:0]out1;
output reg[7:0]out2;

always @(posedge enable)
      begin
       out1 <= {in[10],in[9],in[8]};
        out2 <= {in[7],in[6],in[5],in[4],in[3],in[2],in[1],in[0]};
      end

endmodule


module tb_decoder;
reg[10:0]in;
reg enable;
wire [7:0]out2;
wire [2:0]out1;

decoder de1(enable,in,out1,out2);

initial
begin
in = 8'b11100000;
enable = 1;

end
endmodule
   
