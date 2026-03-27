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
  Example3: 
//////////////////////////////////////////////////////////////////////////   


///////////////////////////////////////////////////////////////////////////
  Example4: 
//////////////////////////////////////////////////////////////////////////   


///////////////////////////////////////////////////////////////////////////
  Example5: 
////////////////////////////////////////////////////////////////////////// 


///////////////////////////////////////////////////////////////////////////
  Example6: 
//////////////////////////////////////////////////////////////////////////   


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

   
