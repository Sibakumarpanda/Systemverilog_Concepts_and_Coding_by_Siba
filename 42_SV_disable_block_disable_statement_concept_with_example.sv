////////////////////////////////////////////////////////////////////////////
  System verilog disable block and disable statement concept with Example
////////////////////////////////////////////////////////////////////////////
- SystemVerilog provides a disable keyword to disable a named block that is currently executing. 
- If a block is not executing currently, then disable has no effect.
- The named task can also be terminated using the disable keyword.
- Syntax: disable <block_name/ statement_name>

////////////////////////////////////////////////////////////////////
  Example1: SV Disable block with disable Statement - Basic Example
/////////////////////////////////////////////////////////////////
In the below example, the following block/ statements are disabled
Disable statement using “disable disp_label”.
Disable initial block using “disable init_B” based on condition.
Disable fork block using “disable fork_D” before completion of process_4.
Disable named task using “disable task_E” in the middle of its execution.

//Example1: SV Disable block with disable Statement - Basic Example
module block_label_example1;
  initial begin: init_A
    $display("Inside initial block A (without labelled statement)");
    fork
      disp_label: $display("Inside initial block A (labelled statement)");
      disable disp_label;
    join
  end
  
  initial
    init_B: begin
      int val = 1;
      $display("Inside initial block B");
      if(val) disable init_B;
      $display("End of inside initial block B"); // This will not be executed
    end
  
  initial begin: init_C
    $display("Inside initial block C");
    fork: fork_C
      begin: process_1
        $display("Inside process_1");
        #1;
        $display("End of process_1");
      end
      begin: process_2
        $display("Inside process_2");
        #3;
        $display("End of process_2");
      end
    join: fork_C // optional to put block name
    $display("------------------");
    fork_D: fork
      begin: process_1
        $display("Inside process_3");
        #2;
        $display("End of process_3");
      end
      begin: process_2
        $display("Inside process_4");
        #5;
        $display("End of process_4");
      end
    join_any: fork_D // optional to put label name
    
    fork
      begin 
        task_E: local_task();
      end
      begin
        #1;
        disable task_E; // Early termination of the task
      end
    join
  end
  
  task local_task();
    $display("Inside task");
    #5;
    $display("End of the task");
  endtask: local_task
  
  // Disable
  initial begin
    #8;
    disable init_C.fork_D; // To disable the fork_D  block
  end
endmodule :block_label_example1

//Logfile Output
Inside initial block A (without labelled statement)
Inside initial block B
Inside initial block C
Inside initial block A (labelled statement)
Inside process_1
Inside process_2
End of process_1
End of process_2
------------------
Inside process_3
Inside process_4
End of process_3
Inside task
           V C S   S i m u l a t i o n   R e p o r t   
  
