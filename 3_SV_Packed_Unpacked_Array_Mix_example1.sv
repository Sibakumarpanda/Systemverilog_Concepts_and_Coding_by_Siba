Characteristics of Combined Packed-Unpacked Arrays :
 -Packed dimensions on the left, unpacked on the right
 -Combines benefits of both
 -Very common in SystemVerilog

/***********************************/
  Example-1
/***********************************/
module combined_packed_unpacked_array_example1;
    // Combined packed-unpacked arrays
    logic [7:0] bytes [0:3];      // 4 elements, each is 8-bit packed
    bit [3:0][15:0] data_array [0:7]; // 8 elements, each is 4x16-bit packed
    
    // Complex example: 2D array of 32-bit words
    logic [31:0] frame_buffer [0:479][0:639]; // 480x640 display buffer
    
    // Memory with byte enable
    logic [3:0][7:0] memory_block [0:1023]; // 1024 elements of 4 bytes each
    
    initial begin
        // Initialization
        bytes = '{8'hAA, 8'hBB, 8'hCC, 8'hDD};
        
        // Access packed part of unpacked element
        bytes[1][3:0] = 4'hF;     // Modify lower nibble of element 1
        $display("bytes[1] = %h", bytes[1]); // BF
        
        // Complex access example
        data_array[2][1] = 16'h1234;  // Element 2, packed index 1
        $display("data_array[2][1] = %h", data_array[2][1]); // 1234
        
        // Using with loops
        foreach (memory_block[i]) begin
            memory_block[i] = {i[7:0], i[15:8], i[23:16], i[31:24]};
        end
        
        // Frame buffer example
        foreach (frame_buffer[i,j]) begin
            frame_buffer[i][j] = {8'hFF, i[7:0], j[7:0], 8'h00}; // ARGB format
        end
    end
endmodule :combined_packed_unpacked_array_example1

//Output
