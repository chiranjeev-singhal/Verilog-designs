module ram(addr,data_in,data_out,clk,wr);

output reg [31:0] data_out;
input [4:0] addr;
input [31:0] data_in;
input clk,wr;

reg [7:0] mem[0:1024]; //1kb memory

always @ (posedge clk)
begin
	if (wr)
		mem[addr] <= data_in;
	else
		data_out <= mem[addr];

end

endmodule 


module ram_test ();

wire [31:0] data_out;
reg [4:0] addr;
reg [31:0] data_in;
reg clk,wr;

integer i;
ram ram_1(addr,data_in,data_out,clk,wr);

initial
begin
	clk = 0;
	wr = 1;
	
	for (i=0;i<1024;i=i+1)
	begin
		addr = i;
		data_in = i+10;
	end	

	#100 wr= 0;
end

initial
begin
	for (i=0;i<1024;i=i+1)
		$display ("%d",data_out); 

end

always #5 clk = ~clk;
endmodule 