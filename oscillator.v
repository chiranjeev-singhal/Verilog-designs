
//it is simply an oscillator wothout any i/o ports, like a C program without any arguments in brackets

module oscillate_30();

reg oscillator;

initial
	begin
		oscillator = 1'b0;
		forever #30 oscillator = ~ oscillator;
	end

initial
	begin
	$monitor(" output--%b ", oscillator);
	#2000 $stop;
	end
endmodule 