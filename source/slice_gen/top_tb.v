module top_tb;
    reg clk;
	reg rst;
	reg [511:0] din;
	reg [7:0] seed_in;
	wire [31:0]     dout;

    // 时钟生成
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 每5个时间单位翻转一次时钟
    end
	
	    initial begin
        rst = 1;
        #20;
		rst=0;
    end
	
    initial
        begin            
            $dumpfile("top_tb.vcd");
            $dumpvars(0,top_tb);
        end	
    // 初始化寄存器值并随时间变化
    initial begin
        din = 512'h0001020304050607_1011121314151617_2021222324252627_3031323334353637_4041424344454647_5051525354555657_6061626364656667_7071727374757677;
		seed_in        = 8'h0;
	@(posedge clk)
        #40;
     		seed_in = 8'h1;
        #10;
    		seed_in = 8'h2;
		#10;
    		seed_in = 8'h3;
		#10;
    		seed_in = 8'h4;
        #4000;
     		$finish; // 结束仿真
    end

top DUT(
    .clk(clk),          // 时钟信号
    .rst(rst),          // 复位信号
    .din(din),  // 512位宽的输入数据
    .seed_in(seed_in), // 外部输入的8位数据
    .dout(dout)   // 32位宽的输出数据
);
endmodule