`timescale 1ns/1ps

module top(
input  wire clk,
input  wire rst,
output [7:0] qout);

parameter  sel = 2;

/* generate
if(sel ==2) begin : add
counter1 counter_inst(
.clk(clk),
.rst(rst),
.qout(qout)
);
end
else begin:sub
counter2 counter_inst(
.clk(clk),
.rst(rst),
.qout(qout)
);
end
endgenerate */

generate
  case(sel)
   2: begin:add   // show add to add name to one case selection
   counter1 counter_inst(
     .clk(clk),
     .rst(rst),
     .qout(qout)
      );
	end
	default: begin:sub
	 counter2 counter_inst(
     .clk(clk),
     .rst(rst),
     .qout(qout)
     );
	 end
	endcase
endgenerate

//the example of inital mul same module in verilog
/* module top_module( 
    input [99:0] a, b,
    input cin,
    output [99:0] cout,
    output [99:0] sum );
	
    //先例化第一个，因为第一个cin的接口不同，所以需要单独的例化
//关于instaance1和generate内部的名字是不冲突的，generate对模块进行模块例化是不会复制成相同的例化模块名。
    add1 instance1(.a(a[0]),.b(b[0]),.cin(cin), .cout(cout[0]), .sum(sum[0]));
    
    genvar i;
    generate  
        for(i=1;i<100;i=i+1) begin  :  add1   //一定要加上你复制的块的名字 @@@@@@@@@@@@@%%%%%%%%%%%
            add1 instance1(.a(a[i]),.b(b[i]),.cin(cout[i-1]), .cout(cout[i]), .sum(sum[i]));
   		end
    endgenerate
endmodule
 
//二进制加法器
module add1(
    input  a,
    input  b,
    input  cin,
    
    output  cout,
    output  sum);
    
    reg [1:0] tmp;
    
    always @(*) begin
       tmp  = a + b + cin;
       cout = tmp[1];
       sum  = tmp[0]; 
    end   
endmodule */
endmodule	
