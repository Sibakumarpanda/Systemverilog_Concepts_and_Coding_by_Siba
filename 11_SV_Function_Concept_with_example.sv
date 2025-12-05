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
module premature_function_example2;
  
  function bit [1:0] compare(input int a, b);
    if(a>b) begin 
      return 2'h1;
      $display("a > b comparison completed");
    end
    
    if(a<b) begin
      return 2'h2;
      $display("a < b comparison completed");
    end
    
    if(a == b) begin 
      return 2'h3; 
      $display("a == b comparison completed");
    end
  endfunction
  
  initial begin
    bit [1:0] done;
    int a, b;
    
    repeat(5) begin
      a = $urandom_range(5, 20);
      b = $urandom_range(5, 20);
      $display("input a = %0d, input b = %0d", a, b);
      done = compare(a,b);
      if(done == 2'h1) $display("a is greater than b");
      if(done == 2'h2) $display("a is less than b");
      if(done == 2'h3) $display("a is equal to b");
      $display("------------------------");
    end
  end
endmodule :premature_function_example2
  
//Log File Output
input a = 10, input b = 17
a is less than b
------------------------
input a = 20, input b = 11
a is greater than b
------------------------
input a = 6, input b = 20
a is less than b
------------------------
input a = 7, input b = 15
a is less than b
------------------------
input a = 15, input b = 14
a is greater than b
------------------------  
  
/////////////////////////////////////////////////  
Concept of Static and Automatic Functions :
////////////////////////////////////////////////  
- By default, functions declared are static except they are declared inside a class scope. 
- If the function is declared within class scope, they behave as an automatic function by default unless they are specifically mentioned as static functions.
- We will discuss more on this concept in class (OOP) concepts.
- All variables declared in a static function are static variables unless they are specifically mentioned as an automatic variable.
- All variables declared in an automatic function are automatic variables unless they are specifically mentioned as a static variable.
- To understand the scope of variables in functions, static and automatic variables are declared in each static, automatic and normal function.

  
