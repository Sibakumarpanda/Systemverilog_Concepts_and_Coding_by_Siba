/////////////////////////////////////////////////////////////////////
  System verilog Named Block and Statement Labels
////////////////////////////////////////////////////////////////////
- SystemVerilog provides feasibility to have names for blocks like begin..end, fork..join, fork..join_any or fork..join_none and statements.
- Syntax:  begin: <block_name>
            …
           end
          <label_name>: <statement>;
- Note:
  A label can not put before the end, join, join_any, join_none
  A label before the begin or fork and block name after the begin or fork can not be placed simultaneously.
    
//////////////////////////////////////////////////////////////////////
   Example1:  SV Named block with Statement label - Basic Example
///////////////////////////////////////////////////////////////////////    
module block_label_example1;
  initial begin: init_A
    disp_label: $display("Inside initial block A");
  end
  
  initial
    init_B: begin
      $display("Inside initial block B");
    end
  
  initial begin: init_C
    $display("Inside initial block C");
    fork: fork_C
      begin: process_1
        $display("Inside process_1");
      end
      begin: process_2
        $display("Inside process_2");
      end
    join: fork_C // optional to put block name
    
    fork_D: fork
      begin: process_1
        $display("Inside process_3");
      end
      begin: process_2
        $display("Inside process_4");
      end
    join_any: fork_D // optional to put label name
    #1;
    task_E: local_task();
  end
  
  task local_task();
    $display("Inside task");
  endtask: local_task
  
endmodule :block_label_example1

//Logfile Output
Inside initial block A
Inside initial block B
Inside initial block C
Inside process_1
Inside process_2
Inside process_3
Inside process_4
Inside task
           V C S   S i m u l a t i o n   R e p o r t     
    
