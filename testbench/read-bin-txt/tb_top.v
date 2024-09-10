`timescale 1ns/1ps


   //============== (1) ==================
   //signals declaration
module tb_top ;
    reg          clk;
    reg          rstn ;
    reg [7:0]    din ;
    reg          din_en ;
    wire [7:0]   dout ;
    wire         dout_en ;


    //============== (2) ==================
    //clock generating
    real         CYCLE_200MHz = 5 ; //
    always begin
        clk = 0 ; #(CYCLE_200MHz/2) ;
        clk = 1 ; #(CYCLE_200MHz/2) ;
    end


    //============== (3) ==================
    //reset generating
    initial begin
        rstn         = 1'b0 ;
        #8 rstn      = 1'b1 ;
		#100000  
		 $finish;
    end


    //============== (4) ==================
    //motivation
    integer          file_id ;
	integer          data_id;
    reg [7:0]        data_in_temp ;  //for self check
    reg [63:0]       read_temp ;     //8bit ascii data, 8bit \n
	reg [511:0]      data_axi;
	reg              data_axi_en;
	reg [5:0]        data_cnt;
	wire [63:0]      data_swap;

	integer          i;
	integer          j;
	
	integer          handle;
	integer          scan_file;
    reg              swap_en;	
    initial
        begin            
            $dumpfile("tb_top.vcd");
            $dumpvars(0,tb_top);
        end	
    initial begin
        din_en    = 1'b0 ;        //(4.1)
        din       = 8'b0 ;
		swap_en   = 1'b0;
		read_temp =64'b0;

 
		file_id = $fopen("./tpch_1page.bin", "rb");    //can used with fread, not can used with fscanf 
	//	file_id = $fopen("./tpch_1page.txt", "r");     //can used with fscanf,but miss half of the data because width of reg  
		handle  =$fopen("wtest.bin","wb");
        wait (rstn) ;    //(4.3)
        # CYCLE_200MHz ;

        //read data from file
		
        while (! $feof(file_id) ) begin  //(4.4)
	//	 while (1'b1) begin  //(4.4)
            @(negedge clk) ;
        //   $fread(read_temp, file_id,0);
		      scan_file = $fscanf(file_id, "%h\n", read_temp); 
              din_en = 1'b1 ;
        end

        //stop data
        @(posedge clk) ;  //(4.5)
        #2 din_en = 1'b0 ;
		
    end
	    always@(posedge clk)   //(4.5)
        begin
		swap_en <= din_en;
		end
	
	assign data_swap[7:0] = read_temp[63:56];
	assign data_swap[15:8] = read_temp[55:48];
	assign data_swap[23:16] = read_temp[47:40];
	assign data_swap[31:24] = read_temp[39:32];
	assign data_swap[39:32] = read_temp[31:24];
	assign data_swap[47:40] = read_temp[23:16];
	assign data_swap[55:48] = read_temp[15:8];
	assign data_swap[63:56] = read_temp[7:0];	
	
	
	always@(posedge clk )
    begin
	    if(din_en) begin
		 $fwrite(handle,"%h\n",data_swap); 
		 // $fdisplay(handle,data_swap); 
		end
    end 

endmodule // 
