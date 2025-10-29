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
        $display("--------------------------------"); 
        
        // Using foreach loop
        foreach (numbers[i]) begin
            numbers[i] = i * 10;
            $display("numbers[%0d] = %0d", i,numbers[i],);
        end
        
        // Multi-dimensional access
        foreach (matrix[i,j]) begin
            matrix[i][j] = i * 4 + j;
            $display("matrix[%0d][%0d] = %0d", i,j,matrix[i][j]);
        end
        $display("--------------------------------"); 
        $display("matrix[2][3] = %0d", matrix[2][3]); // 11
    end
endmodule  :unpacked_array_example1

//Log File Output
Starting vcs inline pass...

1 module and 0 UDP read.
recompiling module unpacked_array_example1
rm -f _cuarc*.so _csrc*.so pre_vcsobj_*.so share_vcsobj_*.so
if [ -x ../simv ]; then chmod a-x ../simv; fi
g++  -o ../simv      -rdynamic  -Wl,-rpath='$ORIGIN'/simv.daidir -Wl,-rpath=./simv.daidir -Wl,-rpath=/apps/vcsmx/vcs/U-2023.03-SP2/linux64/lib -L/apps/vcsmx/vcs/U-2023.03-SP2/linux64/lib  -Wl,-rpath-link=./   objs/amcQw_d.o   _331_archive_1.so   SIM_l.o       rmapats_mop.o rmapats.o rmar.o rmar_nd.o  rmar_llvm_0_1.o rmar_llvm_0_0.o            -lvirsim -lerrorinf -lsnpsmalloc -lvfs    -lvcsnew -lsimprofile -luclinative /apps/vcsmx/vcs/U-2023.03-SP2/linux64/lib/vcs_tls.o   -Wl,-whole-archive  -lvcsucli    -Wl,-no-whole-archive          /apps/vcsmx/vcs/U-2023.03-SP2/linux64/lib/vcs_save_restore_new.o -ldl  -lc -lm -lpthread -ldl 
../simv up to date
CPU time: .384 seconds to compile + .388 seconds to elab + .389 seconds to link
Chronologic VCS simulator copyright 1991-2023
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Oct 29 00:33 2025
numbers[3] = 100
--------------------------------
numbers[0] = 0 
numbers[1] = 10 
numbers[2] = 20 
numbers[3] = 30 
numbers[4] = 40 
numbers[5] = 50 
numbers[6] = 60 
numbers[7] = 70 
matrix[0][0] = 0
matrix[0][1] = 1
matrix[0][2] = 2
matrix[0][3] = 3
matrix[1][0] = 4
matrix[1][1] = 5
matrix[1][2] = 6
matrix[1][3] = 7
matrix[2][0] = 8
matrix[2][1] = 9
matrix[2][2] = 10
matrix[2][3] = 11
matrix[3][0] = 12
matrix[3][1] = 13
matrix[3][2] = 14
matrix[3][3] = 15
--------------------------------
matrix[2][3] = 11
           V C S   S i m u l a t i o n   R e p o r t 
Time: 0 ns
CPU Time:      0.380 seconds;       Data structure size:   0.0Mb
Wed Oct 29 00:33:48 2025
