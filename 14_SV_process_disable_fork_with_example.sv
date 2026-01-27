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


//////////////////////////////////
  disable fork  Example22
//////////////////////////////////


//////////////////////////////////
  disable fork  Example23
//////////////////////////////////


//////////////////////////////////
  disable fork  Example24
//////////////////////////////////

//////////////////////////////////
  disable fork  Example25
//////////////////////////////////

//////////////////////////////////
  disable fork  Example26
//////////////////////////////////

//////////////////////////////////
  disable fork  Example27
//////////////////////////////////

//////////////////////////////////
  disable fork  Example28
//////////////////////////////////


//////////////////////////////////
  disable fork  Example29
//////////////////////////////////


//////////////////////////////////
  disable fork  Example30
//////////////////////////////////

//////////////////////////////////
  disable fork  Example31
//////////////////////////////////


//////////////////////////////////
  disable fork  Example32
//////////////////////////////////


//////////////////////////////////
  disable fork  Example33
//////////////////////////////////


//////////////////////////////////
  disable fork  Example34
//////////////////////////////////

//////////////////////////////////
  disable fork  Example35
//////////////////////////////////

//////////////////////////////////
  disable fork  Example36
//////////////////////////////////    
