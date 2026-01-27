System Verilog disable fork :
- The ‘disable fork’ statement terminates all outstanding or active processes.

//////////////////////////////////
  disable fork  Example1
//////////////////////////////////  
module disable_fork_example1; //disable fork example using fork...join process
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
    join
    disable fork;
    $display("fork...join completed at time = %0t", $time); //20ns
  end
endmodule :disable_fork_example1
      
//Log File Output
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Jan 19 09:20 2026
Process A started at time = 0
Process B started at time = 0
Process C started at time = 0
Process A completed at time = 10
Process B completed at time = 15
Process C completed at time = 20
fork...join completed at time = 20
           V C S   S i m u l a t i o n   R e p o r t       
      
//////////////////////////////////
  disable fork  Example2
//////////////////////////////////  
module disable_fork_example2; //disable fork example using fork...join_any process
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
        $display("Process B completed at time = %0t", $time); //It will not executed due to effect of disable fork 
      end
      begin // process C
        $display("Process C started at time = %0t", $time); //0ns
        #20;
        $display("Process C completed at time = %0t", $time); //It will not executed due to effect of disable fork 
      end
    join_any
    disable fork;
    $display("fork...join_any completed at time = %0t", $time); //10ns
  end
endmodule :disable_fork_example2
      
//Log File Output
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Jan 19 09:24 2026
Process A started at time = 0
Process B started at time = 0
Process C started at time = 0
Process A completed at time = 10
fork...join_any completed at time = 10
           V C S   S i m u l a t i o n   R e p o r t       
      
//////////////////////////////////
  disable fork  Example3
//////////////////////////////////  
module disable_fork_example3; //disable fork example using fork...join_none process
  initial begin
    fork
      begin // process A
        $display("Process A started at time = %0t", $time); //It will not executed due to effect of disable fork
        #10;
        $display("Process A completed at time = %0t", $time); //It will not executed due to effect of disable fork
      end
      begin // process B
        $display("Process B started at time = %0t", $time); //It will not executed due to effect of disable fork
        #15;
        $display("Process B completed at time = %0t", $time); //It will not executed due to effect of disable fork
      end
      begin // process C
        $display("Process C started at time = %0t", $time); //It will not executed due to effect of disable fork
        #20;
        $display("Process C completed at time = %0t", $time); //It will not executed due to effect of disable fork
      end
    join_none
    disable fork;
    $display("fork...join_none completed at time = %0t", $time); //0ns
  end
endmodule :disable_fork_example3

//Log File Output
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Jan 19 09:25 2026
fork...join_none completed at time = 0
           V C S   S i m u l a t i o n   R e p o r t       

//////////////////////////////////
  disable fork  Example4
//////////////////////////////////  
module disable_fork_example4; //disable fork example using fork...join_any process
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
        $display("Process B completed at time = %0t", $time); //It will not executed due to effect of disable fork 
      end
      begin // process C
        $display("Process C started at time = %0t", $time); //0ns
        #20;
        $display("Process C completed at time = %0t", $time); //It will not executed due to effect of disable fork 
      end
    join_any
    disable fork;
     #3;
     $display("fork...join_any completed at time = %0t", $time); //13ns
  end
endmodule :disable_fork_example4
      
//Log File Output
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Jan 19 09:27 2026
Process A started at time = 0
Process B started at time = 0
Process C started at time = 0
Process A completed at time = 10
fork...join_any completed at time = 13
           V C S   S i m u l a t i o n   R e p o r t      
      
//////////////////////////////////
  disable fork  Example5
//////////////////////////////////  
module disable_fork_example5; //disable fork example using fork...join_none process
  initial begin
    fork
      begin // process A
        $display("Process A started at time = %0t", $time); //It will not executed due to effect of disable fork
        #10;
        $display("Process A completed at time = %0t", $time); //It will not executed due to effect of disable fork
      end
      begin // process B
        $display("Process B started at time = %0t", $time); //It will not executed due to effect of disable fork
        #15;
        $display("Process B completed at time = %0t", $time); //It will not executed due to effect of disable fork
      end
      begin // process C
        $display("Process C started at time = %0t", $time); //It will not executed due to effect of disable fork
        #20;
        $display("Process C completed at time = %0t", $time); //It will not executed due to effect of disable fork
      end
    join_none
    disable fork;
    #2;  
      $display("fork...join_none completed at time = %0t", $time); //2ns
  end
endmodule :disable_fork_example5

//Log File Output
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Jan 19 09:28 2026
fork...join_none completed at time = 2
           V C S   S i m u l a t i o n   R e p o r t       

//////////////////////////////////
  disable fork  Example6
//////////////////////////////////
module disable_fork_example6; 
  initial begin
    fork
      #50 $display("Task1: Should print at %0tns", $time);
      #10 
      begin
      $display("Task2: Timeout at %0tns", $time);
      disable fork;
      end
    join
    #5    
    $display("After fork...join block: at %0tns", $time);
    // What prints? What doesn't?
   end
endmodule: disable_fork_example6
      
//LogFile Output
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Jan 26 21:31 2026
Task2: Timeout at 10ns
Task1: Should print at 50ns
After fork...join block: at 55ns
           V C S   S i m u l a t i o n   R e p o r t      
//////////////////////////////////
  disable fork  Example7
////////////////////////////////// 
module disable_fork_example7; 
  initial begin
    fork
      #50 $display("Task1: Should print at %0tns", $time);
      #10 
      begin
      $display("Task2: Timeout at %0tns", $time);
      //disable fork;
      end
    join
    #5    
    $display("After fork...join block: at %0tns", $time);
    // What prints? What doesn't?
   end
endmodule: disable_fork_example7
    
//Logfile Output
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Jan 26 21:33 2026
Task2: Timeout at 10ns
Task1: Should print at 50ns
After fork...join block: at 55ns
           V C S   S i m u l a t i o n   R e p o r t     

//////////////////////////////////
  disable fork  Example8
////////////////////////////////// 
module disable_fork_example8; 
  initial begin
    fork: outer
      fork: inner
        #30 $display("Inner task at %0tns", $time);
      join
      #10 begin
        $display("Disabling inner at %0tns", $time);
        disable inner;
      end
    join
    $display("Main Execution done at %0tns", $time);
    // Does "Inner task" print?
  end
endmodule :disable_fork_example8
    
//Logfile Output
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Jan 26 21:33 2026
Disabling inner at 10ns
Main Execution done at 10ns
           V C S   S i m u l a t i o n   R e p o r t    
        
//////////////////////////////////
  disable fork  Example9
////////////////////////////////// 
module disable_fork_example9; 
  initial begin
    fork: outer
      fork: inner
        #30 $display("Inner task at %0tns", $time);
      join
      #10 begin
        $display("Disabling inner at %0tns", $time);
        //disable inner;
      end
    join
    $display("Main Execution done at %0tns", $time);
    // Does "Inner task" print?
  end
endmodule :disable_fork_example9
    
//Logfile Output
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Jan 26 21:33 2026
Disabling inner at 10ns
Inner task at 30ns
Main Execution done at 30ns
           V C S   S i m u l a t i o n   R e p o r t     
//////////////////////////////////
  disable fork  Example10
//////////////////////////////////  
module disable_fork_example10; 
  initial begin
    fork: outer
      fork: inner
        #15 $display("Inner task1 at %0tns", $time);
        #30 $display("Inner task2 at %0tns", $time);
      join
      #10 begin
        $display("Disabling inner at %0tns", $time);
        disable inner;
      end
    join
    $display("Main Execution done at %0tns", $time);
    // Does "Inner task" print?
  end
endmodule :disable_fork_example10
    
//Logfile Output
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Jan 26 21:34 2026
Disabling inner at 10ns
Main Execution done at 10ns
           V C S   S i m u l a t i o n   R e p o r t     
//////////////////////////////////
  disable fork  Example11
////////////////////////////////// 
module disable_fork_example11; 
  initial begin
    fork: outer
      fork: inner
        #5 $display("Inner task1 at %0tns", $time);
        #30 $display("Inner task2 at %0tns", $time);
      join
      #10 begin
        $display("Disabling inner at %0tns", $time);
        disable inner;
      end
    join
    $display("Main Execution done at %0tns", $time);
    // Does "Inner task" print?
  end
endmodule :disable_fork_example11
    
//Logfile Output
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Jan 27 06:38 2026
Inner task1 at 5ns
Disabling inner at 10ns
Main Execution done at 10ns
           V C S   S i m u l a t i o n   R e p o r t     

//////////////////////////////////
  disable fork  Example12
////////////////////////////////// 
module disable_fork_example12; //Nested Disable Scope
  initial begin
    fork: outer
      fork: inner
        #5 $display("Inner task1 at %0tns", $time);
        #30 $display("Inner task2 at %0tns", $time);
      join
      #10 begin
        $display("Disabling inner at %0tns", $time);
        disable inner;
      end
    join
    #3
    $display("Main Execution done at %0tns", $time);
    // Does "Inner task" print?
  end
endmodule :disable_fork_example12
    
//Logfile Output
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Jan 27 06:39 2026
Inner task1 at 5ns
Disabling inner at 10ns
Main Execution done at 13ns
           V C S   S i m u l a t i o n   R e p o r t     
    
//////////////////////////////////
  disable fork  Example13
////////////////////////////////// 
module disable_fork_example13; // Disable Fork with join_any
   initial begin
     fork
       #100 $display("Statement with More delay : Executed Long process Statement at %0tns", $time);
       #20 
       begin
         $display("Timeout: Printing the timeout Statement at %0tns", $time);
         disable fork;
       end
     join_any
         $display("Outside of fork...join_any Block :Executed at %0tns", $time);
     // What's the output???
   end
endmodule : disable_fork_example13     

//Logfile Output
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Jan 27 06:40 2026
Timeout: Printing the timeout Statement at 20ns
Outside of fork...join_any Block :Executed at 20ns
Statement with More delay : Executed Long process Statement at 100ns
           V C S   S i m u l a t i o n   R e p o r t        

//////////////////////////////////
  disable fork  Example14
//////////////////////////////////  
module disable_fork_example14; //Updated version of example13
   initial begin
     fork: main_block
       begin
         #100 $display("Statement with More delay : Executed Long process Statement at %0tns", $time);
       end
       
       begin
         #20 begin
           $display("Timeout: Printing the timeout Statement at %0tns", $time);
           disable main_block;  // Use named block disable
         end
       end
     join_any
     $display("Outside of fork...join_any Block :Executed at %0tns", $time);
     // What's the output???
   end
endmodule :disable_fork_example14
    
//Logfile Output
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Jan 27 06:41 2026
Timeout: Printing the timeout Statement at 20ns
Outside of fork...join_any Block :Executed at 20ns
           V C S   S i m u l a t i o n   R e p o r t     

//////////////////////////////////
  disable fork  Example15
////////////////////////////////// 
module disable_fork_example15; // Disable Fork with join_any
   initial begin
     fork
       #100 $display("Statement with More delay : Executed Long process Statement at %0tns", $time);
       #20 
       begin
         $display("Timeout: Printing the timeout Statement at %0tns", $time);
         //disable fork;
       end
     join_any
         $display("Outside of fork...join_any Block :Executed at %0tns", $time);
     // What's the output???
   end
endmodule : disable_fork_example15    
 
//Logfile Output
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Jan 27 06:42 2026
Timeout: Printing the timeout Statement at 20ns
Outside of fork...join_any Block :Executed at 20ns
Statement with More delay : Executed Long process Statement at 100ns
           V C S   S i m u l a t i o n   R e p o r t     
//////////////////////////////////
  disable fork  Example16
//////////////////////////////////
module disable_fork_example16; //Updated version of example15
   initial begin
     fork: main_block
       begin
         #100 $display("Statement with More delay : Executed Long process Statement at %0tns", $time);
       end
       
       begin
         #20 begin
           $display("Timeout: Printing the timeout Statement at %0tns", $time);
           //disable main_block;  // Use named block disable
         end
       end
     join_any
     $display("Outside of fork...join_any Block :Executed at %0tns", $time);
     // What's the output???
   end
endmodule :disable_fork_example16

//Logfile Output
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Jan 27 06:43 2026
Timeout: Printing the timeout Statement at 20ns
Outside of fork...join_any Block :Executed at 20ns
Statement with More delay : Executed Long process Statement at 100ns
           V C S   S i m u l a t i o n   R e p o r t    

//////////////////////////////////
  disable fork  Example17
//////////////////////////////////
module disable_fork_example17; // Multiple Level Disable
   initial begin
      fork: Level1
         fork: Level2
           #40 $display("Level2 task at %0tns", $time);
         join
        #10 
        begin
          $display("Disabling Level1 at %0tns", $time);
          disable Level1;
        end
     join
     $display("Outside of fork...join Block : Executed at %0t", $time);
     // What gets killed? What prints?
   end
endmodule :disable_fork_example17

//Logfile Output
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Jan 27 06:43 2026
Disabling Level1 at 10ns
Outside of fork...join Block : Executed at 10
           V C S   S i m u l a t i o n   R e p o r t     
  
//////////////////////////////////
  disable fork  Example18
//////////////////////////////////
module disable_fork_example18; // Multiple Level Disable
   initial begin
      fork: Level1
         fork: Level2
           #5 $display("Level2 task at %0tns", $time);
         join
        #10 
        begin
          $display("Disabling Level1 at %0tns", $time);
          disable Level1;
        end
     join
     $display("Outside of fork...join Block : Executed at %0t", $time);
     // What gets killed? What prints?
   end
endmodule :disable_fork_example18

//Logfile Output
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Jan 27 06:43 2026
Level2 task at 5ns
Disabling Level1 at 10ns
Outside of fork...join Block : Executed at 10
           V C S   S i m u l a t i o n   R e p o r t     
      
//////////////////////////////////
  disable fork  Example19
//////////////////////////////////
module disable_fork_example19; // Multiple Level Disable
   initial begin
      fork: Level1
         fork: Level2
           #5 $display("Level2 task at %0tns", $time);
         join
        #10 
        begin
          $display("Disabling Level1 at %0tns", $time);
          disable Level1;
        end
     join
     #2
     $display("Outside of fork...join Block : Executed at %0t", $time);
     // What gets killed? What prints?
   end
endmodule :disable_fork_example19
      
//Logfile Output
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Jan 27 06:44 2026
Level2 task at 5ns
Disabling Level1 at 10ns
Outside of fork...join Block : Executed at 12
           V C S   S i m u l a t i o n   R e p o r t     

//////////////////////////////////
  disable fork  Example20
//////////////////////////////////
module disable_fork_example20; //Disable Fork in Loop
   initial begin
      for (int i = 0; i < 3; i++) begin
        fork
          #(i*10) $display("Task%0d :Executed at timestamp %0dns", i,$time); //0ns ,10ns,20ns
          #5 
          begin
            $display("Timeout : Executed at timestamp %0dns",$time); //5ns, 15ns ,35ns
          disable fork;
         end
       join
      end
       $display("Outside of For Loop: Executed at %0tns", $time); //35ns
      // How many iterations complete?
   end
endmodule :disable_fork_example20
          
//Logfile output
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Jan 27 06:44 2026
Task0 :Executed at timestamp 0ns
Timeout : Executed at timestamp 5ns
Timeout : Executed at timestamp 10ns
Task1 :Executed at timestamp 15ns
Timeout : Executed at timestamp 20ns
Task2 :Executed at timestamp 35ns
Outside of For Loop: Executed at 35ns
           V C S   S i m u l a t i o n   R e p o r t           

//////////////////////////////////
  disable fork  Example21
//////////////////////////////////
module disable_fork_example21; //Disable Fork in Loop with Little modification
   initial begin
      for (int i = 0; i < 3; i++) begin
        fork
          #(i*10) $display("Task%0d :Executed at timestamp %0dns", i,$time); //0ns ,10ns,20ns
          #5 
          begin
            $display("Timeout : Executed at timestamp %0dns",$time); //5ns, 15ns ,35ns
          disable fork;
         end
       join
      end
       #15   
      $display("Outside of For Loop: Executed at %0tns", $time); //50ns
      // How many iterations complete?
   end
endmodule :disable_fork_example21
          
//Logfile Output
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Jan 27 06:49 2026
Task0 :Executed at timestamp 0ns
Timeout : Executed at timestamp 5ns
Timeout : Executed at timestamp 10ns
Task1 :Executed at timestamp 15ns
Timeout : Executed at timestamp 20ns
Task2 :Executed at timestamp 35ns
Outside of For Loop: Executed at 50ns
           V C S   S i m u l a t i o n   R e p o r t           

//////////////////////////////////
  disable fork  Example22
//////////////////////////////////
module disable_fork_example22; // Partial Disable
  initial begin
    fork
      begin
        #10 $display("TaskA1 Executed at %0dns",$time);
        #10 $display("TaskA2 Executed at %0dns",$time);
      end
      begin
        #15 $display("TaskB Executed at %0dns",$time);
        disable fork;
        $display("After disable :Executed at %0dns",$time);
      end
    join
    $display("Main: Outside of fork...join : Executed at %0dns",$time);
    // What prints? What's killed?
   end
endmodule : disable_fork_example22

//Logfile output
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Jan 27 06:49 2026
TaskA1 Executed at 10ns
TaskB Executed at 15ns
After disable :Executed at 15ns
TaskA2 Executed at 20ns
Main: Outside of fork...join : Executed at 20ns
           V C S   S i m u l a t i o n   R e p o r t       

//////////////////////////////////
  disable fork  Example23
//////////////////////////////////
module disable_fork_example23; // Partial Disable
  initial begin
    fork :my_block
      begin
        #10 $display("TaskA1 Executed at %0dns",$time);
        #10 $display("TaskA2 Executed at %0dns",$time);
      end
      begin
        #15 $display("TaskB Executed at %0dns",$time);
        disable my_block;  // Jumps to end of my_block
        $display("After disable :Executed at %0dns",$time);
      end
    join
    $display("Main: Outside of fork...join : Executed at %0dns",$time);
    // What prints? What's killed?
   end
endmodule : disable_fork_example23
    
//Logfile output
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Jan 27 06:50 2026
TaskA1 Executed at 10ns
TaskB Executed at 15ns
Main: Outside of fork...join : Executed at 15ns
           V C S   S i m u l a t i o n   R e p o r t    
//////////////////////////////////
  disable fork  Example24
//////////////////////////////////
module disable_fork_example24; // Partial Disable
  initial begin
    fork :my_block
      begin
        #10 $display("TaskA1 Executed at %0dns",$time);
        #10 $display("TaskA2 Executed at %0dns",$time);
      end
      begin
        #15 $display("TaskB Executed at %0dns",$time);
        #1;  // Now time is 16ns, Thread A is in middle of #10 delay
        disable my_block;  // Jumps to end of my_block
        $display("After disable :Executed at %0dns",$time);
      end
    join
    $display("Main: Outside of fork...join : Executed at %0dns",$time);
    // What prints? What's killed?
   end
endmodule : disable_fork_example24
    
//Logfile output
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Jan 27 06:51 2026
TaskA1 Executed at 10ns
TaskB Executed at 15ns
Main: Outside of fork...join : Executed at 16ns
           V C S   S i m u l a t i o n   R e p o r t     
        
//////////////////////////////////
  disable fork  Example25
//////////////////////////////////
module disable_fork_example25; // Partial Disable
  initial begin
    fork :my_fork_block
      begin :my_begin_block1
        #10 $display("TaskA1 Executed at %0dns",$time);
        #10 $display("TaskA2 Executed at %0dns",$time);
      end
      begin :my_begin_block2
        #15 $display("TaskB Executed at %0dns",$time);
        #1;  // Now time is 16ns, Thread A is in middle of #10 delay
        disable my_begin_block1;  // Jumps to end of my_block
        $display("After disable :Executed at %0dns",$time);
      end
    join
    $display("Main: Outside of fork...join : Executed at %0dns",$time);
    // What prints? What's killed?
   end
endmodule : disable_fork_example25
    
//Logfile Output
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Jan 27 06:52 2026
TaskA1 Executed at 10ns
TaskB Executed at 15ns
After disable :Executed at 16ns
Main: Outside of fork...join : Executed at 16ns
           V C S   S i m u l a t i o n   R e p o r t     

//////////////////////////////////
  disable fork  Example26
//////////////////////////////////
module disable_fork_example26; // Partial Disable
  initial begin
    fork :my_fork_block
      begin :my_begin_block1
        #10 $display("TaskA1 Executed at %0dns",$time);
        #10 $display("TaskA2 Executed at %0dns",$time);
      end
      begin :my_begin_block2
        #15 $display("TaskB Executed at %0dns",$time);
        #1;  // Now time is 16ns, Thread A is in middle of #10 delay
        disable my_begin_block2;  // Jumps to end of my_block
        $display("After disable :Executed at %0dns",$time);
      end
    join
    $display("Main: Outside of fork...join : Executed at %0dns",$time);
    // What prints? What's killed?
   end
endmodule : disable_fork_example26

//Logfile Output
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Jan 27 06:53 2026
TaskA1 Executed at 10ns
TaskB Executed at 15ns
TaskA2 Executed at 20ns
Main: Outside of fork...join : Executed at 20ns
           V C S   S i m u l a t i o n   R e p o r t     
    
//////////////////////////////////
  disable fork  Example27
//////////////////////////////////
module disable_fork_example27; //Disable Fork with Automatic Variables
   initial begin
      for (int i = 0; i < 3; i++) begin
         automatic int j = i;
         fork
           #(j*10) $display("TASK %0d Executed at %0d", j,$time);
           #5 
           begin
           $display("KILL %0d Executed at %0d", j,$time);
           disable fork;
           end
         join
      end
      $display("DONE Executed at %0d",$time);
      // What's the behavior?
    end
endmodule : disable_fork_example27
           
//Logfile output
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Jan 27 06:54 2026
TASK 0 Executed at 0
KILL 0 Executed at 5
KILL 1 Executed at 10
TASK 1 Executed at 15
KILL 2 Executed at 20
TASK 2 Executed at 35
DONE Executed at 35
           V C S   S i m u l a t i o n   R e p o r t            
           
//////////////////////////////////
  disable fork  Example28
//////////////////////////////////
module disable_fork_example28; //Disable Fork and wait fork
   initial begin
     fork
       #100 $display("Slow: Executed at %0dns",$time);
       #20 
       begin
       $display("Timeout: Executed at %0dns",$time);
       disable fork;
       end
     join_none
     wait fork;
     $display("All Done : Executed at %0dns",$time);
     // Does this finish? When?
   end
endmodule :disable_fork_example28
       
//Logfile Output
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Jan 27 06:55 2026
Timeout: Executed at 20ns
Slow: Executed at 100ns
All Done : Executed at 100ns
           V C S   S i m u l a t i o n   R e p o r t        
       
//////////////////////////////////
  disable fork  Example29
//////////////////////////////////
module disable_fork_example29; //Complex Nested Disable
   initial begin
     fork: A
       fork: B
         #50 $display("Deep task : Executed at %0d",$time);
       join
       fork: C
         #10 begin
         $display("Disabling B: Executed at %0d",$time); //10ns
         disable B;
         end
         #20 begin
         $display("Disabling A: Executed at %0d",$time); //20ns
         disable A;
        end
       join
     join
     $display("Survived: Executed at %0d",$time); //20ns
     // Execution timeline?
   end
endmodule :disable_fork_example29
    
//Logfile Output
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Jan 27 06:56 2026
Disabling B: Executed at 10
Disabling A: Executed at 20
Survived: Executed at 20
           V C S   S i m u l a t i o n   R e p o r t     
//////////////////////////////////
  disable fork  Example30
//////////////////////////////////
module disable_fork_example30; //Disable Fork with Return
   task automatic run_with_timeout(int delay);
     fork
       #delay $display("Task completed at timestamp %0d",$time);
       #10 begin
       $display("Timeout in task at timestamp %0d",$time);
       disable fork;
       end
     join
   endtask

  initial begin
    run_with_timeout(5);
    run_with_timeout(20);
    $display("Main done at timestamp %0d",$time);
    // What prints from each call?
  end
endmodule : disable_fork_example30 

//Logfile Output
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Jan 27 06:57 2026
Task completed at timestamp 5
Timeout in task at timestamp 10
Timeout in task at timestamp 20
Task completed at timestamp 30
Main done at timestamp 30
           V C S   S i m u l a t i o n   R e p o r t         
         
//////////////////////////////////
  disable fork  Example31
//////////////////////////////////
module disable_fork_example31; //Disable Specific Thread
   initial begin
     fork
       begin: thread1
         #30 $display("Thread1 Executed at %0t",$time);
       end
       begin: thread2
          #10 begin
          $display("Killing thread1: Executed at %0t",$time);
          disable thread1;
          #5 $display("Thread2 continues: Executed at %0t",$time);
         end
       end
     join
     $display("All done: Executed at %0t",$time);
     // Can we kill specific thread?
  end  
endmodule :disable_fork_example31
    
//Logfile output
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Jan 27 10:08 2026
Killing thread1: Executed at 10
Thread2 continues: Executed at 15
All done: Executed at 15
           V C S   S i m u l a t i o n   R e p o r t    

//////////////////////////////////
  disable fork  Example32
//////////////////////////////////
module disable_fork_example32; //Disable Specific Thread with little modification
   initial begin
     fork
       begin: thread1
         #30 $display("Thread1 Executed at %0t",$time);
       end
       begin: thread2
          #10 begin
          $display("Killing thread1: Executed at %0t",$time);
          disable thread2;
          #5 $display("Thread2 continues: Executed at %0t",$time);
         end
       end
     join
     #5
     $display("All done: Executed at %0t",$time);
     // Can we kill specific thread?
  end  
endmodule :disable_fork_example32

//Log file Ouput
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Jan 27 07:13 2026
Killing thread1: Executed at 10
Thread1 Executed at 30
All done: Executed at 30
           V C S   S i m u l a t i o n   R e p o r t     

//////////////////////////////////
  disable fork  Example33
//////////////////////////////////
module disable_fork_example33; //Disable Fork Scope Mystery
  initial begin
     fork
       fork
         #40 $display("Inner fork...join task: Executed at %0t",$time);
       join
       #10 $display("Middle: Executed at %0t",$time);
       #20 
       begin
       $display("Disabling: : Executed at %0t",$time);
       disable fork;
       end
     join
     $display("Outer survived: : Executed at %0t",$time);
     // What's the scope of disable fork?
  end
endmodule :disable_fork_example33    
       
//Logfile Output
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Jan 27 10:12 2026
Middle: Executed at 10
Disabling: : Executed at 20
Inner fork...join task: Executed at 40
Outer survived: : Executed at 40
           V C S   S i m u l a t i o n   R e p o r t        

//////////////////////////////////
  disable fork  Example34
//////////////////////////////////
module disable_fork_example34; //Disable Fork Scope Mystery with modification to example33
  initial begin
     fork
       #45 $display("Outer fork...join task: Executed at %0t",$time);
       fork
         #40 $display("Inner fork...join task: Executed at %0t",$time);
       join
       #10 $display("Middle: Executed at %0t",$time);
       #20 
       begin
         $display("Inner Disabling: Executed at %0t",$time);
         disable fork;
          #5  
         $display("Outer Disabling: Executed at %0t",$time);  
       end
     join
     $display("Outer survived: Executed at %0t",$time);
     // What's the scope of disable fork?
  end
endmodule :disable_fork_example34   

//Logfile output
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Jan 27 07:21 2026
Middle: Executed at 10
Inner Disabling: Executed at 20
Outer Disabling: Executed at 25
Inner fork...join task: Executed at 40
Outer fork...join task: Executed at 45
Outer survived: Executed at 45
           V C S   S i m u l a t i o n   R e p o r t        
       
//////////////////////////////////
  disable fork  Example35
//////////////////////////////////
module disable_fork_example35; //Disable in Parallel Blocks
  initial begin
    fork
      begin
        #100 $display("BlockA Executed at %0t", $time); //100ns
      end
      begin
        #10 $display("BlockB Executed at %0t", $time); //10ns
        fork
          #50 $display("Nested in B Executed at %0t", $time); // It will execute , due to use of join_none
        join_none
        disable fork;
      end
    join
    $display("Main Executed at %0t", $time); //100ns
    // What gets killed? Block A?
  end
endmodule :disable_fork_example35    

//Logfile Output
Chronologic VCS simulator copyright 1991-2023
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Jan 27 10:14 2026
BlockB Executed at 10
BlockA Executed at 100
Main Executed at 100
           V C S   S i m u l a t i o n   R e p o r t       
    
//////////////////////////////////
  disable fork  Example36
////////////////////////////////// 
module disable_fork_example36; //Disable in Parallel Blocks
  initial begin
    fork
      begin
        #100 $display("BlockA Executed at %0t", $time); //100ns
      end
      begin
        #10 $display("BlockB Executed at %0t", $time); //10ns
        fork
          #50 $display("Nested in B Executed at %0t", $time); //10+50=60ns
        join_any
        disable fork;
      end
    join
        $display("Main Executed at %0t", $time); //100ns
    // What gets killed? Block A?
  end
endmodule :disable_fork_example36  
      
//Logfile Output
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Jan 27 10:15 2026
BlockB Executed at 10
Nested in B Executed at 60
BlockA Executed at 100
Main Executed at 100
           V C S   S i m u l a t i o n   R e p o r t       

//////////////////////////////////
  disable fork  Example37
////////////////////////////////// 
module disable_fork_example37; //Disable Fork with Events
   event e;
   initial begin
     fork
       begin
         @(e);
         $display("Event received at timestamp %0t",$time);
       end
       begin
         #5;
         -> e;
         disable fork;
         $display("After disable at timestamp %0t",$time);
       end
     join
     $display("Main done: at timestamp %0t",$time);
     // Does event handler execute?
   end
endmodule :disable_fork_example37  
       
//Logfile Output
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Jan 27 07:28 2026
After disable at timestamp 5
Event received at timestamp 5
Main done: at timestamp 5
           V C S   S i m u l a t i o n   R e p o r t        
//////////////////////////////////
  disable fork  Example38
////////////////////////////////// 
module disable_fork_example38; //Disable Fork with Events
   event e;
   initial begin
     fork
       begin        
         @(e);
         #3;
         $display("Event received at timestamp %0t",$time);
       end
       begin
         #5;
         -> e;
         disable fork;
         $display("After disable at timestamp %0t",$time);
       end
     join
     $display("Main done: at timestamp %0t",$time);
     // Does event handler execute?
   end
endmodule :disable_fork_example38
       
//Logfile Output
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Jan 27 11:18 2026
After disable at timestamp 5
Event received at timestamp 8
Main done: at timestamp 8
           V C S   S i m u l a t i o n   R e p o r t        
       
//////////////////////////////////
  disable fork  Example39
////////////////////////////////// 
module disable_fork_example39; //Disable Fork Race
   initial begin
      fork
        #10 $display("Executed A at timestamp %0t",$time);
        #5 begin
           $display("Executed B at timestamp %0t",$time);
           disable fork;
           end
        #1 $display("Executed C at timestamp %0t",$time);
      join
      $display("Executed D at timestamp %0t",$time);
      // What's the output? Is C printed?
   end
endmodule :disable_fork_example39    
  
//Logfile Output
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Jan 27 07:32 2026
Executed C at timestamp 1
Executed B at timestamp 5
Executed A at timestamp 10
Executed D at timestamp 10
           V C S   S i m u l a t i o n   R e p o r t         
//////////////////////////////////
  disable fork  Example40
//////////////////////////////////  
module disable_fork_example40; //Disable Fork Race
   initial begin
      fork
        #10 $display("Executed A at timestamp %0t",$time);
        #5 begin
           $display("Executed B at timestamp %0t",$time);
           disable fork;
           end
        #1 $display("Executed C at timestamp %0t",$time);
       //join_any
       join_none   
       $display("Executed D at timestamp %0t",$time);
      // What's the output? Is C printed?
   end
endmodule :disable_fork_example40
        
//Logfile output
Chronologic VCS simulator copyright 1991-2023
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Jan 27 07:34 2026
Executed D at timestamp 0
Executed C at timestamp 1
Executed B at timestamp 5
Executed A at timestamp 10
           V C S   S i m u l a t i o n   R e p o r t         
