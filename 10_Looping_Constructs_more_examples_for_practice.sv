//More Practice Examples using Various SV Looping Constructs:
****************Systemverilog_looping_constructs_example_by_Siba****************************

Question 1: Infinite Loop Detection using while loop ,Tricky Scenarios
module while_tricky;
  int count = 0;
  int arr[4] = '{1, 2, 3, 4};
  
  initial begin
    while (count < 4) begin
      $display("arr[%0d] = %0d", count, arr[count]);
      // Missing increment - what happens?
    end
  end
endmodule
//Log file Output - This creates an infinite loop because count never increments

Starting vcs inline pass...
1 module and 0 UDP read.
recompiling module while_tricky
rm -f _cuarc*.so _csrc*.so pre_vcsobj_*.so share_vcsobj_*.so
if [ -x ../simv ]; then chmod a-x ../simv; fi
g++  -o ../simv      -rdynamic  -Wl,-rpath='$ORIGIN'/simv.daidir -Wl,-rpath=./simv.daidir -Wl,-rpath=/apps/vcsmx/vcs/U-2023.03-SP2/linux64/lib -L/apps/vcsmx/vcs/U-2023.03-SP2/linux64/lib  -Wl,-rpath-link=./   objs/amcQw_d.o   _332_archive_1.so   SIM_l.o       rmapats_mop.o rmapats.o rmar.o rmar_nd.o  rmar_llvm_0_1.o rmar_llvm_0_0.o            -lvirsim -lerrorinf -lsnpsmalloc -lvfs    -lvcsnew -lsimprofile -luclinative /apps/vcsmx/vcs/U-2023.03-SP2/linux64/lib/vcs_tls.o   -Wl,-whole-archive  -lvcsucli    -Wl,-no-whole-archive          /apps/vcsmx/vcs/U-2023.03-SP2/linux64/lib/vcs_save_restore_new.o -ldl  -lc -lm -lpthread -ldl 
../simv up to date
CPU time: .407 seconds to compile + .455 seconds to elab + .390 seconds to link
Chronologic VCS simulator copyright 1991-2023
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Nov 28 22:25 2025
arr[0] = 1
arr[0] = 1
arr[0] = 1
arr[0] = 1
arr[0] = 1
arr[0] = 1
arr[0] = 1
arr[0] = 1
arr[0] = 1
arr[0] = 1
arr[0] = 1
arr[0] = 1
arr[0] = 1
arr[0] = 1
arr[0] = 1
arr[0] = 1
arr[0] = 1
arr[0] = 1
arr[0] = 1
arr[0] = 1
arr[0] = 1
arr[0] = 1
arr[0] = 1
arr[0] = 1
arr[0] = 1
arr[0] = 1
arr[0] = 1
arr[0] = 1
arr[0] = 1
arr[0] = 1
arr[0] = 1
arr[0] = 1
arr[0] = 1
Result reached the maximum of 5000 lines. Killing process.
Execution interrupted or reached maximum runtime.
Exit code expected: 0, received: 137  

Question 2: Conditional Modification in Loop
module while_conditional;
  int x = 0;
  int y = 10;
  
  initial begin
    while (x < 5 && y > 0) begin
      x++;
      if (x == 3) y = 0;  // What happens next iteration?
      $display("x=%0d, y=%0d", x, y);
    end
  end
endmodule
//Log File Output

Question 3: do-while loop - Edge Cases, Always Execute Once
module do_while_tricky_example ;
  int counter = 10;  
  initial begin
    do begin
      $display("Counter = %0d", counter);
      counter++;
    end while (counter < 5);  // Condition false initially
  end
endmodule
//Log File Output - Executes once despite false condition, showing do-while always runs at least once


Question 4: Breaking Forever Loop -forever loop - Control Mechanisms
module forever_break;
  int clock = 0;
  int iterations = 0;
  
  initial begin
    forever begin
      #5 clock = ~clock;
      iterations++;
      if (iterations == 4) break;  // Can break exit forever?
      $display("Time=%0t, Clock=%0d", $time, clock);
    end
    $display("Broken after %0d iterations", iterations);
  end
endmodule
//LogFile Output :Yes, break can exit forever loops. This runs for 4 iterations.

Question 5: Multiple Variables in For Loop -for loop - Complex Control Flow
module multiple_var_in_for_loop;
  initial begin
    for (int i = 0, j = 10; i < 5 && j > 5; i++, j--) begin
      $display("i=%0d, j=%0d", i, j);
    end
  end
endmodule
//LogFile Output - Loop runs while both conditions are true, with multiple variables updating.

Question 6: Reverse Counting with Step
module reverse_count_using_for_loop;
  initial begin
    for (int i = 10; i > 0; i -= 2) begin
      $display("i = %0d", i);
    end
  end
endmodule
//LogFile Output : Prints even numbers from 10 down to 2.
