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
                       2. do while loop:  
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
 
- Both always and forever block the same effect. 
- The always block is a procedural block and it can not be placed inside other procedural blocks. 
- Also, always block can not be used inside the class, where as we can use forever inside class
- always block is synthesizable  , we are using in RTL/design code. where as forever is Non synthesizable
- Syntax for always block:
   // For multiple statements in always block
   always begin
   ...
   end

   // For single statement
   always <single statement> 
    
/***************************************************/
 Example7 : Example using always block
/**************************************************/
module always_block_example7;  
  int count;
  always begin
    $display("Value of count = %0d", count);
    count++;
    #5;
  end
  
  initial begin
    #30;
    $finish;
  end
endmodule : always_block_example7
 
//Log File Output
Value of count = 0
Value of count = 1
Value of count = 2
Value of count = 3
Value of count = 4
Value of count = 5
$finish called from file "testbench.sv", line 14.
$finish at simulation time 30 
 
///////////////////////////////////////////////////////////////
Different Examples to understand always block and forever loop 
//////////////////////////////////////////////////////////////

/************************************************************/
 Example8 : A always block inside another procedural block
/************************************************************/ 
 - A compilation error is expected when always block is used inside another procedural block. 
 - In such a case, a forever block can be used.
  
module always_block_inside_procedural_block_example8;  
  int count;
  initial begin
    always begin // can not use inside other procedural block
      $display("Value of count = %0d", count);
      count++;
      #5;
    end
  end
  
  initial begin
    #30;
    $finish;
  end
endmodule : always_block_inside_procedural_block_example8
 
//Log File Output
 Error-[SE] Syntax error
  Following verilog source has syntax error :
  "testbench.sv", 7: token is 'always'
      always begin // can not use inside other procedural block
            ^
1 error
 Error-[SE] Syntax error
  Following verilog source has syntax error :
  "testbench.sv", 7: token is 'always'
      always begin // can not use inside other procedural block
            ^
1 error
       
/************************************************************/
 Example9 : A always block inside a class  
/************************************************************/ 
- A compilation error is expected when always block is used inside a class. 
- We will study the concept of class in the upcoming different section .
- For the time being , below example will explain the concept , just understand it. 
 
class transaction;
  int count;
  
  task inc_cnt();
    always begin
      $display("Value of count = %0d", count);
      count++;
      #5;
    end
  endtask
endclass : transaction

module always_example9;
  transaction tr;
  initial begin
    tr = new();
    tr.inc_cnt();
  end
  
  initial begin
    #100;
    $finish;
  end
endmodule : always_example9 
  
//Log File Output
always begin
         |
xmvlog: *E,ALWILL (testbench.sv,8|9): The always construct is illegal in this context.  

/************************************************************/
 Example10 : forever loop inside a class
/************************************************************/ 
- Use the same example9 and now replace always block with forever block and check
class transaction;
  int count;
  
  task inc_cnt();
    forever begin
      $display("Value of count = %0d", count);
      count++;
      #5;
    end
  endtask
endclass :transaction

module always_example10;
  transaction tr;
  initial begin
    tr = new();
    tr.inc_cnt();
  end
  
  initial begin
    #100;
    $finish;
  end
endmodule :always_example10

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
Value of count = 10
Value of count = 11
Value of count = 12
Value of count = 13
Value of count = 14
Value of count = 15
Value of count = 16
Value of count = 17
Value of count = 18
Value of count = 19
Simulation complete via $finish(1) at time 100 NS + 0
./testbench.sv:25     $finish; 
 
/////////////////////////////////////////////////////////////////
                       4. for loop in System Verilog:  
/////////////////////////////////////////////////////////////////
                        
- The for loop iterates till the mentioned condition is satisfied. 
- The execution of for loop depends on –
     Initialization
     Condition
     Update 
- Syntax:
      for (<initialization>; <condition>; <update>) begin
       ...
      end   
  
- Initialization: An initial value of the variable is set. It is executed only once.
- Condition: A condition or expression is evaluated. 
             If it is evaluated to be the true body of for loop (statements inside begin and end) are executed else, the loop terminates.
- Update: After execution of for loop body, the variable value is updated

/************************************************************/
 Example11 : Basic example using for loop constructs
/************************************************************/ 
module basic_example_using_for_example11;
  int array[10];
  
  initial begin
    // Update array
    for (int i = 0; i < $size(array); i++) begin
      array[i] = i*i;
    end
  
    // Display array elements
    for (int i = 0; i < $size(array); i++) begin
      $display("array[%0d] = %0d", i, array[i]);
    end
  end
endmodule :basic_example_using_for_example11

//Log File Output  
array[0] = 0
array[1] = 1
array[2] = 4
array[3] = 9
array[4] = 16
array[5] = 25
array[6] = 36
array[7] = 49
array[8] = 64
array[9] = 81  
  
/************************************************************/
 Example12 : Basic example using for loop constructs
 Multiple variables in for loop
/************************************************************/
- It is possible to have multiple variable initializations, conditions and update values.
module multiple_variables_in_for_loop_example12;
  int array[10];
    
  initial begin
    // Update array
    for (int i = 0, cnt = 0; i < $size(array); i++, cnt++) begin
      array[i] = i*i;
      $display("cnt = %0d", cnt);
    end
  
    // Display array elements
    for (int i = 0; i < $size(array); i++) begin
      $display("array[%0d] = %0d", i, array[i]);
    end
  end
endmodule :multiple_variables_in_for_loop_example12
  
//Log File Output
cnt = 0
cnt = 1
cnt = 2
cnt = 3
cnt = 4
cnt = 5
cnt = 6
cnt = 7
cnt = 8
cnt = 9
array[0] = 0
array[1] = 1
array[2] = 4
array[3] = 9
array[4] = 16
array[5] = 25
array[6] = 36
array[7] = 49
array[8] = 64
array[9] = 81  
  
/************************************************************/
 Example13 : Basic example using for loop constructs
 for loop behaves as a while loop
/************************************************************/  
- A for loop behaves as a while loop if initializations, conditions, and update values are not written.  

module for_loop_behaves_as_while_loop_example13;
  int cnt;
  initial begin
    for (;;) begin
      $display("cnt = %0d", cnt);
      if(cnt == 10) break;
      cnt++;
    end
  end
endmodule :for_loop_behaves_as_while_loop_example13
  
//Log file Output
cnt = 0
cnt = 1
cnt = 2
cnt = 3
cnt = 4
cnt = 5
cnt = 6
cnt = 7
cnt = 8
cnt = 9
cnt = 10  
  
/////////////////////////////////////////////////////////////////
                       5. foreach loop in System Verilog:  
/////////////////////////////////////////////////////////////////
- The foreach loop in SystemVerilog iterates over the array element. 
- Unlike for loop, foreach loop does not require initialization, condition, or update value.
- Syntax:   foreach (variable[iterator]) begin
             ...
            end        
  
/************************************************************/
 Example14 : Basic example using foreach loop constructs
 foreach loop in the single-dimensional (1D) array
/************************************************************/  
module basic_foreach_example14;
  int array[5] = '{100, 200, 300, 400, 500};
  initial begin
    foreach (array[i]) begin
      $display("array[%0d] = %0d", i, array[i]);
    end
  end
endmodule :basic_foreach_example14
  
//Log File Output
array[0] = 100
array[1] = 200
array[2] = 300
array[3] = 400
array[4] = 500  
