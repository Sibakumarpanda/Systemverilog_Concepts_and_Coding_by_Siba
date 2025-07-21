SystemVerilog event Understaning:
-SystemVerilog event is used to synchronize between two or more processes or threads. 
-An event is also a synchronization object that can be passed to a function or task or class constructor. 
-This allows event sharing without declaring it as a global event.
  
How two or more processes are synchronized???
-One process triggers an event while other processes will wait until the event is triggered.
-The System  Verilog events are triggered using -> or ->> operator. 
-The processes can wait for an event to be triggered either via @ operator or wait() construct.
-Syntax:
// To trigger an event
-> <event_name>;
->> <event_name>; 
//wait for an event
@(<event_name>); or @(<event_name>.triggered);
wait(<event_name>.triggered);

Event operator                                            Description

->                                                        Used to trigger an event that unblocks all waiting processes due to this event. It is an instantaneous event.  
  
->>                                                       This operator is used to trigger non-blocking events.

@                                                         The @ operator is used to block the process till an event is triggered. 
                                                          This is an edge-sensitive operator. Hence, waiting for an event should be executed before triggering an event to avoid blocking the waiting process. (Edge sensitive wait operator)
                                                            
wait                                                      The wait() construct is similar to @ operator except it will unblock the process even if triggering an event and waiting for an event to happen at the same time. (level sensitive wait operator)

  
Various examples with outputs to understand the event concept : (By using -> event operator)
  
  1. Event is triggered using -> and waiting for SystemVerilog event to be triggered via the @ operator
      a. Type A1: An event is triggered after waiting for the event trigger
      b. Type B1: An event is triggered before waiting for event trigger
      c. Type C1: An event is triggered at the same time as waiting for the event trigger  

  2. Event is triggered using -> and waiting for SystemVerilog event to be triggered via wait() construct      
      a. Type A2: An event is triggered after waiting for the event trigger
      b. Type B2: An event is triggered before waiting for event trigger
      c. Type C2: An event is triggered at the same time as waiting for the event trigger 

///////////////////////////////////////////////////////////////////////////////////////////////////////////
Example1: Type A1: An event is triggered after waiting for the event trigger 
  
 -For example, there are two processes A and B. The process_A task is used to trigger an event e1 and the process_B task is used to wait for the event using @ operator.
 -The process_A task has a 10ns delay which makes sure event e1 triggers after waiting for the event trigger. The wait for the event to be triggered via @ operator will be unblocked once the e1 event is triggered.

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
endmodule : event_example1
//Logfile output using cadence Xcelium Tool
  
  [2025-07-21 12:11:20 UTC] xrun -Q -unbuffered '-timescale' '1ns/1ns' '-sysv' '-access' '+rw' design.sv testbench.sv  
TOOL:	xrun	23.09-s001: Started on Jul 21, 2025 at 08:11:20 EDT
xrun: 23.09-s001: (c) Copyright 1995-2023 Cadence Design Systems, Inc.
	Top level design units:
		event_example
Loading snapshot worklib.event_example:sv .................... Done
xcelium> source /xcelium23.09/tools/xcelium/files/xmsimrc
xcelium> run
@0: waiting for the event e1
@10: Before triggering event e1
@10: After triggering event e1
@10: event e1 is triggered
xmsim: *W,RNQUIE: Simulation is complete.
xcelium> exit
TOOL:	xrun	23.09-s001: Exiting on Jul 21, 2025 at 08:11:22 EDT  (total: 00:00:02)
Done
////////////////////////////////////////////////////////////////////////////////////////////////  
Example2: Type B1: An event is triggered before waiting for event trigger  
 - The process_B task has a 10ns delay which makes sure event e1 triggers before waiting for an event trigger. 
 - The wait for the event to be triggered via @ operator will not be unblocked since the e1 event is triggered before. 
 - Hence, statements after waiting for the trigger (with @ operator) will not be executed.

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
  
//Logfile output using Cadence xcelium Tool
[2025-07-21 12:16:51 UTC] xrun -Q -unbuffered '-timescale' '1ns/1ns' '-sysv' '-access' '+rw' design.sv testbench.sv  
TOOL:	xrun	23.09-s001: Started on Jul 21, 2025 at 08:16:51 EDT
xrun: 23.09-s001: (c) Copyright 1995-2023 Cadence Design Systems, Inc.
	Top level design units:
		event_example
Loading snapshot worklib.event_example:sv .................... Done
xcelium> source /xcelium23.09/tools/xcelium/files/xmsimrc
xcelium> run
@0: Before triggering event e1
@0: After triggering event e1
@10: waiting for the event e1
xmsim: *W,RNQUIE: Simulation is complete.
xcelium> exit
TOOL:	xrun	23.09-s001: Exiting on Jul 21, 2025 at 08:16:52 EDT  (total: 00:00:01)
Done  
//////////////////////////////////////////////////////////////////////////////////////////////  
Example3: Type C1: An event is triggered at the same time as waiting for the event trigger 
-The process_A and process_B have no delay involved to ensure triggering of an event and waiting for the event trigger to happen at the same time. 
-Since both processes are triggered at the same time, the @ operator will not detect an event triggering. The SystemVerilog provides a wait() construct to solve this problem .(Example6 here)

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
	
//Logfile output using Cadence Xcelium Tool
[2025-07-21 12:31:49 UTC] xrun -Q -unbuffered '-timescale' '1ns/1ns' '-sysv' '-access' '+rw' design.sv testbench.sv  
TOOL:	xrun	23.09-s001: Started on Jul 21, 2025 at 08:31:49 EDT
xrun: 23.09-s001: (c) Copyright 1995-2023 Cadence Design Systems, Inc.
	Top level design units:
		event_example
Loading snapshot worklib.event_example:sv .................... Done
xcelium> source /xcelium23.09/tools/xcelium/files/xmsimrc
xcelium> run
@0: Before triggering event e1
@0: After triggering event e1
@0: waiting for the event e1
xmsim: *W,RNQUIE: Simulation is complete.
xcelium> exit
TOOL:	xrun	23.09-s001: Exiting on Jul 21, 2025 at 08:31:50 EDT  (total: 00:00:01)
Done
////////////////////////////////////////////////////////////////////////////////////////////
Example4: Type A2: An event is triggered after waiting for the event trigger	
-For example, there are two processes A and B. The process_A task is used to trigger an event e1 and the process_B task is used to wait for the event using the wait() construct.
-The process_A task has a 10ns delay which makes sure event e1 triggers after waiting for the event trigger. 
-The wait of the event to be triggered via wait() construct will be unblocked once the e1 event is triggered	

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

//LogFile Output using Cadence Xcelium Tool
[2025-07-21 13:08:40 UTC] xrun -Q -unbuffered '-timescale' '1ns/1ns' '-sysv' '-access' '+rw' design.sv testbench.sv  
TOOL:	xrun	23.09-s001: Started on Jul 21, 2025 at 09:08:40 EDT
xrun: 23.09-s001: (c) Copyright 1995-2023 Cadence Design Systems, Inc.
	Top level design units:
		event_example
Loading snapshot worklib.event_example:sv .................... Done
xcelium> source /xcelium23.09/tools/xcelium/files/xmsimrc
xcelium> run
@0: waiting for the event e1
@10: Before triggering event e1
@10: After triggering event e1
@10: event e1 is triggered
xmsim: *W,RNQUIE: Simulation is complete.
xcelium> exit
TOOL:	xrun	23.09-s001: Exiting on Jul 21, 2025 at 09:08:42 EDT  (total: 00:00:02)
Done
/////////////////////////////////////////////////////////////////////////////////////////////
Example5: Type B2: An event is triggered before waiting for event trigger
-The process_B task has a 10ns delay which makes sure event e1 triggers before waiting for an event trigger. 
-The wait of the event to be triggered via wait() construct will not be unblocked since the e1 event is triggered before. 
-Hence, statements after waiting for the trigger (with wait() construct) will not be executed.
	
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

//LogFile output using Cadence Xcelium Tool
[2025-07-21 13:12:51 UTC] xrun -Q -unbuffered '-timescale' '1ns/1ns' '-sysv' '-access' '+rw' design.sv testbench.sv  
TOOL:	xrun	23.09-s001: Started on Jul 21, 2025 at 09:12:52 EDT
xrun: 23.09-s001: (c) Copyright 1995-2023 Cadence Design Systems, Inc.
	Top level design units:
		event_example
Loading snapshot worklib.event_example:sv .................... Done
xcelium> source /xcelium23.09/tools/xcelium/files/xmsimrc
xcelium> run
@0: Before triggering event e1
@0: After triggering event e1
@10: waiting for the event e1
xmsim: *W,RNQUIE: Simulation is complete.
xcelium> exit
TOOL:	xrun	23.09-s001: Exiting on Jul 21, 2025 at 09:12:53 EDT  (total: 00:00:01)
Done
/////////////////////////////////////////////////////////////////////////////////////////
Example6: Type C2: An event is triggered at the same time as waiting for the event trigger 
-The process_A and process_B have no delay involved to ensure triggering of an event and waiting for even triggers happens at the same time and wait () construct will detect an event triggering.
	
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
//LogFile Output using Cadence Xcelium Tool
[2025-07-21 13:17:27 UTC] xrun -Q -unbuffered '-timescale' '1ns/1ns' '-sysv' '-access' '+rw' design.sv testbench.sv  
TOOL:	xrun	23.09-s001: Started on Jul 21, 2025 at 09:17:28 EDT
xrun: 23.09-s001: (c) Copyright 1995-2023 Cadence Design Systems, Inc.
	Top level design units:
		event_example
Loading snapshot worklib.event_example:sv .................... Done
xcelium> source /xcelium23.09/tools/xcelium/files/xmsimrc
xcelium> run
@0: Before triggering event e1
@0: After triggering event e1
@0: waiting for the event e1
@0: event e1 is triggered
xmsim: *W,RNQUIE: Simulation is complete.
xcelium> exit
TOOL:	xrun	23.09-s001: Exiting on Jul 21, 2025 at 09:17:29 EDT  (total: 00:00:01)
Done	
