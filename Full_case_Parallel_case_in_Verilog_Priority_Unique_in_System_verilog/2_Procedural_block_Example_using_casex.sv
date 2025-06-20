// Example2: Using casex Statement
//RTL Code

//NOTE: casex (treats X and Z as don't care)

module instruction_decoder_using_casex_stmt(
    input logic [7:0] instruction,
    output string op_type
    );

    always_comb begin
        casex (instruction)
            8'b000xxxxx: op_type = "LOAD";
            8'b001xxxxx: op_type = "STORE";
            8'b010xxxxx: op_type = "JUMP";
            8'b011xxxxx: op_type = "BRANCH";
          
            8'bzzzzz000: op_type = "MEMORY";
            8'bzzzzz001: op_type = "IO";
            8'bzzzzz010: op_type = "REGISTER";
            8'bzzzzz011: op_type = "DIRECT";
          
            default:     op_type = "UNKNOWN";
        endcase
    end
endmodule

// TB Code
module instruction_decoder_tb;

    // Inputs
    logic [7:0] instruction;
    
    // Outputs
    string op_type;
    
    // Instantiate the Unit Under Test (UUT)
    instruction_decoder_using_casex_stmt uut (
        .instruction(instruction),
        .op_type(op_type)
    );
    
    initial begin
        $display("Time\tInstruction\tOperation");
        $display("----------------------------------");
        
        // Test LOAD instructions (000xxxxx)
        instruction = 8'b00000000; 
        #10;
        $display("%0t\t%b\t%s", $time, instruction, op_type);
        
        instruction = 8'b00011111; 
        #10;
        $display("%0t\t%b\t%s", $time, instruction, op_type);
        
        instruction = 8'b00010101; 
        #10;
        $display("%0t\t%b\t%s", $time, instruction, op_type);
        
        // Test STORE instructions (001xxxxx)
        instruction = 8'b00100000; 
        #10;
        $display("%0t\t%b\t%s", $time, instruction, op_type);
        
        instruction = 8'b00111111; 
        #10;
        $display("%0t\t%b\t%s", $time, instruction, op_type);
        
        // Test JUMP instructions (010xxxxx)
        instruction = 8'b01000000; 
        #10;
        $display("%0t\t%b\t%s", $time, instruction, op_type);
        
        instruction = 8'b01010101; 
        #10;
        $display("%0t\t%b\t%s", $time, instruction, op_type);
      
        instruction = 8'b01001010; 
        #10;
        $display("%0t\t%b\t%s", $time, instruction, op_type);
        
        
        // Test BRANCH instructions (011xxxxx)
        instruction = 8'b01100000; 
        #10;
        $display("%0t\t%b\t%s", $time, instruction, op_type);
        
        instruction = 8'b01111111; 
        #10;
        $display("%0t\t%b\t%s", $time, instruction, op_type);
        
        // Test UNKNOWN instructions
        instruction = 8'b10000000; 
        #10;
        $display("%0t\t%b\t%s", $time, instruction, op_type);
        
        instruction = 8'b11111111; 
        #10;
        $display("%0t\t%b\t%s", $time, instruction, op_type);
      
        $display("***********Test with Input having z ******************");
      
        instruction = 8'b11111000; 
        #10;
        $display("%0t\t%b\t%s", $time, instruction, op_type);
      
        instruction = 8'b11111001; 
        #10;
        $display("%0t\t%b\t%s", $time, instruction, op_type);
        
        instruction = 8'b11111010; 
        #10;
        $display("%0t\t%b\t%s", $time, instruction, op_type);
      
        
        instruction = 8'b11111011; 
        #10;
        $display("%0t\t%b\t%s", $time, instruction, op_type);
      
        // Test with X bits (to demonstrate casex behavior)
        instruction = 8'b000xxxxx; 
        #10;
        $display("\n%0t\t%b (with x)\t%s", $time, instruction, op_type);
        
        instruction = 8'b001zzzzz; 
        #10;
        $display("%0t\t%b (with z)\t%s", $time, instruction, op_type);
        
        $finish;
    end
endmodule

// LogFile simulation Output using Cadence Xcelium 23.09
[2025-06-18 13:42:11 UTC] xrun -Q -unbuffered '-timescale' '1ns/1ns' '-sysv' '-access' '+rw' design.sv testbench.sv  
TOOL:	xrun	23.09-s001: Started on Jun 18, 2025 at 09:42:11 EDT
xrun: 23.09-s001: (c) Copyright 1995-2023 Cadence Design Systems, Inc.
	Top level design units:
		instruction_decoder_tb
Loading snapshot worklib.instruction_decoder_tb:sv .................... Done
xcelium> source /xcelium23.09/tools/xcelium/files/xmsimrc
xcelium> run
Time	Instruction	Operation
----------------------------------
10	00000000	LOAD
20	00011111	LOAD
30	00010101	LOAD
40	00100000	STORE
50	00111111	STORE
60	01000000	JUMP
70	01010101	JUMP
80	01001010	JUMP
90	01100000	BRANCH
100	01111111	BRANCH
110	10000000	MEMORY
120	11111111	UNKNOWN
***********Test with Input having z ******************
130	11111000	MEMORY
140	11111001	IO
150	11111010	REGISTER
160	11111011	DIRECT

170	000xxxxx (with x)	LOAD
180	001zzzzz (with z)	STORE
Simulation complete via $finish(1) at time 180 NS + 0
./testbench.sv:102         $finish;
xcelium> exit
TOOL:	xrun	23.09-s001: Exiting on Jun 18, 2025 at 09:42:12 EDT  (total: 00:00:01)
Done

//Synthesis Output
