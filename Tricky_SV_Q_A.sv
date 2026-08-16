//------------------------------------------------------------------------------
////////////////////////////////////////////////////////////////////////////////
//(c) Copyright Siba Kumar Panda, All rights reserved
// File    : Tricky_SV_Q_A.sv
// Project : Tricky system verilog coding ,fundamental Questions and Answers
// Purpose : 
// Author  : Siba Kumar Panda
////////////////////////////////////////////////////////////////////////////////

1. AXI Trace file format for Perf verif 
   //AxADDR[53:0] | AR_AW | AxSIZE | AxLEN | AxBURST | AxCACHE | AxUSER[ATYPE[3:0]] | AxUSER[ATOMIC_EN] | AxUser[atomic opcode] | AxUSER[ATOMIC_RR]
     00000000002c00 READ 6 3 1 a 5 0 0 0
  
2. WAC to randomize in such a way that 0-31 having value as 1 and 32-61 having value as 0
class packet;
  rand int d[62];
  
  constraint c1 {
    d.size() == 62;
  }
  
  constraint c2 {
    foreach(d[i]) {
      if (i < 32)
        d[i] == 1;
      else
        d[i] == 0;
    }
  }
endclass :packet
      
module tb_top;
  packet pkt;
  initial begin
    pkt =new();    
    repeat (3) begin
      pkt.randomize ();     
      $display ("The Pattern is = %0p",pkt.d);      
    end 
  end
endmodule :tb_top
//Log File Output
 The Pattern is = '{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0} 
The Pattern is = '{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0} 
The Pattern is = '{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0} 
           V C S   S i m u l a t i o n   R e p o r t    
      
3. WAC to Generate non-repeating values of 0 to 9 without using randc keyword.
class packet;
  rand int d[10];

  constraint c1 { 
    foreach (d[i]) {           
      d[i] inside {[0:9]};
    }
  }
  
  constraint c2 { 
    unique {d};                 
  }
endclass : packet

module tb_top;
  packet pkt;
  
  initial begin
    pkt = new();    
    repeat (5) begin
      assert(pkt.randomize());
      $display("The values are = %0p", pkt.d);
    end 
    $finish;
  end
endmodule : tb_top
     
//Logfile Output
The values are = '{0, 5, 2, 8, 6, 3, 7, 9, 1, 4} 
The values are = '{3, 5, 6, 0, 8, 2, 9, 4, 1, 7} 
The values are = '{5, 9, 6, 8, 4, 7, 3, 1, 0, 2} 
The values are = '{5, 8, 0, 6, 9, 2, 7, 4, 1, 3} 
The values are = '{0, 2, 5, 1, 8, 3, 4, 7, 6, 9} 

The values are = '{0, 5, 2, 8, 6, 3, 7, 9, 1, 4} 
The values are = '{3, 5, 6, 0, 8, 2, 9, 4, 1, 7} 
The values are = '{5, 9, 6, 8, 4, 7, 3, 1, 0, 2} 
The values are = '{5, 8, 0, 6, 9, 2, 7, 4, 1, 3} 
The values are = '{0, 2, 5, 1, 8, 3, 4, 7, 6, 9}  
     
4. Solve the below Question:
//Given Initial array =     int arr[] = '{1, 9, 8, 4, 0, 0, 2, 7, 0, 6, 0};
//Final array, should be =  int arr[] = '{1, 9, 8, 4, 2, 7, 6, 0, 0, 0, 0};
module tb_top;
  int arr[] = '{1, 9, 8, 4, 0, 0, 2, 7, 0, 6, 0};
  
  initial begin
    int non_zero[];
    int zeros[];
    int q_non_zero[$];
    int q_zeros[$];
    
    $display("Initial array: %p", arr);
    
    // Find all non-zero elements (returns queue)
    q_non_zero = arr.find with (item != 0);
    
    // Find all zero elements (returns queue)
    q_zeros = arr.find with (item == 0);
    
    // Convert queue to array
    non_zero = q_non_zero;
    zeros = q_zeros;
    
    // Concatenate
    arr = {non_zero, zeros};
    
    $display("Final array:   %p", arr);
    $finish;
  end
endmodule : tb_top
     
5. Write a constraint to generate and print 1221 1221 1221 1
class pattern_gen;
  rand int d[13]; 
  constraint c1 {
    foreach (d[i]) {
      if (i inside {0, 3, 4, 7, 8, 11, 12}) {
        d[i] == 1;
      } else {
        d[i] == 2;
      }
    }
  }
endclass :pattern_gen
                
module tb_top;
   pattern_gen patrn;
   initial begin
     patrn =new();
     repeat(5) begin
       assert(patrn.randomize());
       $display("Array: %p\nPattern: 1221 1221 1221 1\n", patrn.d);
     end
   end
   
endmodule :tb_top
             
//Logfile Output
Compiler version X-2025.06-SP1_Full64; Runtime version X-2025.06-SP1_Full64;  Jul 20 22:17 2026
Array: '{1, 2, 2, 1, 1, 2, 2, 1, 1, 2, 2, 1, 1} 
Pattern: 1221 1221 1221 1

Array: '{1, 2, 2, 1, 1, 2, 2, 1, 1, 2, 2, 1, 1} 
Pattern: 1221 1221 1221 1

Array: '{1, 2, 2, 1, 1, 2, 2, 1, 1, 2, 2, 1, 1} 
Pattern: 1221 1221 1221 1

Array: '{1, 2, 2, 1, 1, 2, 2, 1, 1, 2, 2, 1, 1} 
Pattern: 1221 1221 1221 1

Array: '{1, 2, 2, 1, 1, 2, 2, 1, 1, 2, 2, 1, 1} 
Pattern: 1221 1221 1221 1  
       
6. Reverse the given string 
//input string = siba
//output string = abis

module reverse_string (
    input  logic [31:0] in,  // "siba"
    output logic [31:0] out  // "abis"
);
    
    assign out = {in[7:0], in[15:8], in[23:16], in[31:24]};
    
endmodule :reverse_string

module tb_top;
    logic [31:0] in, out;    
    reverse_string dut (in, out);
    
    initial begin
        in = "siba";
        #10;
        $display("Original: %s", in);
        $display("Reversed: %s", out);
      
        in = "pink";
        #10;
        $display("Original: %s", in);
        $display("Reversed: %s", out);
        $finish;
    end
endmodule :tb_top
       
//Logfile Output
Original: siba
Reversed: abis
Original: pink
Reversed: knip       
       
7. Write an assertion such that when signal ‘a’ becomes high, then after 1 clock cycle, signal ‘b’ must be high. 
   Do this without using the implication operator. (Hint: use ##.)
   property  p1;
       @(posedge clk)
        disable iff (reset)
        (a == 1'b1) ##1 (b == 1'b1)
   endproperty 

   assert property p1;

8. Write an assertion such that when signal ‘a’ becomes high, then after 5 to 10 clock cycles, signal ‘b’ must be high. Implement both:
       • Without using the implication operator.
           $rose(a) ##[5:10] (b == 1'b1)
       • With using the implication operator.
          $rose(a) |=> ##[5:10] (b == 1'b1)

9. Write an assertion such that when signal ‘a’ becomes high, then after 3 clock cycles until end of simulation (eventually), 
   signal ‘b’ must be high. Implement both:
       • Without using any implication operator.   
              $rose(a) ##3 (b == 1'b1) [*1:$]
      • With using the implication operator.
            $rose(a) |=> ##3 s_eventually (b == 1'b1)

10. Write an assertion to ensure that whenever signal ‘a’ has a rising edge (0→1, X→1, or Z→1), 
     signal ‘b’ must be high in the same clock cycle.
      $rose(a) |-> (b == 1'b1)

11. Write an assertion such that when signal ‘a’ is high, then in the same clock cycle the current value of signal ‘b’ retains 
    its value from the previous clock cycle
    
     (a == 1'b1) |-> (b == $past(b))

12. Write an assertion to ensure that whenever signal ‘valid’ is high, the signal ‘data’ must not contain any unknown value (x or z). 

      valid |-> !$isunknown(data)
        
13. Write an assertion that, when signal ‘a’ is high, then from the next clock cycle, signal ‘b’ should be checked for its 
    value for the previous two clock cycles.
   If b was high in that cycle, then the assertion passes; otherwise, it fails.
    
      a |=> ($past(b, 1) || $past(b, 2))

13. Write an assertion to demonstrate the difference between non-consecutive repetition and go-to repetition with any suitable example.

14. write a simple sv constraint to generate below pattern 1,2,2,3,3,3,4,4,4,4,5,5,5,5,5  
    class pattern_gen;
       rand int d[15];
       constraint c {
         foreach (d[i]) {                  
             if (i < 1)                     d[i] == 1; // Determine which number n appears at position i
             else if (i < 3)                d[i] == 2;
             else if (i < 6)                d[i] == 3;
             else if (i < 10)               d[i] == 4;
             else                           d[i] == 5;
          }
        }
     endclass :pattern_gen

15. How to generate a clock period of 2GHZ with 80% duty cycle and verify it using assertion.
// Frequency = 2GHZ , Clock Period =0.5ns
// 80% Duty cycle .Means Trise =0.4ns and Tfall =0.1ns 

`timescale 1ns / 1ps
module tb_clock_gen_with_2ghz_freq_dc_80percent;
  bit clk;
  
  // Clock generation
  always begin
    clk = 1'b1;
    #0.4;
    clk = 1'b0;
    #0.1;
  end
  
  // Assertion to check clock period
  property clk_period_check;
    realtime current_time;
    @(posedge clk)
    (('1, current_time = $realtime) |=> ($realtime - current_time == 0.5ns));
  endproperty
  
  clk_period_assert: assert property(clk_period_check)
    else $display("ERROR: Clock Period violation at %t", $realtime);
  
  // Assertion to check Rise time  
  property rise_time_check;
    realtime rise_time;
    @(posedge clk)
    (('1, rise_time = $realtime) |=> 
     @(negedge clk) 
     ($realtime - rise_time == 0.4ns));
  endproperty 
  
  rise_time_assert: assert property(rise_time_check)
    else $display("ERROR: Rise time violation at %t", $realtime);
    
  // Assertion to check Fall time  
  property fall_time_check;
    realtime fall_time;
    @(negedge clk)
    (('1, fall_time = $realtime) |=> 
     @(posedge clk) 
     ($realtime - fall_time == 0.1ns));
  endproperty 
  
    fall_time_assert: assert property(fall_time_check)
      else $display("ERROR: Fall time violation at %t", $realtime);   
  
  initial begin
    $display("Starting simulation To check Clock Period and Duty cycle");
    $dumpfile("clk.vcd");
    $dumpvars();
    #300;
    $display("=========================================");
    $display("Simulation completed successfully!");
    $display("=========================================");
    $finish();
  end
endmodule :tb_clock_gen_with_2ghz_freq_dc_80percent

16. WAC to randomize 10 times a single variable such that every time we get a large number as compared to previous value . So that all 10 numbers are in ascending order 
class packet;
  rand int y;
  int z;
  constraint c1 { y > z; }
  // Correct: Use built-in post_randomize() function
  function void post_randomize();
    z = y;
  endfunction
  
  // Display function
  function void disp();
    $display("y = %0d, z = %0d", y, z);
  endfunction
endclass :packet

module tb_top;
  packet pkt;  
  initial begin
    pkt = new();    
    $display("\n=== Printing y values in ascending order ===\n");    
    repeat (10) begin
      if (pkt.randomize()) begin
        pkt.disp();
      end else begin
        $display("Randomization failed!");
      end
    end    
    $finish;
  end
endmodule :tb_top  
       
//Logfile Output
=== Printing y values in ascending order ===
y = 722902786, z = 722902786
y = 1975962593, z = 1975962593
y = 2040517699, z = 2040517699
y = 2125937386, z = 2125937386
y = 2142932310, z = 2142932310
y = 2147367428, z = 2147367428
y = 2147432548, z = 2147432548
y = 2147483473, z = 2147483473
y = 2147483591, z = 2147483591
y = 2147483599, z = 2147483599  
       
17. Write a constraint to randomize 10 times a single variable such that every time we get a large number as compared to previous value . So that all 10 numbers are in ascending order 
     Now this question you can solve using an array 
class packet;
  rand int d[];  
  constraint c1 {
    d.size() == 10;            // 10 elements for 10 numbers
    foreach (d[i]) {
      d[i] inside {[0:100]};
    }
    unique {d};
  }

  constraint c2 {
    foreach (d[i]) {
      if (i < d.size() - 1) {
        d[i] < d[i+1];         // Ascending order
      }
    }
  }
  
  function void display();
    $display("Ascending numbers: %p", d);
  endfunction
endclass : packet

module tb_top;
  packet pkt; 
  initial begin
    pkt = new(); 
    $display("\n=== Ascending Numbers (10 elements) ===\n");   
    repeat (5) begin
      assert(pkt.randomize());
      pkt.display();
    end   
    $finish;
  end
endmodule : tb_top  
       
//Logfile Output
=== Ascending Numbers (10 elements) ===
Ascending numbers: '{25, 26, 33, 41, 44, 60, 70, 92, 94, 98} 
Ascending numbers: '{2, 3, 8, 13, 20, 43, 50, 74, 80, 85} 
Ascending numbers: '{31, 34, 40, 49, 69, 72, 96, 98, 99, 100} 
Ascending numbers: '{10, 16, 49, 50, 52, 66, 67, 70, 94, 98} 
Ascending numbers: '{15, 18, 32, 39, 42, 45, 66, 69, 78, 98}        
       
18. write an assertion to check when signal a is asserted it should stay asserted for at least 2 clk and not more than 8 clk cycles

          property p1;
	        @(posedge clk) 
	        disable iff(!rst) 
	        $rose(a)|-> a[*2:8] ##1 !a;
          endproperty

          stable_assert : assert property p1
	       else $error("error message");

19. For a synchronous FIFO of depth = 16, write an assertion for the following scenarios. Assume a clock signal(clk), write and read enable signals, full flag and a word counter signal.  
           a. If the word count is >15, FIFO full flag set.  // FIFO Full condition is  wp = rp+1;

                     property fifo_full;
	                   @(posedge clk) 
	                   disable iff(rst)
		                    (wc>15) |-> fifo_full;
                     endproperty 

         b. If the word count is 15 and a new write operation happens without a simultaneous read, then the FIFO full flag is set.

                 property read_full;
	               @(posedge clk) 
	                 disbale iif(rst)
		              ((wc==15)&& (wr_en && !rd_en)) |-> fifo_full;
                 endproperty

20. Write an assertion checker to make sure that an output signal y never goes X when valid is asserted? 

                 property p1;
	               @(posedge clk) 
	                 disbale iif(rst)
	                  valid |-> !($isunknown(y));
                 endproperty

21. Write an assertion to make sure that a 5-bit grant signal only has one bit set at any time?  

             @(posedge clk) 
                 grant |-> (($countones(grant)) == 1'b1;);          or

             @(posedge clk)
                  grant |-> $onehot(grant);                         or

             @(posedge clk) 
                   disable iff(rst) 
                  $onehot0(grant);

22. When signal_a is asserted, signal_b must be asserted, and must remain up until one of the signals signal_c or signal_d is asserted.
	
	property p1;
	     @(posedge clk) 
	      disable iff (rst)
	     signal_a |-> signal_b throughout (!(signal_c || signal_d))[*0:$] ;
	endproperty
          assert property p1;
   
23. If signal “a” is high on a given positive clock edge, then within 1 to 4 clock cycles, the signal “b” should be high.
	 
	    property p1;
	       @(posedge clk) 
	       disable iff (rst)
	       a |-> ##[1:4] b;
	    endproperty
       assert property p1;

24. If the signal “a” is high on given posedge of clock, then signal “b” should be high for 3 clock cycles followed by “c” should be high after ”b” is high for third time.
  
           property p1;
                @(posedge clk) 
                disable iff (rst)
               a |-> b[*3] ##1 c;
           endproperty
          assert property p1;

25. write a assertion to verify dut clock frequency of 10ns. (100MHZ)
	
	property p1;
	    realtime current_time; 
	    @(posedge clk)
	   (1, current_time = $realtime) |=> ($realtime-current_time =10)
	endproperty
	assert property p1; 

26. When req is high , grant should be asserted within 2 to 20 clk cycles until request should be high. In the next clk cycle, req should be low.
      property p_req_grant;
         @(posedge clk) 
         disable iff (rst)
         $rose(req) |-> (req throughout ##[2:20] grant) ##1 (!req) ;
      endproperty
      assert property p1; 

27. Write a SV assertion that monitors for an ack. If the ack is not received within 500clks, it issue an error.
      property ack_500clk;
	         @(posedge clk) 
	         disable iif(rst)
		       !ack |-> ##[1:500] ack;
      endproperty
      assert property ack_500clk; 
		  
28. Write a system Verilog assertion for the below requirements 
  - There are around four request coming from master 
  - for all these four requests , ack needs to come . If ack is not coming for any request ,It need to through error.
  - Note that we donot know for each request , when the ack needs to come . there is no timeline actually .
  - And also , these request and ack mechanism , may be follow out of order also.

   logic [1:0] req_cnt, ack_cnt;

   always @(posedge clk or negedge rst_n)
      if (!rst_n) 
	     {req_cnt, ack_cnt} <= 0;
      else begin
         req_cnt <= req_cnt + req;
         ack_cnt <= ack_cnt + ack;
      end

   property p1;
     @(posedge clk) disable iff (!rst_n)
     (req_cnt == 4) |-> (ack_cnt == 4);
   endproperty
		  
  assert property (p1) 
	else $error("Ack missing!");

29. Write a SystemVerilog class representing an execution sequence.
    It contains a dynamic array of 8-bit variables called commands.
    The array size must be randomized between 10 and 20 elements.
    Core Rule: No two identical commands can be next to each other in the array

  class packet;
      rand bit [7:0] d[];  // 8-bit commands
      // Constraint 1: Size between 10 and 20
	  constraint c1 { d.size() inside {[10:20]};}
      // Constraint 2: No adjacent identical commands
	  constraint c2 { foreach (d[i]) {
                        if (i > 0) {
                           d[i] != d[i-1];
                         }
                       }
                     }
  endclass : packet

module tb_top;
  packet pkt; 
  initial begin
    pkt = new();
    
    $display("\n========================================");
    $display("   EXECUTION SEQUENCE");
    $display("========================================\n");
    
    repeat (5) begin
      assert(pkt.randomize());
      $display ("The values in the array are = %0p",pkt.d);
    end    
    $finish;
  end
endmodule : tb_top

//Logfile Output
========================================
   EXECUTION SEQUENCE
========================================
The values in the array are = '{'hb3, 'hf7, 'hf0, 'h41, 'h71, 'hfa, 'h53, 'h42, 'hea, 'h69, 'h99, 'h87} 
The values in the array are = '{'hd8, 'h3f, 'h7, 'h80, 'hcd, 'hbd, 'h4, 'h6, 'h32, 'h6e, 'h22, 'h14} 
The values in the array are = '{'hfa, 'h81, 'hb9, 'h4f, 'hb1, 'h58, 'hf6, 'hff, 'h66, 'hfc, 'hb9, 'h7c, 'h6c, 'h24, 'hd4, 'h24} 
The values in the array are = '{'h19, 'ha9, 'h7e, 'ha7, 'hfb, 'h80, 'h86, 'h29, 'hf1, 'hb2, 'haa, 'h89, 'h54, 'hd8, 'h87, 'h6d, 'hb8, 'hf0} 
The values in the array are = '{'h26, 'h67, 'h6c, 'ha7, 'h2e, 'h74, 'hc8, 'hfb, 'ha9, 'h64, 'h52, 'haf} 
		  
30. Write a SVA for the below requirement.
    Req is asserted at time t0, 
    once request is asserted 2 to 5 clks acknowledgement should come.
    But, in between request to acknowledgement there should not be any 2nd request.

    // Assertion 1: Ack within 2-5 cycles
    property p_ack;
        @(posedge clk) 
		disable iff (!rst_n)
        $rose(req) |-> ##[2:5] ack;
    endproperty
    assert property (p_ack) 
     else $error("Ack missing!");

    // Assertion 2: No second request before ack
   property p_no_req;
      @(posedge clk) 
	    disable iff (!rst_n)
      $rose(req) |-> (!req) throughout ##[0:4];
   endproperty
   assert property (p_no_req) 
      else $error("Second request before ack!");
		  
31. Lets consider a Memory has 4 locations. 
    You have to write the FC groups and FC point that should represent that, all memory locations have been exercised by write.
	   
    covergroup cg @(posedge clk);
        // Address coverage - all 4 locations
       cp_addr: coverpoint addr {
            bins valid_addr[] = {[0:3]};  // Covers 00, 01, 10, 11
        }
  
      // Write/Read coverage - only write
      cp_wr_rd: coverpoint wr_rd {
          bins write = {1};  // Only cover when wr_rd = 1 (write)
        }
		
       // Cross coverage: All 4 addresses must be written
      cp_all_written: cross cp_addr, cp_wr_rd;
    endgroup
    // Instantiate and sample method
    cg cg_inst = new();
	cg_inst.sample();   
		  
32. WAC to genearte a NxN matrix where all diagonal elelments are having value 0
class packet #(int N = 3);
  rand bit [1:0] mat[N][N];
  
  constraint c1 {
    foreach (mat[i]) {
      foreach (mat[j]) {
        // Diagonal: i == j
        // Anti-diagonal: i + j == N-1
        if (i == j || i + j == N-1) {
          mat[i][j] == 0;
        }
      }
    }
  }
  
  function void display();
    $display("Matrix:");
    foreach (mat[i]) begin
      foreach (mat[j]) begin
        $write("%0d ", mat[i][j]);
      end
      $display("");
    end
  endfunction
endclass : packet

module tb_top;
  packet #(4) pkt;  // 4x4 matrix
  
  initial begin
    pkt = new();
    assert(pkt.randomize());
    pkt.display();
    $finish;
  end
endmodule : tb_top
		  
//Log file output
Matrix:
0 1 0 0 
3 0 0 3 
0 0 0 0 
0 1 3 0 
$finish called from file "testbench.sv", line 36.		  

33. WAC to generate 122333444455555 pattern , Create with a generalized logic
class pattern_gen;
  rand int d[];
  rand int num;
  constraint c1 { num inside {[2:10]}; }
  constraint c2 { d.size() == (num * (num + 1)) / 2; }
  
  function void post_randomize();
    int idx = 0;
    for (int n = 1; n <= num; n++)
      for (int j = 0; j < n; j++)
        d[idx++] = n;
  endfunction
  
  function void display();
    $write("Pattern (num=%0d, size=%0d): ", num, d.size());
    foreach (d[i]) $write("%0d", d[i]);
    $display("");
  endfunction
endclass :pattern_gen

module tb_top;
  pattern_gen pg = new();
  initial begin
    repeat (5) begin
      assert(pg.randomize());
      pg.display();
    end
    $finish;
  end
endmodule :tb_top	

//Logfile Output
Pattern (num=5, size=15): 122333444455555
Pattern (num=7, size=28): 1223334444555556666667777777
Pattern (num=8, size=36): 122333444455555666666777777788888888
Pattern (num=6, size=21): 122333444455555666666
Pattern (num=4, size=10): 1223334444
$finish called from file "testbench.sv", line 34.
	
34. WAC to generate unique values in an array of random size
       1. without using the unique method
       2. with using the unique method
  class packet;
     rand int d[];
     rand int size;
     constraint c_size { size inside {[5:10]};
                         d.size() == size;
                       }
	 constraint c_range { foreach (d[i]) {
                          d[i] inside {[0:20]};
                         }
                        }
 
	 constraint c_unique { foreach (d[i]) {
		                      foreach (d[j]) {
                                  if (i != j) {
                                       d[i] != d[j];
                                    }
                                 }
                              }
                         }
         
// constraint unique_c {unique{d};} 
endclass : packet

module tb_top;
  packet pkt;
  initial begin
    pkt = new();   
    $display("\n=== Unique Values Without unique Method ===\n");    
    repeat (5) begin
      assert(pkt. randomize());
      $display("Array size=%0d: Array values= %p", pkt.d.size(), pkt.d);
    end   
    $finish;
  end
endmodule : tb_top

//LogFile Output
=== Unique Values Without unique Method ===
Array size=9: Array values= '{15, 3, 18, 20, 12, 11, 4, 5, 14} 
Array size=7: Array values= '{10, 17, 1, 9, 2, 15, 19} 
Array size=8: Array values= '{13, 3, 12, 7, 20, 6, 14, 8} 
Array size=6: Array values= '{1, 5, 16, 0, 7, 15} 
Array size=5: Array values= '{9, 13, 3, 8, 20} 
$finish called from file "testbench.sv", line 48.								  

35. WAC for 1bit array such that , the values of the array can have 2 consucative 1's , but more than 
    2 consucative 1's should not . Also The size of the array can be random
    Means the pattern could be 0,1,0,1,1,0,1,0,1,1,0
    but it should not be  0,1,0,1,1,1,0,1,0,1,1,1,0,1,0
	
class packet;
  rand bit d[];
  rand bit [3:0] d_size; 
  constraint c1 { d.size() == d_size ;}
  
 /* constraint c_size { d_size inside {[5:10]};
                     d.size() == d_size;
                     }                   
 */ 
  constraint c_no_3_ones { foreach (d[i]) 
                            {
                            if (i >= 2)                             
                               !(d[i-2] == 1 && d[i-1] == 1 && d[i] == 1);
      
                            }
                          }
endclass : packet
    
module tb_top;
  packet pkt; 
  initial begin
    pkt = new();   
    $display("\n=== The Generated Pattern is ===\n");   
    repeat (5) begin
      assert(pkt. randomize());
      $display("Array size=%0d: Array values= %p", pkt.d.size(), pkt.d);
    end   
    $finish;
  end
endmodule : tb_top    
    
//LogFile Output
=== The Generated Pattern is ===
Array size=13: Array values= '{'h0, 'h0, 'h0, 'h1, 'h0, 'h0, 'h1, 'h1, 'h0, 'h0, 'h1, 'h0, 'h0} 
Array size=6: Array values= '{'h1, 'h0, 'h1, 'h0, 'h0, 'h0} 
Array size=1: Array values= '{'h0} 
Array size=2: Array values= '{'h1, 'h0} 
Array size=4: Array values= '{'h1, 'h1, 'h0, 'h1} 
$finish called from file "testbench.sv", line 47.
$finish at simulation time                    0
           V C S   S i m u l a t i o n   R e p o r t 	

36. WAC to ensure that two circles in a xy plane should not touch with each other
   //Logic: Distance between centers > Sum of radii
   //(x2 - x1)² + (y2 - y1)² > (r1 + r2)²

class circle;
  rand int x1, y1, x2, y2;
  rand int r1, r2;
  
  constraint c_range {
    x1 inside {[0:50]};
    y1 inside {[0:50]};
    x2 inside {[0:50]};
    y2 inside {[0:50]};
    r1 inside {[1:10]};
    r2 inside {[1:10]};
  }
  
  constraint c_no_touch {
    (x2 - x1)*(x2 - x1) + (y2 - y1)*(y2 - y1) > (r1 + r2)*(r1 + r2);
   } 
    
endclass : circle

module tb_top;
  circle pkt;  
  initial begin
    pkt = new();   
    $display("\n========================================");
    $display("   CIRCLES SHOULD NOT TOUCH");
    $display("========================================\n");
    
    repeat (5) begin
      assert(pkt.randomize());
      $display("C1: Center(%0d,%0d) R=%0d", pkt.x1, pkt.y1, pkt.r1);
      $display("C2: Center(%0d,%0d) R=%0d", pkt.x2, pkt.y2, pkt.r2);
      $display("*********************************************\n");
    end  
    $finish;
  end
endmodule : tb_top
    
//LogFile Output
========================================
   CIRCLES SHOULD NOT TOUCH
========================================

C1: Center(9,13) R=4
C2: Center(10,27) R=9
*********************************************

C1: Center(33,24) R=9
C2: Center(12,41) R=1
*********************************************

C1: Center(34,47) R=4
C2: Center(31,25) R=6
*********************************************

C1: Center(47,25) R=8
C2: Center(38,46) R=2
*********************************************

C1: Center(30,22) R=8
C2: Center(11,37) R=8
*********************************************
						  
37. Write a SV code/Constraint for finding 2nd largest no in an Array
  class packet;
     rand int d[];
     int second_largest;
     constraint c_size {
        d.size() inside {[5:10]};
      }
	  
     constraint c_range {
         foreach (d[i]) {
         d[i] inside {[0:30]};
        }
     }
  
    function void post_randomize();
      int temp[];
      temp = d;
      temp.sort();
    
      // Find 2nd largest from the end
      for (int i = temp.size()-2; i >= 0; i--) begin
        if (temp[i] != temp[temp.size()-1]) begin
          second_largest = temp[i];
          break;
        end
      end
    endfunction
  
    function void display();
      $display("Array (size=%0d): %p", d.size(), d);
      $display("2nd Largest: %0d", second_largest);
    endfunction    
  endclass :packet
    
module tb_top;
  packet pkt;
  initial begin
    pkt=new();
    repeat (5) begin
      pkt.randomize();
      pkt.display();
    end
  end 
endmodule :tb_top
		 
//Log File Output		 
Contains Synopsys proprietary information.
Compiler version X-2025.06-SP1_Full64; Runtime version X-2025.06-SP1_Full64;  Aug  6 23:13 2026
Array (size=6): '{29, 6, 22, 1, 3, 30} 
2nd Largest: 29
Array (size=6): '{0, 29, 23, 4, 15, 19} 
2nd Largest: 23
Array (size=8): '{22, 23, 14, 14, 25, 9, 9, 9} 
2nd Largest: 23
Array (size=9): '{15, 18, 24, 26, 11, 6, 26, 30, 5} 
2nd Largest: 26
Array (size=6): '{13, 8, 20, 16, 18, 6} 
2nd Largest: 18
           V C S   S i m u l a t i o n   R e p o r t 
		 
38. WAC to generate 9, 99, 999 ,9999,99999 Pattern
   class packet;
     rand int d[];
     constraint c1 { d.size ==5;}
     constraint c2 { foreach (d[i])
                       d[i] ==  10**(i+1) -1;  
                }
  
   endclass :packet

   module tb_top;
      packet pkt; 
       initial begin
        pkt =new();
       repeat (5) begin
         pkt.randomize();
         $display ("The generated Pattern is =%0p",pkt.d) ;    
       end   
       end 
   endmodule :tb_top

 //Logfile out
  The generated Pattern is ='{9, 99, 999, 9999, 99999} 
  The generated Pattern is ='{9, 99, 999, 9999, 99999} 
  The generated Pattern is ='{9, 99, 999, 9999, 99999} 
  The generated Pattern is ='{9, 99, 999, 9999, 99999} 
  The generated Pattern is ='{9, 99, 999, 9999, 99999} 
           V C S   S i m u l a t i o n   R e p o r t 
	
39. WAC to generate pattern of 0,4,8,12,16,20
   class packet;
      rand int d[];
      constraint c1 { d.size ==6;}
      constraint c2 { foreach (d[i])
                      if (i==0)
                        d[i] == 0;
                      else
                        d[i] ==  d[i-1]+4;    
                }
  
    endclass :packet
	module tb_top;
      packet pkt; 
       initial begin
        pkt =new();
       repeat (5) begin
         pkt.randomize();
         $display ("The generated Pattern is =%0p",pkt.d) ;    
       end   
       end 
   endmodule :tb_top

	//Logfile Output
	The generated Pattern is ='{0, 4, 8, 12, 16, 20} 
    The generated Pattern is ='{0, 4, 8, 12, 16, 20} 
    The generated Pattern is ='{0, 4, 8, 12, 16, 20} 
    The generated Pattern is ='{0, 4, 8, 12, 16, 20} 
    The generated Pattern is ='{0, 4, 8, 12, 16, 20} 
           V C S   S i m u l a t i o n   R e p o r t 
    
40 . Write an assertion to detect glitch in a signal
	
module glitch_detector_stable (
  input logic clk,
  input logic rst_n,
  input logic signal
);

  // 1st method : Signal must be stable between clock edges
  property p_stable_signal;
    @(posedge clk)
    disable iff (!rst_n)
    $stable(signal);
  endproperty

  assert_stable: assert property (p_stable_signal)
    else $error("[%t] Glitch detected! Signal changed within clock cycle", $time);

  // Alternative way : To Detect signal goes low then high within same clock cycle
  property p_no_negative_glitch;
    @(posedge clk)
    disable iff (!rst_n)
    ($rose(signal)) |-> ##1 (signal == 1);
  endproperty

  assert_no_neg_glitch: assert property (p_no_negative_glitch)
    else $error("[%t] Negative glitch detected (1→0→1)", $time);

endmodule

41. WAC to generate an array of size 10 where every odd index has a random value and every even index value is the sum of its two neighbours.
   class packet;
	  rand int d [];
	  constraint c1 {d.size()== 10;}
	  constraint c2 { foreach (d[i])
			                if (i % 2 == 0)
							  if (i>0 && i < d.size()-1)
							    d[i] = d[i-1] + d[i+1];
							else if (i ==0)
                                d[0] == d[1];							
			         }
	endclass
	
42. WAC for AXI 4KB boundary scenario
	class packet;
	   rand bit [15:0] awaddr;
	   rand bit [1:0]  awburst ;
       rand bit [2:0]  awlen;  // Burst len = awlen+1;
       rand bit [3:0]  awsize; // Burst size = 2** (awsize)
	   constraint c1_4kb { awaddr % 4096 == 0 && 2** (awsize) * (awlen+1) <= 4096 ;}		   
	endclass
	
43. WAC to generate Fibonacci series of numbers as [0,1,1,2,3,5,8,13,21,34]
	class packet;
		rand int d [];
		constraint c1 {d.size () == 10;}
		constraint c2 { foreach (d[i])
		                    if (i==0)
							 d[i] ==0;
							else if (i==1)
                             d[i] ==1;
                            else 
                             d[i] == d[i-1] + d[i-2];							
		                 }
	 endclass
	
44. WAC to generate pattern as 0000, 0001, 0011, 0111, 1111
	class packet;
        //rand bit [3:0] d [5];
        rand bit [3:0] d [];
        constraint c1 {d.size()== 5;}
		constraint c2 { foreach (d[i]) {
                            d[i] == (1 << i) - 1;  // 0, 1, 3, 7, 15
                                }
                      }
	endclass : packet
    module tb_top;
       packet pkt;
       initial begin
          pkt = new();
        repeat(5) begin
          assert(pkt.randomize());
            $display("data = %p", pkt.d);
            foreach(pkt.d[i]) 
               $write("%04b ", pkt.d[i]);
               $display();
        end
      end
    endmodule :tb_top
					   
45. WAC to generate total no of 1's are of 10 and none of the 1's are beside each other in a 32 bit random variable.
	Means , No two 1's can be adjacent with each other.
	
	class packet;
       rand bit [31:0] data;
       constraint c1 { $countones(data) == 10;}  //Constraint1: Exactly 10 ones
       constraint c2 { foreach(data[i]) {
                          if (i < 31)
							  !(data[i] == 1 && data[i+1] == 1);  //Constraint2: No adjacent ones, No "11" pattern
                            }
                        }
     endclass :packet
		   
     module tb_top;
        packet pkt;
          initial begin
            pkt = new();
           repeat(10) begin
             assert(pkt.randomize());
             $display("data = %032b", pkt.data);
             $display("Number of ones = %0d", $countones(pkt.data));
           end
         end
     endmodule
		
46. WAC to generate pattern as 123454321
	class packet;
	   rand int d [];
	   constraint c1 {d.size()== 9;}
	   constraint c2 {foreach (d[i])
		                 if (i < 5)
						   d[i] == i+1;
						 else 
                           d[i] == d[i-1] -1; 
                           //d[i] == 9 - i;		// This logic will also work				   
		              }
	endclass :packet
	
47. WAC to generate random unique numbers without using unique keyword
	class packet;
	   rand int d[];
	   constraint c1 {d.size() == 10;}
	   //constraint c2 { foreach (d[i]) // Using unique kyword
		                   unique {d};
		                }
		constraint c3 { foreach (d[i])
		                  foreach (d[j]) 
						      if(i != j)
							    d[i] != d[j]
						  }
	 endclass
	   
48. WAC for below scenario 
	1. a , b random variables . Generate random numbers for a & b . 
	2. It should satisfy below conditions:
	          if a is even , b is odd 
	          if a is odd ,  b is even
				  
	class packet ;
	  rand bit [3:0] a;
	  rand bit [3:0] b;
	  constraint c1 { (a % 2 == 0) -> (b % 2 != 0);
                      (a % 2 != 0) -> (b % 2 == 0);
                        }
	  //constraint c1 { a[0] != b[0];  } // LSB must be different, This logic will also work

    endclass
		
49. WAC to generate random numbers between 3.4 to 5.6
	class packet;
        rand int d [];
        real d_float[5];
        constraint c1 {d.size()==5;}
        constraint c2 { foreach (d[i])
                            d[i] inside {[34:56]};
                       }
  
         function void post_randomize();
            foreach(d[i]) begin
              d_float[i] = d[i] / 10.0;
            end
         endfunction
    endclass :packet
	
     module tb_top;
          packet pkt;
          initial begin
             pkt = new();
            repeat(5) begin
              pkt.randomize();
              $display("Original Values: %p", pkt.d);
              $display("Required Float Values : %p", pkt.d_float);
              $display("------------------------");
            end
         end
      endmodule :tb_top
	
50. Write a system Verilog code to arrange numbers in Descending order :  7 , 3, 9 , 2 , 5 , 1 , 4
	Make sure Do not use constraints and inbuild functions
	class packet
	   rand int d[] ;
	   constraint c1 {d.size ()== 10;}
	   constraint c2 { foreach (d[i])           // constraint for Descending order- Decreasing order
		                    if (i < d.size()-1)
						      d[i] > d [i+1];
		             }
	   constraint c3 { foreach (d[i])           // constraint for Ascending order
		                  if (i < d.size()-1)
						      d[i] < d [i+1];
		             }				  
	endclass :packet
		
	//System verilog code to perform same thing , Make sure Do not use constraints and inbuild functions
	module tb_packet
	   int d[] = `{7 , 3, 9 , 2 , 5 , 1 , 4};
	   int temp;  
	   initial begin
		   foreach d[i] begin
		     if (i < 7) begin
			   d[i] > d[i+1];
			   temp = d[i];       // Save original d[i]
               d[i] = d[i+1];     // Put d[i+1] in d[i]
               d[i+1] = temp;     // Put saved original d[i] in d[i+1]
			 end			 
		   end
		   $display ("The original values are =%0p",d);
		   $display ("The values in Descending order are =%0p",temp);
		 end
	 endmodule : tb_packet
	
51. WAC to generate even numbers in odd locations and odd numbers in even location in an array .
	class packet;
	  rand int d[];
	  constraint c1 {d.size()== 10;}
	  constraint c2 {foreach d[i]
		                if (i %2==0)
							d[i] %2 == 1;
						else 
							d[i] %2 == 0 ;
		                }
						
	  //constraint c3 {foreach (d[i]) {   // This constraint logic will also work
                          d[i] % 2 == (i % 2 == 0) ? 1 : 0;
                             d[i] inside {[0:50]};
                           }
                        }
	endclass
		
52. WAC to generate 10 random numbers and then arrange them 
	In ascending order 
	In descending order
	
	class packet
	   rand int d[] ;
	   constraint c1 {d.size ()== 10;}
	   constraint c2 { foreach (d[i])           // constraint for Descending order
		                 if (i < d.size()-1)
						     d[i] > d [i+1];
		             }
	   constraint c3 { foreach (d[i])           // constraint for Ascending order
		                    if (i < d.size()-1)
						      d[i] < d [i+1];
		                  }				  
	 endclass				 
						 
53. WAC to generate multiples of  without using any operator
	
54. WAC to generate powers of 2 without any operator
	
55. calculate values for c and d :
	a   = 1001 , b  = 0110
	c = a & b  //This is bit wise AND operator , so c = 0000 
	d = a && b //This is Logical AND operator , so d = 1 && 1 = 1
	
56. find values of time, a ?
	int a =5;
	fork
	  begin
	     #2 a<=10;
	     $display("time = %t , a = %d",$time, a);      
	  end
	  begin
	     #3 a=12;
	     $display("time = %t , a = %d",$time, a);    
	   end
	   begin
	     #6 a<=14;
	     $display("time = %t , a = %d",$time, a);    
	   end
	     #4 a=10;
	     $display("time = %t , a = %d",$time, a);      
	  join_any
	     $display("time = %t , a = %d",$time, a);
		 
	  //Answer
       time = 2 , a = 5
       time = 3 , a = 12
       time = 4 , a = 10
       time = 4 , a = 10
       time = 6 , a = 10	
	
57. WAC to generate this pattern :  11222333344444 
	class packet;
       rand int count;
	   int d[];     // Not rand - we build it
       constraint c1 { count inside {[1:10]};}
       function void post_randomize();
         d.delete();  // Delete all elements
         for (int val = 1; val <= count; val++) begin
           repeat (val + 1) begin
             d = {d, val};  // Build the pattern
           end
         end
       endfunction
     endclass :packet

    module tb_top;
      packet pkt;
       initial begin
        pkt =new();
         repeat(5) begin
           pkt.randomize();
           $display ("Count = %0d ,The Generated Pattern is = %0p",pkt.count,pkt.d);
       end
     end
    endmodule :tb_top

58. WAC to generate this pattern :  00110011
	class packet;
        rand int d[];
        constraint c1 { d.size() == 8;}
        // Constrain values to 0 and 1 only
        constraint c2 { foreach(d[i]) 
                      d[i] == (i/2) %2 ;
                      }
    endclass :packet
    module tb_top;
       packet pkt;
        initial begin
         pkt =new();
         repeat(5) begin
          pkt.randomize();
          $display ("The Generated Pattern is = %0p",pkt.d);
         end
       end
    endmodule :tb_top

59. Write a SVA to check that if req is asserted, ack must follow within 2 to 5 clock cycles, and 
	grant must not be asserted until ack arrives.
	   
	property p1;
		@(posedge clk)
		disable iff (!rst_n)
		$rose(req) |-> (!grant) throughout ##[2:5] ack;	
	endproperty
	assert property p1; 
		
60. Difference between  a[*3] and a[=3] and a[->3]?
		
	a[*3] -  Its Consecutive repetition operator.             
		     Meaning , a must be true for 3 consecutive cycles	  
	a[=3] - Its Non-consecutive repetition operator        
		    Meaning ,a must be true 3 times (not necessarily consecutive)
	a[->3] - Its also Non-consecutive repetition (GoTo) operator . 
		     Meaning, a must be true 3 times (not necessarily consecutive) ,but here before arrival of next variable , a variable should be present
	   
61. WAA for a raises [ 5:8 ] , b also raise
	property p1;
	   @(posedge clk)
	   disable iff (!rst_n)
	   $rose(a)[->5:8] ##1 $rose(b);
	endproperty
	assert property p1;
	
62. WAA such that : ready should be asserted at least 2 clock cycles before valid is asserted
	property p1;
	  @(posedge clk)
	  disable iff (!rst_n)
	  $rose(valid) |-> ($past(ready, 1) && $past(ready, 2));
	  // (ready == 1) throughout ##2 $rose(valid); // This is also correct
	endproperty
	assert property p1;
		
63. WAA such that if assertion is enable there is up counter , else down counter
	property p1;
       @(posedge clk)
       disable iff (!rst_n)
       (enable == 1) |-> (count == $past(count) + 1);
       (enable == 0) |-> (count == $past(count) - 1);
    endproperty
	assert property p1;
		 
64. WAA for generating 200 MHz clock with 50 % duty cycle
	100MHZ - 10ns
	200MHZ - 5ns
	300MHZ - 2.5ns
	400MHZ - 1.25ns
	Given f= 200MHZ , T = 5ns , Ton =2.5ns , Toff =2.5ns
	module tb_top;
	   bit clk;
	   always begin
		 #2.5 clk= ~clk;
	   end
	 endmodule :tb_top
	 property p1;
		realtime current_time;
		time     time_period = 5;
		 @ (posedge clk)
		 (1 , current_time = $realtime) |=> ($realtime - current_time == time_period);
	 endproperty
	 assert property p1;
		
65. WAA for generating 400 MHZ clock with 60 % duty cycle
	f= 400MHZ , T = 1.25ns , 
	Given DC =60 % 
	Ton  = 60% 1.25 = 0.75ns
	Toff = 40% 1.25 = 0.5ns
	   
	module tb_top;
	   bit clk;
	   always begin
		 clk = 1;
		  #0.75;
		 clk = 0;
		  #0.5;
		end  
	 endmodule :tb_top
	   
	 property p1;
	    realtime current_time;
		time trise= 0.75 ;
		  @ (posedge clk)
		  (1 , current_time = $realtime) |=>
		  @ (negedge clk)
		  ($realtime - current_time == trise) ;  
	  endproperty 
	  assert property p1;
	   
	   property p2;
	      realtime current_time;
		  time tfall= 0.25 ;
		  @ (negedge clk)
		  (1 , current_time = $realtime) |=>
		  @ (posedge clk)
		  ($realtime - current_time == tfall) ;
	   endproperty 
	   assert property p2;
	 
66. WAA such that : a should become one , once b and  c is 1
	property p1;
        @(posedge clk)
        disable iff (!rst_n)
        (b && c) |-> (a ==1);
    endproperty
	assert property p1;
	     
67. WAA such that a is active , b is active , c is inactive and o/p :x within 50ms
	property p1;
       realtime t;
       @(posedge clk)
       disable iff (!rst_n)
       (a && b && !c, t = $realtime) |=> (x == 1) and ($realtime - t <= 50ms);
     endproperty
     assert property (p1)
	   
68. WAA such that : input signal data_in must be stable for at least 10ns before the rising edge of the clock clk
	property p1;
        @(posedge clk)
        disable iff (!rst_n)
        $stable(data_in, 10ns);
    endproperty
    assert property (p1)
		
69. WAA to check the frequency for a clock of 100MHZ
	f =100 MHZ , T =10ns
	property p1;
	   realtime current_time;
	   time  time_period = 10; 
	    @ (posedge clk)
		(1 , current_time = $realtime) |=> ($realtime - current_time == time_period);
	endproperty
	assert property p1;
	 
70. WAA to detect clock pulse
	property p_clock_pulse_any;
        @(posedge clk)
        disable iff (!rst_n)
        $rose(clk) |=> $fell(clk);
    endproperty
	assert property p1;
		
71. WAA to detect clock pulse with specific width
    property p_clock_pulse_width;
        realtime current_time;
        @(posedge clk)
        disable iff (!rst_n)
        (1'b1, current_time = $realtime) |=> $fell(clk) and ($realtime - current_time > 0);
    endproperty	
	assert property p1;
	
	Functional coverage :
	
	1. Lets say ,You are verifying a packet scheduler. 
	    You have a coverpoint for packet_size (small, medium, large) and a coverpoint for error_type (none, crc_err, length_err). 
	    You need to cross them, but length_err is physically impossible with a small packet. 
	    How do you implement this to ensure 100% coverage is achievable?
		
		//covergroup packet_scheduler_cg with function sample(bit [7:0] packet_size, bit [2:0] error_type);
		
		covergroup packet_scheduler_cg ;
              packet_size_cp: coverpoint packet_size {
                                         bins small  = {[0:63]};
                                         bins medium = {[64:127]};
                                         bins large  = {[128:255]};
                                       }
    
             error_type_cp:   coverpoint error_type {
                                         bins none       = {0};
                                         bins crc_err    = {1};
                                         bins length_err = {2};
                                         }
            // Do the Cross coverage between above two cp and Ignore the impossible combination
             cross_cp: cross packet_size_cp, error_type_cp {
        
                                         ignore_bins small_pkt_length_err = binsof(packet_size_cp.small) && 
										                                    binsof(error_type_cp.length_err);
                                                           }
        endgroup
	
	2. How RAL will help in functional coverage
	
	3. Difference between illegal ins and ignore bins.
	
	   illegal_bins	-Marks combinations that should never occur
	                 Causes a simulation error if hit
	              
	   
	   ignore_bins -Marks combinations that are not interesting or impossible
	                Silently excludes from coverage calculation

	   
	4. Write a Functional coverage group for burst length = 2 and 4 , burst type = wrap
	    
		
		covergroup axi_cg;
           bit [1:0] axburst;  // Burst type (0=FIXED, 1=INCR, 2=WRAP, 3=RESERVED)
           bit [2:0] axsize;   // Burst Size (bytes per beat)
           bit [3:0] axlen;    // Burst Length 
    
           // Coverpoint for Burst Type - only WRAP
             cp_burst_type: coverpoint axburst {
                             bins wrap = {2};  // WRAP burst type
                             // Optionally ignore other burst types
                             // ignore_bins others = default;
                             }
    
            // Coverpoint for Burst Length (only 2 and 4) , Burst length = axlen+1;
             cp_burst_len: coverpoint axlen {
                            bins len_2 = {1};  // Burst length = 2 (AXI len = 1 means 2 beats)
                            bins len_4 = {3};  // Burst length = 4 (AXI len = 3 means 4 beats)
                            ignore_bins others = default;  // Ignore other lengths
                            }
    
            // Coverpoint for Burst Size (optional - but good to include)
            cp_burst_size: coverpoint axsize {
                            bins size_1byte  = {0};   // 1 byte per beat
                            bins size_2bytes = {1};   // 2 bytes per beat
                            bins size_4bytes = {2};   // 4 bytes per beat
                            bins size_8bytes = {3};   // 8 bytes per beat
                            bins size_16bytes = {4};  // 16 bytes per beat
                            bins size_32bytes = {5};  // 32 bytes per beat
                            bins size_64bytes = {6};  // 64 bytes per beat
                            bins size_128bytes = {7}; // 128 bytes per beat
                             }
    
            // Cross between Burst Type (WRAP) and Burst Length (2 & 4)
			// All combinations are valid for WRAP (length 2 and 4 are valid)
			// No ignore_bins needed as both combinations are legal
            cp_cross_wrap_len: cross cp_burst_type, cp_burst_len { };
    
           // Optional: Cross all three - WRAP type, Length 2/4, and Size
           cp_cross_wrap_len_size: cross cp_burst_type, cp_burst_len, cp_burst_size {
                  // WRAP bursts have address alignment constraints
                 // For WRAP, address must be aligned to (size * (len+1))
                 // But coverage tool doesn't know this, so we can optionally ignore
                // invalid combinations if needed       
               // Example: For WRAP length 2 (2 beats), size must be such that
               // address is aligned properly. We can leave this to the testbench
               // to ensure only valid combinations are sampled
               }
    
            // Cover bins for specific WRAP combinations
			// Weight these combinations to ensure they get hit
            cp_wrap_len2_size: cross cp_burst_type, cp_burst_len, cp_burst_size {
             
               bins wrap_len2 = binsof(cp_burst_type.wrap) && binsof(cp_burst_len.len_2);
               bins wrap_len4 = binsof(cp_burst_type.wrap) && binsof(cp_burst_len.len_4);
               }
    
            // Coverage option to track progress
            option.per_instance = 1;
            option.goal = 100;
            option.comment = "AXI WRAP burst coverage for length 2 and 4";
    
        endgroup : axi_cg
		
	5. calculate start and end address for below AXI Parameters:
	    start addr = 32`1010
	    axi len = 3
	    axi size = 2
	    axi burst type = wrap
		
	


	  
	  

