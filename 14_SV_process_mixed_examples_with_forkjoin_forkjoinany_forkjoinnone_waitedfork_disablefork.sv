System Verilog Mixed examples with using forkjoin , forkjoinany, forkjoinnone, waitedfork, disablefork :

Key Interview Questions:
Q: Difference between disable fork and disable block_name?
A: disable fork kills processes; disable block_name jumps to end of block

Q: When to use join vs join_none vs join_any?
A: join=wait all, join_none=don't wait, join_any=wait one

Q: What's the execution model of fork-join?
A: Concurrent execution within the fork block

Q: How to handle clean termination?
A: Use wait fork + disable fork or named blocks

Q: Most common pitfall with fork-join?
A: Shared variable races and variable capture in loops

//////////////////
  Example-1
//////////////////
module mixed_fork_example1; 
   initial begin
     fork
       begin
         fork
           #10 $display("A : Executed at timestamp = %0tns", $time);
           #20 $display("B : Executed at timestamp = %0tns", $time);
         join_any
         $display("C : Executed at timestamp = %0tns", $time);
       end
       #5 $display("D : Executed at timestamp = %0tns", $time);
    join_none
    wait fork;
    $display("E : Executed at timestamp = %0tns", $time);
    // Complete timeline output?
  end
endmodule: mixed_fork_example1
     
//Logfile output
Contains Synopsys proprietary information.
Compiler version X-2025.06-SP1_Full64; Runtime version X-2025.06-SP1_Full64;  Feb  1 08:23 2026
D : Executed at timestamp = 5ns
A : Executed at timestamp = 10ns
C : Executed at timestamp = 10ns
E : Executed at timestamp = 10ns
B : Executed at timestamp = 20ns
           V C S   S i m u l a t i o n   R e p o r t       
  
//////////////////
  Example-2
//////////////////
module mixed_fork_example2; 
  initial begin
     fork: outer
       fork
         #30 $display("X: Executed at timestamp= %0tns", $time);
         #10 begin
           $display("Y: Executed at timestamp= %0tns", $time);
         disable fork;
        end
       join_any
       $display("Z: Executed at timestamp= %0tns", $time);
     join
      $display("W: Executed at timestamp= %0tns", $time);
     // What prints? What order?
   end
endmodule : mixed_fork_example2;   
         
//Logfile output
Contains Synopsys proprietary information.
Compiler version X-2025.06-SP1_Full64; Runtime version X-2025.06-SP1_Full64;  Feb  1 08:31 2026
Z: Executed at timestamp= 0ns
Y: Executed at timestamp= 10ns
W: Executed at timestamp= 10ns
X: Executed at timestamp= 30ns
           V C S   S i m u l a t i o n   R e p o r t          
      
//////////////////
  Example-3
//////////////////
module mixed_fork_example3; //The "Nested Madness"
  initial begin
    fork
     fork
       #10 $display("LEVEL1 : Executed at timestamp =%0tns", $time);
        fork
          #5 $display("LEVEL2 : Executed at timestamp =%0tns", $time);
        join_none
      join
      #15 $display("LEVEL2 : Executed at timestamp =%0tns", $time);
    join_any
    wait fork;
    $display("DONE : Executed at timestamp =%0tns", $time);
    // Output order with timing?
  end
endmodule: mixed_fork_example3   
      
//Logfile Output
Contains Synopsys proprietary information.
Compiler version X-2025.06-SP1_Full64; Runtime version X-2025.06-SP1_Full64;  Feb  2 06:55 2026
LEVEL2 : Executed at timestamp =5ns
LEVEL1 : Executed at timestamp =10ns
LEVEL2 : Executed at timestamp =15ns
DONE : Executed at timestamp =15ns
           V C S   S i m u l a t i o n   R e p o r t       

//////////////////
  Example-4
//////////////////
module mixed_fork_example4; //The "Timeout Trap"
  initial begin
    fork
      #100 $display("Success: Executed at timestamp =%0tns", $time);
      begin
        #10 $display("Timeout start : Executed at timestamp =%0tns", $time);
        fork
          #5 $display("Killing : Executed at timestamp =%0tns", $time);
          disable fork;
        join_any
        $display("Timeout end : Executed at timestamp =%0tns", $time);
      end
    join_any
    wait fork;
    $display("Final : Executed at timestamp =%0tns", $time);
    // What prints and what doesn't?
  end
endmodule: mixed_fork_example4   
      
//Logfile Output
Contains Synopsys proprietary information.
Compiler version X-2025.06-SP1_Full64; Runtime version X-2025.06-SP1_Full64;  Feb  2 06:59 2026
Timeout start : Executed at timestamp =10ns
Timeout end : Executed at timestamp =10ns
Killing : Executed at timestamp =15ns
Success: Executed at timestamp =100ns
Final : Executed at timestamp =100ns
           V C S   S i m u l a t i o n   R e p o r t       
      
//////////////////
  Example-5
//////////////////
module mixed_fork_example5; // The "Loop Variable Hell"
  initial begin
     for (int i = 0; i < 3; i++) begin
      fork
        #(i*5) $display("Task%0d: Executed at timestamp =%0tns", i, $time);
        begin
         #10;
         disable fork;
        end
      join_none
     end
     wait fork;
     $display("Complete: Executed at timestamp =%0tns", $time);
     // How many tasks print? What values?
   end
endmodule: mixed_fork_example5  
                   
//Logfile Output
Contains Synopsys proprietary information.
Compiler version X-2025.06-SP1_Full64; Runtime version X-2025.06-SP1_Full64;  Feb  2 07:03 2026
Task3:Executed at timestamp =15ns
Task3:Executed at timestamp =15ns
Task3:Executed at timestamp =15ns
Complete: Executed at timestamp =15ns
           V C S   S i m u l a t i o n   R e p o r t        

//////////////////
  Example-6
//////////////////
module mixed_fork_example6; //The "Order of Operations"
  initial begin
    fork
      begin
        fork
          #5 $display("A: Executed at timestamp=%0t",$time);
          #1 $display("B: Executed at timestamp=%0t",$time);
        join
        $display("C: Executed at timestamp=%0t",$time);
      end
      begin
        fork
          #3 $display("D: Executed at timestamp=%0t",$time);
        join_none
        $display("E: Executed at timestamp=%0t",$time);
      end
    join_any
    $display("F: Executed at timestamp=%0t",$time);
    wait fork;
    $display("G: Executed at timestamp=%0t",$time);
    // Execution sequence?
  end
endmodule : mixed_fork_example6 
//Logfile Output
Contains Synopsys proprietary information.
Compiler version X-2025.06-SP1_Full64; Runtime version X-2025.06-SP1_Full64;  Feb  5 09:25 2026
E: Executed at timestamp=0
F: Executed at timestamp=0
B: Executed at timestamp=1
D: Executed at timestamp=3
A: Executed at timestamp=5
C: Executed at timestamp=5
G: Executed at timestamp=5
           V C S   S i m u l a t i o n   R e p o r t       

//////////////////
  Example-7
//////////////////
module mixed_fork_example7; //The "Scope Confusion"
  initial begin
    fork: block1
      fork
        #20 $display("Inner1: Executed at timestamp=%0t",$time);
        #10 begin
          $display("Inner2 : Executed at timestamp=%0t",$time);
        disable fork;
        end
      join_none
      $display("Mid1: Executed at timestamp=%0t",$time);
    join_none
  
    fork: block2
       #5 $display("Outer: Executed at timestamp=%0t",$time);
    join_none
  
    wait fork;
    $display("End: Executed at timestamp=%0t",$time);
    // What's killed? What prints?
  end
endmodule : mixed_fork_example7  
      
//Logfile Output
Contains Synopsys proprietary information.
Compiler version X-2025.06-SP1_Full64; Runtime version X-2025.06-SP1_Full64;  Feb  5 09:26 2026
Mid1: Executed at timestamp=0
Outer: Executed at timestamp=5
End: Executed at timestamp=5
Inner2 : Executed at timestamp=10
Inner1: Executed at timestamp=20
           V C S   S i m u l a t i o n   R e p o r t      

//////////////////
  Example-8
//////////////////


//////////////////
  Example-9
//////////////////


//////////////////
  Example-10
//////////////////


//////////////////
  Example-11
//////////////////


//////////////////
  Example-12
//////////////////


//////////////////
  Example-13
//////////////////


//////////////////
  Example-14
//////////////////


//////////////////
  Example-15
//////////////////
  
  
