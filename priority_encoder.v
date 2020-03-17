module priority_encoder ( code, sel );

output [2:0] code;
input [7:0] sel;

reg [2:0] code;

always @(sel)
	begin
		if 	(sel[0]) code <= 3'b000;
		else if (sel[1]) code <= 3'b001;
		else if (sel[2]) code <= 3'b010;
		else if (sel[3]) code <= 3'b011;
		else if (sel[4]) code <= 3'b100;
		else if (sel[5]) code <= 3'b101;
		else if (sel[6]) code <= 3'b110;
		else if (sel[7]) code <= 3'b111;
	end

endmodule 

module priority_encoder_stimulus();

wire [2:0]code;
reg [7:0] sel;

integer i; // for the counter to initialize the tests

priority_encoder p1( code, sel );

initial
	begin
		for (i=0;i<=7;i=i+1)
			begin
				#5 sel[i] = 0;
					
		end // for loop end
	end // begin-end

initial
	$monitor ($time, ": sel--%b----->code--%b",sel,code);
endmodule 