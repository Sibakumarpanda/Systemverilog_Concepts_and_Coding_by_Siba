//////////////////////////////////////////////////////
   SystemVerilog Semaphores Concepts and example :
/////////////////////////////////////////////////////
-SystemVerilog semaphores are used to control the access of shared resources. 
-It is a built-in class in SystemVerilog used for synchronization which is a container that contains a fixed number of keys.
-For example, the same memory location is accessed by two different cores. 
-To avoid unexpected results when cores try to write or read from the same memory location, a semaphore can be used.

//////////////////////////////////
   Methods in semaphore :
//////////////////////////////////  
  
Method name                                                            Description

  new()                                                                To create a semaphore with a specified number of keys

  get()                                                                To obtain or get a specified number of keys

  put()                                                                To put or return the number of keys 

  try_get()                                                            Try to obtain or get a specified number of keys without blocking the execution
