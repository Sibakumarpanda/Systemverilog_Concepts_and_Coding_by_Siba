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
