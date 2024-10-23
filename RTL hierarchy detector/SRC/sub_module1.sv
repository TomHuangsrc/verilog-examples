module sub_module1 (
    input wire clk,
    input wire rst,
    output wire out
);
        sub_module3 sub3 (
        .clk(clk),
        .rst(rst),
        .out(out)
    );
	
	
	// Some logic here
endmodule