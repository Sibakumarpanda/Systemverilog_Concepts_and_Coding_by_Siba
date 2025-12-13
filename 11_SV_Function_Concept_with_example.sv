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

/**********************************************************/
  Example3: Uses of static and automatic function Example
/*********************************************************/ 
module static_automatic_function_example3;
  
  function static increment_static();
    static int count_A;
    automatic int count_B;
    int count_C;
    
    count_A++;
    count_B++;
    count_C++;
    $display("Static: count_A = %0d, count_B = %0d, count_C = %0d", count_A, count_B, count_C);
  endfunction
  
  function automatic increment_automatic();
    static int count_A;
    automatic int count_B;
    int count_C;
    
    count_A++;
    count_B++;
    count_C++;
    $display("Automatic: count_A = %0d, count_B = %0d, count_C = %0d", count_A, count_B, count_C);
  endfunction
  
  function increment();
    static int count_A;
    automatic int count_B;
    int count_C;
    
    count_A++;
    count_B++;
    count_C++;
    $display("Normal: count_A = %0d, count_B = %0d, count_C = %0d", count_A, count_B, count_C);
  endfunction
  
  initial begin
    $display("Calling static functions");
    increment_static();
    increment_static();
    increment_static();
    $display("\nCalling automatic functions");
    increment_automatic();
    increment_automatic();
    increment_automatic();
    $display("\nCalling normal functions: without static/automatic keyword");
    increment();
    increment();
    increment();

    //Accessing variables using function
    // count_A
    $display("\nStatic: count_A = %0d", increment_static.count_A);
    $display("Automatic: count_A = %0d", increment_automatic.count_A);
    $display("Normal: count_A = %0d", increment.count_A);
    
    // count_B: Hierarchical reference to automatic variable is not legal.
    /*
    $display("\nStatic: count_B = %0d", increment_static.count_B);
    $display("Automatic: count_B = %0d", increment_automatic.count_B);
    $display("Normal: count_B = %0d", increment.count_B);
    */
    
    // count_C
    $display("\nStatic: count_C = %0d", increment_static.count_C);
    //$display("Automatic: count_C = %0d", increment_automatic.count_C); // illegal reference to automatic variable
    $display("Normal: count_C = %0d", increment.count_C);
  end
endmodule static_automatic_function_example3

//Log File Output
    
Calling static functions
Static: count_A = 1, count_B = 1, count_C = 1
Static: count_A = 2, count_B = 1, count_C = 2
Static: count_A = 3, count_B = 1, count_C = 3

Calling automatic functions
Automatic: count_A = 1, count_B = 1, count_C = 1
Automatic: count_A = 2, count_B = 1, count_C = 1
Automatic: count_A = 3, count_B = 1, count_C = 1

Calling normal functions: without static/automatic keyword
Normal: count_A = 1, count_B = 1, count_C = 1
Normal: count_A = 2, count_B = 1, count_C = 2
Normal: count_A = 3, count_B = 1, count_C = 3

Static: count_A = 3
Automatic: count_A = 3
Normal: count_A = 3

Static: count_C = 3
Normal: count_C = 3  
    
/////////////////    
  Void Functions:
/////////////////    
- A function that returns no value is called a void function. 
- The ‘void’ keyword is used in a function definition.

/**********************************************************/
  Example4: void function Example
/*********************************************************/   
module void_function_example;
  
  function void compare(input int a, b);
    if(a>b)
      $display("a is greater than b");
    else if(a<b)
      $display("a is less than b");
    else 
      $display("a is equal to b");
  endfunction
  
  initial begin
    compare(10,10);
    compare(5, 9);
    compare(9, 5);
  end
  
endmodule :void_function_example
    
//Log File Output
    
a is equal to b
a is less than b
a is greater than b    
    
////////////////////////////////////////////////////////////////    
  Concept of Pass by Value ,Pass by reference and Pass by Name:
///////////////////////////////////////////////////////////////  
    
Pass by value Functions:
- A pass by value argument passing mechanism does copy arguments locally and operate on those variables.
- Any changes in variables in the function will not be visible outside of the function.
  
/**********************************************************/
  Example5: pass by value function Example5
/*********************************************************/  
module pass_by_value_function_example5;
  int a, b;
  int out;
  
  function int multiply_fnct(int a, b);
    a = a*b; //value of a is updated, it won't update global variables a and b
    return a;
  endfunction
  
  initial begin
    a = 5;
    b = 6;
    out = multiply_fnct(a,b);
    $display("Function: out = %0d for a = %0d and b = %0d", out, a, b);
  end
endmodule :pass_by_value_function_example5

//Log File Output
Function: out = 30 for a = 5 and b = 6   
  
/**********************************************************/
  Example6: Default values in the argument Example6
/*********************************************************/  
 -If no arguments are passed, default values are considered in the function/ task otherwise, default values will be overridden in case of passing any arguments  
   
module default_value_in_args_function_example6;
  int a, b;
  int out;
  
  function int multiply(int a = 5, b = 6);
    a = a*b; //value of a is updated, it won't update global variables a and b
    return a;
  endfunction
  
  initial begin
    out = multiply(); // Note: No arguments are passed
    $display("argument passed: out = %0d, a = %0d and b = %0d", out, a, b); //a and b values will be 0 since their values are not updated
    
    a = 2;
    b = 3;
    out = multiply(a, b);
    $display("No arguments passed: out = %0d for a = %0d and b = %0d", out, a, b);
  end
endmodule :default_value_in_args_function_example6

//Log File Output
argument passed: out = 30, a = 0 and b = 0
No arguments passed: out = 6 for a = 2 and b = 3  

Pass by Reference Functions : 
- A pass by reference argument passing mechanism does not copy arguments locally but reference to the original arguments is passed. 
- This also means that any change in values for the argument inside the subroutine will affect the original values of the variables.
- The ref keyword is used to denote pass by reference arguments.
  
/**********************************************************/
  Example7: pass by reference function Example7
/*********************************************************/  
module pass_by_ref_function_example7;
  int a, b;
  int out;
  
  function automatic int multiply(ref int a, b);
    a = a*b; //value of a is updated, it won't update global variables a and b
    return a;
  endfunction
  
  initial begin
    a = 5;
    b = 6;
    out = multiply(a,b);
    $display("Multiplication: out = %0d, a = %0d and b = %0d", out, a, b); //observe value of a is updated
  end
endmodule  :pass_by_ref_function_example7
  
//Log File Output
Multiplication: out = 30, a = 30 and b = 6
  
/**********************************************************/
  Example8: pass by reference function Example8
            With const ref keyword
/*********************************************************/   
-To ensure that the subroutine should not update any values, the ‘const ref’ keyword is used.  
 module pass_by_ref_with_const_ref_keyword_example;
  int a, b;
  int out;
  
  function automatic int fn_multiply(const ref int a, b);
    a = a*b;          // expects compilation error when subroutine tries to modify argument value.
    return a;
  endfunction

  initial begin
    a = 5;
    b = 6;
    out = fn_multiply(a,b);
    $display("Function: out = %0d, a = %0d and b = %0d", out, a, b);
  end
endmodule :pass_by_ref_with_const_ref_keyword_example
  
//Log File Output
 a = a*b; // expects compilation error when subroutine tries to modify argument value.
    |
*E,CONASN (testbench.sv,9|4): Constant variable cannot be assigned outside of an initialization. 
  
/**********************************************************/
  Example9: pass by reference function Example9
            With static Function
/*********************************************************/
- It is illegal to use pass by reference argument for static functions/tasks. 
  
module pass_by_ref_with_static_function_example;
  int a, b;
  int out;
  
  function int multiply(ref int a, b); // static function
    a = a*b;
    return a;
  endfunction
   
  initial begin
    a = 5;
    b = 6;
    out = multiply(a,b);
    $display("Multiplication: out = %0d, a = %0d and b = %0d", out, a, b);
  end
endmodule :pass_by_ref_with_static_function_example
  
//Log File Output
function int multiply(ref int a, b); // static function
                                |
*E,REFANA (testbench.sv,8|32): reference argument is illegal inside static task-function declaration.
function int multiply(ref int a, b); // static function
                                   |
*E,REFANA (testbench.sv,8|35): reference argument is illegal inside static task-function declaration.
  

Pass by name Function :
-By default, SystemVerilog allows passing values in the same order which is specified in function.
-But, passing a value by name and position allows arguments to be passed by name irrespective of their position mentioned in the function definition.  

/**********************************************************/
  Example10: pass by Name function Example10
            
/*********************************************************/  
module pass_by_name_function_example10;
  int a, b;
  int out;
  
  function void fn_pass(string name, int val);
    $display("Function: Values passed by name: %s, %0d", name, val);
  endfunction

  initial begin
    fn_pass(.val(100), .name("SIBA"));
  end
endmodule :pass_by_name_function_example10

//LOG File Output
Function: Values passed by name: SIBA, 100  
  
