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
