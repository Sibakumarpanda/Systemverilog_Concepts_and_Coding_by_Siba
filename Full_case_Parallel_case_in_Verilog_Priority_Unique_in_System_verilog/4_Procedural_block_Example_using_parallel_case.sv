// Example4: Using parallel_case (Uses case statment only ,Need default statemnt to be used)
//RTL Code
//NOTE:- 
/*
The parallel_case directive is a hint to synthesis tools that the cases are mutually exclusive

In simulation, the behavior remains identical to a regular case statement

The testbench verifies:

All specified cases work correctly and Default cases are handled properly

The simulation behavior matches expectations

Important notes about parallel_case:

Synthesis Only: The directive only affects synthesis, not simulation behavior

Mutual Exclusivity: Only use when cases are truly mutually exclusive

Potential Pitfalls: Incorrect use can cause simulation/synthesis mismatches

Modern Alternatives: In SystemVerilog, consider using unique case instead for safer behavior

The example shows:

A one-hot decoder where each input selects a different output bit

The parallel_case suggests to synthesis tools that no priority logic is needed

Simulation shows the expected behavior matches the case statement

For comparison, without parallel_case, synthesis might create a priority encoder, while with the directive it may create a more optimal parallel structure.
However, this difference is only visible in the synthesized hardware, not in simulation.
*/

module parallel_case_example (
    input logic [2:0] sel,
    output logic [3:0] out
);
  
    always_comb begin
        case (sel) // synthesis parallel_case
            3'b000: out = 4'b0001;
            3'b001: out = 4'b0010;
            3'b010: out = 4'b0100;
            3'b100: out = 4'b1000;
            default: out = 4'b0000;
        endcase
    end

endmodule

// TB Code
module tb_parallel_case;

    // Inputs
    logic [2:0] sel;
    
    // Outputs
    logic [3:0] out;
    
    // Instantiate the Unit Under Test (UUT)
    parallel_case_example uut (
        .sel(sel),
        .out(out)
    );
    
    initial begin
        $display("Time\t sel\t out");
        $display("-------------------");
        
        // Test all specified cases
        sel = 3'b000; #10;
        $display("%0t\t %b\t %b", $time, sel, out);
        
        sel = 3'b001; #10;
        $display("%0t\t %b\t %b", $time, sel, out);
        
        sel = 3'b010; #10;
        $display("%0t\t %b\t %b", $time, sel, out);
        
        sel = 3'b100; #10;
        $display("%0t\t %b\t %b", $time, sel, out);
        
        // Test default cases
        sel = 3'b011; #10;
        $display("%0t\t %b\t %b (default)", $time, sel, out);
        
        sel = 3'b101; #10;
        $display("%0t\t %b\t %b (default)", $time, sel, out);
        
        sel = 3'b110; #10;
        $display("%0t\t %b\t %b (default)", $time, sel, out);
        
        sel = 3'b111; #10;
        $display("%0t\t %b\t %b (default)", $time, sel, out);
        
        // Test case that would be ambiguous without parallel_case
        // (Not actually parallel in simulation - shows first match)
        sel = 3'b101; #10;  // Not in case list, goes to default
        $display("\n%0t\t %b\t %b (shows default behavior)", $time, sel, out);
        
        $finish;
    end
endmodule

// Log File- Simulation Output using Cadence Xcelium 23.9 Tool

[2025-06-19 03:47:43 UTC] xrun -Q -unbuffered '-timescale' '1ns/1ns' '-sysv' '-access' '+rw' design.sv testbench.sv  
TOOL:	xrun	23.09-s001: Started on Jun 18, 2025 at 23:47:43 EDT
xrun: 23.09-s001: (c) Copyright 1995-2023 Cadence Design Systems, Inc.
	Top level design units:
		tb_parallel_case
Loading snapshot worklib.tb_parallel_case:sv .................... Done
xcelium> source /xcelium23.09/tools/xcelium/files/xmsimrc
xcelium> run
Time	 sel	 out
-------------------
10	 000	 0001
20	 001	 0010
30	 010	 0100
40	 100	 1000
50	 011	 0000 (default)
60	 101	 0000 (default)
70	 110	 0000 (default)
80	 111	 0000 (default)

90	 101	 0000 (shows default behavior)
Simulation complete via $finish(1) at time 90 NS + 0
./testbench.sv:51         $finish;
xcelium> exit
TOOL:	xrun	23.09-s001: Exiting on Jun 18, 2025 at 23:47:45 EDT  (total: 00:00:02)
Done

