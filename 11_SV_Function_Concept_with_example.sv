SystemVerilog function Concept:
  
- A function that does not consume simulation time (so delays are not allowed inside Function), returns a single value or an expression, and may or may not take arguments.
- Function types :
  Automatic functions
  Static functions
- Syntax :  
// Style 1
function <return_type> <function_name> (<port_list>);
 ...
 return <value or expression>
endfunction

// Style 2
function <return_type> <function_name> ();
  input <port_list>;
  inout <port_list>;
  output <port_list>;
  ...
  return <value or expression>
endfunction
  
