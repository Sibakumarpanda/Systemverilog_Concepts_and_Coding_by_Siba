////////////////////////////////////////////////////////////////////
  System Verilog Program Block Concept Understanding with example
///////////////////////////////////////////////////////////////////
Program Block :
- In Verilog, a module is a basic building block that contains wires, tasks, function declaration, continuous and procedural statements and hierarchies of other modules.
- The module construct behaves perfectly w.r.t. design implementation.
- While developing a testbench an engineer has to take care to avoid a race condition between design and testbench. 
- The program block is sensitive to the design signals changes that are declared in the module block are scheduled in the reactive region of the time slot.
- Syntax:
  program <program_name> <port_list>;
    ...
  endprogram
  
////////////////////////////////////  
  Program block purpose:
///////////////////////////////////  
- All elements within the program block are scheduled to execute in the reactive region. 
- This helps to avoid race-around conditions between Design (DUT) and Testbench (TB).
- It provides an execution entry point for the testbench.
- It encapsulates testbench Data in a single container. 

//////////////////////////////////////////////////////////  
   Similarities between Program and module block
//////////////////////////////////////////////////////////     
- A program block can instantiate another program block in the way how the module is instantiated another module block.
- Both can have no or more inputs, inout, and output ports.
- Both can have tasks, functions, variable declaration.
- Both can have continuous assignments, initial blocks, concurrent assertions, generate blocks, etc.

////////////////////////////////////////////////////////  
   Difference between program and module block
///////////////////////////////////////////////////////     
- A program block can not instantiate a module block. On the opposite side, a module block can instantiate another module or program block.
- A program block can not have an interface, user-defined primitives (UDP), always block or nested program.
- The initial block inside the program block is scheduled in the reactive region whereas the initial blocks inside the module lock are scheduled in the active region. 

/////////////////////////////////////////////////////////////////////////////////////////////////////////////
  Important Question (Tricky)- Generate a clock with 100MHZ frequency using module block and Program block
///////////////////////////////////////////////////////////////////////////////////////////////////////////// 
//Example1: Using Module block
// Simple clock module
module clock_gen (
    output reg clk
);
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  // 5ns half period = 10ns full period = 100MHz
    end
endmodule :clock_gen

// Testbench
module tb_top;
    wire clk;
    
    clock_gen u_clk (.clk(clk));
    
    initial begin
        $monitor("Time=%0t, Clock=%b", $time, clk);
        #1000 $finish;
    end
  
    initial begin
        $dumpfile("advanced_dump.vcd");
        $dumpvars(0, tb_top);
    end
endmodule :tb_top   

//Example2: Using program block 
// Simple program block
program clock_prog;
    logic clk;
    
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    
   initial begin
        $monitor("Time=%0t, Clock=%b", $time, clk);
        #1000 $finish;
   end
  
   initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, tb_top);
    end 
    
endprogram :clock_prog

// Top module
module tb_top;  
    clock_prog clk_prog();      
endmodule :tb_top

//////////////////////////////////////////////////////////    
   How program block avoid race around condition ???
//////////////////////////////////////////////////////////     
- To understand it clearly, below two points need to be cleared.
- As per System Verilog scheduling semantic, System Verilog events are scheduled in the following order.
  Active region → Non-blocking region → Reactive region. 
- The non-blocking assignments (RHS) are evaluated in the active region and updates their LHS in the NBA region (Non-blocking region).
- When the design module assigns some value to a variable in the initial block and the testbench module tries to access the same variable (in the initial block) and perform some action, 
  Then race around condition is expected to occur.   

/////////////////////////////////////////////////////////////////
  Example3: Race Around Condition Situation Example
////////////////////////////////////////////////////////////////

    
    
    
  
