
module accumulator(enable,in,out1,outp);
input [7:0]in;
input enable;
output reg [7:0]out1 = 8'h00;
output reg [7:0] outp;

always @(posedge enable)
begin
         out1 <= in;
         outp <= in;
end
endmodule

module tb_acc;
reg[7:0]in;
reg enable;
wire [7:0]out1,outp;

accumulator acc1(enable,in,out1,outp);

initial
begin
in = 8'b11100000;
enable = 1;

end
endmodule 