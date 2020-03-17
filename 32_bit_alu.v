//this is a design of a 32 bit ALU having various modules defined and then interconnected

//this is a 32 bit 2-to-1 MUX with a single selecte line
module mux_32_1 ( out,sel,i0,i1 );

output [31:0]out;
input sel;
input [31:0] i0,i1;
	initial
	$display ("sel--%b,a--%d,b--%d",sel,i0,i1);

	assign out = sel ? i0 : i1;

endmodule 


// this is a 32 bit adder with sum as a output nd 2 32-bit inputs
module adder_32 ( sum,i0,i1 );

output [31:0] sum;
input [31:0] i0,i1;

	assign sum = i0 + i1; // arithmetic operation is used simply  

endmodule  

//this is a 32 bit subtractor with diff as an output
module sub_32 ( diff,i0,i1 );

output [31:0] diff;
input [31:0] i0,i1;

	assign diff = i0 - i1;

endmodule 

//this is 16-bit multiplier 
module prod_16 ( prod,i0,i1 );

output [31:0] prod;
input [15:0] i0,i1;

	assign prod = i0 * i1;
endmodule 


//this is a 3-to-1 MUX with inputs as outputs of above three modules

module mux_3_1 ( out,sel,i0,i1,i2 );

output [31:0] out;
input [31:0] i0,i1,i2;
input [1:0] sel;

reg [31:0] out;

always @ (i0 or i1 or i2 or sel)
begin
	case (sel)
		2'b00 : out = i0;
		2'b01 : out = i1;
		2'b10 : out = i2;
		default : out = 32'bx;
	endcase 		
			
end	

endmodule 

module alu ( r,f,a,b );

output [31:0] r;
input [2:0] f;

input [31:0] a,b;

wire [31:0] addmux_out, submux_out;
wire [31:0] addout,subout,mulout;

mux_32_1 muxadd( addmux_out,f[0],b,32'd1 );
mux_32_1 muxsub( submux_out,f[0],b,32'd1 );
adder_32 add32(addout,a,addmux_out );
sub_32 sub32( subout,a,submux_out );
prod_16 prod16( mulout,a[15:0],b[15:0] );
mux_3_1 mux31( r,f[2:1],addout,subout,mulout  );

endmodule 

module alu_stimulus();

wire [31:0] r;

reg [2:0] f;
reg [31:0]a,b;

alu alu1(r,f,a,b);

initial
begin: ALU_STIMULUS
	a = 32'd11; b = 32'd9;

	#2  f[2:0] = 3'b000;//a+1
	#5 f[2:0] = 3'b001;//addition
	#5 f[2:0] = 3'b010;//a-1
	#5 f[2:0] = 3'b011;//a-b
	#5 f[2:0] = 3'b10x;//axb

end

initial
	$monitor ($time, " : f--%b---->output--%d",f,r);
endmodule 