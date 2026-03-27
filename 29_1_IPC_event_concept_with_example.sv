/////////////////////////////////////////
  IPC event Various Examples :
////////////////////////////////////////



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
   Example6: 
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
   Example7: 
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
   Example8: 
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
   Example9: 
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
   Example10: 
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
   Example11: 
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
   Example12: 
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
   Example13: 
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
   Example14: 
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
   Example15: 
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
   Example16: 
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


