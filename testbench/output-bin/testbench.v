module testbench;
    reg [31:0] reg_value;
    reg clk;
	reg en;
    integer file;

    // 时钟生成
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 每5个时间单位翻转一次时钟
    end
    initial
        begin            
            $dumpfile("testbench.vcd");
            $dumpvars(0,testbench);
        end	
    // 初始化寄存器值并随时间变化
    initial begin
        reg_value = 32'h00000000;
		en        = 0;
	@(posedge clk)
        #10;
     		reg_value = 32'h01234567;
		    en        = 1;
        #10;
    		reg_value = 32'h89abcdef;
		#10;
    		reg_value = 32'h23456789;
		#10;
    		reg_value = 32'habcdef01;
		#10;en        = 0;
        #4000;
     		$finish; // 结束仿真
    end

    // 在每个时钟周期结束时捕获寄存器的值并写入文件
    initial begin
        file = $fopen("output.bin", "wb");
    end
     
     always@(negedge clk) // 等待时钟上升沿
	 begin
	       if(en) begin
            $fwrite(file, "%c", reg_value[31:24]);  // 写入低8位
			$fwrite(file, "%c", reg_value[23:16]);  // 写入低8位
			$fwrite(file, "%c", reg_value[15:8]);  // 写入低8位
            $fwrite(file, "%c", reg_value[7:0]); // 写入高8位
		   end
     end
    // 在仿真结束时关闭文件
    initial begin
        #800 $fclose(file);
    end
endmodule