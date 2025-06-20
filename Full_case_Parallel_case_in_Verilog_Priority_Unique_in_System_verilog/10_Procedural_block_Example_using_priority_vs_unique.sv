//Example-10 
module priority_case_vs_unique_case_example (
    input logic [1:0] sel,
    output logic [3:0] pri_out,  // priority case output
    output logic [3:0] uni_out   // unique case output
);
  
  // Priority case example - first match has priority (At least one match exist)
    always_comb begin
        priority case (sel)
            2'b00: pri_out = 4'b0001;
            2'b01: pri_out = 4'b0010;
            2'b1?: pri_out = 4'b0100;  // matches 10 and 11
        endcase
    end

  // Unique case example - all cases must be unique (Exactly one match)
    always_comb begin
        unique case (sel)
            2'b00: uni_out = 4'b0001;
            2'b01: uni_out = 4'b0010;
            2'b10: uni_out = 4'b0100;
            2'b11: uni_out = 4'b1000;
        endcase
    end

endmodule

//TB Code
module priority_case_vs_unique_case_example_compare_tb;

    // Inputs
    logic [1:0] sel;
    
    // Outputs
    logic [3:0] pri_out, uni_out;
    
    // Instantiate the Unit Under Test
    priority_case_vs_unique_case_example uut (
        .sel(sel),
        .pri_out(pri_out),
        .uni_out(uni_out)
    );
    
    initial begin
        $display("Time\t sel\t pri_out\t uni_out\t Description");
        $display("-------------------------------------------------------");
        
        // Test all defined cases
        sel = 2'b00; #10;
        $display("%0t\t %b\t %b\t\t %b\t\t Normal case 00", $time, sel, pri_out, uni_out);
        
        sel = 2'b01; #10;
        $display("%0t\t %b\t %b\t\t %b\t\t Normal case 01", $time, sel, pri_out, uni_out);
        
        sel = 2'b10; #10;
        $display("%0t\t %b\t %b\t\t %b\t\t Normal case 10", $time, sel, pri_out, uni_out);
        
        sel = 2'b11; #10;
        $display("%0t\t %b\t %b\t\t %b\t\t Normal case 11", $time, sel, pri_out, uni_out);
        
        // Test with X values
        sel = 2'b0x; #10;
        $display("\n%0t\t %b\t %b\t\t %b\t\t X in LSB (0x)", $time, sel, pri_out, uni_out);
        
        sel = 2'bx1; #10;
        $display("%0t\t %b\t %b\t\t %b\t\t X in MSB (x1)", $time, sel, pri_out, uni_out);
        
        $finish;
    end

    // Monitor for warnings
    always @(sel) begin
        #1; // Small delay to allow case statements to evaluate
        if ($isunknown(sel)) begin
            $display("Note: sel has unknown bits at time %0t: %b", $time, sel);
        end
    end

endmodule

// LogFile Output using Cadence Synopsys VCS

[2025-06-20 02:58:29 UTC] vcs -full64 -licqueue '-timescale=1ns/1ns' '+vcs+flush+all' '+warn=all' '-sverilog' design.sv testbench.sv  && ./simv +vcs+lic+wait  
                         Chronologic VCS (TM)
       Version U-2023.03-SP2_Full64 -- Thu Jun 19 22:58:30 2025

                    Copyright (c) 1991 - 2023 Synopsys, Inc.
   This software and the associated documentation are proprietary to Synopsys,
 Inc. This software may only be used in accordance with the terms and conditions
 of a written license agreement with Synopsys, Inc. All other use, reproduction,
   or distribution of this software is strictly prohibited.  Licensed Products
     communicate with Synopsys servers for the purpose of providing software
    updates, detecting software piracy and verifying that customers are using
    Licensed Products in conformity with the applicable License Key for such
  Licensed Products. Synopsys will use information gathered in connection with
    this process to deliver software updates and pursue software pirates and
                                   infringers.

 Inclusivity & Diversity - Visit SolvNetPlus to read the "Synopsys Statement on
            Inclusivity and Diversity" (Refer to article 000036315 at
                        https://solvnetplus.synopsys.com)

Parsing design file 'design.sv'
Parsing design file 'testbench.sv'
Top Level Modules:
       priority_case_vs_unique_case_example_compare_tb
TimeScale is 1 ns / 1 ns
Starting vcs inline pass...

1 module and 0 UDP read.
recompiling module priority_case_vs_unique_case_example_compare_tb
rm -f _cuarc*.so _csrc*.so pre_vcsobj_*.so share_vcsobj_*.so
if [ -x ../simv ]; then chmod a-x ../simv; fi
g++  -o ../simv      -rdynamic  -Wl,-rpath='$ORIGIN'/simv.daidir -Wl,-rpath=./simv.daidir -Wl,-rpath=/apps/vcsmx/vcs/U-2023.03-SP2/linux64/lib -L/apps/vcsmx/vcs/U-2023.03-SP2/linux64/lib  -Wl,-rpath-link=./   objs/amcQw_d.o   _331_archive_1.so   SIM_l.o       rmapats_mop.o rmapats.o rmar.o rmar_nd.o  rmar_llvm_0_1.o rmar_llvm_0_0.o            -lvirsim -lerrorinf -lsnpsmalloc -lvfs    -lvcsnew -lsimprofile -luclinative /apps/vcsmx/vcs/U-2023.03-SP2/linux64/lib/vcs_tls.o   -Wl,-whole-archive  -lvcsucli    -Wl,-no-whole-archive          /apps/vcsmx/vcs/U-2023.03-SP2/linux64/lib/vcs_save_restore_new.o -ldl  -lc -lm -lpthread -ldl 
../simv up to date
CPU time: .204 seconds to compile + .208 seconds to elab + .197 seconds to link
Chronologic VCS simulator copyright 1991-2023
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Jun 19 22:58 2025
Time	 sel	 pri_out	 uni_out	 Description
-------------------------------------------------------
10	 00	 0001		 0001		 Normal case 00
20	 01	 0010		 0010		 Normal case 01

Warning-[RT-NCMPRCS] No condition matches in statement
design.sv, 10
  No condition matches in 'priority case' statement. 'default' specification 
  is missing, inside priority_case_vs_unique_case_example_compare_tb.uut, at 
  time 20ns.

30	 10	 0010		 0100		 Normal case 10

Warning-[RT-NCMPRCS] No condition matches in statement
design.sv, 10
  No condition matches in 'priority case' statement. 'default' specification 
  is missing, inside priority_case_vs_unique_case_example_compare_tb.uut, at 
  time 30ns.

40	 11	 0010		 1000		 Normal case 11

Warning-[RT-NCMPRCS] No condition matches in statement
design.sv, 10
  No condition matches in 'priority case' statement. 'default' specification 
  is missing, inside priority_case_vs_unique_case_example_compare_tb.uut, at 
  time 40ns.


Warning-[RT-NCMUCS] No condition matches in statement
design.sv, 19
  No condition matches in 'unique case' statement. 'default' specification is 
  missing, inside priority_case_vs_unique_case_example_compare_tb.uut, at time
  40ns.

Note: sel has unknown bits at time 41: 0x

50	 0x	 0010		 1000		 X in LSB (0x)

Warning-[RT-NCMPRCS] No condition matches in statement
design.sv, 10
  No condition matches in 'priority case' statement. 'default' specification 
  is missing, inside priority_case_vs_unique_case_example_compare_tb.uut, at 
  time 50ns.


Warning-[RT-NCMUCS] No condition matches in statement
design.sv, 19
  No condition matches in 'unique case' statement. 'default' specification is 
  missing, inside priority_case_vs_unique_case_example_compare_tb.uut, at time
  50ns.

Note: sel has unknown bits at time 51: x1
60	 x1	 0010		 1000		 X in MSB (x1)
$finish called from file "testbench.sv", line 40.
$finish at simulation time                   60
           V C S   S i m u l a t i o n   R e p o r t 
Time: 60 ns
CPU Time:      0.260 seconds;       Data structure size:   0.0Mb
Thu Jun 19 22:58:31 2025
Done

//Synthesis Output    
