`timescale 1ns/1ps

module counter1(
input  wire clk,
input  wire rst,
output [7:0] qout);

reg [7:0] q_temp;

always@(posedge clk or posedge rst)
begin
if(rst) begin
     q_temp <= 8'b0;
end
else if (q_temp==8'hff) begin
     q_temp <=8'b0;
end
else begin
     q_temp <=q_temp +1'b1;
end
end
assign qout=q_temp;

endmodule
