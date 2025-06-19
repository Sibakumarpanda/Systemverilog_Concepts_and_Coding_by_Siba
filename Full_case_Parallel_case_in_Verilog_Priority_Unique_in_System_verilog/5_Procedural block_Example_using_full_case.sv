// Example5: Using full_case (It uses case statement only ,Default statement not needed)
//RTL Code
//NOTE:
/*
full_case Directive:
Tells synthesis tools that all possible cases are covered
Avoids inference of latches for undefined cases
In simulation, undefined cases produce 'x' (unknown) values
*/

module full_case_example_alu(
    input logic [1:0] opcode,
    input logic [7:0] a,
    input logic [7:0] b,
    output logic [7:0] result
);

    always_comb begin
        case (opcode)
            2'b00: result = a + b;
            2'b01: result = a - b;
            2'b10: result = a & b;
            //2'b11: result = a | b;
            // No default case needed due to full_case
        endcase
    end
endmodule

// TB Code
module full_case_example_alu_tb;

    // Inputs
    logic [1:0] opcode;
    logic [7:0] a;
    logic [7:0] b;
    
    // Outputs
    logic [7:0] result;
    
    // Instantiate the Unit Under Test (UUT)
    full_case_example_alu uut (
        .opcode(opcode),
        .a(a),
        .b(b),
        .result(result)
    );
    
    initial begin
      
      $display("1:Test with First Set of Inputs ");
      
        // Initialize Inputs
        a = 8'h55;  // 01010101
        b = 8'h0F;  // 00001111
        
        // Test all opcodes
        opcode = 2'b00; #10; // ADD
        $display("ADD: %h + %h = %h", a, b, result);
        
        opcode = 2'b01; #10; // SUB
        $display("SUB: %h - %h = %h", a, b, result);
        
        opcode = 2'b10; #10; // AND
        $display("AND: %h & %h = %h", a, b, result);
        
        // Test undefined case 
        opcode = 2'b11; #10; // OR
        $display("OR:  %h | %h = %h", a, b, result); // Expectd synthesis Output = Undefined (full_case)
        
        $display("2: Test with Second Set of Inputs ");
      
        // Test with different values
        a = 8'hAA;
        b = 8'h33;
        
        opcode = 2'b00; #10; // ADD
        $display("ADD: %h + %h = %h", a, b, result);
        
        opcode = 2'b01; #10; // SUB
        $display("SUB: %h - %h = %h", a, b, result);
        
        opcode = 2'b10; #10; // AND
        $display("AND: %h & %h = %h", a, b, result);
        
        // Test undefined case 
        opcode = 2'b11; #10; // OR
        $display("OR:  %h | %h = %h", a, b, result); // Expectd synthesis Output = Undefined (full_case)
        
        $finish;
    end
endmodule

// Log File Simulation Output using Cadence Xcelium 23.09 Tool

[2025-06-19 03:53:48 UTC] xrun -Q -unbuffered '-timescale' '1ns/1ns' '-sysv' '-access' '+rw' design.sv testbench.sv  
TOOL:	xrun	23.09-s001: Started on Jun 18, 2025 at 23:53:48 EDT
xrun: 23.09-s001: (c) Copyright 1995-2023 Cadence Design Systems, Inc.
	Top level design units:
		full_case_example_alu_tb
Loading snapshot worklib.full_case_example_alu_tb:sv .................... Done
xcelium> source /xcelium23.09/tools/xcelium/files/xmsimrc
xcelium> run
1:Test with First Set of Inputs 
ADD: 55 + 0f = 64
SUB: 55 - 0f = 46
AND: 55 & 0f = 05
OR:  55 | 0f = 05
2: Test with Second Set of Inputs 
ADD: aa + 33 = dd
SUB: aa - 33 = 77
AND: aa & 33 = 22
OR:  aa | 33 = 22
Simulation complete via $finish(1) at time 80 NS + 0
./testbench.sv:61         $finish;
xcelium> exit
TOOL:	xrun	23.09-s001: Exiting on Jun 18, 2025 at 23:53:49 EDT  (total: 00:00:01)
Done
