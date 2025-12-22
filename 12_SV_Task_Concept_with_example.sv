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
