///////////////////////////////////////////////////////////////
   Interprocess Communication (IPC) in System Verilog: 
//////////////////////////////////////////////////////////////
-Interprocess communication is a way to communicate between processes/testbench components. 
-SystemVerilog provides three mechanisms for communication.
-They are : Events , Semaphores ,Mailbox
  
//////////////////////////////////////////  
    SystemVerilog event :
//////////////////////////////////////////  
-SystemVerilog event is used to synchronize between two or more processes or threads. 
-An event is also a synchronization object that can be passed to a function or task or class constructor. 
-This allows event sharing without declaring it as a global event.

////////////////////////////////////////////////////  
    How two or more processes are synchronized ???
////////////////////////////////////////////////////  
- One process triggers an event while other processes will wait until the event is triggered.
- The System  Verilog events are triggered using -> or ->> operator. 
- The processes can wait for an event to be triggered either via @ operator or wait() construct.
- Syntax:
  // To trigger an event
  -> <event_name>;   // Instantenous event 
  ->> <event_name>;  // Non Blocking event 

  //wait for an event
  @(<event_name>); or @(<event_name>.triggered);
  wait(<event_name>.triggered);

  //////////////////////////////////////////////////////////////////////////////////////////////////////
  Event operator                                                        Description
  ////////////////////////////////////////////////////////////////////////////////////////////////////////
  ->                                                                    Used to trigger an event that unblocks all waiting processes due to this event. It is an instantaneous event.

  ->>                                                                   This operator is used to trigger non-blocking events.

  @                                                                     The @ operator is used to block the process till an event is triggered. 
                                                                        This is an edge-sensitive operator. Hence, waiting for an event should be executed before triggering an event to avoid blocking the waiting process.

  wait                                                                  The wait() construct is similar to @ operator except it will unblock the process even if triggering an event and waiting for an event to happen at the same time.
