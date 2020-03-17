//behavioral level
module jk_ff (q,qbar,j,k,rst,clk);

output q,qbar;
input j,k,rst,clk;

// output port data type
reg q, qbar;

always @(posedge clk) 
	begin
	$monitor ($time, ": when rst is =%b and clk is =%b -- j is =%b and k is =%b and q is =%b",rst, clk, j,k,q);
		
	if (rst == 1'b1) begin
		q =  1'b0;
	end	
	
	else
		case({j,k}) 	
			
			2'b00: begin
				q <=  q;
				qbar <=  qbar;
			end
			
			2'b01: begin	
				q <=  0;
				qbar <=  1;
			end
	
			2'b10: begin
				q <=  1;
				qbar <=  0;
			end

			2'b11: begin
				q <=  ~q;
				qbar <=  ~qbar;
			end
			default:
				q = 0;
			
		endcase
	end
	
endmodule

module jk_ff_tb();

wire q,qbar;
reg j,k,rst,clk;


jk_ff bl (.q(q), .qbar(qbar), .clk(clk), .rst(rst), .j(j), .k(k));

initial 
	begin
		
		rst = 1'b1;
		clk = 1'b1;
		{j,k} = 01;
		#5 rst = 0;
		
		//#5 j = 1; k = 0;
		#5 j = 0; k = 0;
		#5 j = 1; k = 0;
		#5 j = 0; k = 0;
		#5 j = 1; k = 1;
		#5 j = 0; k = 0;
	end


always 
	begin
		#2 clk = ~clk;
end


endmodule 