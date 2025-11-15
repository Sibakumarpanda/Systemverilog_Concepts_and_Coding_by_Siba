/*************************************/
   Queue : Example1 - Basic example
/**************************************/
module queue_basic_example1;
    // Create a queue that can store "string" values
    string   fruits[$] =  { "orange", "apple", "kiwi" };
 
  initial begin
       // Iterate and access each queue element
      foreach (fruits[i]) 
        $display ("fruits[%0d] = %s", i, fruits[i]);
 
      // Display elements in a queue
      $display ("fruits = %p", fruits);
 
        // Delete all elements in the queue
        fruits = {};
        $display ("After deletion, fruits = %p", fruits);
  end
endmodule

//LogFile Output
Starting vcs inline pass...
1 module and 0 UDP read.
recompiling module queue_example1
rm -f _cuarc*.so _csrc*.so pre_vcsobj_*.so share_vcsobj_*.so
if [ -x ../simv ]; then chmod a-x ../simv; fi
g++  -o ../simv      -rdynamic  -Wl,-rpath='$ORIGIN'/simv.daidir -Wl,-rpath=./simv.daidir -Wl,-rpath=/apps/vcsmx/vcs/U-2023.03-SP2/linux64/lib -L/apps/vcsmx/vcs/U-2023.03-SP2/linux64/lib  -Wl,-rpath-link=./   objs/amcQw_d.o   _332_archive_1.so   SIM_l.o       rmapats_mop.o rmapats.o rmar.o rmar_nd.o  rmar_llvm_0_1.o rmar_llvm_0_0.o            -lvirsim -lerrorinf -lsnpsmalloc -lvfs    -lvcsnew -lsimprofile -luclinative /apps/vcsmx/vcs/U-2023.03-SP2/linux64/lib/vcs_tls.o   -Wl,-whole-archive  -lvcsucli    -Wl,-no-whole-archive          /apps/vcsmx/vcs/U-2023.03-SP2/linux64/lib/vcs_save_restore_new.o -ldl  -lc -lm -lpthread -ldl 
../simv up to date
CPU time: .396 seconds to compile + .414 seconds to elab + .392 seconds to link
Chronologic VCS simulator copyright 1991-2023
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Nov 13 06:25 2025
fruits[0] = orange
fruits[1] = apple
fruits[2] = kiwi
fruits = '{"orange", "apple", "kiwi"} 
After deletion, fruits = '{}
           V C S   S i m u l a t i o n   R e p o r t 
Time: 0 ns
CPU Time:      0.500 seconds;       Data structure size:   0.0Mb
Thu Nov 13 06:25:39 2025
Done
  
/*************************************************************************/
   Queue : Example2 : Example with size , pop_front, pop_back method uses
/************************************************************************/
module queue_basic_example2; 
  byte qu [$] ; 
  
  initial 
    begin 
    qu.push_front(2); 
    qu.push_front(12); 
    qu.push_front(22); 
    $display(" The queue elements are = %p",qu );  
      
    qu.push_back(11); 
    qu.push_back(99);      
    $display(" The queue elements are = %p",qu );
      
    //Printing all elements of the queue with respective indexes
    foreach (qu[i]) begin
      $display(" The queue element at qu[%0d] = %0d",i,qu[i] );
    end  
      
    $display(" Queue Size at beginning= %0d ",qu.size() ); 
    $display(" Poping front from Queue =%0d ",qu.pop_front() ); 
    $display(" Poping Back from Queue=%0d ",qu.pop_back() );
    $display(" The queue elements are = %p",qu );
      
    qu.delete(2); //Deletes the item at a specified index that is at index2
    $display(" The queue elements are = %p",qu );  
    $display(" Queue Size at current = %0d ",qu.size() ); 
      
    qu.delete(); //Deletes all elements in the queue
    $display(" The queue elements are = %p",qu );  
    $display(" Queue Size at end = %0d ",qu.size() ); 
    end 
  
endmodule :queue_basic_example2

//Log File Output
   
Starting vcs inline pass...
1 module and 0 UDP read.
recompiling module queue_basic_example2
rm -f _cuarc*.so _csrc*.so pre_vcsobj_*.so share_vcsobj_*.so
if [ -x ../simv ]; then chmod a-x ../simv; fi
g++  -o ../simv      -rdynamic  -Wl,-rpath='$ORIGIN'/simv.daidir -Wl,-rpath=./simv.daidir -Wl,-rpath=/apps/vcsmx/vcs/U-2023.03-SP2/linux64/lib -L/apps/vcsmx/vcs/U-2023.03-SP2/linux64/lib  -Wl,-rpath-link=./   objs/amcQw_d.o   _330_archive_1.so   SIM_l.o       rmapats_mop.o rmapats.o rmar.o rmar_nd.o  rmar_llvm_0_1.o rmar_llvm_0_0.o            -lvirsim -lerrorinf -lsnpsmalloc -lvfs    -lvcsnew -lsimprofile -luclinative /apps/vcsmx/vcs/U-2023.03-SP2/linux64/lib/vcs_tls.o   -Wl,-whole-archive  -lvcsucli    -Wl,-no-whole-archive          /apps/vcsmx/vcs/U-2023.03-SP2/linux64/lib/vcs_save_restore_new.o -ldl  -lc -lm -lpthread -ldl 
../simv up to date
CPU time: .376 seconds to compile + .389 seconds to elab + .356 seconds to link
Chronologic VCS simulator copyright 1991-2023
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Nov 13 23:47 2025
 The queue elements are = '{22, 12, 2} 
 The queue elements are = '{22, 12, 2, 11, 99} 
 The queue element at qu[0] = 22
 The queue element at qu[1] = 12
 The queue element at qu[2] = 2
 The queue element at qu[3] = 11
 The queue element at qu[4] = 99
 Queue Size at beginning= 5 
 Poping front from Queue =22 
 Poping Back from Queue=99 
 The queue elements are = '{12, 2, 11} 
 The queue elements are = '{12, 2} 
 Queue Size at current = 2 
 The queue elements are = '{}
 Queue Size at end = 0 
           V C S   S i m u l a t i o n   R e p o r t 
Time: 0 ns
CPU Time:      0.480 seconds;       Data structure size:   0.0Mb
Thu Nov 13 23:47:23 2025
Done   
/*************************************************************************/
   Queue : Example3 : Example with insert,delete methods
/************************************************************************/
module queue_example3;       //Queue_example with insert,delete method
  int q[$]={0,7,8,15,73,91};
  
 initial
  begin
    $display ("The values in Queue are  = %p",q);      // 0,7,8,15,73,91
    $display ("The Size of the Queue is = %0p",q.size);  //6
    
    //1st phase insertion and deletion
    q.insert(2,33); // 2=address, 33=element (Means at index2 , 33 value to be placed)
    
    $display ("The values in Queue are = %p",q);      // 0,7,33,8,15,73,91
    $display ("The Size of the Queue is =%0p",q.size); // 7
    
    q.delete(2); // 2=address , Mean delete the value at index2
    $display ("The values in Queue are = %p",q); // 0,7,8,15,73,91
    $display ("The Size of the Queue is =%0p",q.size); // 6
    
    // 2nd phase insertion and deletion
    q.insert(4,100); // 4=address, 100=element
    
    $display ("The values in Queue are = %p",q); // 0,7,8,15,100,73,91
    $display ("The Size of the Queue is =%0p",q.size); // 7
    
    q.delete(6); // 6=address
    $display ("The values in Queue are = %p",q); // 0,7,8,15,100,73,
    $display ("The Size of the Queue is =%0p",q.size); // 6
    
    //3rd attempt
    q.delete();
    $display ("The values in Queue are = %p",q);     // 0
    $display ("The Size of the Queue is =%0p",q.size); //0
    end
  
endmodule :queue_example3

//Log File Output
   
Starting vcs inline pass...
1 module and 0 UDP read.
recompiling module queue_example3
rm -f _cuarc*.so _csrc*.so pre_vcsobj_*.so share_vcsobj_*.so
if [ -x ../simv ]; then chmod a-x ../simv; fi
g++  -o ../simv      -rdynamic  -Wl,-rpath='$ORIGIN'/simv.daidir -Wl,-rpath=./simv.daidir -Wl,-rpath=/apps/vcsmx/vcs/U-2023.03-SP2/linux64/lib -L/apps/vcsmx/vcs/U-2023.03-SP2/linux64/lib  -Wl,-rpath-link=./   objs/amcQw_d.o   _332_archive_1.so   SIM_l.o       rmapats_mop.o rmapats.o rmar.o rmar_nd.o  rmar_llvm_0_1.o rmar_llvm_0_0.o            -lvirsim -lerrorinf -lsnpsmalloc -lvfs    -lvcsnew -lsimprofile -luclinative /apps/vcsmx/vcs/U-2023.03-SP2/linux64/lib/vcs_tls.o   -Wl,-whole-archive  -lvcsucli    -Wl,-no-whole-archive          /apps/vcsmx/vcs/U-2023.03-SP2/linux64/lib/vcs_save_restore_new.o -ldl  -lc -lm -lpthread -ldl 
../simv up to date
CPU time: .402 seconds to compile + .392 seconds to elab + .385 seconds to link
Chronologic VCS simulator copyright 1991-2023
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Nov 14 06:16 2025
The values in Queue are  = '{0, 7, 8, 15, 73, 91} 
The Size of the Queue is = 6
The values in Queue are = '{0, 7, 33, 8, 15, 73, 91} 
The Size of the Queue is =7
The values in Queue are = '{0, 7, 8, 15, 73, 91} 
The Size of the Queue is =6
The values in Queue are = '{0, 7, 8, 15, 100, 73, 91} 
The Size of the Queue is =7
The values in Queue are = '{0, 7, 8, 15, 100, 73} 
The Size of the Queue is =6
The values in Queue are = '{}
The Size of the Queue is =0
           V C S   S i m u l a t i o n   R e p o r t 
Time: 0 ns
CPU Time:      0.360 seconds;       Data structure size:   0.0Mb
Fri Nov 14 06:16:50 2025
Done
   
/*************************************************************************/
   Queue : Example4 : Example with size , max, pop_front, pop_back methods
/************************************************************************/   
module queue_methods_example4; //Example with size , max, pop_front, pop_back methods
  byte q[$];
  
 initial
   begin
   q.push_front(2);
   q.push_front(12);
   q.push_front(22);
   $display("The values in Queue are = %p ",q);  //'{22, 12, 2} 
     
   q.push_back(11);
   q.push_back(99);
   $display("The values in Queue are = %p ",q); // '{22, 12, 2, 11, 99} 
     
   foreach(q[i]) begin
     $display("The values in Queue at q[%0d] = %0d ",i,q[i]); 
   end

   $display("The Size of the Queue is= %0d " ,q.size()); //5
   $display("The maximum value in the Queue is = %p " ,q.max()); // `{99}
   $display("The minimim value in the Queue is = %p " ,q.min());  // `{2}
   $display("The pop_front value in the Queue is = %0d " ,q.pop_front()); //22
   $display("The pop_front value in the Queue is = %0d " ,q.pop_back()); //99
     
   $display("The values in Queue are = %p ",q); 

   foreach(q[i]) begin
     $display("The values in Queue at q[%0d] = %0d ",i,q[i]); // `{12,2,11}
   end

   q.delete(3); 
   // Means delete the value at index 3, But here if you look carefully previously only 3 values are present with index range from 0 to 2 .
   //Means Index3 is not available , Hence it will give warning as (Illegal index into queue) in Simens Questa Tool
   // Will throw error in Synopsys VCS Tool
   $display("The values in Queue are = %p ",q);        // Same values as before '{12, 2, 11}   
   $display("The Size of the Queue is= %0d " ,q.size()); //3
     
   q.delete(2);  // Means delete the value at index 2
   $display("The values in Queue are = %p ",q);         //'{12, 2}  
   $display("The Size of the Queue is= %0d " ,q.size());  //2
  end
endmodule :queue_methods_example4
   
//Log File Output using Simens Questa Tool
   
# Loading sv_std.std
# Loading work.queue_methods_example4(fast)
# 
# run -all
# The values in Queue are = '{22, 12, 2} 
# The values in Queue are = '{22, 12, 2, 11, 99} 
# The values in Queue at q[0] = 22 
# The values in Queue at q[1] = 12 
# The values in Queue at q[2] = 2 
# The values in Queue at q[3] = 11 
# The values in Queue at q[4] = 99 
# The Size of the Queue is= 5 
# The maximum value in the Queue is = '{99} 
# The minimim value in the Queue is = '{2} 
# The pop_front value in the Queue is = 22 
# The pop_front value in the Queue is = 99 
# The values in Queue are = '{12, 2, 11} 
# The values in Queue at q[0] = 12 
# The values in Queue at q[1] = 2 
# The values in Queue at q[2] = 11 
# ** Warning: (vsim-8133) Illegal index into queue.
#    Time: 0 ns  Iteration: 0  Process: /queue_methods_example4/#INITIAL#4 File: testbench.sv Line: 31
# The values in Queue are = '{12, 2, 11} 
# The Size of the Queue is= 3 
# The values in Queue are = '{12, 2} 
# The Size of the Queue is= 2 
# exit
# End time: 06:47:36 on Nov 14,2025, Elapsed time: 0:00:01
# Errors: 0, Warnings: 1
End time: 06:47:36 on Nov 14,2025, Elapsed time: 0:00:02
*** Summary *********************************************
    qrun: Errors:   0, Warnings:   0
    vlog: Errors:   0, Warnings:   0
    vopt: Errors:   0, Warnings:   1
    vsim: Errors:   0, Warnings:   1
  Totals: Errors:   0, Warnings:   2
Done
   
/*******NOTE : If we will run the same above Example4 using Synopsys VCS Tool , we will get the error for that Illegal indx as below ********/
//Log File Output Using Synopsys VCS Tool
Starting vcs inline pass...

1 module and 0 UDP read.
recompiling module queue_methods_example4
rm -f _cuarc*.so _csrc*.so pre_vcsobj_*.so share_vcsobj_*.so
if [ -x ../simv ]; then chmod a-x ../simv; fi
g++  -o ../simv      -rdynamic  -Wl,-rpath='$ORIGIN'/simv.daidir -Wl,-rpath=./simv.daidir -Wl,-rpath=/apps/vcsmx/vcs/U-2023.03-SP2/linux64/lib -L/apps/vcsmx/vcs/U-2023.03-SP2/linux64/lib  -Wl,-rpath-link=./   objs/amcQw_d.o   _331_archive_1.so   SIM_l.o       rmapats_mop.o rmapats.o rmar.o rmar_nd.o  rmar_llvm_0_1.o rmar_llvm_0_0.o            -lvirsim -lerrorinf -lsnpsmalloc -lvfs    -lvcsnew -lsimprofile -luclinative /apps/vcsmx/vcs/U-2023.03-SP2/linux64/lib/vcs_tls.o   -Wl,-whole-archive  -lvcsucli    -Wl,-no-whole-archive          /apps/vcsmx/vcs/U-2023.03-SP2/linux64/lib/vcs_save_restore_new.o -ldl  -lc -lm -lpthread -ldl 
../simv up to date
CPU time: .409 seconds to compile + .463 seconds to elab + .397 seconds to link
Chronologic VCS simulator copyright 1991-2023
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Nov 14 06:50 2025
The values in Queue are = '{22, 12, 2}  
The values in Queue are = '{22, 12, 2, 11, 99}  
The values in Queue at q[0] = 22 
The values in Queue at q[1] = 12 
The values in Queue at q[2] = 2 
The values in Queue at q[3] = 11 
The values in Queue at q[4] = 99 
The Size of the Queue is= 5 
The maximum value in the Queue is = '{99}  
The minimim value in the Queue is = '{2}  
The pop_front value in the Queue is = 22 
The pop_front value in the Queue is = 99 
The values in Queue are = '{12, 2, 11}  
The values in Queue at q[0] = 12 
The values in Queue at q[1] = 2 
The values in Queue at q[2] = 11 

Error-[DT-MCWII] Method called with invalid index
testbench.sv, 31
  "delete" method called with invalid index (size:3, index:3)
  Please make sure that the index is positive and less than size.

           V C S   S i m u l a t i o n   R e p o r t 
Time: 0 ns
CPU Time:      0.390 seconds;       Data structure size:   0.0Mb
Fri Nov 14 06:50:53 2025
Exit code expected: 0, received: 1
Done   
/***************************************************************************/
   Queue : Example5 : Queue_population
/**************************************************************************/
module queue_population_example5;
  int q1[$];
  int q2[$];
  
 initial
   begin
    q1[23] = 81;  // ILLEGAL: Index 23 doesn't exist in empty queue → IGNORED
    q1[75] = 65;  // ILLEGAL: Index 75 doesn't exist in empty queue → IGNORED
     
    $display("The Populted value for Q1 Queue are ------->");
    $display("The values at Queue index23 is =%0d ", q1[23]);  // Reading non-existent index → Returns 0 (default)
    $display("The values at Queue index75 is =%0d ", q1[75]);  // Reading non-existent index → Returns 0 (default)  
    $display("The values in the Queue are = %p ", q1);      // Queue is still empty → '{}
     
    q1.push_back(81);  // q1[0] = 81
    q1.push_back(65);  // q1[1] = 65
    $display("The values in the Queue are = %p " ,q1);
     
    // Method1 -First create the queue with sufficient size 
    q2 = '{76{0}};      // Create queue with 76 zeros
    q2[23] = 81;       // Now this works
    q2[75] = 65;       // This also works 
     
    $display("The Populted value for Q2 Queue are ------->"); 
    $display("The values at Queue index23 is =%0d ", q2[23]);  // 81
    $display("The values at Queue index75 is =%0d ", q2[75]);  // 65
    $display("The values in the Queue are = %p ", q2);      //  `{81,65}
     
     // Method 2: Using insert() - Most straightforward , This will also work as expected 
     /*
    q2.insert(23, 81);  // Insert 81 at index 23
    q2.insert(75, 65);  // Insert 65 at index 75 
    */ 
     
  end
endmodule : queue_population_example5
//Log File Output
   
Starting vcs inline pass...
1 module and 0 UDP read.
recompiling module queue_population_example5
rm -f _cuarc*.so _csrc*.so pre_vcsobj_*.so share_vcsobj_*.so
if [ -x ../simv ]; then chmod a-x ../simv; fi
g++  -o ../simv      -rdynamic  -Wl,-rpath='$ORIGIN'/simv.daidir -Wl,-rpath=./simv.daidir -Wl,-rpath=/apps/vcsmx/vcs/U-2023.03-SP2/linux64/lib -L/apps/vcsmx/vcs/U-2023.03-SP2/linux64/lib  -Wl,-rpath-link=./   objs/amcQw_d.o   _332_archive_1.so   SIM_l.o       rmapats_mop.o rmapats.o rmar.o rmar_nd.o  rmar_llvm_0_1.o rmar_llvm_0_0.o            -lvirsim -lerrorinf -lsnpsmalloc -lvfs    -lvcsnew -lsimprofile -luclinative /apps/vcsmx/vcs/U-2023.03-SP2/linux64/lib/vcs_tls.o   -Wl,-whole-archive  -lvcsucli    -Wl,-no-whole-archive          /apps/vcsmx/vcs/U-2023.03-SP2/linux64/lib/vcs_save_restore_new.o -ldl  -lc -lm -lpthread -ldl 
../simv up to date
CPU time: .404 seconds to compile + .450 seconds to elab + .399 seconds to link
Chronologic VCS simulator copyright 1991-2023
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Nov 14 23:39 2025
The Populted value for Q1 Queue are ------->
The values at Queue index23 is =0 
The values at Queue index75 is =0 
The values in the Queue are = '{} 
The values in the Queue are = '{81, 65}  
The Populted value for Q2 Queue are ------->
The values at Queue index23 is =81 
The values at Queue index75 is =65 
The values in the Queue are = '{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 81, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 65}  
           V C S   S i m u l a t i o n   R e p o r t 
Time: 0 ns
CPU Time:      0.540 seconds;       Data structure size:   0.0Mb   
/******************************************************************************************************/
   Queue : Example6 :  Example with Queue slicing , Mean Printing part of the elements in the Queue
/*****************************************************************************************************/   
module queue_slice_expression_example6; // Example with Queue slicing , Mean Printing part of the elements in the Queue
    
  //Creating queue for storing string values
  string fruits[$]={"orange","apple","lemon","kiwi"}; 
  
  initial begin
    
    foreach(fruits[i]) begin
      $display("fruits[%0d]=%s",i,fruits[i]);
    end
    
    $display("Displaying subset of fruits=%p",fruits[1:2]); // '{"apple", "lemon"} 
    
    //Printing all fruits except last fruit
    $display("Displaying all fruits except last fruit=%p",fruits[0:$-1]); // '{"orange", "apple", "lemon"}
    
     //Printing all fruits except first fruit
    $display("Displaying all fruits except first fruit=%p",fruits[1:$-1]); //'{"apple", "lemon"}
    
     //Printing all fruits except Last fruit
    $display("Displaying all fruits except Last fruit=%p",fruits[0:$-1]); //'{"orange", "apple", "lemon"} 
    
    //Printing the first and second fruit
    $display("Displaying First and second fruits=%p",fruits[1:2]); //'{"apple", "lemon"} 
    
    fruits[$+1]="pineapple";
    $display("Displaying all fruits =%p",fruits); // '{"orange", "apple", "lemon", "kiwi", "pineapple"} 
    
    $display ("The size of the Queue is = %0d", fruits.size());
    
    fruits={};
    $display("After Queue Deletion : fruits=%p",fruits);
    $display ("The size of the Queue is after deleting all = %0d", fruits.size());
    
  end
  
endmodule :queue_slice_expression_example6

// LogFile Output
   
Starting vcs inline pass...
1 module and 0 UDP read.
recompiling module queue_slice_expression_example6
rm -f _cuarc*.so _csrc*.so pre_vcsobj_*.so share_vcsobj_*.so
if [ -x ../simv ]; then chmod a-x ../simv; fi
g++  -o ../simv      -rdynamic  -Wl,-rpath='$ORIGIN'/simv.daidir -Wl,-rpath=./simv.daidir -Wl,-rpath=/apps/vcsmx/vcs/U-2023.03-SP2/linux64/lib -L/apps/vcsmx/vcs/U-2023.03-SP2/linux64/lib  -Wl,-rpath-link=./   objs/amcQw_d.o   _331_archive_1.so   SIM_l.o       rmapats_mop.o rmapats.o rmar.o rmar_nd.o  rmar_llvm_0_1.o rmar_llvm_0_0.o            -lvirsim -lerrorinf -lsnpsmalloc -lvfs    -lvcsnew -lsimprofile -luclinative /apps/vcsmx/vcs/U-2023.03-SP2/linux64/lib/vcs_tls.o   -Wl,-whole-archive  -lvcsucli    -Wl,-no-whole-archive          /apps/vcsmx/vcs/U-2023.03-SP2/linux64/lib/vcs_save_restore_new.o -ldl  -lc -lm -lpthread -ldl 
../simv up to date
CPU time: .374 seconds to compile + .406 seconds to elab + .333 seconds to link
Chronologic VCS simulator copyright 1991-2023
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Nov 15 08:44 2025
fruits[0]=orange
fruits[1]=apple
fruits[2]=lemon
fruits[3]=kiwi
Displaying subset of fruits='{"apple", "lemon"} 
Displaying all fruits except last fruit='{"orange", "apple", "lemon"} 
Displaying all fruits except first fruit='{"apple", "lemon"} 
Displaying all fruits except Last fruit='{"orange", "apple", "lemon"} 
Displaying First and second fruits='{"apple", "lemon"} 
Displaying all fruits ='{"orange", "apple", "lemon", "kiwi", "pineapple"} 
The size of the Queue is = 5
After Queue Deletion : fruits='{}
The size of the Queue is after deleting all = 0
           V C S   S i m u l a t i o n   R e p o r t 
Time: 0 ns
CPU Time:      0.410 seconds;       Data structure size:   0.0Mb
Sat Nov 15 08:44:07 2025
Done 
/******************************************************************************************************/
   Queue : Example7 :  Example of string of queue with , queue method uses
/*****************************************************************************************************/      
module queue_of_string_elelments_with_uses_of_methods_example7; //Example of string of queue with , queue method uses
    
  //Creating queue for storing string values
  string fruits[$]={ "apple","pear","mango","banana"}; 
  
  initial begin
    
    foreach(fruits[i]) begin
      $display("fruits[%0d]=%s",i,fruits[i]);
    end
    
    $display("Displaying subset of fruits=%p",fruits[1:2]);
    
    //use of size() method
    $display("Size of the queue is fruits.size() =%0d",fruits.size());
    
    //use of insert() method- insert an element at given index
    fruits.insert(1,"peach");
    $display("Size of the queue after PEACH insertion at index1: fruits.size() =%0d",fruits.size());
    
    foreach(fruits[i]) begin
      $display("fruits[%0d]=%s",i,fruits[i]);
    end
    
    //use of delete() method- delete an element at given index
    fruits.delete(3);
    $display("Size of the queue after deletion at index3: fruits.size() =%0d",fruits.size());
    
    foreach(fruits[i]) begin
      $display("fruits[%0d]=%s",i,fruits[i]);
    end
    
    //use of pop_front() method- Poping the element from front side of queue :  fruits.pop_front();
    $display("popped from front =%s,Size of the queue after poping : fruits.size() =%0d ",fruits.pop_front(),fruits.size());
    
    foreach(fruits[i]) begin
      $display("fruits[%0d]=%s",i,fruits[i]);
    end
    
    //use of push_front() method- Pushing the element to the front side of queue
    fruits.push_front("apricot");
    $display("The new queue now =%p,Size of the queue after pushing : fruits.size() =%0d ",fruits,fruits.size());
    
    foreach(fruits[i]) begin
      $display("fruits[%0d]=%s",i,fruits[i]);
    end
    
    //use of pop_back() method- Poping the element from Back side of queue : fruits.pop_back();
    $display("popped from back =%s,Size of the queue after poping : fruits.size() =%0d ",fruits.pop_back(),fruits.size());
    
    foreach(fruits[i]) begin
      $display("fruits[%0d]=%s",i,fruits[i]);
    end
    
    //use of push_back() method- Pushing the element to the back side of queue
    fruits.push_back("palm");
    $display("The new queue now =%p,Size of the queue after pushing : fruits.size() =%0d ",fruits,fruits.size());
    
    foreach(fruits[i]) begin
      $display("fruits[%0d]=%s",i,fruits[i]);
    end
    
    fruits={};
    $display("After Queue Deletion : fruits=%p,fruits.size()=%0d",fruits,fruits.size());
         
           
  end
  
endmodule :queue_of_string_elelments_with_uses_of_methods_example7

//Log File Output
   
Starting vcs inline pass...
1 module and 0 UDP read.
recompiling module queue_of_string_elelments_with_uses_of_methods_example7
rm -f _cuarc*.so _csrc*.so pre_vcsobj_*.so share_vcsobj_*.so
if [ -x ../simv ]; then chmod a-x ../simv; fi
g++  -o ../simv      -rdynamic  -Wl,-rpath='$ORIGIN'/simv.daidir -Wl,-rpath=./simv.daidir -Wl,-rpath=/apps/vcsmx/vcs/U-2023.03-SP2/linux64/lib -L/apps/vcsmx/vcs/U-2023.03-SP2/linux64/lib  -Wl,-rpath-link=./   objs/amcQw_d.o   _331_archive_1.so   SIM_l.o       rmapats_mop.o rmapats.o rmar.o rmar_nd.o  rmar_llvm_0_1.o rmar_llvm_0_0.o            -lvirsim -lerrorinf -lsnpsmalloc -lvfs    -lvcsnew -lsimprofile -luclinative /apps/vcsmx/vcs/U-2023.03-SP2/linux64/lib/vcs_tls.o   -Wl,-whole-archive  -lvcsucli    -Wl,-no-whole-archive          /apps/vcsmx/vcs/U-2023.03-SP2/linux64/lib/vcs_save_restore_new.o -ldl  -lc -lm -lpthread -ldl 
../simv up to date
CPU time: .310 seconds to compile + .300 seconds to elab + .325 seconds to link
Chronologic VCS simulator copyright 1991-2023
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Nov 15 08:55 2025
fruits[0]=apple
fruits[1]=pear
fruits[2]=mango
fruits[3]=banana
Displaying subset of fruits='{"pear", "mango"} 
Size of the queue is fruits.size() =4
Size of the queue after PEACH insertion at index1: fruits.size() =5
fruits[0]=apple
fruits[1]=peach
fruits[2]=pear
fruits[3]=mango
fruits[4]=banana
Size of the queue after deletion at index3: fruits.size() =4
fruits[0]=apple
fruits[1]=peach
fruits[2]=pear
fruits[3]=banana
popped from front =apple,Size of the queue after poping : fruits.size() =3 
fruits[0]=peach
fruits[1]=pear
fruits[2]=banana
The new queue now ='{"apricot", "peach", "pear", "banana"} ,Size of the queue after pushing : fruits.size() =4 
fruits[0]=apricot
fruits[1]=peach
fruits[2]=pear
fruits[3]=banana
popped from back =banana,Size of the queue after poping : fruits.size() =3 
fruits[0]=apricot
fruits[1]=peach
fruits[2]=pear
The new queue now ='{"apricot", "peach", "pear", "palm"} ,Size of the queue after pushing : fruits.size() =4 
fruits[0]=apricot
fruits[1]=peach
fruits[2]=pear
fruits[3]=palm
After Queue Deletion : fruits='{},fruits.size()=0
           V C S   S i m u l a t i o n   R e p o r t 
Time: 0 ns
CPU Time:      0.420 seconds;       Data structure size:   0.0Mb
Sat Nov 15 08:55:46 2025
Done   
/******************************************************************************************************/
   Queue : Example8 :  
/*****************************************************************************************************/         
