////////////////////////////////////////////////////////////////////
  System Verilog Parameter Concept understanding with Example
///////////////////////////////////////////////////////////////////
- A System parameter is used to pass a constant to the module when it is instantiated. 
- It is not considered under net or reg data types. 
- In run time, the parameter value can not be changed at run time. 
- SystemVerilog allows changing parameter values during compilation time using the ‘defparam’ keyword.
- The parameter value can be updated in two ways
  Pass constant or define based value
  Use the ‘defparam’ keyword
- Syntax:   module <module_name> #(<parameter list>) <port_list>;


////////////////////////////////////////////////////////////////////
  Example1: Parameter basic example
///////////////////////////////////////////////////////////////////
//DUT code
module param_example #(parameter DATA_WIDTH = 8, ID_WIDTH = 32) (data, id);
  input bit [DATA_WIDTH-1: 0] data;
  input bit [ID_WIDTH-1: 0] id;
  
  initial begin
    // Display width values
    $display("DATA_WIDTH = %0d, ID_WIDTH = %0d", DATA_WIDTH, ID_WIDTH);
    
    // Display variables
    $display("data = %0d,  id = %0d", data, id);
    $display("-------------------------------------");
  end
endmodule :param_example

//TB Code
`define D_WIDTH 32
`define I_WIDTH 8
module tb_top;  
  param_example p1(.data(2), .id(1)); // without passing parameter
  param_example #(4, 16) p2(.data(3), .id(2)); // constant parameter passing
  param_example #(`D_WIDTH, `I_WIDTH) p3(.data(6), .id(3));  // macro define based parameter passing
    
  param_example p4(.data(9), .id(4));
  // Change parameter value using defparam
  defparam p4.DATA_WIDTH = 10;
  defparam p4.ID_WIDTH = 16;
  
endmodule :tb_top  

//Logfile output
  
DATA_WIDTH = 8, ID_WIDTH = 32
data = 2,  id = 1
-------------------------------------
DATA_WIDTH = 4, ID_WIDTH = 16
data = 3,  id = 2
-------------------------------------
DATA_WIDTH = 32, ID_WIDTH = 8
data = 6,  id = 3
-------------------------------------
DATA_WIDTH = 10, ID_WIDTH = 16
data = 9,  id = 4
-------------------------------------
           V C S   S i m u l a t i o n   R e p o r t   
