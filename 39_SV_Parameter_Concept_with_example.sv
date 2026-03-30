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
