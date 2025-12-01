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
Starting vcs inline pass...
1 module and 0 UDP read.
recompiling module while_conditional
rm -f _cuarc*.so _csrc*.so pre_vcsobj_*.so share_vcsobj_*.so
if [ -x ../simv ]; then chmod a-x ../simv; fi
g++  -o ../simv      -rdynamic  -Wl,-rpath='$ORIGIN'/simv.daidir -Wl,-rpath=./simv.daidir -Wl,-rpath=/apps/vcsmx/vcs/U-2023.03-SP2/linux64/lib -L/apps/vcsmx/vcs/U-2023.03-SP2/linux64/lib  -Wl,-rpath-link=./   
objs/amcQw_d.o   _331_archive_1.so   SIM_l.o       rmapats_mop.o rmapats.o rmar.o rmar_nd.o  rmar_llvm_0_1.o rmar_llvm_0_0.o            -lvirsim -lerrorinf -lsnpsmalloc -lvfs    
-lvcsnew -lsimprofile -luclinative /apps/vcsmx/vcs/U-2023.03-SP2/linux64/lib/vcs_tls.o   -Wl,-whole-archive  -lvcsucli    -Wl,-no-whole-archive          /apps/vcsmx/vcs/U-2023.03-SP2/linux64/lib/vcs_save_restore_new.o -ldl  -lc -lm -lpthread -ldl 
../simv up to date
CPU time: .417 seconds to compile + .483 seconds to elab + .396 seconds to link
Chronologic VCS simulator copyright 1991-2023
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Nov 28 22:29 2025
x=1, y=10
x=2, y=10
x=3, y=0
           V C S   S i m u l a t i o n   R e p o r t   

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
  

Question 7: Modifying Array During Iteration
module foreach_modify_array_during_iteration_using_foreach;
  int arr[6] = '{1, 2, 3, 4, 5, 6};
  
  initial begin
    foreach (arr[i]) begin
      $display("arr[%0d] = %0d", i, arr[i]);
      if (i == 2) arr[4] = 99;  // Modify future element
    end
    
    foreach (arr[i]) 
      $display("Final arr[%0d] = %0d", i, arr[i]);
  end
endmodule :foreach_modify_array_during_iteration_using_foreach
//LogFile Output - Modification affects future iterations - arr[4] becomes 99.  
  
Question 8: Multi-dimensional foreach
module foreach_2d;
  int matrix[2][3] = '{'{1, 2, 3}, '{4, 5, 6}};
  
  initial begin
    foreach (matrix[i,j]) begin
      $display("matrix[%0d][%0d] = %0d", i, j, matrix[i][j]);
    end
  end
endmodule
//LogFile: Iterates through all elements of 2D array


Question 9: repeat loop - Dynamic Repetition ,Variable Repeat Count

module repeat_dynamic;
  int repeat_count = 3;
  
  initial begin
    $display("Starting repeat loop");
    repeat (repeat_count) begin
      $display("Iteration, count = %0d", repeat_count);
      repeat_count--;  // Modifying count variable
    end
    $display("Loop completed");
  end
endmodule  


Question 10: break and continue - Complex Logic : Nested Loop Control

module break_continue;
  initial begin
    for (int i = 0; i < 3; i++) begin
      $display("Outer loop i=%0d", i);
      for (int j = 0; j < 3; j++) begin
        if (i == 1 && j == 1) break;     // Which loop breaks?
        if (i == 2 && j == 1) continue;  // Which loop continues?
        $display("  Inner loop j=%0d", j);
      end
    end
  end
endmodule
//LogFile Output- 
break exits only the innermost loop
continue skips to next iteration of innermost loop  

Question 11: Continue with Conditional
module continue_complex;
  initial begin
    for (int i = 0; i < 5; i++) begin
      if (i % 2 == 0) continue;  // Skip even numbers
      $display("Odd number: %0d", i);
    end
  end
endmodule
//LogFile Output: Only odd numbers (1, 3) are displayed.  


Question 12: Combined Constructs - Tricky Problems: Loop with Multiple Exit Conditions
module multiple_exit;
  int data[8] = '{3, 7, 2, 9, 1, 8, 4, 6};
  int sum = 0;
  int i = 0;
  
  initial begin
    while (i < 8) begin
      sum += data[i];
      if (sum > 15) break;
      if (data[i] == 1) continue;
      $display("Processing data[%0d] = %0d, sum = %0d", i, data[i], sum);
      i++;
    end
    $display("Final sum = %0d", sum);
  end
endmodule
//LogFile Output: Loop stops when sum exceeds 15, skipping display when value is 1

Question 13: Forever with Timeout
module forever_timeout;
  event done;
  int counter = 0;
  
  initial begin
    fork
      begin : main_loop
        forever begin
          #10 counter++;
          $display("Counter = %0d at time %0t", counter, $time);
          if (counter >= 5) -> done;
        end
      end
      
      begin : timeout
        #100 -> done;  // Force exit after 100 time units
      end
      
      begin : wait_done
        @(done);
        disable main_loop;
        $display("Loop terminated");
      end
    join
  end
endmodule
//LogFile Output : Demonstrates controlling forever loop with events and disable.  
  
Question 14: What happens when you modify the loop control variable inside a while loop condition itself, like while(++i < 5)? How many iterations execute if i starts at 0?

Question 15: Can a while loop condition contain a function call that has side effects? What are the potential pitfalls?

Question 16: What's the difference between while(!randomize()) and do...while(!randomize()) in constraint solving scenarios?  

Question 17: In a do-while loop, if the condition fails on the first check, how many times does the loop execute? Provide a real verification scenario where this behavior is crucial.

Question 18: Why might you prefer do-while over while loop when working with UVM phases or component initialization?
  
