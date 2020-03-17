module nasa_rover_stata ( state,in,reset,clk );

output [2:0] state;
input in,reset,clk;

reg [2:0]state, next;

parameter killian = 3'b000;
parameter kresge = 3'b001;
parameter zcenter = 3'b010;
parameter sydpac = 3'b011;
parameter studentcenter = 3'b100;
parameter building34 = 3'b101;
parameter lab_6 = 3'b110;
parameter statacenter = 3'b111;

always @ (posedge clk or negedge reset)
if (!reset)
	state <= killian;
else
	state <= next; 

always @ ( state or in	)begin : state_transitions
	
 case (state)
	killian : if (in) next = kresge;
		  	else next = killian;

	kresge : if (in) next = studentcenter;
			else next = zcenter;

	zcenter : if (in) next = studentcenter;
		 	else next = sydpac;

	sydpac : if (in) next = killian;
	 		else next = sydpac;

	studentcenter : if (in) next = building34;
				else next = statacenter;

	building34 : if (in) next = lab_6;
				else next = sydpac;

	lab_6 : if (in) next = lab_6;
			else next = statacenter;

	statacenter : if (in) next = building34;
			else next = kresge; 	
	default : next = killian;
 endcase
end

endmodule 


module nasa_rover_stimulus ();

wire [2:0] state;
reg in, clk, reset;

nasa_rover_stata nasa1( state,in,reset,clk );

initial
begin : reseting
	clk = 0;
	reset = 1;
	#2 reset = 0;
	#2 reset = 1;
end

initial
begin : inputs
	#5 in =0;
	#10 in = 1;
	#10 in =0;
	#10 in =1;
	repeat (10) #10 in = in +1;
end
always 
	#5 clk = ~clk;

initial
	$monitor ("input--%b---->current_location--%d",in,state);

endmodule 