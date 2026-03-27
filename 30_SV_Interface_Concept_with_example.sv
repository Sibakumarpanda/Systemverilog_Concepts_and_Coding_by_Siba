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

/////////////////////////////////////////////////////////////////////////
  Example1: An example without using an interface - Full adder example
/////////////////////////////////////////////////////////////////////////
- To understand how interfaces can be used in the environment, a full adder is constructed using two half adders. 
- In case any new signal has to be added (like enable), it can be easily added to the interface without touching the port list in the module.

//DUT Code
module half_addr(input a, b, output so, co);
  assign so = a^b;
  assign co = a & b;
endmodule :half_addr

module full_adder(input a, b, c, output s_out, c_out);
  wire s0, c0, c1;
  half_addr HA1 (a, b, s0, c0);
  half_addr HA2 (s0, c, s_out, c1);
  
  assign c_out = c0 | c1;
endmodule :full_adder   

//TB Code   
module tb_top;
  reg a, b, c;
  wire s, c_out;
  
  full_adder fa(a, b, c, s, c_out);
  
  initial begin
    $monitor("a=%b b=%b c=%b, sum=%b, carry=%b",a,b,c,s,c_out);
    a = 1; b = 0; c = 0;
    #1;
    a = 1; b = 0; c = 1;
    #1;
    a = 0; b = 1; c = 1;
  end
endmodule  :tb_top

//Logfile Output
a=1 b=0 c=0, sum=1, carry=0
a=1 b=0 c=1, sum=0, carry=1
a=0 b=1 c=1, sum=0, carry=1   
   
