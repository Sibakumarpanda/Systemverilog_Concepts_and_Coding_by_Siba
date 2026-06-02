//************************************ Clock Divider generation Module Plus Testbench ***************************************************
////////////////////////////////////////////////////////////////////////////////////////////////////////
//(c) Copyright Siba Kumar Panda, All rights reserved
// File    : 1_clock_divider_gen_with_tb.sv 
// Project : 1_clock_divider_gen_with_tb.sv 
// Purpose : Generate f/2 , f/3, f/5 frequency from given frequency f. Also create generalized frequency divider module
// Author  : Siba Kumar Panda
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/*
Lets Say, Given Frequency (f)=100MHz , So Time Period = 1/Tperiod = 1/100MHz = 10ns
f/2=50MHZ
f/3= 33MHZ
f/5=20MHZ
*/
//DUT code :clock_divider_by_2
module clock_divider_by_2 (
    input wire clk_in,      // f MHz input clock
    input wire reset_n,     // Active low reset
    output reg clk_out      // f/2 MHz output clock
);

    always @(posedge clk_in or negedge reset_n) begin
        if (!reset_n)
            clk_out <= 1'b0;
        else
            clk_out <= ~clk_out;    // Simply toggle on each clock edge
    end

endmodule :clock_divider_by_2

//DUT code :clock_divider_by_3
module clock_divider_by_3 (
    input wire clk_in,      // f MHz input clock
    input wire reset_n,     // Active low reset
    output reg clk_out      // f/3 MHz output clock
);

    reg [1:0] counter; // It will count 0,1,2,3

    always @(posedge clk_in or negedge reset_n) begin
        if (!reset_n) begin
            counter <= 2'b00;
            clk_out <= 1'b0;
        end else begin
            counter <= counter + 1;
            if (counter == 2'b10) begin     // When counter reaches 2
                counter <= 2'b00;          // Reset counter
                clk_out <= ~clk_out;       // Toggle output
            end
        end
    end

endmodule :clock_divider_by_3

//DUT code :clock_divider_by_5
module clock_divider_by_5 (
    input wire clk_in,      // f MHz input clock
    input wire reset_n,     // Active low reset
    output reg clk_out      // f/5 MHz output clock
);

    reg [2:0] counter; // It will count 0,1,2,3,4,5,6,7

    always @(posedge clk_in or negedge reset_n) begin
        if (!reset_n) begin
            counter <= 3'b000;
            clk_out <= 1'b0;
        end else begin
            counter <= counter + 1;
            if (counter == 3'b100) begin     // When counter reaches 4
                counter <= 3'b000;          // Reset counter
                clk_out <= ~clk_out;       // Toggle output
            end
        end
    end

endmodule :clock_divider_by_5


//DUT code :generic_clock_divider
module generic_clock_divider #(
    parameter DIVIDE_FACTOR = 5
)(
    input wire clk_in,
    input wire reset_n,
    output reg clk_out
);

    reg [$clog2(DIVIDE_FACTOR)-1:0] counter;

    always @(posedge clk_in or negedge reset_n) begin
        if (!reset_n) begin
            counter <= 0;
            clk_out <= 1'b0;
        end else begin
            if (counter == DIVIDE_FACTOR - 1) begin
                counter <= 0;
                clk_out <= ~clk_out;
            end else begin
                counter <= counter + 1;
            end
        end
    end

endmodule

//Testbench Code
module tb_clock_dividers;

    reg clk_100mhz;
    reg reset_n;
    wire clk_50mhz;     // f/2
    wire clk_33mhz;     // f/3
    wire clk_20mhz;     // f/5

    // Instantiate dividers
    clock_divider_by_2 div2 (
        .clk_in(clk_100mhz),
        .reset_n(reset_n),
        .clk_out(clk_50mhz)
    );

    clock_divider_by_3 div3 (
        .clk_in(clk_100mhz),
        .reset_n(reset_n),
        .clk_out(clk_33mhz)
    );

    clock_divider_by_5 div5 (
        .clk_in(clk_100mhz),
        .reset_n(reset_n),
        .clk_out(clk_20mhz)
    );

    // Generate 100 MHz clock
    initial begin
        clk_100mhz = 0;
        forever #5 clk_100mhz = ~clk_100mhz;  // 10ns period = 100MHz
    end

    // Test sequence
    initial begin
        reset_n = 0;
        #20 reset_n = 1;
        #200;
       $finish();
    end
  
    initial begin
      $dumpfile("clk.vcd");
      $dumpvars();    
      #1000;
      $finish();
  end

endmodule :tb_clock_dividers

