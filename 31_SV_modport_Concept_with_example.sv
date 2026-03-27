/////////////////////////////////////////////////
  SystemVerilog Modport Concept with Example
////////////////////////////////////////////////
- Within an interface to declare port directions for signals modport is used. 
- The modport also put some restrictions on interface access.
- Syntax: modport <name> ( input <port_list>, output <port_list>);

 ///////////////////////////// 
   Advantage of modport:
 //////////////////////////// 
- Modport put access restriction by specifying port directions that avoid driving of the same signal by design and testbench.
- Directions can also be specified inside the module.
- Modport provide input, inout, output, and ref as port directions.
- Multiple modports can be declared for different directions for monitor and driver.
- Examples:
  modport TB (output a,b, en, input out, ack);
  modport RTL (input clk, reset, a,b, en, output out, ack);

//////////////////////////////////////////////
   An Example by using modport 
/////////////////////////////////////////////  
//DUT Code
module multiplier(mult_if inf);
  always @(posedge inf.clk or posedge inf.reset) begin 
    if(inf.reset) begin 
      inf.out <= 0;
      inf.ack <= 0;
    end
    else if(inf.en) begin
      inf.out <= inf.a * inf.b;
      inf.ack <= 1;
    end
    else inf.ack <= 0;
  end
endmodule  :multiplier
  
//TB Code
interface mult_if (input logic clk, reset);
  logic [7:0] a, b;
  logic [15:0] out;
  logic en;
  logic ack;
  
  modport TB (output a,b, en, input out, ack);
  modport RTL (input clk, reset, a,b, en, output out, ack);
  
endinterface :mult_if

module tb_top;
  bit clk;
  bit reset;
  
  always #2 clk = ~clk;
  
  initial begin
    clk = 0;
    reset = 1;
    #2;
    reset = 0;
  end 
  
  mult_if    inf(clk, reset);
  multiplier DUT(inf);
   
  initial begin
    #5;
    inf.TB.a = 'd5; 
    inf.TB.b = 'd6;
    inf.TB.en = 1;
    #10 inf.TB.en = 0;
    wait(inf.TB.ack);
    $display("time = %0t: a=%d b=%d, out=%d", $time, inf.TB.a,inf.TB.b,inf.TB.out);
    
    #25;
    inf.TB.a = 'd20; 
    inf.TB.b = 'd7;
    #5ns inf.TB.en = 1;
    #6 inf.TB.en = 0;
    wait(inf.TB.ack);
    $display("time = %0t: a=%d b=%d, out=%d", $time, inf.TB.a,inf.TB.b,inf.TB.out);
    
    #25;
    inf.TB.a = 'd10; 
    inf.TB.b = 'd4;
    #6ns inf.TB.en = 1;
    #5 inf.TB.en = 0;
    wait(inf.TB.ack);
    $display("time = %0t: a=%d b=%d, out=%d", $time, inf.TB.a,inf.TB.b,inf.TB.out);
    #10;
    $finish;
  end
  initial begin 
    $dumpfile("dump.vcd"); 
    $dumpvars;
  end
endmodule  :tb_top

//Logfile Output
time = 15: a=  5 b=  6, out=   30
time = 51: a= 20 b=  7, out=  140
time = 87: a= 10 b=  4, out=   40  
