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
