SystemVerilog fork join :
- In fork-join, all processes start simultaneously and join will wait for all processes to be completed.
  
Key Interview Questions & Answers on fork...join :
/*************************************************/
  
Q1: What does fork...join do?
A: Creates parallel threads of execution and waits for ALL threads to complete before continuing.

Q2: How does it differ from begin...end?
A: begin...end is sequential, fork...join is parallel.

Q3: What's the execution order of threads in fork...join?
A: Threads start simultaneously, but completion order depends on their delays/logic.

Q4: What happens if one thread in fork...join has an infinite loop?
A: The join will wait forever, simulation will hang.

Q5: Can we kill specific threads inside fork...join?
A: Not directly with fork...join. Need named blocks and disable.

Q6: How to handle shared resources in parallel threads?
A: Use semaphores, mailboxes, or events for synchronization.

Q7: Why use automatic variables in fork-join loops?
A: Each thread gets its own copy of the variable, avoiding race conditions.  
  
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
module fork_join_example2;
   initial begin
 
       #1 $display ("[%0t ns] Start fork ...", $time);
 
       // Main Process: Fork these processes in parallel and wait untill all 
       // of them finish
      fork
         // Thread1 : Print this statement after 5ns from start of fork
         #5 $display ("[%0t ns] Thread1: Orange is named after orange", $time);
 
         // Thread2 : Print these two statements after the given delay from start of fork
         begin                                                
            #2 $display ("[%0t ns] Thread2: Apple keeps the doctor away", $time);      
            #4 $display ("[%0t ns] Thread2: But not anymore", $time);      
         end                           
 
         // Thread3 : Print this statement after 10ns from start of fork
         #10 $display ("[%0t ns] Thread3: Banana is a good fruit", $time);  
      join
 
      // Main Process: Continue with rest of statements once fork-join is over
      $display ("[%0t ns] After Fork-Join", $time);
   end
endmodule :fork_join_example2

//Log File Output
Starting vcs inline pass...
1 module and 0 UDP read.
recompiling module fork_join_example2
rm -f _cuarc*.so _csrc*.so pre_vcsobj_*.so share_vcsobj_*.so
if [ -x ../simv ]; then chmod a-x ../simv; fi
g++  -o ../simv      -rdynamic  -Wl,-rpath='$ORIGIN'/simv.daidir -Wl,-rpath=./simv.daidir -Wl,-rpath=/apps/vcsmx/vcs/U-2023.03-SP2/linux64/lib -L/apps/vcsmx/vcs/U-2023.03-SP2/linux64/lib  -Wl,-rpath-link=./  
  objs/amcQw_d.o   _333_archive_1.so   SIM_l.o       rmapats_mop.o rmapats.o rmar.o rmar_nd.o  rmar_llvm_0_1.o rmar_llvm_0_0.o           
  -lvirsim -lerrorinf -lsnpsmalloc -lvfs    -lvcsnew -lsimprofile -luclinative /apps/vcsmx/vcs/U-2023.03-SP2/linux64/lib/vcs_tls.o   -Wl,-whole-archive  -lvcsucli    -Wl,-no-whole-archive       
  /apps/vcsmx/vcs/U-2023.03-SP2/linux64/lib/vcs_save_restore_new.o -ldl  -lc -lm -lpthread -ldl 
../simv up to date
CPU time: .418 seconds to compile + .428 seconds to elab + .416 seconds to link
Chronologic VCS simulator copyright 1991-2023
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Jan  4 00:52 2026
[1 ns] Start fork ...
[3 ns] Thread2: Apple keeps the doctor away
[6 ns] Thread1: Orange is named after orange
[7 ns] Thread2: But not anymore
[11 ns] Thread3: Banana is a good fruit
[11 ns] After Fork-Join
           V C S   S i m u l a t i o n   R e p o r t 
  
/////////////////////////////
  fork...join Example3
////////////////////////////
 module fork_join_example3;

  initial begin
    fork
      begin // process A
        $display("Process A started at time = %0t", $time);
        #20;
        $display("Process A completed at time = %0t", $time);
      end
      begin // process B
        $display("Process B started at time = %0t", $time);
        #15;
        $display("Process B completed at time = %0t", $time);
      end
      begin // process C
        $display("Process C started at time = %0t", $time);
        #10;
        $display("Process C completed at time = %0t", $time);
      end
    join
    $display("fork-join completed at time = %0t", $time);
  end
endmodule :fork_join_example3 

//Log File Output
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Jan 10 22:13 2026
Process A started at time = 0
Process B started at time = 0
Process C started at time = 0
Process C completed at time = 10
Process B completed at time = 15
Process A completed at time = 20
fork-join completed at time = 20
           V C S   S i m u l a t i o n   R e p o r t   

/////////////////////////////
  fork...join Example4
////////////////////////////
 module fork_join_example4;

  initial begin
    fork
      begin // process A
        $display("Process A started at time = %0t", $time);
        #20;
        $display("Process A completed at time = %0t", $time);
      end
      begin // process B
        $display("Process B started at time = %0t", $time);
        #15;
        $display("Process B completed at time = %0t", $time);
      end
      begin // process C
        $display("Process C started at time = %0t", $time);
        #10;
        $display("Process C completed at time = %0t", $time);
      end
    join
    #5; 
    $display("fork-join completed at time = %0t", $time);
  end
endmodule :fork_join_example4 
//Log File Output
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Jan 10 22:20 2026
Process A started at time = 0
Process B started at time = 0
Process C started at time = 0
Process C completed at time = 10
Process B completed at time = 15
Process A completed at time = 20
fork-join completed at time = 25
           V C S   S i m u l a t i o n   R e p o r t   
  

/////////////////////////////
  fork...join Example5
////////////////////////////
module fork_join_example5;

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
        #10;
        $display("Process C completed at time = %0t", $time);
      end
    join
    #5; 
    $display("fork-join completed at time = %0t", $time);
  end
endmodule :fork_join_example5  
  
//Log File Output
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Jan 10 22:24 2026
Process A started at time = 0
Process B started at time = 0
Process C started at time = 0
Process A completed at time = 10
Process C completed at time = 10
Process B completed at time = 15
fork-join completed at time = 20
           V C S   S i m u l a t i o n   R e p o r t  
/////////////////////////////
  fork...join Example6
////////////////////////////
module fork_join_example6;
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
    join
    #5; 
    $display("fork-join completed at time = %0t", $time); //15ns+5ns=20ns
  end
endmodule :fork_join_example6
  
//Log File Output
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Jan 10 22:46 2026
Process B started at time = 0
Process C started at time = 2
Process A started at time = 3
Process A completed at time = 13
Process C completed at time = 14
Process B completed at time = 15
fork-join completed at time = 20
           V C S   S i m u l a t i o n   R e p o r t   
  

/////////////////////////////
  fork...join Example7
////////////////////////////
module fork_join_example7; // Example7: Simple parallel threads
initial begin
  $display("[T0] Start at time %0t", $time);
  fork
    begin
      #10;
      $display("[T1] Thread 1 complete at %0t", $time);
    end
    begin
      #30;
      $display("[T2] Thread 2 complete at %0t", $time);
    end
    begin
      #20;
      $display("[T3] Thread 3 complete at %0t", $time);
    end
  join  // Waits for ALL threads (T1, T2, T3)
  $display("[T4] All threads finished at %0t", $time);
  #13;
  $display("[T5] All threads finished at %0t", $time);
end
endmodule : fork_join_example7

//Log File Output
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Jan 10 22:56 2026
[T0] Start at time 0
[T1] Thread 1 complete at 10
[T3] Thread 3 complete at 20
[T2] Thread 2 complete at 30
[T4] All threads finished at 30
[T5] All threads finished at 43
           V C S   S i m u l a t i o n   R e p o r t   

/////////////////////////////
  fork...join Example8
////////////////////////////
module fork_join_example8; // Example8: Multi-level nesting
initial begin
  $display("[MAIN] Level 0 start: %0t", $time); //0ns
  fork
    begin
      $display("[A] Level1-A start: %0t", $time); //0ns
      fork
        begin
          #5;
          $display("[A1] Level2-A1: %0t", $time); //5ns
        end
        begin
          #10;
          $display("[A2] Level2-A2: %0t", $time); //10ns
        end
      join  // Inner fork-join
      $display("[A3] Level1-A after inner join: %0t", $time); //10ns
    end
    
    begin
      $display("[B] Level1-B start: %0t", $time); //0ns
      #15;
      $display("[B1] Level1-B done: %0t", $time); //15ns
    end
  join  // Outer fork-join
  #1;
  $display("[MAIN] All complete: %0t", $time);//16ns
end
endmodule: fork_join_example8  

//Log File Output
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Jan 10 23:31 2026
[MAIN] Level 0 start: 0
[A] Level1-A start: 0
[B] Level1-B start: 0
[A1] Level2-A1: 5
[A2] Level2-A2: 10
[A3] Level1-A after inner join: 10
[B1] Level1-B done: 15
[MAIN] All complete: 16  

/////////////////////////////
  fork...join Example9
////////////////////////////
 module fork_join_example9; // Example9: Shared resource race condition
  integer shared_counter = 0;
  
  task increment_counter(string name);
    integer local_copy;
    local_copy = shared_counter;
    #1;  // Simulate some delay
    shared_counter = local_copy + 1;
    $display("%s: counter = %0d at %0t", name, shared_counter, $time);
  endtask
  
  initial begin
    $display("Initial counter = %0d", shared_counter);
    fork
      increment_counter("Thread_A");
      increment_counter("Thread_B");
      increment_counter("Thread_C");
    join
    $display("Final counter = %0d (Expected: 3)", shared_counter);
    // Might output 1 instead of 3 due to race!
  end
endmodule :fork_join_example9
//Log File Output
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Jan 11 01:29 2026
Initial counter = 0
Thread_C: counter = 1 at 1
Thread_C: counter = 1 at 1
Thread_C: counter = 1 at 1
Final counter = 1 (Expected: 3)
           V C S   S i m u l a t i o n   R e p o r t   

/////////////////////////////
  fork...join Example10
////////////////////////////
module fork_join_example10; // Example code for fixing Race issue in Example9
  integer shared_counter = 0;
  
  task increment_counter(string name);
    // Add a unique delay to each thread to stagger accesses
    #($random % 3);  // Random delay 0-2 time units
    
    // Critical section - simulate with a small atomic operation
    begin
      integer local_copy = shared_counter;
      #1;  // Simulate some delay
      shared_counter = local_copy + 1;
    end
    
    $display("%s: counter = %0d at %0t", name, shared_counter, $time);
  endtask
  
  initial begin
    $display("Initial counter = %0d", shared_counter);
    fork
      increment_counter("Thread_A");
      increment_counter("Thread_B");
      increment_counter("Thread_C");
    join
    $display("Final counter = %0d (Expected: 3)", shared_counter);
  end
endmodule :fork_join_example10

//LogFile Output
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Jan 11 01:31 2026
Initial counter = 0
Thread_C: counter = 1 at 1
Thread_C: counter = 1 at 3
Thread_C: counter = 1 at 4294967296
Final counter = 1 (Expected: 3)
           V C S   S i m u l a t i o n   R e p o r t   

/////////////////////////////
  fork...join Example11
////////////////////////////
module fork_join_example11; // Example11: Event synchronization between parallel threads
  event trigger_event;
  event done_event;
  
  initial begin
    $display("[Main] Starting at %0t", $time);
    
    fork
      // Thread 1: Producer
      begin
        $display("[T1] Producer started at %0t", $time); //0ns
        #15;
        -> trigger_event;
        $display("[T1] Event triggered at %0t", $time); //15ns
      end
      
      // Thread 2: Consumer
      begin
        $display("[T2] Consumer waiting at %0t", $time); //0ns
        @(trigger_event);
        $display("[T2] Event received at %0t", $time); //15ns
        #5;
        -> done_event;
      end
      
      // Thread 3: Monitor
      begin
        $display("[T3] Monitor started at %0t", $time); //0ns
        @(done_event);
        $display("[T3] Done event received at %0t", $time); //20ns
      end
    join
    
    $display("[Main] All threads synchronized at %0t", $time); //20ns
  end
endmodule :fork_join_example11
  
//LogFile Output
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Jan 11 06:52 2026
[Main] Starting at 0
[T1] Producer started at 0
[T2] Consumer waiting at 0
[T3] Monitor started at 0
[T1] Event triggered at 15
[T2] Event received at 15
[T3] Done event received at 20
[Main] All threads synchronized at 20
           V C S   S i m u l a t i o n   R e p o r t   

/////////////////////////////
  fork...join Example12
////////////////////////////
 module fork_join_example12; // Example12: Common pitfall with loop variables
  initial begin
    $display("Starting loop with fork-join...");
    
    fork
      begin
        for (int i = 0; i < 3; i++) begin // PROBLEM: All threads share same 'i'
          fork            
            #((i+1) * 5);
            $display("Thread i=%0d at %0t", i, $time);
          join  // Inner fork
        end
      end
    join
    
    $display("Loop completed :Likely WRONG output");
  end
endmodule :fork_join_example12
  
//Log File Output
Starting loop with fork-join...
Thread i=0 at 0
Thread i=1 at 5
Thread i=2 at 15
Loop completed :Likely WRONG output
           V C S   S i m u l a t i o n   R e p o r t 

/////////////////////////////
  fork...join Example13
////////////////////////////
 module fork_join_example13; // Example13: Fixedthe loop scope in Example12 , Corrected using automatic variable
  initial begin
    $display("Fixed version with automatic variable");
    
    fork
      begin
        for (int i = 0; i < 3; i++) begin
          automatic int j = i;  // Each thread gets its own copy
          fork           
            #((j+1) * 5);
            $display("Thread j=%0d at %0t", j, $time);
          join  // Inner fork
        end
      end
    join
    
    $display("Loop completed :CORRECT output");
  end
endmodule :fork_join_example13
  
//Log File Output
Fixed version with automatic variable
Thread j=0 at 0
Thread j=1 at 5
Thread j=2 at 15
Loop completed :CORRECT output
           V C S   S i m u l a t i o n   R e p o r t   
  
NOTE : The reason both outputs in Example 12 and 13 , look the same is that join makes the loop sequential. 
  It will show the corect analysis , when we will use the same example12 and example13 using fork..join_none
/////////////////////////////
  fork...join Example14
////////////////////////////
module fork_join_example14; // Example: Parallel clock generation
  bit clk1, clk2, clk3;
  
  initial begin
    $display("Starting multiple clocks at %0t", $time);
    
    fork
      // Clock1: 10 time units period
      begin
        forever begin
          #5 clk1 = ~clk1;
        end
      end
      
      // Clock2: 7 time units period
      begin
        #1;  // Phase shift
        forever begin
          #3.5 clk2 = ~clk2;
        end
      end
      
      // Clock3: 12 time units period
      begin
        #2;  // Phase shift
        forever begin
          #6 clk3 = ~clk3;
        end
      end
      
      // Monitor
      begin
        #50;
        $display("Simulation complete at %0t", $time);
        $finish;
      end
    join
    // Note: This fork-join will never complete due to forever loops!
  end
endmodule :fork_join_example14

//Log File Output
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Jan 17 08:14 2026
Starting multiple clocks at 0
Simulation complete at 50
$finish called from file "testbench.sv", line 36.
$finish at simulation time 50
           V C S   S i m u l a t i o n   R e p o r t   
/////////////////////////////
  fork...join Example15
////////////////////////////

