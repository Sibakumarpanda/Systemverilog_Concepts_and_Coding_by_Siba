//////////////////////////////////
   System Verilog interface :
/////////////////////////////////     
- Unlike Verilog that has module ports for communication, System Verilog provides an interface construct that simply contains a bundle of sets of signals. 
- This encapsulates signals and communicates with design, testbench components.

Advantages of SystemVerilog interfaces
In Verilog for the addition of new signals, it has to be manually changed everywhere that module has been instantiated. System Verilog made it easier to add new signals in the interface block for existing connections.
It has increased re-usability across the projects.
A set of signals can be easily shared across the components bypassing its handle.
It provides directional information (modports) and timing information (clocking blocks).
Interfaces can contain parameters, variables, functional coverage, assertions, tasks and functions.
Interfaces can contain procedural initial and always blocks and continuous assign statements.
Syntax:

interface <interface_name>;
  ...
endinterface
