
module top;
    reg [7:0] data;
    reg [7:0] result;
	
task my_task;
    input [7:0] data;
    begin
        // Task implementation
        $display("Data received: %h", data);
    end
endtask

function [7:0] my_function;
    input [7:0] in_data;
    begin
        // Function implementation
        my_function = in_data + 1;
    end
endfunction

    initial begin
        data = 8'hA5;
        my_task(data);  // Using the task
        result = my_function(data);  // Using the function
        $display("Result: %h", result);
		#200 $finish;
    end
endmodule