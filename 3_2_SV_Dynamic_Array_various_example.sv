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
 Dynamic Array Method Example-3
/********************************/  
module dynamic_array_example3;
  // Create a dynamic array that can hold elements of type string
  string   fruits [];       
 
  initial begin
    // Create a size for the dynamic array -> size here is 3
    // so that it can hold 3 values
        fruits = new [3];       
 
    // Initialize the array with five values
        fruits = '{"apple", "orange", "mango"};
 
        // Print size of the dynamic array
    $display ("fruits.size() = %0d", fruits.size());
 
    // Empty the dynamic array by deleting all items
    fruits.delete();
    $display ("fruits.size() = %0d", fruits.size());
  end
endmodule :dynamic_array_example3

//Log File Output
 Starting vcs inline pass...
1 module and 0 UDP read.
recompiling module tb
rm -f _cuarc*.so _csrc*.so pre_vcsobj_*.so share_vcsobj_*.so
if [ -x ../simv ]; then chmod a-x ../simv; fi
g++  -o ../simv      -rdynamic  -Wl,-rpath='$ORIGIN'/simv.daidir -Wl,-rpath=./simv.daidir -Wl,-rpath=/apps/vcsmx/vcs/U-2023.03-SP2/linux64/lib -L/apps/vcsmx/vcs/U-2023.03-SP2/linux64/lib  -Wl,-rpath-link=./   objs/amcQw_d.o   _331_archive_1.so   SIM_l.o       rmapats_mop.o rmapats.o rmar.o rmar_nd.o  rmar_llvm_0_1.o rmar_llvm_0_0.o            -lvirsim -lerrorinf -lsnpsmalloc -lvfs    -lvcsnew -lsimprofile -luclinative /apps/vcsmx/vcs/U-2023.03-SP2/linux64/lib/vcs_tls.o   -Wl,-whole-archive  -lvcsucli    -Wl,-no-whole-archive          /apps/vcsmx/vcs/U-2023.03-SP2/linux64/lib/vcs_save_restore_new.o -ldl  -lc -lm -lpthread -ldl 
../simv up to date
CPU time: .352 seconds to compile + .334 seconds to elab + .367 seconds to link
Chronologic VCS simulator copyright 1991-2023
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Nov  3 00:39 2025
fruits.size() = 3
fruits.size() = 0
           V C S   S i m u l a t i o n   R e p o r t 
Time: 0 ns
CPU Time:      0.390 seconds;       Data structure size:   0.0Mb
Mon Nov  3 00:39:11

/************************************************************************/
 Dynamic Array Example-4
 How to add new items to a dynamic array ?
  int d1 [];
  d1 = new [10]; 
  // This creates one more slot in the d1 dyn array, while keeping old contents
 d1 = new [d1.size() + 1] (d1);
/*************************************************************************/  
module add_new_item_to_syn_array_example;
  // Create two dynamic arrays of type int
  int d1 [];
  int d2 [];
 
  initial begin
    // Allocate 5 memory locations to "d1" and initialize with values
    d1 = new [5];
    d1 = '{1, 2, 3, 4, 5};
    
    // Display contents of "d1"
    $display ("d1 = %p", d1);
    
    // Point "d2" to "d1"
    d2 = d1;
 
    // Display contents of "d2"
    $display ("d2 = %p", d2);
 
    // Grow size by 1 and copy existing elements to the new dyn.Array "d2"
    d2 = new [d2.size() + 1] (d2);
 
    // Assign value 6 to the newly added location [index 5]
    d2 [d2.size() - 1] = 6;
 
    // Display contents of new "id"
    $display ("New d2 = %p", d2);
 
    // Display size of both arrays
    $display ("d1.size() = %0d, d2.size() = %0d", d1.size(), d2.size());
  end
endmodule :add_new_item_to_syn_array_example
 
//LogFile Output
 Starting vcs inline pass...
1 module and 0 UDP read.
recompiling module add_new_item_to_syn_array_example
rm -f _cuarc*.so _csrc*.so pre_vcsobj_*.so share_vcsobj_*.so
if [ -x ../simv ]; then chmod a-x ../simv; fi
g++  -o ../simv      -rdynamic  -Wl,-rpath='$ORIGIN'/simv.daidir -Wl,-rpath=./simv.daidir -Wl,-rpath=/apps/vcsmx/vcs/U-2023.03-SP2/linux64/lib -L/apps/vcsmx/vcs/U-2023.03-SP2/linux64/lib  -Wl,-rpath-link=./   objs/amcQw_d.o   _332_archive_1.so   SIM_l.o       rmapats_mop.o rmapats.o rmar.o rmar_nd.o  rmar_llvm_0_1.o rmar_llvm_0_0.o            -lvirsim -lerrorinf -lsnpsmalloc -lvfs    -lvcsnew -lsimprofile -luclinative /apps/vcsmx/vcs/U-2023.03-SP2/linux64/lib/vcs_tls.o   -Wl,-whole-archive  -lvcsucli    -Wl,-no-whole-archive          /apps/vcsmx/vcs/U-2023.03-SP2/linux64/lib/vcs_save_restore_new.o -ldl  -lc -lm -lpthread -ldl 
../simv up to date
CPU time: .351 seconds to compile + .331 seconds to elab + .333 seconds to link
Chronologic VCS simulator copyright 1991-2023
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Nov  3 00:47 2025
d1 = '{1, 2, 3, 4, 5} 
d2 = '{1, 2, 3, 4, 5} 
New d2 = '{1, 2, 3, 4, 5, 6} 
d1.size() = 5, d2.size() = 6
           V C S   S i m u l a t i o n   R e p o r t 
Time: 0 ns
CPU Time:      0.360 seconds;       Data structure size:   0.0Mb
Mon Nov  3 00:47:46 2025
Done
/********************************/
 Dynamic Array Method Example-5
/********************************/  
module string_of_dyn_array_with_method_example;
  
    int  fruits_l0 [string]; 
    initial begin
      fruits_l0 = '{ "apple"  : 4, 
                     "orange" : 10,
                     "plum"   : 9,
                     "guava"  : 1 };
  
      // size() : Print the number of items in the given dynamic array
      $display ("fruits_l0.size() = %0d", fruits_l0.size()); 
      // num() : Another function to print number of items in given array
      $display ("fruits_l0.num() = %0d", fruits_l0.num()); 
      // exists() : Check if a particular key exists in this dynamic array
      if (fruits_l0.exists ("orange"))
        $display ("Found %0d orange !", fruits_l0["orange"]);
 
      if (!fruits_l0.exists ("apricots"))
        $display ("Sorry, season for apricots is over ...");
 
      // Note: String indices are taken in alphabetical order
      // first() : Get the first element in the array
      begin
        string f;
        // This function returns true if it succeeded and first key is stored
        // in the provided string "f"
        if (fruits_l0.first (f))
          $display ("fruits_l0.first [%s] = %0d", f, fruits_l0[f]);
      end
 
      // last() : Get the last element in the array
      begin
        string f;
        if (fruits_l0.last (f))
          $display ("fruits_l0.last [%s] = %0d", f, fruits_l0[f]);
      end
 
      // prev() : Get the previous element in the array
      begin
        string f = "orange";
        if (fruits_l0.prev (f))
          $display ("fruits_l0.prev [%s] = %0d", f, fruits_l0[f]);
      end
 
      // next() : Get the next item in the array
      begin
        string f = "orange";
        if (fruits_l0.next (f))
          $display ("fruits_l0.next [%s] = %0d", f, fruits_l0[f]);
      end
    end
  
endmodule :string_of_dyn_array_with_method_example

//Log File Output
 Starting vcs inline pass...
1 module and 0 UDP read.
recompiling module string_of_dyn_array_with_method_example
rm -f _cuarc*.so _csrc*.so pre_vcsobj_*.so share_vcsobj_*.so
if [ -x ../simv ]; then chmod a-x ../simv; fi
g++  -o ../simv      -rdynamic  -Wl,-rpath='$ORIGIN'/simv.daidir -Wl,-rpath=./simv.daidir -Wl,-rpath=/apps/vcsmx/vcs/U-2023.03-SP2/linux64/lib -L/apps/vcsmx/vcs/U-2023.03-SP2/linux64/lib  -Wl,-rpath-link=./   objs/amcQw_d.o   _331_archive_1.so   SIM_l.o       rmapats_mop.o rmapats.o rmar.o rmar_nd.o  rmar_llvm_0_1.o rmar_llvm_0_0.o            -lvirsim -lerrorinf -lsnpsmalloc -lvfs    -lvcsnew -lsimprofile -luclinative /apps/vcsmx/vcs/U-2023.03-SP2/linux64/lib/vcs_tls.o   -Wl,-whole-archive  -lvcsucli    -Wl,-no-whole-archive          /apps/vcsmx/vcs/U-2023.03-SP2/linux64/lib/vcs_save_restore_new.o -ldl  -lc -lm -lpthread -ldl 
../simv up to date
CPU time: .418 seconds to compile + .445 seconds to elab + .339 seconds to link
Chronologic VCS simulator copyright 1991-2023
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Nov  3 00:52 2025
fruits_l0.size() = 4
fruits_l0.num() = 4
Found 10 orange !
Sorry, season for apricots is over ...
fruits_l0.first [apple] = 4
fruits_l0.last [plum] = 9
fruits_l0.prev [guava] = 1
fruits_l0.next [plum] = 9
           V C S   S i m u l a t i o n   R e p o r t 
Time: 0 ns
CPU Time:      0.370 seconds;       Data structure size:   0.0Mb
Mon Nov  3 00:52:03 2025
Done
 
