//////////////////////////////////////////////////////
   SystemVerilog Semaphores Concept and example :
/////////////////////////////////////////////////////
-SystemVerilog semaphores are used to control the access of shared resources. 
-It is a built-in class in SystemVerilog used for synchronization which is a container that contains a fixed number of keys.
-For example, the same memory location is accessed by two different cores. 
-To avoid unexpected results when cores try to write or read from the same memory location, a semaphore can be used.

//////////////////////////////////
   Methods in semaphore :
//////////////////////////////////  
   Method name                                                           Description
   new()                                                                 To create a semaphore with a specified number of keys
   get()                                                                 To obtain or get a specified number of keys
   put()                                                                 To put or return the number of keys 
   try_get()                                                             Try to obtain or get a specified number of keys without blocking the execution


new()
-The new() method is used to create the semaphore with a specified number of keys. 
-By default, no keys are created. 
-The new() method returns semaphore handle or null if it is not created.
-Syntax: <semaphore> = new(<number_of_keys>);  // <number_of_keys> is integer value

get()
-The get() method in semaphore is used to obtain a specified number of keys. 
-By default, one key is returned if no value is specified. 
-The get() method is a blocking method and execution continues after successful key or keys are obtained.
-Syntax: <semaphore>.get(<number_of_keys>);
   
put()
-The put() method in semaphore is used to return a specified number of keys to the semaphore container or bucket.
-Syntax: <semaphore>.put(<number_of_keys>);
   
try_get()
-The try_get() method in semaphore tries to obtain a specified number of keys. 
-The get() method is blocking whereas try_get() is a non-blocking method. 
-The execution is not blocked even if the number of keys is not available. The try_get() function returns 1 if keys are available otherwise, it returns 0 if no keys are available,
-Syntax: <semaphore>.try_get(<number_of_keys>); 


///////////////////////////////////////////////////////////////////////////
  Example1: IPC Semaphore - An example Without using semaphore 
////////////////////////////////////////////////////////////////////////// 
module without_semaphore_example1();
  task write_mem();
    $display("At Time %0tns : Before writing into memory", $time);
    #5ns;  // Assume 5ns is required to write into mem
    $display("At Time %0tns : Write completed into memory" , $time);
  endtask
  
  task read_mem();
    $display("At Time %0tns : Before reading from memory", $time);
    #4ns;  // Assume 4ns is required to read from mem
    $display("At Time %0tns : Read completed from memory", $time);
  endtask

  initial begin
    fork
      write_mem();
      read_mem();
    join
  end
endmodule :without_semaphore_example1

//Logfile Output:   
At Time 0ns : Before writing into memory
At Time 0ns : Before reading from memory
At Time 4ns : Read completed from memory
At Time 5ns : Write completed into memory
           V C S   S i m u l a t i o n   R e p o r t

///////////////////////////////////////////////////////////////////////////
  Example2: IPC Semaphore - Same example1 With using semaphore
////////////////////////////////////////////////////////////////////////// 
module with_semaphore_example2();
  semaphore sem = new(1);
  
  task write_mem();
    sem.get();
    $display("At Time %0tns : Before writing into memory", $time);
    #5ns;  // Assume 5ns is required to write into mem
    $display("At Time %0tns : Write completed into memory" , $time);
    sem.put();
  endtask
  
  task read_mem();
    sem.get();
    $display("At Time %0tns : Before reading from memory", $time);
    #4ns;  // Assume 4ns is required to read from mem
    $display("At Time %0tns : Read completed from memory", $time);
    sem.put();
  endtask

  initial begin
    fork
      write_mem();
      read_mem();
    join
  end
endmodule :with_semaphore_example2
   
//Logfile Output
At Time 0ns : Before writing into memory
At Time 5ns : Write completed into memory
At Time 5ns : Before reading from memory
At Time 9ns : Read completed from memory
           V C S   S i m u l a t i o n   R e p o r t    

///////////////////////////////////////////////////////////////////////////
  Example3: IPC Semaphore -  With using semaphore
//////////////////////////////////////////////////////////////////////////   
module with_semaphore_example3();
  semaphore sem = new(2);
  
  task write_mem();
    sem.get(1);
    $display("At Time %0tns : Before writing into memory", $time);
    #5ns;  // Assume 5ns is required to write into mem
    $display("At Time %0tns : Write completed into memory" , $time);
    sem.put(1);
  endtask
  
  task read_mem();
    sem.get(1);
    $display("At Time %0tns : Before reading from memory", $time);
    #4ns;  // Assume 4ns is required to read from mem
    $display("At Time %0tns : Read completed from memory", $time);
    sem.put(1);
  endtask

  initial begin
    fork
      write_mem();
      read_mem();
    join
  end
endmodule : with_semaphore_example3
   
//Logfile Output   
At Time 0ns : Before writing into memory
At Time 0ns : Before reading from memory
At Time 4ns : Read completed from memory
At Time 5ns : Write completed into memory
           V C S   S i m u l a t i o n   R e p o r t 

///////////////////////////////////////////////////////////////////////////
  Example4: IPC Semaphore -  Semaphore having multiple keys
//////////////////////////////////////////////////////////////////////////   
//The semaphore is created with 3 keys as shown in the below example.
//process_A requires all 3 keys whereas process_B requires 2 keys to access the resource.

module semaphore_example4();
  semaphore sem = new(3);
  
  task process_A();
    sem.get(3);
    $display("At timestamp %0t : process_A started", $time);
    #5ns;
    $display("At timestamp %0t : process_A completed",$time);
    sem.put(3);
  endtask
  
  task process_B();
    sem.get(2);
    $display("At timestamp %0t : process_B started",$time);
    #4ns;
    $display("At timestamp %0t : process_B completed",$time);
    sem.put(2);
  endtask

  initial begin
    fork
      process_A();
      process_B();
    join
  end
endmodule :semaphore_example4
   
//Logfile Output
At timestamp 0 : process_A started
At timestamp 5 : process_A completed
At timestamp 5 : process_B started
At timestamp 9 : process_B completed
           V C S   S i m u l a t i o n   R e p o r t    
///////////////////////////////////////////////////////////////////////////
  //Example5: IPC Semaphore -  try_get() example 
////////////////////////////////////////////////////////////////////////// 
//try_get() is a non-blocking semaphore method where execution is not blocked if keys are not available. 
//In the below example, process_A obtained a key at first and even if a key is not available, process_B execution is not blocked
module semaphore_example5_using_try_get();
  semaphore sem = new(1);
  
  task process_A();
    if(sem.try_get()) 
      $display("At timestmap %0tns : process_A: Key received" ,$time);
    else 
      $display("At timestmap %0tns : process_A: Key is not available",$time);
    
    $display("At timestmap %0tns : process_A started",$time);
    #5ns;
    $display("At timestmap %0tns : process_A completed",$time);
    sem.put();
  endtask
  
  task process_B();
    if(sem.try_get()) 
      $display("At timestmap %0tns : process_B: Key received",$time);
    else 
      $display("At timestmap %0tns : process_B: Key is not available",$time);
    
    $display("At timestmap %0tns : process_B started",$time);
    #4ns;
    $display("At timestmap %0tns : process_B completed",$time);
    sem.put();
  endtask

  initial begin
    fork
      process_A();
      process_B();
    join
  end
endmodule :semaphore_example5_using_try_get

//Logfile Output
At timestmap 0ns : process_A: Key received
At timestmap 0ns : process_A started
At timestmap 0ns : process_B: Key is not available
At timestmap 0ns : process_B started
At timestmap 4ns : process_B completed
At timestmap 5ns : process_A completed
           V C S   S i m u l a t i o n   R e p o r t    

///////////////////////////////////////////////////////////////////////////
  Example6: IPC Semaphore -  Putting more keys back
//////////////////////////////////////////////////////////////////////////   
//In the below example, 3 keys are obtained using the get method whereas 5 keys are put back. 
//It is one of the ways to manage resources. Note that no error is observed in the example since keys allocation is initialized, it is not like fixed keys are assigned.
module semaphore_example6();
  semaphore sem = new(3);  
  task process();
    sem.get(3);
    $display("At timestamp %0tns : process is started",$time);
    #5ns;
    $display("At timestamp %0tns : process is completed ",$time);
    sem.put(5);
  endtask

  initial begin
    process();
  end
endmodule :semaphore_example6

//Logfile Output
At timestamp 0ns : process is started
At timestamp 5ns : process is completed 
           V C S   S i m u l a t i o n   R e p o r t    
///////////////////////////////////////////////////////////////////////////
  Example7: 
////////////////////////////////////////////////////////////////////////// 


///////////////////////////////////////////////////////////////////////////
  Example8: 
//////////////////////////////////////////////////////////////////////////   


 ///////////////////////////////////////////////////////////////////////////
  Example9: 
//////////////////////////////////////////////////////////////////////////  


///////////////////////////////////////////////////////////////////////////
  Example10: 
//////////////////////////////////////////////////////////////////////////  

   
