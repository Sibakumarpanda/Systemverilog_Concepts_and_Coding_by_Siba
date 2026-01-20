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

//////////////////////////////////
  fork...join_any Example6
//////////////////////////////////
module fork_join_any_example6;

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
    #3; 
    $display("fork...join_any completed at time = %0t", $time); //(10ns+3ns)=13ns
  end
endmodule :fork_join_any_example6

//Log File Output
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Jan 16 01:14 2026
Process A started at time = 0
Process B started at time = 0
Process C started at time = 0
Process A completed at time = 10
Process C completed at time = 10
fork...join_any completed at time = 13
Process B completed at time = 15
           V C S   S i m u l a t i o n   R e p o r t 

//////////////////////////////////
  fork...join_any Example7
//////////////////////////////////
module fork_join_any_example7; // What prints and when?
  initial begin
    fork
      #10 $display("A executed at %0t", $time);
      #20 $display("B executed at %0t", $time);
      #5  $display("C executed at %0t", $time);
    join_any
     $display("First done at %0t", $time); 
  end
  
endmodule: fork_join_any_example7

//Log File Output
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Jan 17 20:13 2026
C executed at 5
First done at 5
A executed at 10
B executed at 20
           V C S   S i m u l a t i o n   R e p o r t 

//////////////////////////////////
  fork...join_any Example8
//////////////////////////////////
module fork_join_any_example8; // With little modification with delay ,What prints and when?
  initial begin
    fork
      #10 $display("A executed at %0t", $time);
      #20 $display("B executed at %0t", $time);
      #5  $display("C executed at %0t", $time);
    join_any
     #6;
     $display("First done at %0t", $time); 
  end
  
endmodule: fork_join_any_example8

//Log File Output
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Jan 17 20:16 2026
C executed at 5
A executed at 10
First done at 11
B executed at 20
           V C S   S i m u l a t i o n   R e p o r t 

//////////////////////////////////
  fork...join_any Example9
//////////////////////////////////
module fork_join_any_example9; // With little modification with delay ,What prints and when?
  initial begin
    fork
      #10 $display("A executed at %0t", $time);  //10ns
      #20 $display("B executed at %0t", $time); //20ns
      #5  $display("C executed at %0t", $time); //5ns
    join_any
     #2;
     #1;
     $display("First done at %0t", $time); //8ns
  end
  
endmodule: fork_join_any_example9

//LogFile Output
Chronologic VCS simulator copyright 1991-2023
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Jan 17 20:20 2026
C executed at 5
First done at 8
A executed at 10
B executed at 20
           V C S   S i m u l a t i o n   R e p o r t 

//////////////////////////////////
  fork...join_any Example10
//////////////////////////////////
module fork_join_any_example10; // Example of Nested join_any
  initial begin
    fork
     fork
       #30 $display("Inner1 executed at %0t", $time); //30ns
       #10 $display("Inner2 executed at %0t", $time); //10ns
     join_any
       $display("Middle executed  at %0t", $time); //0ns
       #15 $display("Outer executed  at %0t", $time); //15ns
    join_any
    $display("DONE at %0t", $time); //0ns
  end
endmodule: fork_join_any_example10

//Log File Output
Chronologic VCS simulator copyright 1991-2023
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Jan 18 02:01 2026
Middle executed  at 0
DONE at 0
Inner2 executed at 10
Outer executed  at 15
Inner1 executed at 30
           V C S   S i m u l a t i o n   R e p o r t 

//////////////////////////////////
  fork...join_any Example11
//////////////////////////////////
module fork_join_any_example11; // Example of Nested join_any
  initial begin
    fork
     fork
       #30 $display("Inner1 executed at %0t", $time); //30ns
       #10 $display("Inner2 executed at %0t", $time); //10ns
     join_any
       #2 $display("Middle executed  at %0t", $time); //2ns
       #15 $display("Outer executed  at %0t", $time); //15ns
    join_any
    $display("DONE at %0t", $time); //2ns
  end
endmodule: fork_join_any_example11

//Log File Output
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Jan 18 02:04 2026
Middle executed  at 2
DONE at 2
Inner2 executed at 10
Outer executed  at 15
Inner1 executed at 30

//////////////////////////////////
  fork...join_any Example12
//////////////////////////////////
module fork_join_any_example12; // Example of Nested join_any
  initial begin
    fork
     fork
       #30 $display("Inner1 executed at %0t", $time); //30ns
       #10 $display("Inner2 executed at %0t", $time); //10ns
     join_any
       #2 $display("Middle executed  at %0t", $time); //2ns
       #15 $display("Outer executed  at %0t", $time); //15ns
    join_any
    #3;
    $display("DONE at %0t", $time); //5ns
  end
endmodule: fork_join_any_example12

//Log File Outpt
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Jan 18 02:09 2026
Middle executed  at 2
DONE at 5
Inner2 executed at 10
Outer executed  at 15
Inner1 executed at 30
           V C S   S i m u l a t i o n   R e p o r t 

//////////////////////////////////
  fork...join_any Example13
//////////////////////////////////
module fork_join_any_example13; // Example of Nested join_any
  initial begin
    fork
     fork
       #30 $display("Inner1 executed at %0t", $time); //30ns
       #10 $display("Inner2 executed at %0t", $time); //10ns
     join_any
       #2 $display("Middle executed  at %0t", $time); //2ns
       #15 $display("Outer executed  at %0t", $time); //15ns
    join_any
    #10;
    $display("DONE at %0t", $time); //12ns
  end
endmodule: fork_join_any_example13

//Log File Output
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Jan 18 02:10 2026
Middle executed  at 2
Inner2 executed at 10
DONE at 12
Outer executed  at 15
Inner1 executed at 30
           V C S   S i m u l a t i o n   R e p o r t 

//////////////////////////////////
  fork...join_any Example14
//////////////////////////////////
module fork_join_any_example14; // Example for Disable Fork with join_any
  initial begin
    fork
      begin
       #50 $display("Long task at %0t", $time);
      end
      begin
       #10 $display("Timeout at %0t", $time);
       disable fork;
      end
    join_any
    $display("After join_any at %0t", $time);
    // What happens to the long task?
  end
endmodule: fork_join_any_example14   

//Log File Output
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Jan 20 08:03 2026
Timeout at 10
After join_any at 10
Long task at 50
           V C S   S i m u l a t i o n   R e p o r t       

//////////////////////////////////
  fork...join_any Example15
//////////////////////////////////
module fork_join_any_example15; // Example for Disable Fork with join_any -with little modification
  initial begin
    fork
      begin
       #50 $display("Long task at %0t", $time);
       disable fork; 
      end
      begin
       #10 $display("Timeout at %0t", $time);
      end
    join_any
    $display("After join_any at %0t", $time);
  end
endmodule: fork_join_any_example15  
      
//Log File Output
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Jan 20 08:03 2026
Timeout at 10
After join_any at 10
Long task at 50
           V C S   S i m u l a t i o n   R e p o r t       
      

//////////////////////////////////
  fork...join_any Example16
//////////////////////////////////
module fork_join_any_example16; // Example for Disable Fork with join_any -with little modification
  initial begin
    fork
      begin
       #50 $display("Long task at %0t", $time);     
      end
      begin
       #10 $display("Timeout at %0t", $time);
      end
    join_any
    disable fork; 
    $display("After join_any at %0t", $time);
  end
endmodule: fork_join_any_example16   
      
//Log File Output
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Jan 20 08:03 2026
Timeout at 10
After join_any at 10
           V C S   S i m u l a t i o n   R e p o r t       
      
//////////////////////////////////
  fork...join_any Example17
//////////////////////////////////
module fork_join_any_example17; //Multiple Processes Complete Simultaneously
  initial begin
    fork
      #10 $display("Executed-A");
      #10 $display("Executed-B");
      #10 $display("Executed-C");
    join_any
    $display("First completed at %0t", $time);
    // Which one is "first"?
    // Does this guarantee all 3 print?
  end
endmodule : fork_join_any_example17

//Log File Output
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Jan 20 08:25 2026
Executed-A
First completed at 10
Executed-B
Executed-C
           V C S   S i m u l a t i o n   R e p o r t     

//////////////////////////////////
  fork...join_any Example18
//////////////////////////////////


//////////////////////////////////
  fork...join_any Example19
//////////////////////////////////


//////////////////////////////////
  fork...join_any Example20
//////////////////////////////////


//////////////////////////////////
  fork...join_any Example21
//////////////////////////////////


//////////////////////////////////
  fork...join_any Example22
//////////////////////////////////


//////////////////////////////////
  fork...join_any Example23
//////////////////////////////////


//////////////////////////////////
  fork...join_any Example24
//////////////////////////////////


//////////////////////////////////
  fork...join_any Example25
//////////////////////////////////


//////////////////////////////////
  fork...join_any Example26
//////////////////////////////////


//////////////////////////////////
  fork...join_any Example27
//////////////////////////////////


//////////////////////////////////
  fork...join_any Example28
//////////////////////////////////


//////////////////////////////////
  fork...join_any Example29
//////////////////////////////////


//////////////////////////////////
  fork...join_any Example30
//////////////////////////////////
