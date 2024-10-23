module sub_module3 (
    input wire clk,
    input wire rst,
    output wire out
);
        sub_module4 sub4 (
        .clk(clk),
        .rst(rst),
        .out(out)
    );
	
	
	// Some logic here
endmodule