// Jan Marjanovic, 2015
// 
// This is a Verilog module which will be used as DUT in MyHDL-Verilog
// co-simulation example

module counter (
	input clk,
	output [3:0] q	
);

reg [3:0] cntr = 0;
assign q = cntr;

always @ (posedge clk) begin
	$display("from counter module, t=%5d, q=%d", $time, cntr);
	cntr <= cntr + 1;
end

endmodule
