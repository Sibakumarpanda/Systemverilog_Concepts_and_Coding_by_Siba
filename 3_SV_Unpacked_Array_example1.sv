Unpacked Arrays Characteristics:
 -Each element stored separately
 -Better for large memories
 -Can have different indexing schemes
 -More flexible for software-like operations

/**************************************/
   Example-1
/**************************************/
module unpacked_array_example1;
    // Basic unpacked arrays
    int numbers [0:7];            // 8 elements of 32-bit integers
    logic [7:0] memory [0:255];   // 256 bytes of memory
    
    // Multi-dimensional unpacked arrays
    int matrix [0:3][0:3];        // 4x4 matrix
    string names [0:2];           // Array of strings
    
    // Different indexing styles
    bit [15:0] data_asc [1:8];    // 1 to 8 indexing
    bit [15:0] data_desc [8:1];   // 8 down to 1 indexing
    
    initial begin
        // Initialization
        numbers = '{0, 1, 2, 3, 4, 5, 6, 7};
        names = '{"Alice", "Bob", "Charlie"};
        
        // Element access
        numbers[3] = 100;
        $display("numbers[3] = %0d", numbers[3]); // 100
        
        // Using foreach loop
        foreach (numbers[i]) begin
            numbers[i] = i * 10;
        end
        
        // Multi-dimensional access
        foreach (matrix[i,j]) begin
            matrix[i][j] = i * 4 + j;
        end
        $display("matrix[2][3] = %0d", matrix[2][3]); // 11
    end
endmodule  :unpacked_array_example1
//Output

