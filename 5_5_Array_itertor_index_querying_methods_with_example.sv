Iterator index querying method Overview:
 - The iterator index querying method iterates over array indexes or elements at each iteration.
 - Syntax as below:
   find method
   q = arr.find(x) with (x == x.index);
   //or
   q = arr.find with (item == item.index);
  - As mentioned above, the find method compares the index value with the element and pushes it into the queue. 
  - Thus, queue size represents matched value count for the same index and element value.

 /************************************************/
    Array Iterator Index Querying Method Example1
 /************************************************/   
module array_iterator_index_method_example1;
  int arr[8] = '{5,6,9,2,4,4,6,7};
  int q[$], qsize;
  
  initial begin
    q = arr.find(x) with (x == x.index); // Mean at Index4 , Value=4 . At Index6 , value=6 , At Index7 , value=7
    //or
    //q = arr.find with (item == item.index);
    qsize = q.size();
    $display("Count = %0d having same index and element", qsize);
    $display("same index and elements are %p", q);
  end
endmodule :array_iterator_index_method_example1

//Log File Output
Starting vcs inline pass...

1 module and 0 UDP read.
recompiling module array_iterator_index_method_example1
rm -f _cuarc*.so _csrc*.so pre_vcsobj_*.so share_vcsobj_*.so
if [ -x ../simv ]; then chmod a-x ../simv; fi
g++  -o ../simv      -rdynamic  -Wl,-rpath='$ORIGIN'/simv.daidir -Wl,-rpath=./simv.daidir -Wl,-rpath=/apps/vcsmx/vcs/U-2023.03-SP2/linux64/lib -L/apps/vcsmx/vcs/U-2023.03-SP2/linux64/lib  -Wl,-rpath-link=./   objs/amcQw_d.o   _331_archive_1.so   SIM_l.o       rmapats_mop.o rmapats.o rmar.o rmar_nd.o  rmar_llvm_0_1.o rmar_llvm_0_0.o            -lvirsim -lerrorinf -lsnpsmalloc -lvfs    -lvcsnew -lsimprofile -luclinative /apps/vcsmx/vcs/U-2023.03-SP2/linux64/lib/vcs_tls.o   -Wl,-whole-archive  -lvcsucli    -Wl,-no-whole-archive          /apps/vcsmx/vcs/U-2023.03-SP2/linux64/lib/vcs_save_restore_new.o -ldl  -lc -lm -lpthread -ldl 
../simv up to date
CPU time: .416 seconds to compile + .479 seconds to elab + .411 seconds to link
Chronologic VCS simulator copyright 1991-2023
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Nov 13 04:07 2025
Count = 3 having same index and element
same index and elements are '{4, 6, 7} 
           V C S   S i m u l a t i o n   R e p o r t 
Time: 0 ns
CPU Time:      0.390 seconds;       Data structure size:   0.0Mb
Thu Nov 13 04:07:42 2025
Done
  
/*****************************************************/
    Array Iterator Index Querying Method Example2
/***************************************************/     
