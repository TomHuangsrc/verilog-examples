module top_module (
    input wire clk,
    input wire rst,
    output wire out
);
    sub_module1 sub1 (
        .clk(clk),
        .rst(rst),
        .out(out)
    );

    sub_module2 sub2 (
        .clk(clk),
        .rst(rst),
        .out(out)
    );
endmodule