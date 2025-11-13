Array reduction methods Overview :
  -The array reduction methods are used to reduce the array to a single value with the optional use of the ‘with’ clause.
  -The reduction methods can be applied on any unpacked array. 
  -For a ‘with’ clause, boolean or arithmetic reduction operation must be specified.
  -Note: If the ‘with’ clause is specified, the above reduction methods return value based on evaluating the expression for each array element.

Methods                                                     Description

and                                                         Returns bitwise AND (&) of all elements of the array.

or                                                          Returns bitwise OR (|) of all elements of the array.

xor                                                         Returns bitwise XOR (^) of all elements of the array.

sum                                                         Returns the sum of all elements of the array.

product                                                     Returns product of all elements of the array.

/**********************************************/
    Array Reduction Method Example1
/**********************************************/    
module array_reduction_method_example1;
  int arr[8] = '{5,6,9,2,3,4,6,10};
  int que[$];
  initial begin
    que.push_back(45);
    que.push_back(30);
    que.push_back(99);
    que.push_back(51);
    que.push_back(85);
    
    $display("---------------------------------------------");
    $display("------ Printing array and queue values -----");
    $display("---------------------------------------------");
    
    print_array_and_queue_values();
    
    $display("-------------------------------------");
    $display("------------ Methods ----------------");
    $display("-------------------------------------");
    
    $display("AND Operation for: arr = %0h and queue = %0h", arr.and(), que.and());
    $display("OR Operation for : arr = %0h and queue = %0h", arr.or(), que.or());
    $display("XOR Operation for: arr = %0h and queue = %0h", arr.xor(), que.xor());
    $display("SUM Operation for: arr = %0d and queue = %0d", arr.sum(), que.sum());
    $display("PRODUCT Operation for: arr = %0d and queue = %0d", arr.product(), que.product());  
  end
  
  //-------------------------
  // print array and queue
  //-------------------------
  
  function void print_array_and_queue_values();
    $display("Array = %p", arr);
    $display("Queue = %p", que);
  endfunction
  
endmodule :array_reduction_method_example1

//Log File Output
Starting vcs inline pass...
1 module and 0 UDP read.
recompiling module array_reduction_method_example1
rm -f _cuarc*.so _csrc*.so pre_vcsobj_*.so share_vcsobj_*.so
if [ -x ../simv ]; then chmod a-x ../simv; fi
g++  -o ../simv      -rdynamic  -Wl,-rpath='$ORIGIN'/simv.daidir -Wl,-rpath=./simv.daidir -Wl,-rpath=/apps/vcsmx/vcs/U-2023.03-SP2/linux64/lib -L/apps/vcsmx/vcs/U-2023.03-SP2/linux64/lib  -Wl,-rpath-link=./   objs/amcQw_d.o   _331_archive_1.so   SIM_l.o       rmapats_mop.o rmapats.o rmar.o rmar_nd.o  rmar_llvm_0_1.o rmar_llvm_0_0.o            -lvirsim -lerrorinf -lsnpsmalloc -lvfs    -lvcsnew -lsimprofile -luclinative /apps/vcsmx/vcs/U-2023.03-SP2/linux64/lib/vcs_tls.o   -Wl,-whole-archive  -lvcsucli    -Wl,-no-whole-archive          /apps/vcsmx/vcs/U-2023.03-SP2/linux64/lib/vcs_save_restore_new.o -ldl  -lc -lm -lpthread -ldl 
../simv up to date
CPU time: .391 seconds to compile + .367 seconds to elab + .339 seconds to link
Chronologic VCS simulator copyright 1991-2023
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Nov 13 03:58 2025
---------------------------------------------
------ Printing array and queue values -----
---------------------------------------------
Array = '{5, 6, 9, 2, 3, 4, 6, 10} 
Queue = '{45, 30, 99, 51, 85} 
-------------------------------------
------------ Methods ----------------
-------------------------------------
AND Operation for: arr = 0 and queue = 0
OR Operation for : arr = f and queue = 7f
XOR Operation for: arr = 3 and queue = 36
SUM Operation for: arr = 45 and queue = 310
PRODUCT Operation for: arr = 388800 and queue = 579372750
           V C S   S i m u l a t i o n   R e p o r t 
Time: 0 ns
CPU Time:      0.360 seconds;       Data structure size:   0.0Mb
Thu Nov 13 03:58:45 2025
Done
