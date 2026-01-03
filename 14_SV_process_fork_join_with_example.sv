SystemVerilog fork join :
- In fork-join, all processes start simultaneously and join will wait for all processes to be completed.

/////////////////////////////
  Basic fork...join Example1
////////////////////////////
- In the below example, there are three processes A, B, and C. All started at the same time.
- Execution time for process A: 10ns
- Execution time for process B: 15ns
- Execution time for process C: 20ns
- Fork-join will be completed when all three process execution is completed.  
  
module fork_join_example1;

  initial begin
    fork
      begin // process A
        $display("Process A started at time = %0t", $time);
        #10;
        $display("Process A completed at time = %0t", $time);
      end
      begin // process B
        $display("Process B started at time = %0t", $time);
        #15;
        $display("Process B completed at time = %0t", $time);
      end
      begin // process C
        $display("Process C started at time = %0t", $time);
        #20;
        $display("Process C completed at time = %0t", $time);
      end
    join
    $display("fork-join completed at time = %0t", $time);
  end
endmodule :fork_join_example1

//Log File Output
Process A started at time = 0
Process B started at time = 0
Process C started at time = 0
Process A completed at time = 10
Process B completed at time = 15
Process C completed at time = 20
fork-join completed at time = 20

/////////////////////////////
  fork...join Example2
////////////////////////////
