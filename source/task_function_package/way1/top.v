// my_tasks.vh
`include "my_package.vh"

module sub;

   reg [7:0] data;
   reg [7:0] result;
   
   
       initial begin
        data = 8'hA5;
        my_package.my_task(data);  // Using the task
        result = my_package.my_function(data);  // Using the function
        $display("Result: %h", result);
		#200 $finish;
    end
endmodule