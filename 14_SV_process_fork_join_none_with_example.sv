SystemVerilog fork join_none:
 -In fork-join_none, all processes start simultaneously and join_none will not wait for any process to be completed.
 -So, we can say that fork-join and fork-join_any is blocked due to process execution time, whereas fork-join_none is not blocked due to any process.
NOTE :
fork...join and fork...join_any -> Called Blocked Processes
fork...join_none -> Non Blocked Process

//////////////////////////////////
Basic fork...join_none Example1
//////////////////////////////////
 -In the below example, there are three processes A, B, and C. All started at the same time.
 -Execution time for process A: 10ns
 -Execution time for process B: 15ns
 -Execution time for process C: 20ns
 -Fork-join_none will be completed without waiting for any process completion.

module fork_join_none_example1;
  initial begin
    fork
      begin // process A
        $display("Process A started at time = %0t", $time); //0ns
        #10;
        $display("Process A completed at time = %0t", $time); //10ns
      end
      begin // process B
        $display("Process B started at time = %0t", $time); //0ns
        #15;
        $display("Process B completed at time = %0t", $time); //15ns
      end
      begin // process C
        $display("Process C started at time = %0t", $time); //0ns
        #20;
        $display("Process C completed at time = %0t", $time); //20ns
      end
    join_none
    $display("fork-join_none completed at time = %0t", $time); //0ns
  end
endmodule :fork_join_none_example1

//Log File Output
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Jan 18 23:58 2026
fork-join_none completed at time = 0
Process A started at time = 0
Process B started at time = 0
Process C started at time = 0
Process A completed at time = 10
Process B completed at time = 15
Process C completed at time = 20
           V C S   S i m u l a t i o n   R e p o r t 

//////////////////////////////////
  fork...join_none Example2
//////////////////////////////////
module fork_join_none_example2;
  initial begin
    fork
      begin // process A
        $display("Process A started at time = %0t", $time); //0ns
        #10;
        $display("Process A completed at time = %0t", $time); //10ns
      end
      begin // process B
        $display("Process B started at time = %0t", $time); //0ns
        #15;
        $display("Process B completed at time = %0t", $time); //15ns
      end
      begin // process C
        $display("Process C started at time = %0t", $time); //0ns
        #20;
        $display("Process C completed at time = %0t", $time); //20ns
      end
    join_none
    #1;
   $display("fork-join_none completed at time = %0t", $time); //1ns
  end
endmodule :fork_join_none_example2

//Log File Output
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Jan 19 00:50 2026
Process A started at time = 0
Process B started at time = 0
Process C started at time = 0
fork-join_none completed at time = 1
Process A completed at time = 10
Process B completed at time = 15
Process C completed at time = 20
           V C S   S i m u l a t i o n   R e p o r t 

//////////////////////////////////
  fork...join_none Example3
//////////////////////////////////


//////////////////////////////////
  fork...join_none Example4
//////////////////////////////////

//////////////////////////////////
  fork...join_none Example5
//////////////////////////////////

//////////////////////////////////
  fork...join_none Example6
//////////////////////////////////
