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
   Queue : Example4 : 
/************************************************************************/   
