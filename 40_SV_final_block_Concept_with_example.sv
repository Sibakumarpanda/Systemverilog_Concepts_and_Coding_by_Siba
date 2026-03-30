///////////////////////////////////////////////////////////////////
  System Verilog final block concept understanding with example
//////////////////////////////////////////////////////////////////
- The initial block occurs at the start of simulation whereas the final block occurs at end of the simulation without having any delays. 
- So, it is the same as a function call that can execute in zero simulation time.
- The main usage of the final block is to display statistical information about the simulation
- Syntax:   final begin
             ...
            end

////////////////////////////////////////////////////////
  Example1: Basic example with final block
////////////////////////////////////////////////////////
//Example1: SV final block - basic example
module final_block_usage_example1;
  initial begin
    $display("Inside initial block Executed at %0dns", $time);
    #10;
    $display("Before calling $finish Executed at %0dns", $time);
    $finish;
  end
  
  final begin
    $display("Inside final block Executed at %0dns", $time);
  end
endmodule :final_block_usage_example1

//Logfile Output
Inside initial block Executed at 0ns
Before calling $finish Executed at 10ns
$finish called from file "testbench.sv", line 8.
Inside final block Executed at 10ns
$finish at simulation time                   10
           V C S   S i m u l a t i o n   R e p o r t 
