// Jan Marjanovic, 2015
//
// This is a top module which combines DUT and MyHDL signals

module counter_top;

reg clk = 0;
wire [3:0] q;

counter dut (.clk(clk), .q(q));

initial begin
	$from_myhdl(clk);
	$to_myhdl(q);
end

initial begin
    $dumpfile("counter_top.vcd");
    $dumpvars();
end

endmodule
