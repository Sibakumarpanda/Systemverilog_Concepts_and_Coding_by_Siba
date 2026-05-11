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

// Log File Outout
Starting vcs inline pass...

1 module and 0 UDP read.
recompiling module packed_array_example1
rm -f _cuarc*.so _csrc*.so pre_vcsobj_*.so share_vcsobj_*.so
if [ -x ../simv ]; then chmod a-x ../simv; fi
g++  -o ../simv      -rdynamic  -Wl,-rpath='$ORIGIN'/simv.daidir -Wl,-rpath=./simv.daidir -Wl,-rpath=/apps/vcsmx/vcs/U-2023.03-SP2/linux64/lib -L/apps/vcsmx/vcs/U-2023.03-SP2/linux64/lib  -Wl,-rpath-link=./   objs/amcQw_d.o   _332_archive_1.so   SIM_l.o       rmapats_mop.o rmapats.o rmar.o rmar_nd.o  rmar_llvm_0_1.o rmar_llvm_0_0.o            -lvirsim -lerrorinf -lsnpsmalloc -lvfs    -lvcsnew -lsimprofile -luclinative /apps/vcsmx/vcs/U-2023.03-SP2/linux64/lib/vcs_tls.o   -Wl,-whole-archive  -lvcsucli    -Wl,-no-whole-archive          /apps/vcsmx/vcs/U-2023.03-SP2/linux64/lib/vcs_save_restore_new.o -ldl  -lc -lm -lpthread -ldl 
../simv up to date
CPU time: .425 seconds to compile + .441 seconds to elab + .429 seconds to link
Chronologic VCS simulator copyright 1991-2023
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Oct 29 00:23 2025
byte_data = a5
bit 3 = 0
bits [3:0] = 5
data_word[2] = ad
data_word[1][3] = 1
           V C S   S i m u l a t i o n   R e p o r t 
Time: 0 ns
CPU Time:      0.470 seconds;       Data structure size:   0.0Mb
Wed Oct 29 00:23:43 2025
Done

/***********************************/
  Example-2
/***********************************/
module static_array_or_packed_array_example;
  bit [7:0]   m_data;   // A vector or 1D packed array
 
  initial begin
    // 1. Assign a value to the vector
    m_data = 8'hA2; 
 
    // 2. Iterate through each bit of the vector and print value
    for (int i = 0; i < $size(m_data); i++) begin
      $display ("m_data[%0d] = %b", i, m_data[i]);
    end
  end
endmodule

// LogFile Output
Starting vcs inline pass...
1 module and 0 UDP read.
recompiling module static_array_or_packed_array_example
rm -f _cuarc*.so _csrc*.so pre_vcsobj_*.so share_vcsobj_*.so
if [ -x ../simv ]; then chmod a-x ../simv; fi
g++  -o ../simv      -rdynamic  -Wl,-rpath='$ORIGIN'/simv.daidir -Wl,-rpath=./simv.daidir -Wl,-rpath=/apps/vcsmx/vcs/U-2023.03-SP2/linux64/lib -L/apps/vcsmx/vcs/U-2023.03-SP2/linux64/lib  -Wl,-rpath-link=./   objs/amcQw_d.o   _331_archive_1.so   SIM_l.o       rmapats_mop.o rmapats.o rmar.o rmar_nd.o  rmar_llvm_0_1.o rmar_llvm_0_0.o            -lvirsim -lerrorinf -lsnpsmalloc -lvfs    -lvcsnew -lsimprofile -luclinative /apps/vcsmx/vcs/U-2023.03-SP2/linux64/lib/vcs_tls.o   -Wl,-whole-archive  -lvcsucli    -Wl,-no-whole-archive          /apps/vcsmx/vcs/U-2023.03-SP2/linux64/lib/vcs_save_restore_new.o -ldl  -lc -lm -lpthread -ldl 
../simv up to date
CPU time: .379 seconds to compile + .390 seconds to elab + .350 seconds to link
Chronologic VCS simulator copyright 1991-2023
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Oct 29 00:54 2025
m_data[0] = 0
m_data[1] = 1
m_data[2] = 0
m_data[3] = 0
m_data[4] = 0
m_data[5] = 1
m_data[6] = 0
m_data[7] = 1
           V C S   S i m u l a t i o n   R e p o r t 
Time: 0 ns
CPU Time:      0.390 seconds;       Data structure size:   0.0Mb
Wed Oct 29 00:54:20 2025
Done  
