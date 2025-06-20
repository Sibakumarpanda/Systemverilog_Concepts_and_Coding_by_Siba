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

// LogFile Output
