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
       
