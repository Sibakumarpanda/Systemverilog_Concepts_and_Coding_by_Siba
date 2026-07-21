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
      

