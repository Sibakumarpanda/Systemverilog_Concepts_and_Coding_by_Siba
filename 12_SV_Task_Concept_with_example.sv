SystemVerilog Tasks :
 - A task that may or may not consume simulation time and may/may not take arguments and returns values as output or inout argument type.
 - Task types:
   Automatic tasks
   Static task
 - Syntax  for the Task :
   // Style 1
   task <task_name> (input <port_list>, inout <port_list>, output <port_list>);
   ...
   endtask

   // Style 2
   task <task_name> ();
     input <port_list>;
     inout <port_list>;
     output <port_list>;
     ...
   endtask

 ////////////////////////////////////////////////////////////
   Example1: Basic Task Example with arguments and directions
 /////////////////////////////////////////////////////////// 
 module basic_task_example1;
  
  task compare(input int a, b, output done);
    if(a>b)
      $display("a is greater than b");
    else if(a<b)
      $display("a is less than b");
    else 
      $display("a is equal to b");
    
    #10;
    done = 1;
  endtask
  
  initial begin
    bit done;
    compare(10,10, done);
    if(done) $display("comparison completed at time = %0t", $time);
    compare(5,9, done);
    if(done) $display("comparison completed at time = %0t", $time);
    compare(9,5, done);
    if(done) $display("comparison completed at time = %0t", $time);
  end
  
endmodule :basic_task_example1
  
//Log File Output
a is equal to b
comparison completed at time = 10
a is less than b
comparison completed at time = 20
a is greater than b
comparison completed at time = 30  
  
////////////////////////////////////////////////////////////
  Example2: Premature Task Return Example2
///////////////////////////////////////////////////////////   
module premature_task_example2;
  
  task compare(input int a, b, output bit [1:0] done);
    if(a>b) begin 
      done = 2'h1;
      return;
      $display("a > b comparison completed");
    end
    
    if(a<b) begin
      done = 2'h2;
      return;
      $display("a < b comparison completed");
    end
    
    if(a == b) begin 
      done = 2'h3; 
      return;
      $display("a == b comparison completed");
    end
  endtask
  
  initial begin
    bit [1:0] done;
    int a, b;
    
    repeat(5) begin
      a = $urandom_range(5, 20);
      b = $urandom_range(5, 20);
      $display("input a = %0d, input b = %0d", a, b);
      compare(a,b, done);
      if(done == 2'h1) $display("a is greater than b");
      if(done == 2'h2) $display("a is less than b");
      if(done == 2'h3) $display("a is equal to b");
      $display("------------------------");
    end
  end
endmodule :premature_task_example2
  
//Log Fileoutput
input a = 11, input b = 5
a is greater than b
------------------------
input a = 15, input b = 10
a is greater than b
------------------------
input a = 8, input b = 12
a is less than b
------------------------
input a = 6, input b = 17
a is less than b
------------------------
input a = 9, input b = 9
a is equal to b
------------------------  
///////////////////////////////////////////
  Static Task and Automatic Task Concept
//////////////////////////////////////////
  
-By default, tasks declared are static except they are declared inside a class scope. 
-If the task is declared within class scope, they behave like an automatic task by default unless they are specifically mentioned as static tasks. 
-We will discuss more on this concept in class (OOP) concepts.
-All variables declared in a static task are static variables unless they are specifically mentioned as an automatic variable.
-All variables declared in an automatic task are automatic variables unless they are specifically mentioned as a static variable.
-To understand the scope of variables in tasks, static and automatic variables are declared in each static, automatic, and normal task.

////////////////////////////////////////////////////////////
  Example3: static and automatic task Example3
///////////////////////////////////////////////////////////
module static_and_automatic_task_example3;
  
  task static increment_static();
    static int count_A;
    automatic int count_B;
    int count_C;
    
    count_A++;
    count_B++;
    count_C++;
    $display("Static: count_A = %0d, count_B = %0d, count_C = %0d", count_A, count_B, count_C);
  endtask
  
  task automatic increment_automatic();
    static int count_A;
    automatic int count_B;
    int count_C;
    
    count_A++;
    count_B++;
    count_C++;
    $display("Automatic: count_A = %0d, count_B = %0d, count_C = %0d", count_A, count_B, count_C);
  endtask
  
  task increment();
    static int count_A;
    automatic int count_B;
    int count_C;
    
    count_A++;
    count_B++;
    count_C++;
    $display("Normal: count_A = %0d, count_B = %0d, count_C = %0d", count_A, count_B, count_C);
  endtask
  
  initial begin
    $display("Calling static tasks");
    increment_static();
    increment_static();
    increment_static();
    $display("\nCalling automatic tasks");
    increment_automatic();
    increment_automatic();
    increment_automatic();
    $display("\nCalling normal tasks: without static/automatic keyword");
    increment();
    increment();
    increment();

    //Accessing variables using task
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
endmodule :static_and_automatic_task_example3
   
//Log File Output
Calling static tasks
Static: count_A = 1, count_B = 1, count_C = 1
Static: count_A = 2, count_B = 1, count_C = 2
Static: count_A = 3, count_B = 1, count_C = 3

Calling automatic tasks
Automatic: count_A = 1, count_B = 1, count_C = 1
Automatic: count_A = 2, count_B = 1, count_C = 1
Automatic: count_A = 3, count_B = 1, count_C = 1

Calling normal tasks: without static/automatic keyword
Normal: count_A = 1, count_B = 1, count_C = 1
Normal: count_A = 2, count_B = 1, count_C = 2
Normal: count_A = 3, count_B = 1, count_C = 3

Static: count_A = 3
Automatic: count_A = 3
Normal: count_A = 3

Static: count_C = 3
Normal: count_C = 3 
   
//////////////////////   
  Pass by value Tasks
//////////////////////   
- A pass by value argument passing mechanism does copy arguments locally and operate on those variables.
- Any changes in variables in the task will not be visible outside of the task.
 
////////////////////////////////////////////////////////////
  Example4: Pass by value task Example4
///////////////////////////////////////////////////////////
module pass_by_value_task_example4;
  int a, b;
  int out;
    
  task tk_multiply(int a, b, output int out);
    a = a*b; //value of a is updated, it won't update global variables a and b
    out = a;
  endtask
  
  initial begin
    a = 5;
    b = 6;

    tk_multiply(a,b, out);
    $display("Task: out = %0d for a = %0d and b = %0d", out, a, b);
  end
endmodule :pass_by_value_task_example4
   
//Log File Output
Task: out = 30 for a = 5 and b = 6   

////////////////////////////////////////////////////////////
  Example5: Default values in the argument Example5
/////////////////////////////////////////////////////////// 
 -If no arguments are passed, default values are considered in the function/ task otherwise, default values will be overridden in case of passing any arguments
module default_value_in_task_example5;
  int a, b;
  int out;
    
  task tk_multiply(int a = 5, b = 6, output int out);
    a = a*b; //value of a is updated, it won't update global variables a and b
    out = a;
  endtask
  
  initial begin
    a = 5;
    b = 6;

    tk_multiply(a,b, out);
    $display("Task: out = %0d for a = %0d and b = %0d", out, a, b);
  end
endmodule :default_value_in_task_example5
 
//Log File Output
 Task: out = 30 for a = 5 and b = 6
 
///////////////////////////   
  Pass by reference Tasks
//////////////////////////  
