///////////////////////////////////////////////////////
  SystemVerilog Clocking Block Concept with Example
//////////////////////////////////////////////////////
- To specify synchronization scheme and timing requirements for an interface, a clocking block is used. 
- The testbench can have multiple clocking blocks but only one clocking block per clock. 
- The clocking block can be declared in the program, module, or interface.
- Syntax:
  clocking <clocking_name> (<clocking event>);
     Default input <delay> output <delay>;
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
- The input or output clocking block signals can be sampled before or after some time unit delay known as clocking skew. It is declared as:
  default input #2 output #3;
  Input clocking skew: #2
  Output clocking skew: #3
-This means input signals is sampled #2 time unit before the clocking event and output signals are driven after #3 time units after the clocking event.
-The input and output skews must be either parameter or constant.
-By default, input and output skews are 0 time units if not specified. 
-It is possible to specify particular time units otherwise by default skews are considered based on the timescale in the current scope.
-Note: In the clocking block, the direction of signals is mentioned w.r.t. testbench (not w.r.t. DUT).  
