SystemVerilog fork join_any :
- Here ,In fork-join_any, all processes start simultaneously and join_any will wait for any one process to be completed.

//////////////////////////////////
  Basic fork...join_any Example1
//////////////////////////////////
-In the below example1, there are three processes A, B, and C. All started at the same time.
-Execution time for process A: 10ns
-Execution time for process B: 15ns
-Execution time for process C: 20ns
-Fork-join_any will be completed when any one of the three process execution is completed.

module fork_join_any_example1;

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
    join_any
    $display("fork-join_any completed at time = %0t", $time);
  end
endmodule :fork_join_any_example1

//Log File Output

Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Jan 15 23:57 2026
Process A started at time = 0
Process B started at time = 0
Process C started at time = 0
Process A completed at time = 10
fork-join_any completed at time = 10
Process B completed at time = 15
Process C completed at time = 20
           V C S   S i m u l a t i o n   R e p o r t 

//////////////////////////////////
  fork...join_any Example2
//////////////////////////////////
module fork_join_any_example2;

  initial begin
    fork
      begin // process A
        $display("Process A started at time = %0t", $time); //0ns
        #20;
        $display("Process A completed at time = %0t", $time); //20ns
      end
      begin // process B
        $display("Process B started at time = %0t", $time); //0ns
        #15;
        $display("Process B completed at time = %0t", $time); //15ns
      end
      begin // process C
        $display("Process C started at time = %0t", $time); //0ns
        #10;
        $display("Process C completed at time = %0t", $time); //10ns
      end
    join_any
    $display("fork ...join_any completed at time = %0t", $time); //(10ns+0ns)=10ns
  end
endmodule :fork_join_any_example2

//Log File Output 
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Jan 16 01:05 2026
Process A started at time = 0
Process B started at time = 0
Process C started at time = 0
Process C completed at time = 10
fork ...join_any completed at time = 10
Process B completed at time = 15
Process A completed at time = 20
           V C S   S i m u l a t i o n   R e p o r t 

//////////////////////////////////
  fork...join_any Example3
//////////////////////////////////
module fork_join_any_example3;

  initial begin
    fork
      begin // process A
        $display("Process A started at time = %0t", $time); //0ns
        #20;
        $display("Process A completed at time = %0t", $time); //20ns
      end
      begin // process B
        $display("Process B started at time = %0t", $time); //0ns
        #15;
        $display("Process B completed at time = %0t", $time); //15ns
      end
      begin // process C
        $display("Process C started at time = %0t", $time); //0ns
        #10;
        $display("Process C completed at time = %0t", $time); //10ns
      end
    join_any
    #5; 
    $display("fork...join_any completed at time = %0t", $time); //(10ns+5ns)=15ns
  end
endmodule :fork_join_any_example3

//Log File Output
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Jan 16 01:07 2026
Process A started at time = 0
Process B started at time = 0
Process C started at time = 0
Process C completed at time = 10
Process B completed at time = 15
fork...join_any completed at time = 15
Process A completed at time = 20
           V C S   S i m u l a t i o n   R e p o r t 


//////////////////////////////////
  fork...join_any Example4
//////////////////////////////////
module fork_join_any_example4;

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
        #10;
        $display("Process C completed at time = %0t", $time); //10ns
      end
    join_any
    #5; 
    $display("fork...join_any completed at time = %0t", $time); //(10ns+5ns)=15ns
  end
endmodule :fork_join_any_example4

//Log File Output
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Jan 16 01:10 2026
Process A started at time = 0
Process B started at time = 0
Process C started at time = 0
Process A completed at time = 10
Process C completed at time = 10
Process B completed at time = 15
fork...join_any completed at time = 15
           V C S   S i m u l a t i o n   R e p o r t 

//////////////////////////////////
  fork...join_any Example5
//////////////////////////////////
module fork_join_any_example5;
  initial begin
    fork
      begin // process A
        #3;
        $display("Process A started at time = %0t", $time); //3ns
        #10;
        $display("Process A completed at time = %0t", $time); //13ns
      end
      begin // process B
        $display("Process B started at time = %0t", $time); //0ns
        #15;
        $display("Process B completed at time = %0t", $time); //15ns
      end
      begin // process C
        #2;
        $display("Process C started at time = %0t", $time); //2ns
        #12;
        $display("Process C completed at time = %0t", $time); //14ns
      end
    join_any
    #5; 
    $display("fork...join_any completed at time = %0t", $time); //13+5=18ns
  end
endmodule :fork_join_any_example5

//Log File Output
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Jan 16 01:11 2026
Process B started at time = 0
Process C started at time = 2
Process A started at time = 3
Process A completed at time = 13
Process C completed at time = 14
Process B completed at time = 15
fork...join_any completed at time = 18
           V C S   S i m u l a t i o n   R e p o r t 
