//4-bit-serial-in to parallel -out register practice using D-FF

module df_f(q,d,clk,clr);

output q;
input clk,clr;
input d;

reg q;

always @(posedge clk)
		begin
			if (clr)
				q <= 0;
			else
				q <= d; 
		end 
endmodule

module serial_reg(Q,din,clock,clear);

output [3:0]Q;
input din, clock, clear;

//reg [3:0]Q;

df_f ffa(Q[0],din,clock,clear);
df_f ffb(Q[1],Q[0],clock,clear);
df_f ffc(Q[2],Q[1],clock,clear);
df_f ffd(Q[3],Q[2],clock,clear);


endmodule 

module serial_reg_tb();

wire [3:0]Q;
reg din,clock,clear;

serial_reg s1(Q,din,clock,clear);

initial
	begin
		clock = 1;
		clear = 1;
		din = 0;
		
		#5 clear = 0;
		#5 din = 1;
		#5 din = 0;
		#7 din = 0;
		#9 din = 1'bz;
		#30 $stop;
	end
always
	#5 clock = ~clock;
initial
	$monitor($time, ": clock--%b clear--%b din--%b Q--%b",clock,clear,din,Q);
	

endmodule 

 