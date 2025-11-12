Array ordering methods in SV
  -The ordering methods are used to reorder the single-dimensional arrays or queues.

Methods                                                      Description

shuffle                                                      Randomizes the order of the elements in an array

sort                                                         Sorts the unpacked array in ascending order

rsort                                                        Sorts the unpacked array in descending order

reverse                                                      Reverses all the elements of a packed or unpacked array.

Note:

-The sort and rsort methods may use the ‘with’ clause. The ‘with’ clause usage is optional. 
-The shuffle and reverse methods lead to a compilation error if the ‘with’ clause is specified.

/**********************************************/
   Array Ordering Example1 
/***********************************************/  
module array_ordering_example1;
  
  int arr[8] = '{5,6,9,2,3,4,6,10};
  int que[$];
  
  initial begin
    que.push_back(45);
    que.push_back(30);
    que.push_back(99);
    que.push_back(51);
    que.push_back(85);
    
    $display("-------------------------------------");
    $display("------ Printing array and queue -----");
    $display("-------------------------------------");
    print_array_queue();
    
    $display("-------------------------------------");
    $display("----------- shuffle method ----------");
    $display("-------------------------------------");
    shuffle_method();
    print_array_queue();
    
    $display("-------------------------------------");
    $display("---------- reverse method -----------");
    $display("-------------------------------------");
    reverse_method();
    print_array_queue();
    
    $display("-------------------------------------");
    $display("------------- sort method -----------");
    $display("-------------------------------------");
    sort_method();
    print_array_queue();
    
    $display("-------------------------------------");
    $display("------------ rsort method -----------");
    $display("-------------------------------------");
    rsort_method();
    print_array_queue();
    
    /*
    $display("--------------------------------------------------------");
    $display("------------- sort method Using with clause -----------");
    $display("-------------------------------------------------------");
    sort_method_using_with_clause();
    print_array_queue();
    
    $display("--------------------------------------------------------");
    $display("------------ rsort method Using with clause -----------");
    $display("-------------------------------------------------------");
    rsort_method_using_with_clause();
    print_array_queue();
    */
    
  end
  
  //-------------------------
  // Array gen and methods
  //-------------------------
  
  function void print_array_queue();
    $display("Array = %p", arr);
    $display("Queue = %p", que);
  endfunction :print_array_queue
  
  function void shuffle_method();
    arr.shuffle();
    que.shuffle();
  endfunction :shuffle_method
  
  function void sort_method();
    arr.sort();
    que.sort();
  endfunction :sort_method
  
  function void rsort_method();
    arr.rsort();
    que.rsort();
  endfunction :rsort_method
  
  function void reverse_method();
    arr.reverse();
    que.reverse();
  endfunction :reverse_method
  
 /* 
  // sort method uses using 'with' clause
  function void sort_method_using_with_clause();
    
    arr.sort (item) with (item > 6);  
    
    que.sort (item) with (item < 40);
  endfunction :sort_method_using_with_clause
  
  // rsort method uses using 'with' clause
  function void rsort_method_using_with_clause();
    
    arr.rsort (item) with (item > 6);  
    
    que.rsort (item) with (item < 40);
  endfunction :rsort_method_using_with_clause
 */ 
endmodule :array_ordering_example1  
  
//Log File Output
Starting vcs inline pass...
1 module and 0 UDP read.
recompiling module array_ordering_example1
rm -f _cuarc*.so _csrc*.so pre_vcsobj_*.so share_vcsobj_*.so
if [ -x ../simv ]; then chmod a-x ../simv; fi
g++  -o ../simv      -rdynamic  -Wl,-rpath='$ORIGIN'/simv.daidir -Wl,-rpath=./simv.daidir -Wl,-rpath=/apps/vcsmx/vcs/U-2023.03-SP2/linux64/lib -L/apps/vcsmx/vcs/U-2023.03-SP2/linux64/lib  -Wl,-rpath-link=./   objs/amcQw_d.o   _332_archive_1.so   SIM_l.o       rmapats_mop.o rmapats.o rmar.o rmar_nd.o  rmar_llvm_0_1.o rmar_llvm_0_0.o            -lvirsim -lerrorinf -lsnpsmalloc -lvfs    -lvcsnew -lsimprofile -luclinative /apps/vcsmx/vcs/U-2023.03-SP2/linux64/lib/vcs_tls.o   -Wl,-whole-archive  -lvcsucli    -Wl,-no-whole-archive          /apps/vcsmx/vcs/U-2023.03-SP2/linux64/lib/vcs_save_restore_new.o -ldl  -lc -lm -lpthread -ldl 
../simv up to date
CPU time: .392 seconds to compile + .439 seconds to elab + .365 seconds to link
Chronologic VCS simulator copyright 1991-2023
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Nov 11 06:10 2025
-------------------------------------
------ Printing array and queue -----
-------------------------------------
Array = '{5, 6, 9, 2, 3, 4, 6, 10} 
Queue = '{45, 30, 99, 51, 85} 
-------------------------------------
----------- shuffle method ----------
-------------------------------------
Array = '{2, 4, 10, 6, 9, 6, 5, 3} 
Queue = '{99, 45, 85, 30, 51} 
-------------------------------------
---------- reverse method -----------
-------------------------------------
Array = '{3, 5, 6, 9, 6, 10, 4, 2} 
Queue = '{51, 30, 85, 45, 99} 
-------------------------------------
------------- sort method -----------
-------------------------------------
Array = '{2, 3, 4, 5, 6, 6, 9, 10} 
Queue = '{30, 45, 51, 85, 99} 
-------------------------------------
------------ rsort method -----------
-------------------------------------
Array = '{10, 9, 6, 6, 5, 4, 3, 2} 
Queue = '{99, 85, 51, 45, 30} 
           V C S   S i m u l a t i o n   R e p o r t 
Time: 0 ns
CPU Time:      0.390 seconds;       Data structure size:   0.0Mb
Tue Nov 11 06:10:46 2025
Done
  
/*******************************************************************************/
   Array Ordering Example2- sort and rsort methods may use the ‘with’ clause.
/**********************************************************************************/      
//Important and Tricky example

/*
Note:
-The sort and rsort methods may use the ‘with’ clause. The ‘with’ clause usage is optional. 
-The shuffle and reverse methods lead to a compilation error if the ‘with’ clause is specified.
  */
module array_ordering_method_using_with_clause;
  
  string str[5]   = '{"siba", "Biranchi", "Subha", "Subhra", "Sriyambika"};
  int    a_value[8]  = '{3,2,1,6,8,7,4,9};
  
  initial begin
     $display ("********************************************");
     $display("BEFORE 'str' reverse: str=%p", str);  //str.reverse (x) with (x > 5);  //Compile ERROR - can't use 'with' clause
     str.reverse;
     $display("AFTER 'str' reverse: str=%p", str);
     $display ("********************************************");
    
    
     $display("BEFORE 'a_value' sort: a_value=%p", a_value);
     a_value.sort;
     $display("AFTER 'a_value' sort: a_value=%p",a_value);
     $display ("********************************************");
    
     $display("BEFORE 'a_value' sort using with clause: a_value=%p", a_value);
     a_value.sort (x) with (x > 3); //OK – 'with' clause is ok    
     $display("AFTER 'a_value' sort using with clause: a_value=%p",a_value);
     $display ("********************************************");
    
     $display("BEFORE 'a_value' rsort: a_value=%p",a_value);
     a_value.rsort;
     $display("AFTER 'a_value' rsort: a_value=%p",a_value);
     $display ("********************************************");
    
     $display("BEFORE 'a_value' rsort using with clause: a_value=%p",a_value);
     a_value.rsort (x) with (x > 3);    
     $display("AFTER 'a_value' rsort using with clause: a_value=%p",a_value);
     $display ("********************************************");
    
     $display("BEFORE 'a_value' shuffle: a_value=%p",a_value); //a_value.shuffle (x) with (x < 5); //Compile ERROR –cannot use 'with' clause
     a_value.shuffle;
     $display("AFTER 'a_value' shuffle: a_value=%p",a_value);
     $display ("********************************************");
    end
  
endmodule :array_ordering_method_using_with_clause

//Log File
 Starting vcs inline pass...
1 module and 0 UDP read.
recompiling module array_ordering_method_using_with_clause
rm -f _cuarc*.so _csrc*.so pre_vcsobj_*.so share_vcsobj_*.so
if [ -x ../simv ]; then chmod a-x ../simv; fi
g++  -o ../simv      -rdynamic  -Wl,-rpath='$ORIGIN'/simv.daidir -Wl,-rpath=./simv.daidir -Wl,-rpath=/apps/vcsmx/vcs/U-2023.03-SP2/linux64/lib -L/apps/vcsmx/vcs/U-2023.03-SP2/linux64/lib  -Wl,-rpath-link=./   objs/amcQw_d.o   _332_archive_1.so   SIM_l.o       rmapats_mop.o rmapats.o rmar.o rmar_nd.o  rmar_llvm_0_1.o rmar_llvm_0_0.o            -lvirsim -lerrorinf -lsnpsmalloc -lvfs    -lvcsnew -lsimprofile -luclinative /apps/vcsmx/vcs/U-2023.03-SP2/linux64/lib/vcs_tls.o   -Wl,-whole-archive  -lvcsucli    -Wl,-no-whole-archive          /apps/vcsmx/vcs/U-2023.03-SP2/linux64/lib/vcs_save_restore_new.o -ldl  -lc -lm -lpthread -ldl 
../simv up to date
CPU time: .388 seconds to compile + .419 seconds to elab + .369 seconds to link
Chronologic VCS simulator copyright 1991-2023
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Nov 11 19:55 2025
********************************************
BEFORE 'str' reverse: str='{"siba", "Biranchi", "Subha", "Subhra", "Sriyambika"} 
AFTER 'str' reverse: str='{"Sriyambika", "Subhra", "Subha", "Biranchi", "siba"} 
********************************************
BEFORE 'a_value' sort: a_value='{3, 2, 1, 6, 8, 7, 4, 9} 
AFTER 'a_value' sort: a_value='{1, 2, 3, 4, 6, 7, 8, 9} 
********************************************
BEFORE 'a_value' sort using with clause: a_value='{1, 2, 3, 4, 6, 7, 8, 9} 
AFTER 'a_value' sort using with clause: a_value='{2, 3, 1, 8, 7, 9, 4, 6} 
********************************************
BEFORE 'a_value' rsort: a_value='{2, 3, 1, 8, 7, 9, 4, 6} 
AFTER 'a_value' rsort: a_value='{9, 8, 7, 6, 4, 3, 2, 1} 
********************************************
BEFORE 'a_value' rsort using with clause: a_value='{9, 8, 7, 6, 4, 3, 2, 1} 
AFTER 'a_value' rsort using with clause: a_value='{6, 7, 4, 9, 8, 2, 1, 3} 
********************************************
BEFORE 'a_value' shuffle: a_value='{6, 7, 4, 9, 8, 2, 1, 3} 
AFTER 'a_value' shuffle: a_value='{1, 8, 3, 9, 4, 2, 6, 7} 
********************************************
           V C S   S i m u l a t i o n   R e p o r t 
Time: 0 ns
CPU Time:      0.400 seconds;       Data structure size:   0.0Mb
Tue Nov 11 19:55:51 2025
Done 
