///////////////////////////////////////////////////////
  SystemVerilog Clocking Block Concept with Example
//////////////////////////////////////////////////////
- To specify synchronization scheme and timing requirements for an interface, a clocking block is used. 
- The testbench can have multiple clocking blocks but only one clocking block per clock. 
- The clocking block can be declared in the program, module, or interface.
- Syntax:
  clocking <clocking_name> (<clocking event>);
     default input <delay> output <delay>;
     <signals>
  endclocking
                            
//////////////////////////////////                            
  Advantages of clocking block
/////////////////////////////////
- It provides a group of signals that are synchronous with a particular clock in DUT and testbench
- Provides a facility to specify timing requirements between clock and signals.

///////////////////////  
  Clocking event
///////////////////////  
- To synchronize the clocking block, a clocking event is used. 
- The clocking event governs the timing of all signals mentioned in that clocking block. 
- All input or inout signals are sampled on the occurrence corresponding clock event. 
- Similarly, output or inout are also driven by the occurrence of the corresponding clock event.
- Example:  @(posedge clk) or @(negedge clk)

///////////////////  
  Clocking Skew
///////////////////  
- The input or output clocking block signals can be sampled before or after some time unit delay known as clocking skew. 
- It is declared as: default input #2 output #3;
- Here Input clocking skew: #2
- Output clocking skew: #3
-This means input signals is sampled #2 time unit before the clocking event and output signals are driven after #3 time units after the clocking event.
-The input and output skews must be either parameter or constant.
-By default, input and output skews are 0 time units if not specified. 
-It is possible to specify particular time units otherwise by default skews are considered based on the timescale in the current scope.
-Note: In the clocking block, the direction of signals is mentioned w.r.t. testbench (not w.r.t. DUT).  

/////////////////////////////////////////////////////////  
  Various Legal ways of clocking block declaration
//////////////////////////////////////////////////////////  
 //1st way
clocking cb @(negedge clk);
 default input #2 output #3;
  input ...
  output ...
endclocking

//2nd Way
clocking cb @(clk); // clocking event without edge
 default input #2 output negedge;  //outputs are driven on negedge clk
  input ...
  output ...
endclocking

//3rd Way
clocking cb @(posedge clk);
 default input #1 output negedge;  //outputs are driven on negedge clk
  input ...
  output ...
endclocking

//4th Way
clocking cb @(posedge clk);
 default input #1ps output #4; // explicit declaration of time unit
  input ...
  output ...
endclocking

//5th Way
clocking cb @(posedge clk);
 default input #1ps output #4; // explicit declaration of time unit
  input #2ps <signal_name>;
  input #3 output #4 <signal_name>;
endclocking
 
////////////////////////////////////////////
    An Example with Clocking Block
////////////////////////////////////////////    
//DUT Code
module multiplier(mult_if.RTL inf); 
  always@(posedge inf.clk or posedge inf.reset) begin 
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
endmodule :multiplier

//TB Code
interface mult_if (input logic clk, reset);
  logic [7:0] a, b;
  logic [15:0] out;
  logic en;
  logic ack;
  
  clocking cb @(posedge clk);
    default input #1 output #2;
    input out, ack;
    output a,b, en;
  endclocking
  
  modport TB (clocking cb, input clk, reset);
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
  
  mult_if inf(clk, reset);
  multiplier DUT(inf);
  
  `define TB_IF inf.TB.cb
   
  initial begin
    #5;
    `TB_IF.a <= 'd5; `TB_IF.b <= 'd6;    
    `TB_IF.en <= 1;
    #10 `TB_IF.en <= 0;
    wait(`TB_IF.ack);
    $display("time = %0t: a=%d b=%d, out=%d", $time, inf.a,inf.b,inf.out);
    
    #25;
    `TB_IF.a <= 'd20; `TB_IF.b <= 'd7;
    #5ns `TB_IF.en <= 1;
    #6 `TB_IF.en <= 0;
    wait(`TB_IF.ack);
    $display("time = %0t: a=%d b=%d, out=%d", $time, inf.a,inf.b,inf.out);
    
    #25;
    `TB_IF.a <= 'd10; `TB_IF.b <= 'd4;
    #6ns `TB_IF.en <= 1;
    #5 `TB_IF.en <= 0;
    wait(`TB_IF.ack);
    $display("time = %0t: a=%d b=%d, out=%d", $time, inf.a,inf.b,inf.out);

    #10;
    $finish;
  end
endmodule :tb_top
    
//Logfile Output
time = 15: a=  5 b=  6, out=   30
time = 54: a= 20 b=  7, out=  140
time = 94: a= 10 b=  4, out=   40    
    
    
