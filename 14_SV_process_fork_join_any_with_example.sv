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
module fork_join_any_example18; //Multiple Processes Complete Simultaneously
  initial begin
    fork
      #10 $display("Executed-A");
      #10 $display("Executed-B");
      #10 $display("Executed-C");
    join_any
    $display("First completed at %0t", $time);
    $display("Second completed at %0t", $time);
    $display("Third completed at %0t", $time);
    // Which one is "first"?
    // Does this guarantee all 3 print?
  end
endmodule : fork_join_any_example18

//Log File Output
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Jan 20 08:25 2026
Executed-A
First completed at 10
Second completed at 10
Third completed at 10
Executed-B
Executed-C
           V C S   S i m u l a t i o n   R e p o r t     

//////////////////////////////////
  fork...join_any Example19
//////////////////////////////////
module fork_join_any_example19; //Multiple Processes Complete Simultaneously
  initial begin
    fork
      #10 $display("Executed-A");
      #10 $display("Executed-B");
      #10 $display("Executed-C");
    join_any
    #10;
    $display("First completed at %0t", $time);
    // Which one is "first"?
    // Does this guarantee all 3 print?
  end
endmodule : fork_join_any_example19
    
//Log File Output
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Jan 20 08:25 2026
Executed-A
Executed-B
Executed-C
First completed at 20
           V C S   S i m u l a t i o n   R e p o r t     
    

//////////////////////////////////
  fork...join_any Example20
//////////////////////////////////
module fork_join_any_example20; // join_any with Immediate Statements
  initial begin
    fork
      $display("Immediate A at %0t", $time);
      #5 $display("Delayed B at %0t", $time);
    join_any
      $display("After join_any at %0t", $time);
      // What's the output order?
  end
endmodule : fork_join_any_example20 

 //Log File Output
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Jan 20 08:25 2026
Immediate A at 0
After join_any at 0
Delayed B at 5
           V C S   S i m u l a t i o n   R e p o r t    

//////////////////////////////////
  fork...join_any Example21
//////////////////////////////////
module fork_join_any_example21; //Variable Race with join_any
  int count = 0;
    initial begin
      fork
        begin
         count = count + 1;
          $display("In First begin_end block : Count = %0d at %0t", count, $time); 
         #10;
        end
        begin
         count = count + 2;
         $display("In Second begin_end block : Count = %0d at %0t", count, $time);  
         #5;
        end
        begin
         count = count + 3;
          $display("In Third begin_end block : Count = %0d at %0t", count, $time); 
         #1;
         end
      join_any
      $display("Outside of join_any block : Count = %0d at %0t", count, $time); //1ns+0ns=1ns
      // What's the value of count?
      // Does it wait for all increments?
     end
endmodule : fork_join_any_example21
    
//LogFile Output
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Jan 20 08:39 2026
In First begin_end block : Count = 1 at 0
In Second begin_end block : Count = 3 at 0
In Third begin_end block : Count = 6 at 0
Outside of join_any block : Count = 6 at 1
           V C S   S i m u l a t i o n   R e p o r t     

//////////////////////////////////
  fork...join_any Example22
//////////////////////////////////
module fork_join_any_example22; //Variable Race with join_any with little modification
  int count = 0;
    initial begin
      fork
        begin
         count = count + 1;
          $display("In First begin_end block : Count = %0d at %0t", count, $time); 
         #10;
        end
        begin
         count = count + 2;
         $display("In Second begin_end block : Count = %0d at %0t", count, $time);  
         #5;
        end
        begin
         count = count + 3;
          $display("In Third begin_end block : Count = %0d at %0t", count, $time); 
         #1;
         end
      join_any
      #3;
      $display("Outside of join_any block : Count = %0d at %0t", count, $time); //1ns+3ns=4ns
      // What's the value of count?
      // Does it wait for all increments?
     end
endmodule : fork_join_any_example22
    
//Log File Output
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Jan 20 08:41 2026
In First begin_end block : Count = 1 at 0
In Second begin_end block : Count = 3 at 0
In Third begin_end block : Count = 6 at 0
Outside of join_any block : Count = 6 at 4
           V C S   S i m u l a t i o n   R e p o r t     
    
//////////////////////////////////
  fork...join_any Example23
//////////////////////////////////
module fork_join_any_example23; //Variable Race with join_any with modification
  int count = 0;
    initial begin
      fork
        begin
         #10; 
         count = count + 1;
         $display("In First begin_end block : Count = %0d at %0t", count, $time); 
        end
        begin
         #5; 
         count = count + 2;
         $display("In Second begin_end block : Count = %0d at %0t", count, $time);  
        end
        begin
         #1;
         count = count + 3;
         $display("In Third begin_end block : Count = %0d at %0t", count, $time); 
         end
      join_any
      $display("Outside of join_any block : Count = %0d at %0t", count, $time); //1ns+0ns=1ns
      // What's the value of count?
      // Does it wait for all increments?
     end
endmodule : fork_join_any_example23
    
//LogFile Output
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Jan 20 08:44 2026
In Third begin_end block : Count = 3 at 1
Outside of join_any block : Count = 3 at 1
In Second begin_end block : Count = 5 at 5
In First begin_end block : Count = 6 at 10
           V C S   S i m u l a t i o n   R e p o r t
    
//////////////////////////////////
  fork...join_any Example24
//////////////////////////////////
module fork_join_any_example24; //join_any in Loop
  initial begin
     for (int i = 0; i < 3; i++) begin
       fork
         #(i*10) $display("Task %0d at %0t", i, $time);
        #5 $display("Quick at %0t", $time);
      join_any
      $display("Loop %0d done at %0t", i, $time);
     end
     // How many times does "Quick" print?
     // What's the value of i in each task?
  end
endmodule:fork_join_any_example24
    
//Log File Output
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Jan 20 08:53 2026
Task 0 at 0
Loop 0 done at 0
Quick at 5
Quick at 5
Loop 1 done at 5
Task 2 at 10
Quick at 10
Loop 2 done at 10
Task 3 at 25
           V C S   S i m u l a t i o n   R e p o r t     

//////////////////////////////////
  fork...join_any Example25
//////////////////////////////////
module fork_join_any_example25; //join_any with Automatic Variables
  initial begin
    for (int i = 0; i < 3; i++) begin
      automatic int j = i;
      fork
        #(j*5) $display("Value %0d at %0t", j, $time);
        #1 $display("Fast %0d at %0t", j, $time);
      join_any
    end
    // What's the output?
    // Is it deterministic?
  end
endmodule : fork_join_any_example25
    
//Logfile Output
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Jan 20 08:55 2026
Value 0 at 0
Fast 0 at 1
Fast 1 at 1
Fast 2 at 2
Value 1 at 5
Value 2 at 11
           V C S   S i m u l a t i o n   R e p o r t     

//////////////////////////////////
  fork...join_any Example26
//////////////////////////////////
module fork_join_any_example26; //Complex Timing with join_any
  initial begin
    fork
      fork
        #10 
        $display("Executing:A at %0tns",$time); //at 10ns
        begin
          #5;
          $display("Executing:B at %0tns",$time); //at 5ns
          #5;
          $display("Executing:C at %0tns",$time); //at 10ns
        end
      join_any
      $display("Executing:D at %0tns",$time); //at 0ns
    join_any
    $display("Executing:E at %0tns",$time); //at 0ns
      // Timeline and output order?
   end
endmodule :  fork_join_any_example26
    
//Logfile Output
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Jan 20 09:13 2026
Executing:D at 0ns
Executing:E at 0ns
Executing:B at 5ns
Executing:A at 10ns
Executing:C at 10ns
           V C S   S i m u l a t i o n   R e p o r t     
    

//////////////////////////////////
  fork...join_any Example27
//////////////////////////////////
module fork_join_any_example27; //Complex Timing with join_any
  initial begin
    fork
      fork
        #10; //Look carefully the effect of semicoln present vs Not present(example26) 
        $display("Executing:A at %0tns",$time); //at 0ns
        begin
          #5;
          $display("Executing:B at %0tns",$time); //at 5ns
          #5;
          $display("Executing:C at %0tns",$time); //at 10ns
        end
      join_any
      $display("Executing:D at %0tns",$time); //at 0ns
    join_any
    $display("Executing:E at %0tns",$time); //at 0ns
      // Timeline and output order?
   end
endmodule : fork_join_any_example27
    
//Logfile Output    
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Jan 20 09:14 2026
Executing:D at 0ns
Executing:E at 0ns
Executing:A at 0ns
Executing:B at 5ns
Executing:C at 10ns
           V C S   S i m u l a t i o n   R e p o r t 
    
//////////////////////////////////
  fork...join_any Example28
//////////////////////////////////
module fork_join_any_example28; //join_any with wait fork
  initial begin
    fork
      #10 $display("Slow");
      #5  $display("Medium");
      #1  $display("Fast");
    join_any
    $display("First completed");
    wait fork;
    $display("All completed");
    // Does "Slow" print before "All completed"?
  end  
endmodule : fork_join_any_example28
      
//LogFile Output
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Jan 20 11:26 2026
Fast
First completed
Medium
Slow
All completed
           V C S   S i m u l a t i o n   R e p o r t      

//////////////////////////////////
  fork...join_any Example29
//////////////////////////////////
module fork_join_any_example29; //join_any and disable Combination
  initial begin
     fork: main
       fork
         #100 $display("Should not print");
         #10 begin
         $display("Timeout");
         disable main;
         end
       join_any
       $display("This line?");
     join
     $display("This line??");
     // What prints and what doesn't?
  end
endmodule : fork_join_any_example29
      
//LogFile Output
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Jan 20 11:28 2026
This line?
Timeout
This line??
           V C S   S i m u l a t i o n   R e p o r t       
      

//////////////////////////////////
  fork...join_any Example30
//////////////////////////////////
module fork_join_any_example30; //Multiple join_any Levels
  initial begin
    fork
      begin
        fork
          #20 $display("LEVEL2-A at timestamp= %0tns",$time); //20ns
          #10 $display("LEVEL2-B at timestamp= %0tns",$time); //10ns
        join_any
        $display("LEVEL1-A at timestamp= %0tns",$time); //10ns
      end
      begin
        #5 $display("LEVEL1-B at timestamp= %0tns",$time); //5ns
      end
    join_any
    $display("Main done at timestamp= %0tns",$time); //5ns
  end
endmodule : fork_join_any_example30
      
//LogFile Output
 Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Jan 20 11:43 2026
LEVEL1-B at timestamp= 5ns
Main done at timestamp= 5ns
LEVEL2-B at timestamp= 10ns
LEVEL1-A at timestamp= 10ns
LEVEL2-A at timestamp= 20ns
           V C S   S i m u l a t i o n   R e p o r t      

//////////////////////////////////
  fork...join_any Example31
//////////////////////////////////  
module fork_join_any_example31; //join_any with Forever Loop
  initial begin
    fork
      begin
        forever #5 $display("Ping at Timestamp %0tns", $time);
      end
      #15 $display("Timeout at Timestamp %0tns", $time);
    join_any
    $display("Simulation Done at Timestamp %0tns", $time);
    // Does simulation hang?
    // How many "Ping"s print?
  end
endmodule : fork_join_any_example31  
//Logfile Output
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Jan 20 11:39 2026
Ping at Timestamp 5ns
Ping at Timestamp 10ns
Timeout at Timestamp 15ns
Simulation Done at Timestamp 15ns
Ping at Timestamp 15ns
Ping at Timestamp 20ns
Ping at Timestamp 25ns
Ping at Timestamp 30ns
Ping at Timestamp 35ns
Ping at Timestamp 40ns
Ping at Timestamp 45ns
Ping at Timestamp 50ns
Ping at Timestamp 55ns
Ping at Timestamp 60ns
.
.      
.
Keep on printing the Ping statement      
//////////////////////////////////
  fork...join_any Example32
////////////////////////////////// 
module fork_join_any_example32; //join_any and Event Trigger
  event e;
  initial begin
    fork
      begin
        @(e);
        $display("Event received at %0t", $time);
      end
      begin
        #5;
        -> e;
        $display("Event triggered at %0t", $time);
      end
    join_any
    $display("After join_any at %0t", $time);
    // What's the output order?
    // Does join_any wait for event?
  end
endmodule : fork_join_any_example32  
//Logfile Output
Chronologic VCS simulator copyright 1991-2023
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Jan 20 11:40 2026
Event triggered at 5
After join_any at 5
Event received at 5
           V C S   S i m u l a t i o n   R e p o r t       
//////////////////////////////////
  fork...join_any Example33
//////////////////////////////////   


//////////////////////////////////
  fork...join_any Example34
////////////////////////////////// 


//////////////////////////////////
  fork...join_any Example35
//////////////////////////////////    
