wait_order in SV events:
-The wait_order construct is useful when events are expected to be triggered in a particular order otherwise run time error or display message for out of 
 order event can be written.
  
In order event : Trigger an event for wait_order(inorder)
//Example1:  
module event_example();
  event e1, e2, e3;
  
  task process_A();
    #5;
    ->e1;
    $display("@%0t: process_A: event e1 is triggered", $time);
  endtask
  
  task process_B();
    #15;
    ->e2;
    $display("@%0t: process_B: event e2 is triggered", $time);
  endtask
  
  task process_C();
    #10;
    ->e3;
    $display("@%0t: process_C: event e3 is triggered", $time);
  endtask
  
  // wait for event triggering in order (e1, e3, e2)
  task wait_process();
    $display("@%0t: waiting for the events e1, e2, e3", $time);
    wait_order(e1, e3, e2)
      $display("Events are triggered in order");
    else
      $display("Events are triggered out of order");
  endtask

  initial begin
    fork
      process_A();
      process_B();
      process_C();
      wait_process();
    join
  end
endmodule

//LogFile output using Synopsys Tool
Starting vcs inline pass...

1 module and 0 UDP read.
recompiling module event_example
rm -f _cuarc*.so _csrc*.so pre_vcsobj_*.so share_vcsobj_*.so
if [ -x ../simv ]; then chmod a-x ../simv; fi
g++  -o ../simv      -rdynamic  -Wl,-rpath='$ORIGIN'/simv.daidir -Wl,-rpath=./simv.daidir -Wl,-rpath=/apps/vcsmx/vcs/U-2023.03-SP2/linux64/lib -L/apps/vcsmx/vcs/U-2023.03-SP2/linux64/lib  -Wl,-rpath-link=./   objs/amcQw_d.o   _332_archive_1.so   SIM_l.o       rmapats_mop.o rmapats.o rmar.o rmar_nd.o  rmar_llvm_0_1.o rmar_llvm_0_0.o            -lvirsim -lerrorinf -lsnpsmalloc -lvfs    -lvcsnew -lsimprofile -luclinative /apps/vcsmx/vcs/U-2023.03-SP2/linux64/lib/vcs_tls.o   -Wl,-whole-archive  -lvcsucli    -Wl,-no-whole-archive          /apps/vcsmx/vcs/U-2023.03-SP2/linux64/lib/vcs_save_restore_new.o -ldl  -lc -lm -lpthread -ldl 
../simv up to date
CPU time: .298 seconds to compile + .306 seconds to elab + .317 seconds to link
Chronologic VCS simulator copyright 1991-2023
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Jul 22 00:15 2025
@0: waiting for the events e1, e2, e3
@5: process_A: event e1 is triggered
@10: process_C: event e3 is triggered
@15: process_B: event e2 is triggered
Events are triggered in order
           V C S   S i m u l a t i o n   R e p o r t 
Time: 15 ns
CPU Time:      0.320 seconds;       Data structure size:   0.0Mb
Tue Jul 22 00:15:12 2025
Done
  
//Example2
 module event_example();
  event e1, e2, e3;
  
  task process_A();
    #5;
    ->e1;
    $display("@%0t: process_A: event e1 is triggered", $time);
  endtask
  
  task process_B();
    #10;
    ->e2;
    $display("@%0t: process_B: event e2 is triggered", $time);
  endtask
  
  task process_C();
    #15;
    ->e3;
    $display("@%0t: process_C: event e3 is triggered", $time);
  endtask
  
  // wait for event triggering in order (e1, e3, e2)
  task wait_process();
    $display("@%0t: waiting for the events e1, e2, e3", $time);
    wait_order(e1, e3, e2)
      $display("Events are triggered in order");
    else
      $display("Events are triggered out of order");
  endtask

  initial begin
    fork
      process_A();
      process_B();
      process_C();
      wait_process();
    join
  end
endmodule

 //LogFile Output using Synopsys VCS Tool
  Starting vcs inline pass...

1 module and 0 UDP read.
recompiling module event_example
rm -f _cuarc*.so _csrc*.so pre_vcsobj_*.so share_vcsobj_*.so
if [ -x ../simv ]; then chmod a-x ../simv; fi
g++  -o ../simv      -rdynamic  -Wl,-rpath='$ORIGIN'/simv.daidir -Wl,-rpath=./simv.daidir -Wl,-rpath=/apps/vcsmx/vcs/U-2023.03-SP2/linux64/lib -L/apps/vcsmx/vcs/U-2023.03-SP2/linux64/lib  -Wl,-rpath-link=./   objs/amcQw_d.o   _332_archive_1.so   SIM_l.o       rmapats_mop.o rmapats.o rmar.o rmar_nd.o  rmar_llvm_0_1.o rmar_llvm_0_0.o            -lvirsim -lerrorinf -lsnpsmalloc -lvfs    -lvcsnew -lsimprofile -luclinative /apps/vcsmx/vcs/U-2023.03-SP2/linux64/lib/vcs_tls.o   -Wl,-whole-archive  -lvcsucli    -Wl,-no-whole-archive          /apps/vcsmx/vcs/U-2023.03-SP2/linux64/lib/vcs_save_restore_new.o -ldl  -lc -lm -lpthread -ldl 
../simv up to date
CPU time: .278 seconds to compile + .262 seconds to elab + .275 seconds to link
Chronologic VCS simulator copyright 1991-2023
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Jul 22 01:08 2025
@0: waiting for the events e1, e2, e3
@5: process_A: event e1 is triggered
@10: process_B: event e2 is triggered
Events are triggered out of order
@15: process_C: event e3 is triggered
           V C S   S i m u l a t i o n   R e p o r t 
Time: 15 ns
CPU Time:      0.290 seconds;       Data structure size:   0.0Mb
Tue Jul 22 01:08:18 2025
Done

Out of order event example: Trigger an event for wait_order(out of order)
 module event_example();
  event e1, e2, e3;
  
  task process_A();
    #5;
    ->e1;
    $display("@%0t: process_A: event e1 is triggered", $time);
  endtask
  
  task process_B();
    #15;
    ->e2;
    $display("@%0t: process_B: event e2 is triggered", $time);
  endtask
  
  task process_C();
    #10;
    ->e3;
    $display("@%0t: process_C: event e3 is triggered", $time);
  endtask
  
  // wait for event triggering in out of order (e2, e1, e3)
  task wait_process();
    $display("@%0t: waiting for the events e2, e1, e3", $time);
    wait_order(e2, e1, e3)
      $display("Events are triggered in order");
    else
      $display("Events are triggered out of order");
  endtask

  initial begin
    fork
      process_A();
      process_B();
      process_C();
      wait_process();
    join
  end
endmodule
//LogFile Output using Synopsys VCS Tool
 Starting vcs inline pass...

1 module and 0 UDP read.
recompiling module event_example
rm -f _cuarc*.so _csrc*.so pre_vcsobj_*.so share_vcsobj_*.so
if [ -x ../simv ]; then chmod a-x ../simv; fi
g++  -o ../simv      -rdynamic  -Wl,-rpath='$ORIGIN'/simv.daidir -Wl,-rpath=./simv.daidir -Wl,-rpath=/apps/vcsmx/vcs/U-2023.03-SP2/linux64/lib -L/apps/vcsmx/vcs/U-2023.03-SP2/linux64/lib  -Wl,-rpath-link=./   objs/amcQw_d.o   _332_archive_1.so   SIM_l.o       rmapats_mop.o rmapats.o rmar.o rmar_nd.o  rmar_llvm_0_1.o rmar_llvm_0_0.o            -lvirsim -lerrorinf -lsnpsmalloc -lvfs    -lvcsnew -lsimprofile -luclinative /apps/vcsmx/vcs/U-2023.03-SP2/linux64/lib/vcs_tls.o   -Wl,-whole-archive  -lvcsucli    -Wl,-no-whole-archive          /apps/vcsmx/vcs/U-2023.03-SP2/linux64/lib/vcs_save_restore_new.o -ldl  -lc -lm -lpthread -ldl 
../simv up to date
CPU time: .269 seconds to compile + .269 seconds to elab + .262 seconds to link
Chronologic VCS simulator copyright 1991-2023
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Jul 22 01:10 2025
@0: waiting for the events e2, e1, e3
@5: process_A: event e1 is triggered
Events are triggered out of order
@10: process_C: event e3 is triggered
@15: process_B: event e2 is triggered
           V C S   S i m u l a t i o n   R e p o r t 
Time: 15 ns
CPU Time:      0.280 seconds;       Data structure size:   0.0Mb
Tue Jul 22 01:10:37 2025
Done 
  
