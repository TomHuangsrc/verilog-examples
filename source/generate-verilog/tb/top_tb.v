`timescale 1ns/1ps

module top_tb();

reg clk;
reg rst;
wire [7:0] qout;



initial begin
    clk = 0;
		forever
		#5 clk = ~clk;
end
		
initial begin
			rst = 1;
			#500;	          			
		    rst = 0;
            #50000;
            $finish;
end
initial
        begin            
            $dumpfile("top_tb.vcd");
            $dumpvars(0,top_tb);
        end
top DUT(
.clk(clk),
.rst(rst),
.qout(qout)
);

endmodule
