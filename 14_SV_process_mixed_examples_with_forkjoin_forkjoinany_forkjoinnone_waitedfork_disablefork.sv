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


//////////////////
  Example-3
//////////////////


//////////////////
  Example-4
//////////////////

//////////////////
  Example-5
//////////////////


//////////////////
  Example-6
//////////////////


//////////////////
  Example-7
//////////////////


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
  
  
