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

 
Question 19: How do you safely terminate a forever loop running in a parallel process without using $finish?

Question 20: In a clock generation module, what's the difference between:
             forever #5 clk = ~clk;
             and
             always #5 clk = ~clk;
  
Question 21: What happens if you put a forever loop in a class method without forking it?


Question 22: What's the scope of the loop variable in SystemVerilog for loops? Can you access it outside the loop?

Question 23: How does modifying the loop index variable inside a for loop affect the iteration count? Is this legal?

Question 24: What's the output of this code and why?

            for (int i=0; i<5; i++) begin
               if (i == 2) continue;
               $display(i);
               if (i == 3) break;
            end
  

Question 25: When iterating a 2D array with foreach, what happens if you only specify one index: foreach(arr[i]) vs foreach(arr[i,j])?

Question 26: Can you use foreach with dynamic arrays that change size during iteration? What are the risks?

Question 27: How does foreach handle sparse arrays or arrays with holes?

Question 28: If the repeat count expression evaluates to zero or negative, how many times does the loop execute?

Question 29: What's a practical verification scenario where repeat loop is more suitable than for loop?

Question 30: In nested loops, does break exit all nested levels or just the immediate containing loop?

Question 31: What's the difference between using continue and nesting the loop body in an if condition?

Question 32: Can you use break and continue in all types of loops? Are there any restrictions?

Question 33: In a scoreboard, you are monitoring transactions with below:

      while (transaction_queue.size() > 0) begin
           trans = transaction_queue.pop_front();
           // process transaction
      end
      What potential issue exists if another process is adding to the queue concurrently?

Question 34: You need to find the first occurrence of a value in a 2D array and exit all nested loops immediately. How would you implement this efficiently?
        
Question 35: In a coverage collection loop, you have:

     foreach(coverpoints[i]) begin
        if (!coverpoints[i].is_enabled()) continue;
       coverpoints[i].sample();
     end
     What optimization could you make if many coverpoints are disabled?

Question 36: For a memory initialization routine, which loop construct would you choose and why?
             while (address < max_address)
             for (int addr=0; addr<max_addr; addr++)
             repeat (memory_size)
             foreach (memory[addr])

Question 37: You're writing a recursive function that traverses a tree structure. Can you use looping constructs instead of recursion? What are the trade-offs?
  
Question 38: In a constraint solver, you have:
          do begin
           success = randomize();
           attempts++;
         end while (!success && attempts < max_attempts);
         What's the maximum number of randomization attempts that will occur?

Question 39: How would you rewrite this forever loop without using break?
       forever begin
          @(posedge clk);
          if (reset) break;
          // normal operation
       end

Question 40: In a packet processor, you have:
       for (int i=0; i<packets.size(); i++) begin
         if (packets[i].has_error()) continue;
         process_packet(packets[i]);
         packets.delete(i);
         i--;  // why is this needed?
      end
      Explain why the i-- is necessary and what problem it solves.

Question 41: What's wrong with this loop for finding a maximum value?
      int arr[] = '{5, 2, 9, 1, 7};
      int max_val = 0;
      foreach (arr[i]) begin
        if (arr[i] > max_val)
          max_val = arr[i];
          break;  // bug here!
      end

Question 42: In a multi-clock domain synchronizer, you have:
     forever begin
        @(posedge fast_clk);
       if (data_available) begin
          repeat (SYNC_STAGES) @(posedge slow_clk);
          processed_data <= input_data;
       end
     end
    What synchronization issue exists in this code?

Question 43: Compare the performance implications of:
    // Version A
    for (int i=0; i<array.size(); i++) 
       if (condition(array[i])) process(array[i]);

   // Version B  
   foreach (array[i])
       if (condition(array[i])) process(array[i]);
   Which is more efficient and why?

Question 44: This loop should print values 0 through 4, but it prints only 0. Why?
   int i = 0;
   while (i < 5) begin
      $display(i);
   end

Question 45: Why does this infinite loop occur and how would you fix it?
    for (int i=5; i>=0; i++) 
      $display("Countdown: %0d", i);

Question 46: What's the issue with this array processing code?
     int arr[5] = '{1, 2, 3, 4, 5};
     foreach (arr[i]) begin
        if (arr[i] == 3) 
          arr.delete(i);
     end

1. Variable Scope & Lifetime
Q1: What happens when you declare the same loop variable name in nested for loops? Does SystemVerilog allow this and what's the scope?

Q2: Consider this code:

systemverilog
for (int i=0; i<3; i++) begin
    int i = 10;
    $display(i);
end
What values get displayed and why?

Q3: In a generate loop, can you use break or continue statements? What are the limitations?

Q4: How does a return statement inside a loop affect the loop execution compared to break?

Q5: What's the difference between these two approaches for early loop termination?

systemverilog
// Approach A
for (int i=0; i<100; i++) begin
    if (condition) break;
    // processing
end

// Approach B  
for (int i=0; i<100 && !condition; i++) begin
    // processing
end

3. Performance & Optimization
Q6: Which is more efficient for large arrays and why?

systemverilog
// Method 1
for (int i=0; i < $size(array); i++)

// Method 2
int size = $size(array);
for (int i=0; i < size; i++)

// Method 3
foreach (array[i])
Q7: In a forever loop with timing controls, what's the impact of using #0 versus @(posedge clk) for synchronization?

4. Concurrent Loop Execution
Q8: You have multiple forever loops running in parallel processes. How can you coordinate their termination gracefully?

Q9: What happens when two parallel processes try to modify the same loop control variable simultaneously?

Q10: In a fork-join block, if one process has an infinite loop, how do other processes get executed?

11. Write a loop that iterates through a queue but skips every second element without using continue statements.
12. Implement a loop that processes a 3D array in reverse order (z, y, x) instead of the natural (x, y, z) order.
13. Create a foreach loop that only processes elements at even indices of a dynamic array.
14. Write a loop that finds all pairs of elements in an array that sum to a target value, without using nested loops.
15. Implement a timeout mechanism for a while loop that should break if a condition isn't met within specific simulation time.
16. Write a loop that traverses a associative array where keys are not consecutive integers.
17. Create a forever loop that executes exactly N times without using break statement.

18. Implement a loop that processes a circular buffer using any looping construct.
19. Write a loop that converts a while loop into equivalent for loop without changing the behavior.
20. Create a repeat loop where the repetition count is determined by a function that has side effects.

21. This code is supposed to copy array elements but has a bug. Identify it:
systemverilog
int src[5] = '{1,2,3,4,5};
int dst[5];
for (int i=0; i<=5; i++) begin
    dst[i] = src[i];
end
22. Why does this loop sometimes miss elements?
systemverilog
queue = '{1,2,3,4,5};
foreach (queue[i]) begin
    if (queue[i] % 2 == 0) begin
        queue.delete(i);
    end
end

23. What's the issue with this clock generator?
systemverilog
initial begin
    clk = 0;
    forever begin
        #5 clk = ~clk;
        if ($time > 100) break;
    end
end
24. Why does this loop create a simulation hang?
systemverilog
while (transaction_mailbox.num() == 0) begin
    // wait for transaction
end

25. Identify the race condition in this code:
systemverilog
bit done = 0;
initial begin
    fork
        begin
            for (int i=0; i<1000; i++) begin
                // process data
            end
            done = 1;
        end
        begin
            wait(done);
            $display("Processing complete");
        end
    join
end

Advanced Application Scenarios
26. You're building a scoreboard that compares expected vs actual transactions. Write a loop that handles transaction reordering with a window of N transactions.
27. Implement a loop for a memory tester that writes walking 1's pattern to all memory locations and verifies readback.
28. Create a loop for a packet generator that creates packets with random sizes but ensures the total doesn't exceed a maximum frame size.
29. Write a loop for a coverage collector that merges coverage from multiple test runs while excluding illegal bins.
30. Implement a loop for a sequence generator that produces Fibonacci sequence until it exceeds a maximum value.
31. Create a loop for a monitor that watches a bus and captures transactions until a timeout or reset occurs.
32. Write a loop for a constraint solver that retries randomization with different seeds until all constraints are satisfied.

33. Implement a loop for a scoreboard that matches request and response transactions using transaction ID.
34. Create a loop for a memory allocator that finds the first free block of requested size in a bitmap.
35. Write a loop for a CRC calculator that processes data in chunks with a sliding window.
Conceptual Deep Dive
36. How does SystemVerilog handle loop unrolling during synthesis versus simulation?
37. What are the implications of using non-constant loop bounds in synthesizable code?
38. Can you use loops to generate hardware instances? What are the rules and limitations?

39. How do forever loops in always blocks differ from forever loops in initial blocks for synthesis?
40. What's the difference between pre-test and post-test loops in terms of guaranteed execution?
41. How does SystemVerilog handle loop variables in terms of hardware implementation?
42. What are the simulation performance implications of deeply nested loops with large iteration counts?
43. How can you optimize loops for better simulation performance without changing functionality?
44. What's the difference between loop pipelining and loop unrolling in high-level synthesis?
45. How do you handle loop-carried dependencies in pipelined designs?

46. What does this code display and why?
systemverilog
int j = 0;
for (int i=0; i<5; i++) begin
    $display("i=%0d, j=%0d", i, j);
    j++;
    continue;
    j = 100; // will this ever execute?
end

47. Predict the output:
systemverilog
for (int i=0; i<3; i++) begin
    fork
        automatic int k = i;
        begin
            #(i*10);
            $display("k=%0d", k);
        end
    join_none
end
wait_fork;
48. What's the final value of count?
systemverilog
int count = 0;
repeat (5) begin
    for (int i=0; i<3; i++) begin
        if (i == 1) continue;
        count++;
    end
end

49. How many times is "Processing" displayed?
systemverilog
int arr[] = '{1,2,3,4,5};
foreach (arr[i]) begin
    if (arr[i] == 2) break;
    $display("Processing %0d", arr[i]);
    if (arr[i] == 4) continue;
end
50. What's the simulation time when this loop finishes?
systemverilog
initial begin
    for (int i=0; i<4; i++) begin
        #10;
        $display("Time: %0t", $time);
    end
end  
  
  
  
