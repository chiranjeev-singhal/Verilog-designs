/* Here we are designing the MCM6264C SRAM with 8k x 8. 
The RAM has 13 address lines so as to address 8k locations (8192) and each clocation can store a data of 8 bits. 
It is an aysnchronous type RAM, i.e. no clock is required to perofm the read/write operations.
Their are chip enable signals (~E1/E2) and write enable (~W) and output enable (~G)
*/
module MCM6264C ( dataout,datain,address,e1,e2,w,g);

parameter memory_size = 8192;
parameter address_bars = 13;
parameter word_size = 8;

output reg[word_size - 1:0] dataout;		//there are 8-bit data input and output line as wire, we will need a register to drive it
input [word_size - 1:0] datain;
input [address_bars - 1:0] address;		//there are 13 address line--> ponitnig to 8192 memory locations
input e1,e2,w,g;

reg [word_size -1 :0] mem[memory_size-1:0];	//memory as a 2D array declared

always @ (w)
	if ((e1==0 && e2==1) && (g==1) && (w==0)) mem[address] = datain;

always @ (g) 
	if ((e1==0 & e2==1) && (g==0) && (w==1)) dataout = mem[address];

endmodule 
/*
module MCM6264C_test();

wire [7:0]dataout;
reg e1,e2,w,g;
reg [7:0]datain;
reg [12:0]address;

integer i;

MCM6264C SRAM( dataout,datain,address,e1,e2,w,g);

initial
begin
	datain = 8'bz; e1 = 1'bz; e2 = 1'bz; w=1'bz; g=1'bz;address=13'bz;

	for (i=0;i<=100;i=i+1)begin
		#10 datain = i; e1 = 0; e2 = 1; w=0; g=1;address=100+i;
		#5  w = 1; g=0;
		//#5 w = 1; g= 0;
		end
	
end
initial
	$monitor ($time, " %d written in %d-----> %d has data %d",datain,address,address,dataout);
endmodule */

