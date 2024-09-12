module top (
    input wire clk,          
    input wire rst,         
    input wire [511:0] din,  
    input wire [7:0] seed_in, 
    output reg [31:0] dout   
);
//solution1
    // 使用generate语句动态生成位切片操作
/*     generate
        genvar i;
        for (i = 0; i < 481; i = i + 1) begin : slice_gen    //i+31<=511, the max value of i should be 480
            always @(posedge clk or posedge rst) begin
                if (rst) begin
                    dout <= 32'd0;  // 复位时将输出置为0
                end else if (seed_in == i) begin
                    dout <= din[i + 31:i];
                end
            end
        end
    endgenerate */
//solution2
integer     i;
always@(seed_in)
begin
    i=  seed_in;
end
always @(posedge clk or posedge rst) begin
          if (rst) begin
                    dout <= 32'd0;  // 复位时将输出置为0
          end 
		  else begin
                    //dout <= din[i + 31:i];   //not support by vivado or iverilog
					dout <= din[i +: 32];   //this type can be accecpt, even as dout <= din[i*8 +: 32]; 
          end
end
//solution1 and solution2 work out the same output
endmodule