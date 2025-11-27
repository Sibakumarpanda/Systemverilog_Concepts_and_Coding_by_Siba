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
  
/**********************************************************/
  Example1: A Basic Example with arguments and directions
/*********************************************************/
module basic_function_example1;
  
  function compare(input int a, b);
    if(a>b)
      $display("a is greater than b");
    else if(a<b)
      $display("a is less than b");
    else 
      $display("a is equal to b");
    return 1; // Not mandatory to write
  endfunction
  
  initial begin
    compare(10,10);
    compare(5, 9);
    compare(9, 5);
  end
endmodule :basic_function_example1
  
//Log File Output
a is equal to b
a is less than b
a is greater than b 
  
/**********************************************************/
  Example2: Premature Function Return Example
/*********************************************************/  
