Difference between @(event) and wait (event.triggered):

@(event): 
-The waiting for an event using @ operator blocks the current process until an event is triggered. 
-In a certain condition like waiting for an event and triggering an event can occur at the same time, this will cause race conditions between them and triggering an event will be missed if the wait for an event happens earlier.

wait(event.triggered): 
-The waiting for an event using the wait() construct will unblock the waiting process even if an event is triggered at the time. 
-Thus, the wait() construct eliminates race around condition between waiting for an event and triggering an event.
-In short, wait() construct catches an event triggering at the same simulation whereas @ operator waiting for an event would lead to race conditions.

-To explain above concept using an example, three processes execute in the same simulation time. lets understand

process_A: Triggers at event e1;
process_B: wait for event e1 using @ operator
process_C: wait for event e1 using wait() construct
The process_C will be unblocked due to event e1 triggering whereas process B is blocked due to race around condition.

//Example1 code Snippet with output  
module event_example_difference();
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
endmodule :event_example_difference

//LogFile output using Cadence Xcelium Tool
[2025-07-21 13:29:27 UTC] xrun -Q -unbuffered '-timescale' '1ns/1ns' '-sysv' '-access' '+rw' design.sv testbench.sv  
TOOL:	xrun	23.09-s001: Started on Jul 21, 2025 at 09:29:28 EDT
xrun: 23.09-s001: (c) Copyright 1995-2023 Cadence Design Systems, Inc.
	Top level design units:
		event_example
Loading snapshot worklib.event_example:sv .................... Done
xcelium> source /xcelium23.09/tools/xcelium/files/xmsimrc
xcelium> run
@0: Process A: Before triggering event e1
@0: Process A: After triggering event e1
@0: Process B: waiting for the event e1 using @
@0: Process C: waiting for the event e1 using wait(e1.triggered)
@0: Process C: event e1 is triggered using wait(e1.triggered)
xmsim: *W,RNQUIE: Simulation is complete.
xcelium> exit
TOOL:	xrun	23.09-s001: Exiting on Jul 21, 2025 at 09:29:29 EDT  (total: 00:00:01)
Done
  
//Example2: With minor change in delay
module event_example();
  event e1;
  
  task process_A();
    #10;
    $display("@%0t: Process A: Before triggering event e1", $time);
    ->e1;
    $display("@%0t: Process A: After triggering event e1", $time);
  endtask
  
  task process_B();
    #10;
    $display("@%0t: Process B: waiting for the event e1 using @", $time);
    @e1;
    $display("@%0t: Process B: event e1 is triggered using @", $time);
  endtask

  task process_C();
    #10;
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
endmodule
//LogFile output using Cadence Xcelium Tool
[2025-07-21 13:34:44 UTC] xrun -Q -unbuffered '-timescale' '1ns/1ns' '-sysv' '-access' '+rw' design.sv testbench.sv  
TOOL:	xrun	23.09-s001: Started on Jul 21, 2025 at 09:34:44 EDT
xrun: 23.09-s001: (c) Copyright 1995-2023 Cadence Design Systems, Inc.
	Top level design units:
		event_example
Loading snapshot worklib.event_example:sv .................... Done
xcelium> source /xcelium23.09/tools/xcelium/files/xmsimrc
xcelium> run
@10: Process A: Before triggering event e1
@10: Process A: After triggering event e1
@10: Process B: waiting for the event e1 using @
@10: Process C: waiting for the event e1 using wait(e1.triggered)
@10: Process C: event e1 is triggered using wait(e1.triggered)
xmsim: *W,RNQUIE: Simulation is complete.
xcelium> exit
TOOL:	xrun	23.09-s001: Exiting on Jul 21, 2025 at 09:34:46 EDT  (total: 00:00:02)
Done
  
//Example3: With minor change in delay
module event_example();
  event e1;
  
  task process_A();
    #10;
    $display("@%0t: Process A: Before triggering event e1", $time);
    ->e1;
    $display("@%0t: Process A: After triggering event e1", $time);
  endtask
  
  task process_B();
    #20;
    $display("@%0t: Process B: waiting for the event e1 using @", $time);
    @e1;
    $display("@%0t: Process B: event e1 is triggered using @", $time);
  endtask

  task process_C();
    #10;
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
endmodule
//LogFile output using Cadence Xcelium Tool
[2025-07-21 13:36:15 UTC] xrun -Q -unbuffered '-timescale' '1ns/1ns' '-sysv' '-access' '+rw' design.sv testbench.sv  
TOOL:	xrun	23.09-s001: Started on Jul 21, 2025 at 09:36:16 EDT
xrun: 23.09-s001: (c) Copyright 1995-2023 Cadence Design Systems, Inc.
	Top level design units:
		event_example
Loading snapshot worklib.event_example:sv .................... Done
xcelium> source /xcelium23.09/tools/xcelium/files/xmsimrc
xcelium> run
@10: Process A: Before triggering event e1
@10: Process A: After triggering event e1
@10: Process C: waiting for the event e1 using wait(e1.triggered)
@10: Process C: event e1 is triggered using wait(e1.triggered)
@20: Process B: waiting for the event e1 using @
xmsim: *W,RNQUIE: Simulation is complete.
xcelium> exit
TOOL:	xrun	23.09-s001: Exiting on Jul 21, 2025 at 09:36:17 EDT  (total: 00:00:01)
Done

//Example4: With minor change in delay  
module event_example();
  event e1;
  
  task process_A();
    #10;
    $display("@%0t: Process A: Before triggering event e1", $time);
    ->e1;
    $display("@%0t: Process A: After triggering event e1", $time);
  endtask
  
  task process_B();
    #20;
    $display("@%0t: Process B: waiting for the event e1 using @", $time);
    @e1;
    $display("@%0t: Process B: event e1 is triggered using @", $time);
  endtask

  task process_C();
    #30;
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
endmodule
//LogFile output using Cadence Xcelium Tool
 [2025-07-21 13:37:09 UTC] xrun -Q -unbuffered '-timescale' '1ns/1ns' '-sysv' '-access' '+rw' design.sv testbench.sv  
TOOL:	xrun	23.09-s001: Started on Jul 21, 2025 at 09:37:10 EDT
xrun: 23.09-s001: (c) Copyright 1995-2023 Cadence Design Systems, Inc.
	Top level design units:
		event_example
Loading snapshot worklib.event_example:sv .................... Done
xcelium> source /xcelium23.09/tools/xcelium/files/xmsimrc
xcelium> run
@10: Process A: Before triggering event e1
@10: Process A: After triggering event e1
@20: Process B: waiting for the event e1 using @
@30: Process C: waiting for the event e1 using wait(e1.triggered)
xmsim: *W,RNQUIE: Simulation is complete.
xcelium> exit
TOOL:	xrun	23.09-s001: Exiting on Jul 21, 2025 at 09:37:11 EDT  (total: 00:00:01)
Done
  
//Example5: With minor change in delay  
module event_example();
  event e1;
  
  task process_A();
    #30;
    $display("@%0t: Process A: Before triggering event e1", $time);
    ->e1;
    $display("@%0t: Process A: After triggering event e1", $time);
  endtask
  
  task process_B();
    #20;
    $display("@%0t: Process B: waiting for the event e1 using @", $time);
    @e1;
    $display("@%0t: Process B: event e1 is triggered using @", $time);
  endtask

  task process_C();
    #10;
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
endmodule

//LogFile output using Cadence Xcelium Tool
[2025-07-21 13:38:09 UTC] xrun -Q -unbuffered '-timescale' '1ns/1ns' '-sysv' '-access' '+rw' design.sv testbench.sv  
TOOL:	xrun	23.09-s001: Started on Jul 21, 2025 at 09:38:09 EDT
xrun: 23.09-s001: (c) Copyright 1995-2023 Cadence Design Systems, Inc.
	Top level design units:
		event_example
Loading snapshot worklib.event_example:sv .................... Done
xcelium> source /xcelium23.09/tools/xcelium/files/xmsimrc
xcelium> run
@10: Process C: waiting for the event e1 using wait(e1.triggered)
@20: Process B: waiting for the event e1 using @
@30: Process A: Before triggering event e1
@30: Process A: After triggering event e1
@30: Process C: event e1 is triggered using wait(e1.triggered)
@30: Process B: event e1 is triggered using @
xmsim: *W,RNQUIE: Simulation is complete.
xcelium> exit
TOOL:	xrun	23.09-s001: Exiting on Jul 21, 2025 at 09:38:10 EDT  (total: 00:00:01)
Done
