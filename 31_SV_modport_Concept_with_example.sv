//////////////////////////////////////////////
  SystemVerilog Modport Concept with Example
/////////////////////////////////////////////
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
