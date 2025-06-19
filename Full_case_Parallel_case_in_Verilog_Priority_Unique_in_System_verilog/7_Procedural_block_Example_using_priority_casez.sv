// Example7: Using priority_casez () statement- 
//RTL Code
//NOTE: priority casez()-Priority with high-impedance match
module priority_casez_example (
    input logic [1:0] sel,
    output logic [3:0] out
    );
  
    always_comb begin
      priority casez (sel)          // SystemVerilog priority casez
            2'b00: out = 4'b0001;  // Highest priority
            2'b01: out = 4'b0010;
            2'b10: out = 4'b0100;
            2'b11: out = 4'b1000;  
        
            2'b1?: out = 4'b0100;  // matches 10, 11
            2'b??: out = 4'b1111;  // matches any value like 00 or 11 , Lowest Priority
        endcase
    end

endmodule

//TB Code
module tb_priority_casez;

    // Inputs
    logic [1:0] sel;
    
    // Outputs
    logic [3:0] out;
    
    // Instantiate the Unit Under Test (UUT)
    priority_casez_example uut (
        .sel(sel),
        .out(out)
    );
    
    initial begin
        $display("Time\t sel\t out\t\t Description");
        $display("---------------------------------------------");
        
        // Test all individual cases
        sel = 2'b00; #10;
        $display("%0t\t %b\t %b\t\t Highest priority (00)", $time, sel, out);
        
        sel = 2'b01; #10;
        $display("%0t\t %b\t %b\t\t Priority 01", $time, sel, out);
        
        sel = 2'b10; #10;
        $display("%0t\t %b\t %b\t\t Priority 10", $time, sel, out);
        
        sel = 2'b11; #10;
        $display("%0t\t %b\t %b\t\t Lowest priority (11)", $time, sel, out);
        
        // Test with X and Z values
        sel = 2'b0x; #10;
        $display("\n%0t\t %b\t %b\t\t With X (priority warns)", $time, sel, out);
        
        sel = 2'b1z; #10;
        $display("%0t\t %b\t %b\t\t With Z (priority warns)", $time, sel, out);
        
        // Test with multiple bits set (shows priority)
        sel = 2'b??; #10;  // Wildcard assignment
        $display("\n%0t\t %b\t %b\t\t Wildcard input", $time, sel, out);
      
        sel = 2'b11; #10;
        $display("%0t\t %b\t %b\t\t To Verify wildcard Combinations", $time, sel, out);
      
        sel = 2'b10; #10;
        $display("%0t\t %b\t %b\t\t To Verify wildcard Combinations", $time, sel, out);
        
        sel = 2'b00; #10;
        $display("%0t\t %b\t %b\t\t To Verify wildcard Combinations", $time, sel, out);
      
        sel = 2'b11; #10;
        $display("%0t\t %b\t %b\t\t To Verify wildcard Combinations", $time, sel, out);
            
        $finish;
    end

    // Additional checks for priority case warnings
    always @(sel) begin
        #1; // Small delay to allow priority case to evaluate
        if ($isunknown(sel)) begin
            $warning("Priority case encountered unknown bits in sel: %b", sel);
        end
    end 

endmodule

//Log File Output using Cadence Xcelium 23.09

[2025-06-19 16:47:00 UTC] xrun -Q -unbuffered '-timescale' '1ns/1ns' '-sysv' '-access' '+rw' design.sv testbench.sv  
TOOL:	xrun	23.09-s001: Started on Jun 19, 2025 at 12:47:01 EDT
xrun: 23.09-s001: (c) Copyright 1995-2023 Cadence Design Systems, Inc.
	Top level design units:
		tb_priority_casez
Loading snapshot worklib.tb_priority_casez:sv .................... Done
xcelium> source /xcelium23.09/tools/xcelium/files/xmsimrc
xcelium> run
Time	 sel	 out		 Description
---------------------------------------------
10	 00	 0001		 Highest priority (00)
20	 01	 0010		 Priority 01
30	 10	 0100		 Priority 10
40	 11	 1000		 Lowest priority (11)
xmsim: *W,WARSEV (./testbench.sv,65): (time 41 NS).
tb_priority_casez
Priority case encountered unknown bits in sel: 0x

50	 0x	 1111		 With X (priority warns)
xmsim: *W,WARSEV (./testbench.sv,65): (time 51 NS).
tb_priority_casez
Priority case encountered unknown bits in sel: 1z
60	 1z	 0100		 With Z (priority warns)
xmsim: *W,WARSEV (./testbench.sv,65): (time 61 NS).
tb_priority_casez
Priority case encountered unknown bits in sel: zz

70	 zz	 0001		 Wildcard input
80	 11	 1000		 To Verify wildcard Combinations
90	 10	 0100		 To Verify wildcard Combinations
100	 00	 0001		 To Verify wildcard Combinations
110	 11	 1000		 To Verify wildcard Combinations
Simulation complete via $finish(1) at time 110 NS + 0
./testbench.sv:58         $finish;
xcelium> exit
TOOL:	xrun	23.09-s001: Exiting on Jun 19, 2025 at 12:47:02 EDT  (total: 00:00:01)
Done
