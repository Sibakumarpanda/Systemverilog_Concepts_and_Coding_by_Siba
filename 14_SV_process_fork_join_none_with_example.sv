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
module fork_join_none_example3;
  initial begin
    fork
      begin // process A
        $display("Process A started at time = %0t", $time); //0ns
        #10;
        $display("Process A completed at time = %0t", $time); //10ns
      end
      begin // process B
        #1;
        $display("Process B started at time = %0t", $time); //1ns
        #15;
        $display("Process B completed at time = %0t", $time); //16ns
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
endmodule :fork_join_none_example3

//Log File Output
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Jan 19 00:54 2026
Process A started at time = 0
Process C started at time = 0
fork-join_none completed at time = 1
Process B started at time = 1
Process A completed at time = 10
Process B completed at time = 16
Process C completed at time = 20
           V C S   S i m u l a t i o n   R e p o r t

//////////////////////////////////
  fork...join_none Example4
//////////////////////////////////
module fork_join_none_example4;
  initial begin
    fork
      begin // process A
        #1;
        $display("Process A started at time = %0t", $time); //1ns
        #10;
        $display("Process A completed at time = %0t", $time); //11ns
      end
      begin // process B
        #2;
        $display("Process B started at time = %0t", $time); //2ns
        #15;
        $display("Process B completed at time = %0t", $time); //17ns
      end
      begin // process C
        #3;
        $display("Process C started at time = %0t", $time); //3ns
        #20;
        $display("Process C completed at time = %0t", $time); //23ns
      end
    join_none
    #2;
    $display("fork-join_none completed at time = %0t", $time); //2ns
  end
endmodule :fork_join_none_example4

//Log File Output
Chronologic VCS simulator copyright 1991-2023
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Jan 19 00:58 2026
Process A started at time = 1
fork-join_none completed at time = 2
Process B started at time = 2
Process C started at time = 3
Process A completed at time = 11
Process B completed at time = 17
Process C completed at time = 23
           V C S   S i m u l a t i o n   R e p o r t 
//////////////////////////////////
  fork...join_none Example5
//////////////////////////////////
module fork_join_none_example5;
  initial begin
    fork
      begin // process A
        #1;
        $display("Process A started at time = %0t", $time); //1ns
        #10;
        $display("Process A completed at time = %0t", $time); //11ns
      end
      begin // process B
        #2;
        $display("Process B started at time = %0t", $time); //2ns
        #15;
        $display("Process B completed at time = %0t", $time); //17ns
      end
      begin // process C
        #3;
        $display("Process C started at time = %0t", $time); //3ns
        #20;
        $display("Process C completed at time = %0t", $time); //23ns
      end
    join_none
    $display("fork-join_none completed at time = %0t", $time); //0ns
  end
endmodule :fork_join_none_example5

//Log File Output
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Jan 19 01:01 2026
fork-join_none completed at time = 0
Process A started at time = 1
Process B started at time = 2
Process C started at time = 3
Process A completed at time = 11
Process B completed at time = 17
Process C completed at time = 23
           V C S   S i m u l a t i o n   R e p o r t 

//////////////////////////////////
  fork...join_none Example6
//////////////////////////////////
module fork_join_none_example6; //Basic example
  initial begin
    fork
      #10 $display("A at %0t", $time); //10ns
      #20 $display("B at %0t", $time); //20ns
    join_none
      $display("Main at %0t", $time); //0ns
     // What prints and when? Does B print?
   end
endmodule :fork_join_none_example6

//Logfile Output
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Jan 21 20:27 2026
Main at 0
A at 10
B at 20
           V C S   S i m u l a t i o n   R e p o r t 

//////////////////////////////////
  fork...join_none Example7
//////////////////////////////////
module fork_join_none_example7; // basic example with little modification
  initial begin
    fork
      #5 $display("Will I print?");
      #20 $display("What about me?");
    join_none
      #30
      $display("Main done at %0t", $time);
      // Do any fork threads print? Why?
   end
endmodule : fork_join_none_example7

//Logfile Output
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Jan 21 20:28 2026
Will I print?
What about me?
Main done at 30
           V C S   S i m u l a t i o n   R e p o r t 

//////////////////////////////////
  fork...join_none Example8
//////////////////////////////////
module fork_join_none_example8;// Very Important example join_none in Loop
   initial begin
     for (int i = 0; i < 3; i++) begin
       fork
         #(i*5) $display("i=%0d at %0t", i, $time);
       join_none
     end
     $display("Loop done at %0t", $time);
     // What value of i do threads see?
     // How many threads print?
   end
endmodule :fork_join_none_example8

//Log File Output
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Jan 21 20:29 2026
Loop done at 0
i=3 at 15
i=3 at 15
i=3 at 15
           V C S   S i m u l a t i o n   R e p o r t 

//////////////////////////////////
  fork...join_none Example9
//////////////////////////////////
module fork_join_none_example9; //Variable Capture Race
  int shared = 0;
    initial begin
      fork
        begin          
         shared = shared + 1;
         $display("Inside First begin end loop : Shared = %0d at %0t", shared, $time);  
         #10;
        end
        begin          
         shared = shared + 2;
         $display("Inside Second begin end loop : Shared = %0d at %0t", shared, $time); 
         #5;
        end
       join_none
        $display("Outside to join_none block : Shared = %0d at %0t", shared, $time);
       // What's the value? When is it printed?
     end
endmodule :fork_join_none_example9

//Logfile Output
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Jan 21 20:30 2026
Outside to join_none block : Shared = 0 at 0
Inside First begin end loop : Shared = 1 at 0
Inside Second begin end loop : Shared = 3 at 0
           V C S   S i m u l a t i o n   R e p o r t 

//////////////////////////////////
  fork...join_none Example10
//////////////////////////////////
module fork_join_none_example10; //Nested join_none
  initial begin
    fork
      fork
        #10 $display("Inner Executed at %0t", $time); //10ns
      join_none
      $display("Middle Executed at %0t", $time); //0ns
    join_none
    $display("Outer Executed at %0t", $time); //0ns
    // Execution order? Does "Inner" print?
  end
endmodule :fork_join_none_example10

//Logfile Output
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Jan 21 20:31 2026
Outer Executed at 0
Middle Executed at 0
Inner Executed at 10
           V C S   S i m u l a t i o n   R e p o r t 

//////////////////////////////////
  fork...join_none Example11
//////////////////////////////////
module fork_join_none_example11; // join_none with wait fork
  initial begin
    fork
      #10 $display("Slow at %0t", $time); //10ns
      #5  $display("Medium at %0t", $time); //5ns
      #1  $display("Fast at %0t", $time); //1ns
    join_none
    $display("Immediate at %0t", $time); //0ns
    wait fork;
    $display("All done at %0t", $time); //10ns
    
  end
endmodule :fork_join_none_example11 
     
//Logfile output
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Jan 21 20:34 2026
Immediate at 0
Fast at 1
Medium at 5
Slow at 10
All done at 10
           V C S   S i m u l a t i o n   R e p o r t      

//////////////////////////////////
  fork...join_none Example12
//////////////////////////////////
module fork_join_none_example12; //Automatic Variable Trap
  initial begin
     for (int i = 0; i < 3; i++) begin
       automatic int j = i;
        fork
          #(j*10) $display("j=%0d at %0t", j, $time);
        join_none
      end
    $display("Outside Loop complete at %0t", $time);
      // What delays do threads have?
      // Do all threads execute?
   end
endmodule:fork_join_none_example12
     
//Logfile ouput       
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Jan 21 20:35 2026
Outside Loop complete at 0
j=0 at 0
j=1 at 10
j=2 at 20
           V C S   S i m u l a t i o n   R e p o r t      


//////////////////////////////////
  fork...join_none Example13
//////////////////////////////////

//////////////////////////////////
  fork...join_none Example14
//////////////////////////////////


//////////////////////////////////
  fork...join_none Example15
//////////////////////////////////


//////////////////////////////////
  fork...join_none Example16
//////////////////////////////////

//////////////////////////////////
  fork...join_none Example17
//////////////////////////////////

//////////////////////////////////
  fork...join_none Example18
//////////////////////////////////

//////////////////////////////////
  fork...join_none Example19
//////////////////////////////////

//////////////////////////////////
  fork...join_none Example20
//////////////////////////////////

//////////////////////////////////
  fork...join_none Example21
//////////////////////////////////

//////////////////////////////////
  fork...join_none Example22
//////////////////////////////////

//////////////////////////////////
  fork...join_none Example23
//////////////////////////////////

//////////////////////////////////
  fork...join_none Example24
//////////////////////////////////

//////////////////////////////////
  fork...join_none Example25
//////////////////////////////////


