// Example12: Using unique_if () statement- 
//RTL Code
//NOTE: unique_if()-Enforces exactly one condition is true

module unique_if_example (
    input logic [2:0] request,  // 3-bit request signal (must be one-hot)
    output logic [1:0] grant    // 2-bit grant output
);

    always_comb begin
        grant = 2'b00;  // Default grant value
        
        // Unique if statement - conditions must be mutually exclusive
        unique if (request == 3'b001) begin       // Bit 0
            grant = 2'b01;
        end
        else if (request == 3'b010) begin         // Bit 1
            grant = 2'b10;
        end
        else if (request == 3'b100) begin         // Bit 2
            grant = 2'b11;
        end
    end

endmodule

//TB Code
module tb_unique_if;

    // Inputs
    logic [2:0] request;
    
    // Outputs
    logic [1:0] grant;
    
    // Instantiate the Unit Under Test (UUT)
    unique_if_example uut (
        .request(request),
        .grant(grant)
    );
    
    initial begin
        $display("Time\tRequest\tGrant\tDescription");
        $display("----------------------------------");
        
        // Test valid one-hot requests
        request = 3'b001; #10;
        $display("%0t\t%b\t%b\tBit 0 request", $time, request, grant);
        
        request = 3'b010; #10;
        $display("%0t\t%b\t%b\tBit 1 request", $time, request, grant);
        
        request = 3'b100; #10;
        $display("%0t\t%b\t%b\tBit 2 request", $time, request, grant);
        
        // Test no requests
        request = 3'b000; #10;
        $display("%0t\t%b\t%b\tNo requests", $time, request, grant);
        
        // Test invalid multiple requests (should trigger warning)
        request = 3'b011; #10;
        $display("%0t\t%b\t%b\tMultiple bits set (warning expected)", $time, request, grant);
        
        // Test all bits set (should trigger warning)
        request = 3'b111; #10;
        $display("%0t\t%b\t%b\tAll bits set (warning expected)", $time, request, grant);
        
        $finish;
    end
endmodule

// LogFile Output using Cadence Xcelium 23.09

[2025-06-20 03:57:25 UTC] xrun -Q -unbuffered '-timescale' '1ns/1ns' '-sysv' '-access' '+rw' design.sv testbench.sv  
TOOL:	xrun	23.09-s001: Started on Jun 19, 2025 at 23:57:25 EDT
xrun: 23.09-s001: (c) Copyright 1995-2023 Cadence Design Systems, Inc.
	Top level design units:
		tb_unique_if
Loading snapshot worklib.tb_unique_if:sv .................... Done
xcelium> source /xcelium23.09/tools/xcelium/files/xmsimrc
xcelium> run
Time	Request	Grant	Description
----------------------------------
10	001	01	Bit 0 request
20	010	10	Bit 1 request
30	100	11	Bit 2 request
xmsim: *W,NOCOND: Unique if violation:  Every if clause was false.
            File: ./design.sv, line = 14, pos = 16
           Scope: tb_unique_if.uut
            Time: 30 NS + 3

40	000	00	No requests
xmsim: *W,NOCOND: Unique if violation:  Every if clause was false.
            File: ./design.sv, line = 14, pos = 16
           Scope: tb_unique_if.uut
            Time: 40 NS + 2

50	011	00	Multiple bits set (warning expected)
xmsim: *W,NOCOND: Unique if violation:  Every if clause was false.
            File: ./design.sv, line = 14, pos = 16
           Scope: tb_unique_if.uut
            Time: 50 NS + 2

60	111	00	All bits set (warning expected)
Simulation complete via $finish(1) at time 60 NS + 0
./testbench.sv:43         $finish;
xcelium> exit
TOOL:	xrun	23.09-s001: Exiting on Jun 19, 2025 at 23:57:27 EDT  (total: 00:00:02)
Done

//Synthesis Output
