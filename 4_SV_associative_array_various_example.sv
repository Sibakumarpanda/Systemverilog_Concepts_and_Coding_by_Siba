/*****************************************/
  Associative Array Example -1
/*****************************************/
module associative_array_example1;
 
  int     array1 [int];       // An integer array with integer index
  int     array2 [string];     // An integer array with string index
  string  array3 [string];     // A string array with string index
 
    initial begin
        // Initialize each dynamic array with some values
      array1 = '{ 1 : 22, 6 : 34 };
 
      array2 = '{ "Ross" : 100, "Joey" : 60 };
 
      array3 = '{ "Apples" : "Oranges", "Pears" : "44" };
 
      // Print each array
      $display ("array1 = %p", array1);
      $display ("array2 = %p", array2);
      $display ("array3 = %p", array3);
    end
endmodule :associative_array_example1

//LogFile Output

Starting vcs inline pass...
1 module and 0 UDP read.
recompiling module associative_array_example
rm -f _cuarc*.so _csrc*.so pre_vcsobj_*.so share_vcsobj_*.so
if [ -x ../simv ]; then chmod a-x ../simv; fi
g++  -o ../simv      -rdynamic  -Wl,-rpath='$ORIGIN'/simv.daidir -Wl,-rpath=./simv.daidir -Wl,-rpath=/apps/vcsmx/vcs/U-2023.03-SP2/linux64/lib -L/apps/vcsmx/vcs/U-2023.03-SP2/linux64/lib  -Wl,-rpath-link=./   objs/amcQw_d.o   _331_archive_1.so   SIM_l.o       rmapats_mop.o rmapats.o rmar.o rmar_nd.o  rmar_llvm_0_1.o rmar_llvm_0_0.o            -lvirsim -lerrorinf -lsnpsmalloc -lvfs    -lvcsnew -lsimprofile -luclinative /apps/vcsmx/vcs/U-2023.03-SP2/linux64/lib/vcs_tls.o   -Wl,-whole-archive  -lvcsucli    -Wl,-no-whole-archive          /apps/vcsmx/vcs/U-2023.03-SP2/linux64/lib/vcs_save_restore_new.o -ldl  -lc -lm -lpthread -ldl 
../simv up to date
CPU time: .400 seconds to compile + .478 seconds to elab + .415 seconds to link
Chronologic VCS simulator copyright 1991-2023
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Nov  3 03:45 2025
array1 = '{0x1:22, 0x6:34} 
array2 = '{"Joey":60, "Ross":100} 
array3 = '{"Apples":"Oranges", "Pears":"44"} 
  
           V C S   S i m u l a t i o n   R e p o r t 
Time: 0 ns
CPU Time:      0.670 seconds;       Data structure size:   0.0Mb
Mon Nov  3 03:45:16 2025
Done

/*****************************************/
  Associative Array Example -2
/*****************************************/ 
module associative_array_example2;
  typedef enum {TRANS, RECEIVE, REPEATER} tr_type;
  bit [7:0] array_enum [tr_type];
  bit [7:0] array_int [int];
  
  initial begin
    
    array_enum[TRANS] = 10;
    array_enum[RECEIVE] = 20;
    array_enum[REPEATER] = 30;
    
    foreach (array_enum[i]) 
      $display("array_enum[%s] = %0d", i.name(), array_enum[i]);
    
    array_int[5] = 2;
    array_int[10] = 4;
    array_int[7] = 6;
    
    foreach (array_int[i]) 
      $display("array_int[%0d] = %0d", i, array_int[i]);
  end
endmodule  :associative_array_example2
  
//Log file Output
  
array_enum[TRANS] = 10
array_enum[RECEIVE] = 20
array_enum[REPEATER] = 30
array_int[5] = 2
array_int[7] = 6
array_int[10] = 4
  
