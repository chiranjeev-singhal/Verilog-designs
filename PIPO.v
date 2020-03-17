//parallelin and parallelout register

module parallelin_parallelout ( dout,datain,clock,reset	);

output [2:0]dout;
input [2:0]datain;
input clock, reset;

reg [2:0]int_reg;
reg [2:0]dout;

always @ (posedge clock)
begin
	if (reset)
	begin
		int_reg <= 3'b000;
		int_reg <= datain;
	end
	
	else
	begin
		dout <= datain;
	end
end

endmodule 

module PIPO ();

wire [2:0]dout;
reg [2:0]datain;
reg clock, reset;

parallelin_parallelout PIPO( dout,datain,clock,reset	);

initial
begin
	clock = 0;
	reset = 0;
	#5 reset = 1; datain = 3'b010;
	#3 reset = 0;

end

always
	#5 clock = ~clock;
initial
	$monitor($time, " : clock--%b,datain--%b----->dataout--%b",clock,datain,dout);
endmodule 