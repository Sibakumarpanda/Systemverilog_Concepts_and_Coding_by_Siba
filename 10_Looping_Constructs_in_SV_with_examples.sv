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

1. while loop:  
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

2. do while loop: 
