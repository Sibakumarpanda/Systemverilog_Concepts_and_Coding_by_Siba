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
