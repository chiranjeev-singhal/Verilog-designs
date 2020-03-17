module block_non_block ();
reg a,b,c,d,e;

initial begin
#10 a = 0;
#11 a = 1;
#12 a = 0;
#13 a = 1;
end
initial
begin
#10 b <= 0;
#11 b <= 1;
#12 b <= 0;
#13 b <= 1;


end
initial
begin

c = #10 0; 
c = #11 1;
c = #12 0; 
c = #13 1;


end

initial

begin

d <= #10 0;
d <= #11 1;
d <= #12 0;
d <= #13 1;

end

initial
begin

e <= 0;
e <= 1;
e <= 0;
e <= 1;
end
initial
$monitor ($time, ":a--%b, b--%b, c--%b, d--%b, e--%b",a,b,c,d,e);
endmodule 

 