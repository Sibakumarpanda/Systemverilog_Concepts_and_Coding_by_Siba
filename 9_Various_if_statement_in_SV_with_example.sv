Various if statement in SystemVerilog :
  
1. if statement :
  
 -SystemVerilog supports ‘if’, ‘else if’, ‘else’ same as other programming languages. 
 -The ‘If’ statement is a conditional statement based on which decision is made whether to execute lines inside ‘if’ block or not.
 -The begin and are required in case of multiple lines present in ‘if’ block. For single-line inside ‘if’ statement may not require ‘begin..end’
 -The ‘if’ statement returns true if the expression calculates its value as 1 otherwise, for 0, x, z values ‘if’ block will not be executed.
 -Syntax:
        if(<condition>) begin
        ...
        end  
   
2. else if or else statement :
  
-In case, ‘if’ statement does not hold true, ‘else if’ or ‘else’ will be executed. 
-For any condition hold true in ‘else if’ statement, subsequent ‘else if’ or ‘else’ statement will not be checked.
-Syntax: ‘else if’ and ‘else’ condition
        if(<condition>) begin
        ...
        end
        else if(<condition>) begin
        ...
        end 
        else if(<condition>) begin
        ...
        end
        else begin
        ...
        end
-Syntax: if and else condition
        if(<condition>) begin
        ...
        end
        else begin
        ...
        end
/***********************************/
  Example1 : If statement Example
/***********************************/     
module if_example1;  
  initial begin
    int a, b;
    a = 10;
    b = 20;
    if(a>b)
      $display("a is greater than b");
    else if(a<b)
      $display("a is less than b");
    else 
      $display("a is equal to b");
  end
endmodule :if_example1
  
//Log File Output
a is less than b  

3. unique if statement :  
  - SystemVerilog allows us to use a ‘unique’ keyword before ‘if’ statement. 
  - Following error/warnings are expected:
  - None of ‘if’ conditions are true or there is no ‘else’ statement.
  - More than one ‘if’ or ‘else if’ conditions are true.

/**********************************/
    Example2: unique if example
/**********************************/  
module unique_if_example2;  
  initial begin
    int a, b;
    a = 10;
    b = 20;
    unique if(a>b)
      $display("a is greater than b");
    else if(a<b)
      $display("a is less than b");
    else 
      $display("a is equal to b");
  end
endmodule    
  
//Log File Output
  a is less than b  
/*******************************************************************/
  Example3: unique if example (An error/ warning Example)
  (None of if conditions are true or there is no ‘else’ statement)  
/******************************************************************/  
 -In the below example, no ‘if’ or ‘else if’ the condition is true. 
 -Also, ‘else’ condition is not written. Hence, run time error/ warning is expected. 
   
module unique_if_example3;  
  initial begin
    int a, b;
    a = 10;
    b = 20;
    unique if(a>30)
      $display("a is greater than 30");
    else if(b>30)
      $display("b is greater than 30");
  end
endmodule :unique_if_example3
   
//Log File Output
   
Warning-[RT-NCMUIF] No condition matches in statement
  No condition matches in 'unique if' statement. 'else' statement is missing 
  for the last 'else if' block, inside unique_if_example.unnamed$$_0, at time 
  0ns.   
/*******************************************************************/
  Example4: unique if example (An error/ warning Example)
  - In the below example, more that ‘if’ or ‘else if’ condition is 
    true which issues a compilation error/ warning.   
/******************************************************************/
module unique_if_example4;  
  initial begin
    int a, b;
    a = 10;
    b = 20;
    unique if(a>b)
      $display("a is greater than b");
    else if(a<b)
      $display("a is less than b");
    else if(a<50)
      $display("a is less than 50");
    else 
      $display("a is equal to b");
  end
endmodule : unique_if_example4
   
//Log File Output
a is less than b
Warning-[RT-MTOCMUIF] More than one condition match in statement
testbench.sv, 9
  More than one condition matches are found in 'unique if' statement inside 
  unique_if_example4.unnamed$$_0, at time 0ns.  
  Line number 11 and 13 are overlapping.   
