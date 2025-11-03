/********************************/
 Dynamic Array Basic Example-1
/********************************/
module dynamic_array_example1;
  int array [];
  initial begin
    array = new[5];
    array = '{5, 10, 15, 20, 25};
    
    // Print elements of an array
    foreach (array[i]) 
      $display("array[%0d] = %0d", i, array[i]);
    
    // size of an array
    $display("size of array = %0d", array.size());
    
    // Resizing of an array and copy old array content
    array = new[8] (array);
    $display("size of array after resizing = %0d", array.size());
    
    // Print elements of an array
    foreach (array[i]) 
      $display("array[%0d] = %0d", i, array[i]);
    
    // Override existing array: Previous array elememt values will be lost
    array = new[6];
    $display("size of array after overriding = %0d", array.size());
    
    // Print elements of an array
    foreach (array[i]) 
      $display("array[%0d] = %0d", i, array[i]);
    
    array.delete();
    $display("size of array after deleting = %0d", array.size());
    
  end
endmodule :dynamic_array_example1

//Log File Output
array[0] = 5
array[1] = 10
array[2] = 15
array[3] = 20
array[4] = 25
size of array = 5
size of array after resizing = 8
array[0] = 5
array[1] = 10
array[2] = 15
array[3] = 20
array[4] = 25
array[5] = 0
array[6] = 0
array[7] = 0
size of array after overriding = 6
array[0] = 0
array[1] = 0
array[2] = 0
array[3] = 0
array[4] = 0
array[5] = 0
size of array after deleting = 0

/********************************/
 Dynamic Array Basic Example-2
/********************************/
module dynamic_array_example2;
  // Create a dynamic array that can hold elements of type int
  int   array [];       
 
  initial begin
    // Create a size for the dynamic array -> size here is 5
    // so that it can hold 5 values
    array = new [5];       
 
    // Initialize the array with five values
    array = '{31, 67, 10, 4, 99};
 
    // Loop through the array and print their values
    foreach (array[i]) 
      $display ("array[%0d] = %0d", i, array[i]);
  end
endmodule :dynamic_array_example2

//Log File Output
Starting vcs inline pass...
1 module and 0 UDP read.
recompiling module tb
rm -f _cuarc*.so _csrc*.so pre_vcsobj_*.so share_vcsobj_*.so
if [ -x ../simv ]; then chmod a-x ../simv; fi
g++  -o ../simv      -rdynamic  -Wl,-rpath='$ORIGIN'/simv.daidir -Wl,-rpath=./simv.daidir -Wl,-rpath=/apps/vcsmx/vcs/U-2023.03-SP2/linux64/lib -L/apps/vcsmx/vcs/U-2023.03-SP2/linux64/lib  -Wl,-rpath-link=./   objs/amcQw_d.o   _331_archive_1.so   SIM_l.o       rmapats_mop.o rmapats.o rmar.o rmar_nd.o  rmar_llvm_0_1.o rmar_llvm_0_0.o            -lvirsim -lerrorinf -lsnpsmalloc -lvfs    -lvcsnew -lsimprofile -luclinative /apps/vcsmx/vcs/U-2023.03-SP2/linux64/lib/vcs_tls.o   -Wl,-whole-archive  -lvcsucli    -Wl,-no-whole-archive          /apps/vcsmx/vcs/U-2023.03-SP2/linux64/lib/vcs_save_restore_new.o -ldl  -lc -lm -lpthread -ldl 
../simv up to date
CPU time: .404 seconds to compile + .464 seconds to elab + .401 seconds to link
Chronologic VCS simulator copyright 1991-2023
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Nov  3 00:34 2025
array[0] = 31
array[1] = 67
array[2] = 10
array[3] = 4
array[4] = 99
           V C S   S i m u l a t i o n   R e p o r t 
Time: 0 ns
CPU Time:      0.420 seconds;       Data structure size:   0.0Mb
Mon Nov  3 00:34:17 2025
Done

/********************************/
 Dynamic Array Example-3
/********************************/  
