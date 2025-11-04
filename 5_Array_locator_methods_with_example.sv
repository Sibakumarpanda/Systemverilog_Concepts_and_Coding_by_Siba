Array Locator methods Overview :

- Array locator methods operate on queues, unpacked arrays, but their return type is a queue.
- An array locator methods do below operations
    Search an index or elements of the array
    Array traversal in an unspecified order
  
-  The array location methods can be classified into two types
      Element locator
      Index locator

Element locator Methods: 
  - In element locator type, locator methods iterate over all elements in an array, and then it is used to evaluate the expression specified ‘with’ clause and returns element/s in a queue. 
  - For some of the methods, the ‘with’ clause is optional.
  - The Element locator methods are as below
  
find          -Returns all elements satisfying the given expression.
find_first    -Returns the first element satisfying the given expression.
find_last     -Returns the last element satisfying the given expression.
unique        -Returns all elements with unique values or whose expression is unique 
min           -Returns the element with the minimum value or whose expression evaluates to a minimum.
max           -Returns the element with the maximum value or whose expression evaluates to a maximum.
    
/**************************************************************************************************/
      Array Locator Methods , Complete Example1
/**************************************************************************************************/
// Transaction class , File Name : array_locator_method_trans_class.sv
    
typedef enum {RED, GREEN, YELLOW} color_type;
class array_locator_method_trans_class;
  
  rand bit [2:0] addr;
  rand bit [2:0] data;
  rand color_type colors; 
  
  function void print;
    $display("addr = %0d, data = %0d and color = %s", addr, data, colors.name);
  endfunction
  
endclass :array_locator_method_trans_class    

// TB TOP , File Name : testbench.sv   
`include "array_locator_method_trans_class.sv"
module elememt_arr_locator_tb_top_example1;
  
  array_locator_method_trans_class tr;
  array_locator_method_trans_class tr_assoc_arr[int];
  int arr[8] = '{5,6,9,2,3,4,6,10};
  
  initial begin
    $display("-------------------------------------");
    $display("--------- Generating array ----------");
    $display("-------------------------------------");
    array_gen();
    $display("-------------------------------------");
    $display("------------- find method -----------");
    $display("-------------------------------------");
    find_method();
    $display("-------------------------------------");
    $display("--------- find_first method ---------");
    $display("-------------------------------------");
    find_first_method();
    $display("-------------------------------------");
    $display("--------- find_last method ----------");
    $display("-------------------------------------");
    find_last_method();
    $display("-------------------------------------");
    $display("---------- unique method ------------");
    $display("-------------------------------------");
    unique_method();
    $display("-------------------------------------");
    $display("---------- min max method -----------");
    $display("-------------------------------------");
    min_max_method();
  end
    
  //-------------------------
  // Array gen and methods
  //-------------------------
  
  function void array_gen();
    tr = new();
    assert(tr.randomize());
    tr.print();
    tr_assoc_arr[3] =  tr;
    
    tr = new();
    assert(tr.randomize());
    tr.print();
    tr_assoc_arr[5] =  tr;
    
    tr = new();
    assert(tr.randomize());
    tr.print();
    tr_assoc_arr[8] =  tr;
    
    tr = new();
    assert(tr.randomize());
    tr.print();
    tr_assoc_arr[11] =  tr;
    
    tr = new();
    assert(tr.randomize());
    tr.print();
    tr_assoc_arr[15] =  tr;
    
  endfunction :array_gen
  
  function void find_method();
    array_locator_method_trans_class tr_q[$], tr;
    int qsize;
    
    // Find all elements having item as YELLOW color
    tr_q = tr_assoc_arr.find with (item.colors == YELLOW);
    qsize = tr_q.size;
    $display("Number of elements for color item 'YELLOW' = %0d", qsize);
    
    for(int i = 0; i < qsize; i++) begin
      $display("Element %0d: ",i+1);
      tr = tr_q.pop_front();
      tr.print();
    end
    
    // expression has multiple conditions
    tr_q = tr_assoc_arr.find with (item.data >= 1 && item.data <= 5);
    qsize = tr_q.size;
    $display("\nNumber of elements for data item in range of 1 to 5 = %0d", qsize);
    
    for(int i = 0; i < qsize; i++) begin
      $display("Element %0d: ",i+1);
      tr = tr_q.pop_front();
      tr.print();
    end
  endfunction :find_method
  
  function void find_first_method();
    array_locator_method_trans_class tr_q[$], tr;
    int qsize;
    
    // Find first element having item as YELLOW color
    tr_q = tr_assoc_arr.find_first with (item.colors == YELLOW);
    qsize = tr_q.size;
    $display("Number of elements for color item 'YELLOW' = %0d", qsize);
    
    for(int i = 0; i < qsize; i++) begin
      $display("Element %0d: ",i+1);
      tr = tr_q.pop_front();
      tr.print();
    end
    
    // expression has multiple conditions
    tr_q = tr_assoc_arr.find_first with (item.data >= 1 && item.data <= 5);
    qsize = tr_q.size;
    $display("\nNumber of elements for data item in range of 1 to 5 = %0d", qsize);
    
    for(int i = 0; i < qsize; i++) begin
      $display("Element %0d: ",i+1);
      tr = tr_q.pop_front();
      tr.print();
    end
  endfunction : find_first_method
  
  function void find_last_method();
    array_locator_method_trans_class tr_q[$], tr;
    int qsize;
    
    // Find last element having item as YELLOW color
    tr_q = tr_assoc_arr.find_last with (item.colors == YELLOW);
    qsize = tr_q.size;
    $display("Number of elements for color item 'YELLOW' = %0d", qsize);
    
    for(int i = 0; i < qsize; i++) begin
      $display("Element %0d: ",i+1);
      tr = tr_q.pop_front();
      tr.print();
    end
    
    // expression has multiple conditions
    tr_q = tr_assoc_arr.find_last with (item.data >= 1 && item.data <= 5);
    qsize = tr_q.size;
    $display("\nNumber of elements for data item in range of 1 to 5 = %0d", qsize);
    
    for(int i = 0; i < qsize; i++) begin
      $display("Element %0d: ",i+1);
      tr = tr_q.pop_front();
      tr.print();
    end
  endfunction :find_last_method
  
  function void unique_method();
    array_locator_method_trans_class tr_q[$], tr;
    int arr_q[$];
    int qsize;
    
    arr_q = arr.unique();
    $display("unique element in arr = %p", arr_q);
    
    // Find unique elements of addr.
    tr_q = tr_assoc_arr.unique with (item.addr);
    qsize = tr_q.size;
    $display("Number of unique elements for addr = %0d", qsize);
    
    for(int i = 0; i < qsize; i++) begin
      $display("Element %0d: ",i+1);
      tr = tr_q.pop_front();
      tr.print();
    end
  endfunction : unique_method
  
  function void min_max_method();
    array_locator_method_trans_class tr_q[$], tr;
    int arr_q[$];
    int qsize;
    
    // Find min and max element in an array
    arr_q = arr.min;
    $display("min element in arr = %p", arr_q);
    arr_q = arr.max;
    $display("max element in arr = %p", arr_q);
    
    tr_q = tr_assoc_arr.min with (item.addr);
    qsize = tr_q.size;
       
    for(int i = 0; i < qsize; i++) begin
      $display("Min element w.r.t. addr is ");
      tr = tr_q.pop_front();
      tr.print();
    end
    
    tr_q = tr_assoc_arr.max with (item.addr);
    qsize = tr_q.size;
       
    for(int i = 0; i < qsize; i++) begin
      $display("Max element w.r.t. addr is ");
      tr = tr_q.pop_front();
      tr.print();
    end
  endfunction :min_max_method
  
endmodule :elememt_arr_locator_tb_top_example1    

//Log File Output
    
Starting vcs inline pass...
1 module and 0 UDP read.
recompiling module elememt_arr_locator_example1
rm -f _cuarc*.so _csrc*.so pre_vcsobj_*.so share_vcsobj_*.so
if [ -x ../simv ]; then chmod a-x ../simv; fi
g++  -o ../simv      -rdynamic  -Wl,-rpath='$ORIGIN'/simv.daidir -Wl,-rpath=./simv.daidir -Wl,-rpath=/apps/vcsmx/vcs/U-2023.03-SP2/linux64/lib -L/apps/vcsmx/vcs/U-2023.03-SP2/linux64/lib  -Wl,-rpath-link=./   objs/amcQw_d.o   _332_archive_1.so   SIM_l.o       rmapats_mop.o rmapats.o rmar.o rmar_nd.o  rmar_llvm_0_1.o rmar_llvm_0_0.o            -lvirsim -lerrorinf -lsnpsmalloc -lvfs    -lvcsnew -lsimprofile -luclinative /apps/vcsmx/vcs/U-2023.03-SP2/linux64/lib/vcs_tls.o   -Wl,-whole-archive  -lvcsucli    -Wl,-no-whole-archive          /apps/vcsmx/vcs/U-2023.03-SP2/linux64/lib/vcs_save_restore_new.o -ldl  -lc -lm -lpthread -ldl 
../simv up to date
CPU time: .425 seconds to compile + .402 seconds to elab + .365 seconds to link
Chronologic VCS simulator copyright 1991-2023
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Nov  4 01:54 2025
-------------------------------------
--------- Generating array ----------
-------------------------------------
addr = 1, data = 4 and color = GREEN
addr = 7, data = 4 and color = GREEN
addr = 3, data = 1 and color = YELLOW
addr = 6, data = 3 and color = YELLOW
addr = 1, data = 0 and color = GREEN
-------------------------------------
------------- find method -----------
-------------------------------------
Number of elements for color item 'YELLOW' = 2
Element 1: 
addr = 3, data = 1 and color = YELLOW
Element 2: 
addr = 6, data = 3 and color = YELLOW

Number of elements for data item in range of 1 to 5 = 4
Element 1: 
addr = 1, data = 4 and color = GREEN
Element 2: 
addr = 7, data = 4 and color = GREEN
Element 3: 
addr = 3, data = 1 and color = YELLOW
Element 4: 
addr = 6, data = 3 and color = YELLOW
-------------------------------------
--------- find_first method ---------
-------------------------------------
Number of elements for color item 'YELLOW' = 1
Element 1: 
addr = 3, data = 1 and color = YELLOW

Number of elements for data item in range of 1 to 5 = 1
Element 1: 
addr = 1, data = 4 and color = GREEN
-------------------------------------
--------- find_last method ----------
-------------------------------------
Number of elements for color item 'YELLOW' = 1
Element 1: 
addr = 6, data = 3 and color = YELLOW

Number of elements for data item in range of 1 to 5 = 1
Element 1: 
addr = 6, data = 3 and color = YELLOW
-------------------------------------
---------- unique method ------------
-------------------------------------
unique element in arr = '{5, 6, 9, 2, 3, 4, 10} 
Number of unique elements for addr = 4
Element 1: 
addr = 1, data = 4 and color = GREEN
Element 2: 
addr = 7, data = 4 and color = GREEN
Element 3: 
addr = 3, data = 1 and color = YELLOW
Element 4: 
addr = 6, data = 3 and color = YELLOW
-------------------------------------
---------- min max method -----------
-------------------------------------
min element in arr = '{2} 
max element in arr = '{10} 
Min element w.r.t. addr is 
addr = 1, data = 4 and color = GREEN
Max element w.r.t. addr is 
addr = 7, data = 4 and color = GREEN
           V C S   S i m u l a t i o n   R e p o r t 
Time: 0 ns
CPU Time:      0.460 seconds;       Data structure size:   0.0Mb
Tue Nov  4 01:54:28 2025
Done
    
    
