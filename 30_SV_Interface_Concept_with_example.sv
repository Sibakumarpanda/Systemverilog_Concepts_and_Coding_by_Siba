//////////////////////////////////
   System Verilog interface :
/////////////////////////////////     
- Unlike Verilog that has module ports for communication, System Verilog provides an interface construct that simply contains a bundle of sets of signals.
- This encapsulates signals and communicates with design, testbench components.
- Hence , we can say interface is nothing but the bundle of wires with directionless signals in general . But we can include directional informations to it also as per need.
- The directional info can be included with modport and the timing info can be included with clocking blocks .
- The modport and clocking block concept we will study in coming sections.   

///////////////////////////////////////////
  Advantages of SystemVerilog interfaces
///////////////////////////////////////////   
- In Verilog for the addition of new signals, it has to be manually changed everywhere that module has been instantiated. 
- System Verilog made it easier to add new signals in the interface block for existing connections.
- It has increased re-usability across the projects.
- A set of signals can be easily shared across the components bypassing its handle.
- It provides directional information (modports) and timing information (clocking blocks).
- Interfaces can contain parameters, variables, functional coverage, assertions, tasks and functions.
- Interfaces can contain procedural initial and always blocks and continuous assign statements.
- Syntax:
  interface <interface_name>;
    ...
  endinterface
   
/////////////////////////////////////
   Writing a basic Interface
/////////////////////////////////////   
  interface bus (input clk);
      logic [31:0] addr;
      logic [31:0] data;
      logic en;
   endinterface :bus
   
/////////////////////////////////////
   Writing a Parameterized Interface
/////////////////////////////////////  
 interface bus #(parameter WIDTH = 32)(input clk);
    logic [WIDTH-1:0] addr;
    logic [WIDTH-1:0] data;
    logic en;
 endinterface :bus  
