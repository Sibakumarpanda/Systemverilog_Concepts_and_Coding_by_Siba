/////////////////////////////////////////
  IPC event Various Examples :
////////////////////////////////////////
Different types of event Summary :
- Syntax:
  // To trigger an event
  -> <event_name>;   // Instantenous event 
  ->> <event_name>;  // Non Blocking event 

  //wait for an event
  @(<event_name>); or @(<event_name>.triggered);
  wait(<event_name>.triggered);

  //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    Event operator                                                      Description
  //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  ->                                                                    Used to trigger an event that unblocks all waiting processes due to this event. It is an instantaneous event.

  ->>                                                                   This operator is used to trigger non-blocking events.

  @                                                                     The @ operator is used to block the process till an event is triggered. 
                                                                        This is an edge-sensitive operator. Hence, waiting for an event should be executed before triggering an event to avoid blocking the waiting process.

  wait                                                                  The wait() construct is similar to @ operator except it will unblock the process even if triggering an event and waiting for an event to happen at the same time.


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
   Example1: Example1: IPC Event - Event is triggered using -> and waiting for SystemVerilog event to be triggered via the @ operator 
   (Here An event is triggered after waiting for the event trigger)
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//Example1: IPC Event - Event is triggered using -> and waiting for SystemVerilog event to be triggered via the @ operator 
// Here An event is triggered after waiting for the event trigger
//In below example , The process_A task has a 10ns delay which makes sure event e1 triggers after waiting for the event trigger. 
//The wait for the event to be triggered via @ operator will be unblocked once the e1 event is triggered.
module event_example1();
  event e1;
  
  task process_A();
    #10;
    $display("@%0t: Before triggering event e1", $time);
    ->e1;
    $display("@%0t: After triggering event e1", $time);
  endtask
  
  task process_B();
    $display("@%0t: waiting for the event e1", $time);
    @e1;
    $display("@%0t: event e1 is triggered", $time);
  endtask

  initial begin
    fork
      process_A();
      process_B();
    join
  end
endmodule :event_example1
    
//Logfile Output
@0: waiting for the event e1
@10: Before triggering event e1
@10: After triggering event e1
@10: event e1 is triggered
           V C S   S i m u l a t i o n   R e p o r t     

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
   Example2: IPC Event - Event is triggered using -> and waiting for SystemVerilog event to be triggered via the @ operator 
   (An event is triggered before waiting for event trigger)
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//Example2: IPC Event - Event is triggered using -> and waiting for SystemVerilog event to be triggered via the @ operator 
//An event is triggered before waiting for event trigger
//The process_B task has a 10ns delay which makes sure event e1 triggers before waiting for an event trigger. The wait for the event to be triggered via @ operator will not be unblocked since the e1 event is triggered before.
//Hence, statements after waiting for the trigger (with @ operator) will not be executed
module event_example2();
  event e1;
  
  task process_A();
    $display("@%0t: Before triggering event e1", $time);
    ->e1;
    $display("@%0t: After triggering event e1", $time);
  endtask
  
  task process_B();
    #10;
    $display("@%0t: waiting for the event e1", $time);
    @e1;
    $display("@%0t: event e1 is triggered", $time);
  endtask

  initial begin
    fork
      process_A();
      process_B();
    join
  end
endmodule :event_example2

//Logfile Output
@0: Before triggering event e1
@0: After triggering event e1
@10: waiting for the event e1
           V C S   S i m u l a t i o n   R e p o r t     

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
   Example3: IPC Event - Event is triggered using -> and waiting for SystemVerilog event to be triggered via the @ operator
   (An event is triggered at the same time as waiting for the event trigger)
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//Example3: IPC Event - Event is triggered using -> and waiting for SystemVerilog event to be triggered via the @ operator
//(An event is triggered at the same time as waiting for the event trigger)
  //The process_A and process_B have no delay involved to ensure triggering of an event and waiting for the event trigger to happen at the same time. 
//Since both processes are triggered at the same time, the @ operator will not detect an event triggering. 
//The SystemVerilog provides a wait() construct to solve this problem . Will see this example in Example6 
module event_example3();
  event e1;
  
  task process_A();
    $display("@%0t: Before triggering event e1", $time);
    ->e1;
    $display("@%0t: After triggering event e1", $time);
  endtask
  
  task process_B();
    $display("@%0t: waiting for the event e1", $time);
    @e1;
    $display("@%0t: event e1 is triggered", $time);
  endtask

  initial begin
    fork
      process_A();
      process_B();
    join
  end
endmodule :event_example3

//Logfile Output
@0: Before triggering event e1
@0: After triggering event e1
@0: waiting for the event e1
           V C S   S i m u l a t i o n   R e p o r t     
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
   Example4: IPC Event - Event is triggered using -> and waiting for SystemVerilog event to be triggered via wait() construct
   (An event is triggered after waiting for the event trigger) 
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//Example4: IPC Event - Event is triggered using -> and waiting for SystemVerilog event to be triggered via wait() construct
//(An event is triggered after waiting for the event trigger)
//For example, there are two processes A and B. The process_A task is used to trigger an event e1 and the process_B task is used to wait for the event using the wait() construct.
//The process_A task has a 10ns delay which makes sure event e1 triggers after waiting for the event trigger. The wait of the event to be triggered via wait() construct will be unblocked once the e1 event is triggered.
module event_example4();
  event e1;
  
  task process_A();
    #10;
    $display("@%0t: Before triggering event e1", $time);
    ->e1;
    $display("@%0t: After triggering event e1", $time);
  endtask
  
  task process_B();
    $display("@%0t: waiting for the event e1", $time);
    wait(e1.triggered);
    $display("@%0t: event e1 is triggered", $time);
  endtask

  initial begin
    fork
      process_A();
      process_B();
    join
  end
endmodule :event_example4
    
//Logfile Output
@0: waiting for the event e1
@10: Before triggering event e1
@10: After triggering event e1
@10: event e1 is triggered
           V C S   S i m u l a t i o n   R e p o r t     
  
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
   Example5: IPC Event -  Event is triggered using -> and waiting for SystemVerilog event to be triggered via wait() construct
   (An event is triggered before waiting for event trigger)
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//Example5: IPC Event -  Event is triggered using -> and waiting for SystemVerilog event to be triggered via wait() construct
//(An event is triggered before waiting for event trigger)
//The process_B task has a 10ns delay which makes sure event e1 triggers before waiting for an event trigger. The wait of the event to be triggered via wait() construct will not be unblocked since the e1 event is triggered before.
//Hence, statements after waiting for the trigger (with wait() construct) will not be executed.

module event_example5();
  event e1;
  
  task process_A();
    $display("@%0t: Before triggering event e1", $time);
    ->e1;
    $display("@%0t: After triggering event e1", $time);
  endtask
  
  task process_B();
    #10;
    $display("@%0t: waiting for the event e1", $time);
    wait(e1.triggered);
    $display("@%0t: event e1 is triggered", $time);
  endtask

  initial begin
    fork
      process_A();
      process_B();
    join
  end
endmodule :event_example5

//Logfile Output
@0: Before triggering event e1
@0: After triggering event e1
@10: waiting for the event e1
           V C S   S i m u l a t i o n   R e p o r t     

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
   Example6: IPC Event - Event is triggered using -> and waiting for SystemVerilog event to be triggered via wait() construct
   (An event is triggered at the same time as waiting for the event trigger)
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
 //Example6: IPC Event - Event is triggered using -> and waiting for SystemVerilog event to be triggered via wait() construct
//(An event is triggered at the same time as waiting for the event trigger)
//The process_A and process_B have no delay involved to ensure triggering of an event and waiting for even triggers happens at the same time and wait () construct will detect an event triggering.
module event_example6();
  event e1;
  
  task process_A();
    $display("@%0t: Before triggering event e1", $time);
    ->e1;
    $display("@%0t: After triggering event e1", $time);
  endtask
  
  task process_B();
    $display("@%0t: waiting for the event e1", $time);
    wait(e1.triggered);
    $display("@%0t: event e1 is triggered", $time);
  endtask

  initial begin
    fork
      process_A();
      process_B();
    join
  end
endmodule :event_example6 

//Logfile Output
@0: Before triggering event e1
@0: After triggering event e1
@0: waiting for the event e1
@0: event e1 is triggered
           V C S   S i m u l a t i o n   R e p o r t 
  
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
   Example7: IPC Event - An example Differenciating between @(event) and wait (event.triggered)
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//Example7: IPC Event - An example Differenciating between @(event) and wait (event.triggered)
/*
Difference between @(event) and wait (event.triggered)

@(event): The waiting for an event using @ operator blocks the current process until an event is triggered. In a certain condition like waiting for an event and 
triggering an event can occur at the same time, this will cause race conditions between them and triggering an event will be missed if trigger happens before the process begin waiting for it..

wait(event.triggered): The waiting for an event using the wait() construct will unblock the waiting process even if an event is triggered at the time. 
Thus, the wait() construct eliminates race around condition between waiting for an event and triggering an event.

In short, wait() construct catches an event triggering at the same simulation whereas @ operator waiting for an event would lead to race conditions.

To explain using an example, three processes execute in the same simulation time.

process_A: Triggers at event e1;

process_B: wait for event e1 using @ operator

process_C: wait for event e1 using wait() construct

The process_C will be unblocked due to event e1 triggering whereas process B is blocked due to race around condition.

*/

module event_example7();
  event e1;
  
  task process_A();
    $display("@%0t: Process A: Before triggering event e1", $time);
    ->e1;
    $display("@%0t: Process A: After triggering event e1", $time);
  endtask
  
  task process_B();
    $display("@%0t: Process B: waiting for the event e1 using @", $time);
    @e1;
    $display("@%0t: Process B: event e1 is triggered using @", $time);
  endtask

  task process_C();
    $display("@%0t: Process C: waiting for the event e1 using wait(e1.triggered)", $time);
    wait(e1.triggered);
    $display("@%0t: Process C: event e1 is triggered using wait(e1.triggered)", $time);
  endtask
  
  initial begin
    fork
      process_A();
      process_B();
      process_C();
    join
  end
endmodule :event_example7
  
//Logfile Output
@0: Process A: Before triggering event e1
@0: Process A: After triggering event e1
@0: Process B: waiting for the event e1 using @
@0: Process C: waiting for the event e1 using wait(e1.triggered)
@0: Process C: event e1 is triggered using wait(e1.triggered)
           V C S   S i m u l a t i o n   R e p o r t     

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
   Example8: IPC Event - Nonblocking Events +  @(e1.triggered) 
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//Example8: IPC Event - Nonblocking Events +  @(e1.triggered)
//Non-blocking event is triggered using ->>
//As discussed in an earlier example, 
//In case of waiting for an event using @ operator, an event will be missed if the event is triggered (using ->) at the same time as waiting for the event trigger.
//The non-blocking event (using –>>)  is triggered in the non-blocking region of the time slot. Ultimately, event triggering using ->> is a delayed version of the event triggering using ->. 
// Hence, the process_B was waiting for the event using @ operator is completed as shown in the below example.

module event_example8();
  event e1;

  task process_A();
    $display("@%0t: process_A: Before triggering event e1 using ->>", $time);
    ->>e1;
    $display("@%0t: process_A: After triggering event e1 using ->>", $time);
  endtask
  
  task process_B();
    $display("@%0t: process_B: waiting for the event e1", $time);
    @(e1.triggered); //This is equivalent to @ e1;
    // @e1;
    $display("@%0t: process_B: event e1 is triggered", $time);
  endtask

  initial begin
    fork
      process_A();
      process_B();
    join
  end
endmodule :event_example8
    
//Logfile Output    
@0: process_A: Before triggering event e1 using ->>
@0: process_A: After triggering event e1 using ->>
@0: process_B: waiting for the event e1
@0: process_B: event e1 is triggered
           V C S   S i m u l a t i o n   R e p o r t 
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
   Example9: IPC Event - Nonblocking Events + wait(e1.triggered) 
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//Example9: IPC Event - Nonblocking Events + wait(e1.triggered)
//Non-blocking event is triggered using ->>
//As discussed in an earlier example, 
//In case of waiting for an event using @ operator, an event will be missed if the event is triggered (using ->) at the same time as waiting for the event trigger.
//The non-blocking event (using –>>)  is triggered in the non-blocking region of the time slot. Ultimately, event triggering using ->> is a delayed version of the event triggering using ->. 
//Hence, the process_B was waiting for the event using @ operator is completed as shown in the below example.
module event_example9();
  event e1;

  task process_A();
    $display("@%0t: process_A: Before triggering event e1 using ->>", $time);
    ->>e1;
    $display("@%0t: process_A: After triggering event e1 using ->>", $time);
  endtask
  
  task process_B();
    $display("@%0t: process_B: waiting for the event e1", $time);
    //@(e1.triggered); //This is equivalent to @ e1;
    // @e1;
    wait(e1.triggered);
    $display("@%0t: process_B: event e1 is triggered", $time);
  endtask

  initial begin
    fork
      process_A();
      process_B();
    join
  end
endmodule :event_example9
    
//Logfile Output
@0: process_A: Before triggering event e1 using ->>
@0: process_A: After triggering event e1 using ->>
@0: process_B: waiting for the event e1
@0: process_B: event e1 is triggered
           V C S   S i m u l a t i o n   R e p o r t 
  
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
   Example10: IPC Event - wait_order in SV events:In order event example 
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//Example10: IPC Event - wait_order in SV events:In order event example
//The wait_order construct is useful when events are expected to be triggered in a particular order otherwise run time error or display message for out of order event can be written.
module event_example10();
  event e1, e2, e3;
  
  task process_A();
    #5;
    ->e1;
    $display("@%0t: process_A: event e1 is triggered", $time);
  endtask
  
  task process_B();
    #15;
    ->e2;
    $display("@%0t: process_B: event e2 is triggered", $time);
  endtask
  
  task process_C();
    #10;
    ->e3;
    $display("@%0t: process_C: event e3 is triggered", $time);
  endtask
  
  // wait for event triggering in order (e1, e3, e2)
  task wait_process();
    $display("@%0t: waiting for the events e1, e2, e3", $time);
    wait_order(e1, e3, e2)
      $display("Events are triggered in order");
    else
      $display("Events are triggered out of order");
  endtask

  initial begin
    fork
      process_A();
      process_B();
      process_C();
      wait_process();
    join
  end
endmodule :event_example10

//Logfile Output
@0: waiting for the events e1, e2, e3
@5: process_A: event e1 is triggered
@10: process_C: event e3 is triggered
@15: process_B: event e2 is triggered
Events are triggered in order
           V C S   S i m u l a t i o n   R e p o r t     
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
   Example11: IPC Event - wait_order in SV events: Out of order event example1
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
module event_example11();
  event e1, e2, e3;
  
  task process_A();
    #5;
    ->e1;
    $display("@%0t: process_A: event e1 is triggered", $time);
  endtask
  
  task process_B();
    #15;
    ->e2;
    $display("@%0t: process_B: event e2 is triggered", $time);
  endtask
  
  task process_C();
    #10;
    ->e3;
    $display("@%0t: process_C: event e3 is triggered", $time);
  endtask
  
  // wait for event triggering in out of order (e2, e1, e3)
  task wait_process();
    $display("@%0t: waiting for the events e2, e1, e3", $time);
    wait_order(e2, e1, e3)
      $display("Events are triggered in order");
    else
      $display("Events are triggered out of order");
  endtask

  initial begin
    fork
      process_A();
      process_B();
      process_C();
      wait_process();
    join
  end
endmodule :event_example11
    
//Logfile Output
@0: waiting for the events e2, e1, e3
@5: process_A: event e1 is triggered
Events are triggered out of order
@10: process_C: event e3 is triggered
@15: process_B: event e2 is triggered
           V C S   S i m u l a t i o n   R e p o r t     

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
   Example12: IPC Event - wait_order in SV events: Out of order event example2
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
module event_example12();
  event e1, e2, e3;
  
  task process_A();
    #5;
    ->e1;
    $display("@%0t: process_A: event e1 is triggered", $time);
  endtask
  
  task process_B();
    #15;
    ->e2;
    $display("@%0t: process_B: event e2 is triggered", $time);
  endtask
  
  task process_C();
    #10;
    ->e3;
    $display("@%0t: process_C: event e3 is triggered", $time);
  endtask
  
  // wait for event triggering in out of order (e3, e2, e1)
  task wait_process();
    $display("@%0t: waiting for the events e3, e2, e1", $time);
    wait_order(e3, e2, e1)
      $display("Events are triggered in order");
    else
      $display("Events are triggered out of order");
  endtask

  initial begin
    fork
      process_A();
      process_B();
      process_C();
      wait_process();
    join
  end
endmodule :event_example12
    
//Logfile Output
@0: waiting for the events e3, e2, e1
@5: process_A: event e1 is triggered
Events are triggered out of order
@10: process_C: event e3 is triggered
@15: process_B: event e2 is triggered
           V C S   S i m u l a t i o n   R e p o r t 
  
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  Example13: IPC Event - Merging events in SV Ex1
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//An event can be assigned to another event. Hence, waiting for either event will be unblocked by either event triggering.
//There are two events e1 and e2.
//In process_A, an event e2 variable is assigned with the e1 variable and an event e2 is triggered.
//In process_B, the wait() construct is waiting for event e1 to be triggered. 
//Due to event merging, even though process_B is unblocked due to e2 event triggering even though it is waiting for event e1.

module event_example13();
  event e1, e2;
  
  task process_A();
    e2 = e1;
    #10;
    ->e2;
    $display("@%0t: process_A: event e2 is triggered", $time);
  endtask
  
  task process_B();
    $display("@%0t: process_B: waiting for the event e1", $time);
    wait(e1.triggered);
    $display("@%0t: process_B: event e1 is received", $time);
  endtask

  initial begin
    fork
      process_A();
      process_B();
    join
  end
endmodule :event_example13

//Logfile Output
@0: process_B: waiting for the event e1
@10: process_A: event e2 is triggered
@10: process_B: event e1 is received
           V C S   S i m u l a t i o n   R e p o r t     
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
   Example14: IPC Event - Merging events in SV Ex2
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
module event_example14();
  event e1, e2;
  
  task process_A();
    e2 = e1;
    #10;
    ->e1;
    $display("@%0t: process_A: event e1 is triggered", $time);
  endtask
  
  task process_B();
    $display("@%0t: process_B: waiting for the event e2", $time);
    wait(e2.triggered);
    $display("@%0t: process_B: event e2 is received", $time);
  endtask

  initial begin
    fork
      process_A();
      process_B();
    join
  end
endmodule :event_example14
    
//Logfile Output
@0: process_B: waiting for the event e2
@10: process_A: event e1 is triggered
@10: process_B: event e2 is received
           V C S   S i m u l a t i o n   R e p o r t
  
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
   Example15: 
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
   Example16: 
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


