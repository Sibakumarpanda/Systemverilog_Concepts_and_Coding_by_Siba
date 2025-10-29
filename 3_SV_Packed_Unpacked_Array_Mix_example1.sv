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

//LogFile Output
Starting vcs inline pass...

1 module and 0 UDP read.
recompiling module combined_packed_unpacked_array_example1
rm -f _cuarc*.so _csrc*.so pre_vcsobj_*.so share_vcsobj_*.so
if [ -x ../simv ]; then chmod a-x ../simv; fi
g++  -o ../simv      -rdynamic  -Wl,-rpath='$ORIGIN'/simv.daidir -Wl,-rpath=./simv.daidir -Wl,-rpath=/apps/vcsmx/vcs/U-2023.03-SP2/linux64/lib -L/apps/vcsmx/vcs/U-2023.03-SP2/linux64/lib  -Wl,-rpath-link=./   objs/amcQw_d.o   _332_archive_1.so   SIM_l.o       rmapats_mop.o rmapats.o rmar.o rmar_nd.o  rmar_llvm_0_1.o rmar_llvm_0_0.o            -lvirsim -lerrorinf -lsnpsmalloc -lvfs    -lvcsnew -lsimprofile -luclinative /apps/vcsmx/vcs/U-2023.03-SP2/linux64/lib/vcs_tls.o   -Wl,-whole-archive  -lvcsucli    -Wl,-no-whole-archive          /apps/vcsmx/vcs/U-2023.03-SP2/linux64/lib/vcs_save_restore_new.o -ldl  -lc -lm -lpthread -ldl 
../simv up to date
CPU time: .366 seconds to compile + .408 seconds to elab + .404 seconds to link
Chronologic VCS simulator copyright 1991-2023
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Oct 29 00:37 2025
bytes[1] = bf
data_array[2][1] = 1234
           V C S   S i m u l a t i o n   R e p o r t 
Time: 0 ns
CPU Time:      0.520 seconds;       Data structure size:   0.0Mb
Wed Oct 29 00:37:02 2025
Done
