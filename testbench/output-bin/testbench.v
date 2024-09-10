module testbench;
    reg [15:0] reg_value;
    integer file;

    initial begin
        // 初始化寄存器值为 16'h0a0a
        reg_value = 16'h0a0a;

        // 打开文件以写入二进制数据
        file = $fopen("output.bin", "wb");

        // 将寄存器的值写入文件
        $fwrite(file, "%c", reg_value[7:0]);  // 写入低8位
        $fwrite(file, "%c", reg_value[15:8]); // 写入高8位

        // 关闭文件
        $fclose(file);

        // 结束仿真
        $finish;
    end
endmodule