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


/////////////////////////////
  fork...join Example8
////////////////////////////
  

/////////////////////////////
  fork...join Example9
////////////////////////////
  

/////////////////////////////
  fork...join Example10
////////////////////////////
  

/////////////////////////////
  fork...join Example11
////////////////////////////
  

/////////////////////////////
  fork...join Example12
////////////////////////////
  

/////////////////////////////
  fork...join Example13
////////////////////////////
  

/////////////////////////////
  fork...join Example14
////////////////////////////

/////////////////////////////
  fork...join Example15
////////////////////////////

