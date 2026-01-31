System Verilog wait fork :
- The ‘wait fork’ statement is used to wait for all forked processes to be completed.
  
///////////////////////////////////////
  Key Interview Questions and Answer:
///////////////////////////////////////  
  
Q: What does wait fork do?
A: Waits for ALL forked processes (including nested ones) to complete.

Q: How is wait fork different from join?
A: join waits for processes in its immediate fork; wait fork waits for ALL forked processes in current scope.

Q: Can wait fork wait for processes created before it?
A: Yes, it waits for all outstanding forked processes.

Q: What happens if no processes are forked before wait fork?
A: It returns immediately (no wait).

Q: Does wait fork wait for processes in called tasks/functions?
A: Yes, it waits for ALL forked processes in the current scope.

Q: Can wait fork be used with join_any?
A: Yes, common pattern: join_any for timeout, wait fork to clean up others.

Q: What's the danger of using wait fork?
A: Can wait forever if any process doesn't terminate (forever loops).

Q: How to avoid hanging on wait fork?
A: Use timeouts with fork...join_any and disable fork.

Q: When should you use wait fork vs join?
A: Use join when creating processes and immediately waiting. Use wait fork when processes are created at different times.  

//////////////////////////////////
  wait fork  Example1
//////////////////////////////////  
module wait_fork_example1; //wait fork example using fork...join process
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
    wait fork;
    $display("fork...join completed at time = %0t", $time); //20ns
  end
endmodule :wait_fork_example1

//Log File Output
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Jan 19 09:49 2026
Process A started at time = 0
Process B started at time = 0
Process C started at time = 0
Process A completed at time = 10
Process B completed at time = 15
Process C completed at time = 20
fork...join completed at time = 20
           V C S   S i m u l a t i o n   R e p o r t       
      
    
//////////////////////////////////
  wait fork  Example2
////////////////////////////////// 
module wait_fork_example2; //wait fork example using fork...join_any process
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
    join_any
    wait fork;
    $display("fork...join_any completed at time = %0t", $time); //20ns
  end
endmodule :wait_fork_example2
      
//Log File Output
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Jan 19 09:51 2026
Process A started at time = 0
Process B started at time = 0
Process C started at time = 0
Process A completed at time = 10
Process B completed at time = 15
Process C completed at time = 20
fork...join_any completed at time = 20
           V C S   S i m u l a t i o n   R e p o r t       
      

//////////////////////////////////
  wait fork  Example3
////////////////////////////////// 
module wait_fork_example3; //wait fork example using fork...join_none process
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
    wait fork;
    $display("fork...join_none completed at time = %0t", $time); //20ns
  end
endmodule :wait_fork_example3

//LogFile Output
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Jan 19 09:52 2026
Process A started at time = 0
Process B started at time = 0
Process C started at time = 0
Process A completed at time = 10
Process B completed at time = 15
Process C completed at time = 20
fork...join_none completed at time = 20
           V C S   S i m u l a t i o n   R e p o r t      
    
//////////////////////////////////
  wait fork  Example4
////////////////////////////////// 
module wait_fork_example4; //wait fork example using fork...join_any process
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
    join_any
    wait fork;
    #5;
    $display("fork...join_any completed at time = %0t", $time); //25ns
  end
endmodule :wait_fork_example4

//LogFile Output
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Jan 19 09:53 2026
Process A started at time = 0
Process B started at time = 0
Process C started at time = 0
Process A completed at time = 10
Process B completed at time = 15
Process C completed at time = 20
fork...join_any completed at time = 25
           V C S   S i m u l a t i o n   R e p o r t       
    
//////////////////////////////////
  wait fork  Example5
////////////////////////////////// 
module wait_fork_example5; //wait fork example using fork...join_none process
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
    wait fork;
     #5;
    $display("fork...join_none completed at time = %0t", $time); //20ns
  end
endmodule :wait_fork_example5
      
//Logfile Output
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Jan 19 09:54 2026
Process A started at time = 0
Process B started at time = 0
Process C started at time = 0
Process A completed at time = 10
Process B completed at time = 15
Process C completed at time = 20
fork...join_none completed at time = 25
           V C S   S i m u l a t i o n   R e p o r t       
      
//////////////////////////////////
  wait fork  Example6
////////////////////////////////// 
module wait_fork_example6; //Basic Example
  initial begin
    fork
      #10 $display("A Executed at %0t", $time); //10ns
      #20 $display("B Executed at %0t", $time); //20ns
    join_none
    $display("Main Executed at %0t", $time); //0ns
    wait fork;
    $display("All done at %0t", $time); //20ns
    // Timeline and output?
  end
endmodule :wait_fork_example6

//Logfile Output
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Jan 27 20:23 2026
Main Executed at 0
A Executed at 10
B Executed at 20
All done at 20
           V C S   S i m u l a t i o n   R e p o r t       
    
//////////////////////////////////
  wait fork  Example7
//////////////////////////////////
module wait_fork_example7; //Basic Example
  initial begin
    fork
      #10 $display("A Executed at %0t", $time); //10ns
      #20 $display("B Executed at %0t", $time); //20ns
    join_any
    $display("Main Executed at %0t", $time); //0ns
    wait fork;
    $display("All done at %0t", $time); //20ns
    // Timeline and output?
  end
endmodule :wait_fork_example7
      
//Logfile Output    
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Jan 27 20:23 2026
A Executed at 10
Main Executed at 10
B Executed at 20
All done at 20
           V C S   S i m u l a t i o n   R e p o r t 

//////////////////////////////////
  wait fork  Example8
//////////////////////////////////
module wait_fork_example8; //wait fork with join_any
  initial begin
    fork
      #50 $display("Slow executed at %0tns", $time); //50ns
      #10 $display("Fast executed at %0tns", $time); //10ns
    join_any
    $display("First done at %0tns", $time); //10ns
    wait fork;
    $display("All done at %0tns", $time); //50ns
      // What prints when?
   end
endmodule :wait_fork_example8
 
//Logfile Output
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Jan 29 11:31 2026
Fast executed at 10ns
First done at 10ns
Slow executed at 50ns
All done at 50ns
           V C S   S i m u l a t i o n   R e p o r t       

//////////////////////////////////
  wait fork  Example9
//////////////////////////////////
module wait_fork_example9; //wait fork with join_any
  initial begin
    fork
      #50 $display("Slow executed at %0tns", $time); //50ns
      #10 $display("Fast executed at %0tns", $time); //10ns
    join_any
    #60
    $display("First done at %0tns", $time); //10+60=70ns
    wait fork;
    $display("All done at %0tns", $time); //70ns
      // What prints when?
   end
endmodule :wait_fork_example9
      
//Logfile Ouput
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Jan 29 11:34 2026
Fast executed at 10ns
Slow executed at 50ns
First done at 70ns
All done at 70ns
           V C S   S i m u l a t i o n   R e p o r t       

//////////////////////////////////
  wait fork  Example10
//////////////////////////////////
module wait_fork_example10; // Nested wait fork
  initial begin
    fork
      begin
        fork
          #30 $display("Inner Executed at %0t", $time);
        join_none
        wait fork;
        $display("Middle Executed at %0t", $time);
      end
      #10 $display("Outer Executed at %0t", $time);
    join
    $display("Done at %0t", $time);
    // Execution order?
  end 
endmodule :wait_fork_example10   
      
//Logfile Output
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Jan 29 11:39 2026
Outer Executed at 10
Inner Executed at 30
Middle Executed at 30
Done at 30
           V C S   S i m u l a t i o n   R e p o r t       

//////////////////////////////////
  wait fork  Example11
//////////////////////////////////
module wait_fork_example11; // wait fork with disable fork
  initial begin
    fork
      #100 $display("Long task Executed at %0t ",$time);
      #20 begin
          $display("Timeout: Executed at %0t ",$time);
      disable fork;
      end
    join_none
    wait fork;
      $display("Outside of fork...join_none : Executed at %0t ",$time);
  // Does wait fork complete?
  end
endmodule:wait_fork_example11
//Logfile Output
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Jan 30 20:34 2026
Timeout: Executed at 20 
Long task Executed at 100 
Outside of fork...join_none : Executed at 100 
           V C S   S i m u l a t i o n   R e p o r t      

//////////////////////////////////
  wait fork  Example12
//////////////////////////////////
module wait_fork_example12; // wait fork with disable fork with minor change
  initial begin
    fork
      #100 $display("Long task Executed at %0t ",$time);
      #20 begin
          $display("Timeout: Executed at %0t ",$time);
      disable fork;
      end
    join_none
    wait fork;
      #10
      $display("Outside of fork...join_none : Executed at %0t ",$time);
  // Does wait fork complete?
  end
endmodule:wait_fork_example12
      
//Logfile Output
Chronologic VCS simulator copyright 1991-2023
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Jan 30 20:36 2026
Timeout: Executed at 20 
Long task Executed at 100 
Outside of fork...join_none : Executed at 110 
           V C S   S i m u l a t i o n   R e p o r t 
  
//////////////////////////////////
  wait fork  Example13
//////////////////////////////////
module wait_fork_example13; // wait fork in Loop
  initial begin
     for (int i = 0; i < 3; i++) begin
       fork
         #(i*10) $display("Task%0d Executed at timestamp= %0tns", i,$time);
       join_none
    end
    wait fork;
    $display("Loop done at %0t", $time);
    // What value of i do threads see?
    // When does it finish?
  end
endmodule : wait_fork_example13   
      
//Logfile Output
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Jan 30 20:37 2026
Task3 Executed at timestamp= 30ns
Task3 Executed at timestamp= 30ns
Task3 Executed at timestamp= 30ns
Loop done at 30
           V C S   S i m u l a t i o n   R e p o r t       

//////////////////////////////////
  wait fork  Example14
//////////////////////////////////
module wait_fork_example14; // wait fork with Automatic Variables- Updated version of Example13
   initial begin
     for (int i = 0; i < 3; i++) begin
       automatic int j = i;
       fork
         #(j*10) $display("Task%0d Executed at timestamp= %0tns", j,$time);
       join_none
      end
      wait fork;
        $display("Loop Done at %0t", $time);
      // Delays? Completion time?
    end
endmodule :wait_fork_example14

//Logfile Output
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Jan 30 20:39 2026
Task0 Executed at timestamp= 0ns
Task1 Executed at timestamp= 10ns
Task2 Executed at timestamp= 20ns
Loop Done at 20
           V C S   S i m u l a t i o n   R e p o r t         

//////////////////////////////////
  wait fork  Example15
//////////////////////////////////
module wait_fork_example15; // wait fork with Automatic Variables- Updated version of Example13
   initial begin
     for (int i = 0; i < 3; i++) begin
       automatic int j = i;
       fork
         #(j*10) $display("Task%0d Executed at timestamp= %0tns", j,$time);
       join_none
      end
      wait fork;
        #40
        $display("Loop Done at %0t", $time); // 20+40=60ns
      // Delays? Completion time?
    end
endmodule :wait_fork_example15
        
//Logfile Output
Chronologic VCS simulator copyright 1991-2023
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Jan 30 20:39 2026
Task0 Executed at timestamp= 0ns
Task1 Executed at timestamp= 10ns
Task2 Executed at timestamp= 20ns
Loop Done at 60
           V C S   S i m u l a t i o n   R e p o r t         
        
//////////////////////////////////
  wait fork  Example16
////////////////////////////////// 
module wait_fork_example16; //Multiple wait fork Calls
  initial begin
     fork
       #10 $display("First fork...join_none :Executed at %0tns", $time); //10ns , this stmt executed first , even if having higher delay
     join_none
  
     wait fork;
     $display("First wait Executed at %0tns", $time); //10ns
  
     fork
       #5 $display("Second fork...join_none :Executed at %0tns", $time); // 5+10ns=15ns , Executed at 15ns
     join_none
  
     wait fork;
     $display("Second wait Executed at %0tns", $time); // Executed at 15ns
     // Output timeline?
  end
endmodule: wait_fork_example16
       
//Logfile Output
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Jan 30 20:44 2026
First fork...join_none :Executed at 10ns
First wait Executed at 10ns
Second fork...join_none :Executed at 15ns
Second wait Executed at 15ns
           V C S   S i m u l a t i o n   R e p o r t        
    
//////////////////////////////////
  wait fork  Example17
////////////////////////////////// 
module wait_fork_example17; //Multiple wait fork Calls
  initial begin
      
     fork
       #5 $display("First fork...join_none :Executed at %0tns", $time); //5ns , this stmt executed first 
     join_none
  
     wait fork;
     $display("First wait Executed at %0tns", $time); //5ns
       
     fork
       #10 $display("Second fork...join_none :Executed at %0tns", $time); //10+5=15ns
     join_none
  
     wait fork;
     $display("second wait Executed at %0tns", $time);  //15ns
     // Output timeline?
  end
endmodule: wait_fork_example17
       
//Logfile Output
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Jan 30 20:44 2026
First fork...join_none :Executed at 5ns
First wait Executed at 5ns
Second fork...join_none :Executed at 15ns
second wait Executed at 15ns
           V C S   S i m u l a t i o n   R e p o r t        
       
//////////////////////////////////
  wait fork  Example18
////////////////////////////////// 


//////////////////////////////////
  wait fork  Example19
////////////////////////////////// 


//////////////////////////////////
  wait fork  Example20
////////////////////////////////// 


//////////////////////////////////
  wait fork  Example21
////////////////////////////////// 


//////////////////////////////////
  wait fork  Example22
////////////////////////////////// 


//////////////////////////////////
  wait fork  Example23
////////////////////////////////// 


//////////////////////////////////
  wait fork  Example24
////////////////////////////////// 


//////////////////////////////////
  wait fork  Example25
//////////////////////////////////     
    
