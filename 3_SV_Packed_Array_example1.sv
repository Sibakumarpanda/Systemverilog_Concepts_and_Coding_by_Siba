// Characteristics of Packed Arrays
  -Contiguous bits in memory
  -Treated as a single vector
  -Support bit-selects and part-selects
  -More efficient for synthesis

 /*********************/
  Example1:
 /********************/ 
  module packed_example1;
    // Basic packed arrays
    bit [7:0] byte_data;          // 8-bit packed array
    logic [3:0] nibble;           // 4-bit packed array
    
    // Multi-dimensional packed arrays
    logic [3:0][7:0] data_word;   // 4 bytes packed together (32 bits total)
    bit [1:0][3:0][7:0] complex_packed; // 2x4x8 = 64 bits
    
    initial begin
        // Assignment and access
        byte_data = 8'hA5;
        $display("byte_data = %h", byte_data);  // A5
        
        // Bit-select and part-select
        $display("bit 3 = %b", byte_data[3]);   // 1
        $display("bits [3:0] = %h", byte_data[3:0]); // 5
        
        // Multi-dimensional packed access
        data_word = 32'hDEAD_BEEF;
        $display("data_word[2] = %h", data_word[2]); // AD (byte 2)
        $display("data_word[1][3] = %b", data_word[1][3]); // bit 3 of byte 1
    end
endmodule  :packed_example1

//Outout

    
