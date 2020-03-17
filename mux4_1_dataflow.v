module mux4_1_dataflow (out,in,sel);

output out;
input [3:0]in;
input [1:0]sel;

assign out = sel[1] ? (	sel[0]? in[3]:in[2] ):( sel[0] ? in[1]:in[0]);
//also we can use assign out = in[sel]; this will be synthesized as a mux.

endmodule 

