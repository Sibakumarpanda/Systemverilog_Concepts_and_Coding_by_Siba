Looping Constructs in SV:
 -A loop is an essential concept of any programming language. 
 -The loop is useful to read/ update an array content, execute a few statements multiple times based on a certain condition. 
 -In SystemVerilog, basically we will be having below loops 
   while loop
   do while loop
   forever loop
   for loop
   foreach loop
   repeat loop
   break , continue  
-In all supported loops, begin and end keywords are used to enclose multiple statements as a single block. 
-A begin and end keywords are optional if the loop encloses a single statement.

/////////////////////////////////////////////////////////////////
                       1. while loop:  
///////////////////////////////////////////////////////////////// 
-A while loop is a control flow statement that executes statements repeatedly if the condition holds true else loop terminates.
-Syntax:
     while(<condition>) begin
     ...
     end
/******************************/
 Example1 : Using while loop
/******************************/
module while_loop_example1;  
  int count;
  initial begin
    while(count<10) begin 
      $display("Value of count = %0d", count);
      count++;
    end
  end
endmodule  :while_loop_example1

//Log File Output
Value of count = 0
Value of count = 1
Value of count = 2
Value of count = 3
Value of count = 4
Value of count = 5
Value of count = 6
Value of count = 7
Value of count = 8
Value of count = 9

/////////////////////////////////////////////////////////////////
                       1. do while loop:  
/////////////////////////////////////////////////////////////////  
- A do while loop is a control flow statement that executes statements at least once and then the condition is checked. 
- If the condition holds true, statements execute repeatedly else the loop terminates.
- Syntax:  
           do begin
           ...
           end
           while(<condition>);
/******************************/
 Example2 : Using do while loop
/******************************/
module do_while_example2;  
  int count;
  initial begin
    do begin 
      $display("Value of count = %0d", count);
      count++;
    end
    while(count<10);
  end
endmodule :do_while_example2

//Log File Output
Value of count = 0
Value of count = 1
Value of count = 2
Value of count = 3
Value of count = 4
Value of count = 5
Value of count = 6
Value of count = 7
Value of count = 8
Value of count = 9

Understanding Difference between while and do while loop:

- In the while loop, a condition is checked first, and if it holds true, then statements will be executed else the loop terminates.
- But ,in do while loop, even if a condition is not true, a loop can execute at once. 
 
/**********************************/
 Example3 : Using do while loop
 (when a condition is not true)
/*********************************/
module do_while_example3;  
  int count = 2;
  initial begin
    do begin 
      $display("Value of count = %0d", count);
      count++;
    end
    while(count<1);
  end
endmodule :do_while_example3

//Log File Output
Value of count = 2

/////////////////////////////////////////////////////////////////
                       3. forever loop:  
///////////////////////////////////////////////////////////////// 
- As the name suggests, a forever loop runs indefinitely.
- To terminate the loop, a break statement can be used.
- Syntax:
        forever begin
        ...
        end                        
/***************************************************/
 Example5 : Using forever loop
 To terminate the loop, $finish system call is used.
/**************************************************/
module forever_with_finish_example5;  
  int count;
  initial begin
    forever begin 
      $display("Value of count = %0d", count);
      count++;
      #5;
    end
  end
  
  initial begin
    #30;
    $finish;
  end
endmodule :forever_with_finish_example5

//Log File Output
Value of count = 0
Value of count = 1
Value of count = 2
Value of count = 3
Value of count = 4
Value of count = 5
$finish called from file "testbench.sv", line 16.
$finish at simulation time 30

/***************************************************/
 Example6 : Using forever loop with a break statement
 To terminate the loop, $finish system call is used.
/**************************************************/
-The break statement is used in the below example to terminate the loop based on the condition. 
-The break statement will be discussed under the break and continue section.
module forever_with_break_stmt_example6;  
  int count;
  initial begin
    forever begin 
      $display("Value of count = %0d", count);
      count++;
      if(count == 10) break;
    end
  end
endmodule :forever_with_break_stmt_example6

//Log file Output
Value of count = 0
Value of count = 1
Value of count = 2
Value of count = 3
Value of count = 4
Value of count = 5
Value of count = 6
Value of count = 7
Value of count = 8
Value of count = 9

Difference between always block and forever block :
 
