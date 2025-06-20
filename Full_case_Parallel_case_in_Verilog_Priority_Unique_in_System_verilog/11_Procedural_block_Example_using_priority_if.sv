// Example11: Using priority_if () statement- 
//RTL Code
//NOTE: priority_if ()-Enforces that at least one condition is true

module priority_if_example (
    input logic [2:0] request,  // 3-bit request signal
    output logic [1:0] grant    // 2-bit grant output
);

    always_comb begin
        grant = 2'b00;  // Default grant value
        
        // Priority if statement - conditions evaluated in order
        priority if (request[0]) begin       // Highest priority
            grant = 2'b01;
        end
        else if (request[1]) begin           // Medium priority
            grant = 2'b10;
        end
        else if (request[2]) begin           // Lowest priority
            grant = 2'b11;
        end
    end

endmodule

//TB Code
module tb_priority_if;

    // Inputs
    logic [2:0] request;
    
    // Outputs
    logic [1:0] grant;
    
    // Instantiate the Unit Under Test (UUT)
    priority_if_example uut (
        .request(request),
        .grant(grant)
    );
    
    initial begin
        $display("Time\tRequest\tGrant\tDescription");
        $display("----------------------------------");
        
        // Test single requests
        request = 3'b001; #10;  // Bit 0
        $display("%0t\t%b\t%b\tHighest priority (bit 0)", $time, request, grant);
        
        request = 3'b010; #10;  // Bit 1
        $display("%0t\t%b\t%b\tMedium priority (bit 1)", $time, request, grant);
        
        request = 3'b100; #10;  // Bit 2
        $display("%0t\t%b\t%b\tLowest priority (bit 2)", $time, request, grant);
        
        // Test multiple requests (show priority)
        request = 3'b011; #10;  // Bits 0 and 1
        $display("%0t\t%b\t%b\tBits 0+1 (bit 0 wins)", $time, request, grant);
        
        request = 3'b101; #10;  // Bits 0 and 2
        $display("%0t\t%b\t%b\tBits 0+2 (bit 0 wins)", $time, request, grant);
        
        request = 3'b110; #10;  // Bits 1 and 2
        $display("%0t\t%b\t%b\tBits 1+2 (bit 1 wins)", $time, request, grant);
        
        request = 3'b111; #10;  // All bits
        $display("%0t\t%b\t%b\tAll bits (bit 0 wins)", $time, request, grant);
        
        // Test no requests
        request = 3'b000; #10;
        $display("%0t\t%b\t%b\tNo requests", $time, request, grant);
        
        $finish;
    end

endmodule

//LogFile simulation Output using Cadence Xcelium 23.09

[2025-06-20 03:01:26 UTC] xrun -Q -unbuffered '-timescale' '1ns/1ns' '-sysv' '-access' '+rw' design.sv testbench.sv  
TOOL:	xrun	23.09-s001: Started on Jun 19, 2025 at 23:01:26 EDT
xrun: 23.09-s001: (c) Copyright 1995-2023 Cadence Design Systems, Inc.
	Top level design units:
		tb_priority_if
Loading snapshot worklib.tb_priority_if:sv .................... Done
xcelium> source /xcelium23.09/tools/xcelium/files/xmsimrc
xcelium> run
Time	Request	Grant	Description
----------------------------------
10	001	01	Highest priority (bit 0)
20	010	10	Medium priority (bit 1)
30	100	11	Lowest priority (bit 2)
40	011	01	Bits 0+1 (bit 0 wins)
50	101	01	Bits 0+2 (bit 0 wins)
60	110	10	Bits 1+2 (bit 1 wins)
70	111	01	All bits (bit 0 wins)
xmsim: *W,NOCOND: Priority if violation:  Every if clause was false.
            File: ./design.sv, line = 14, pos = 18
           Scope: tb_priority_if.uut
            Time: 70 NS + 3

80	000	00	No requests
Simulation complete via $finish(1) at time 80 NS + 0
./testbench.sv:47         $finish;
xcelium> exit
TOOL:	xrun	23.09-s001: Exiting on Jun 19, 2025 at 23:01:27 EDT  (total: 00:00:01)
Done

//Synthesis Output
