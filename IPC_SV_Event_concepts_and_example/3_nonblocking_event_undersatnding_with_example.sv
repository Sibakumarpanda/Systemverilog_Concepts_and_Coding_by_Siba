Non-blocking event understanding :
-it is triggered using ->>
-As discussed in an earlier example, 
-In case of waiting for an event using @ operator, an event will be missed if the event is triggered (using ->) at the same time as waiting for the event trigger.
-The non-blocking event (using –>>)  is triggered in the non-blocking region of the time slot. 
-Ultimately, event triggering using ->> is a delayed version of the event triggering using ->. 
-Hence, the process_B was waiting for the event using @ operator is completed as shown in the below example.
  
//Example code 
module non_blocking_event_example();
  event e1;

  task process_A();
    $display("@%0t: process_A: Before triggering event e1 using ->>", $time);
    ->>e1;
    $display("@%0t: process_A: After triggering event e1 using ->>", $time);
  endtask
  
  task process_B();
    $display("@%0t: process_B: waiting for the event e1", $time);
    @(e1.triggered);
    $display("@%0t: process_B: event e1 is triggered", $time);
  endtask

  initial begin
    fork
      process_A();
      process_B();
    join
  end
endmodule :non_blocking_event_example

//LogFile output using cadence Xcelium Tool
[2025-07-22 02:14:48 UTC] xrun -Q -unbuffered '-timescale' '1ns/1ns' '-sysv' '-access' '+rw' design.sv testbench.sv  
TOOL:	xrun	23.09-s001: Started on Jul 21, 2025 at 22:14:49 EDT
xrun: 23.09-s001: (c) Copyright 1995-2023 Cadence Design Systems, Inc.
    @(e1.triggered);
                 |
xmvlog: *W,EVCTTR (testbench.sv,12|17): Use of triggered property in event control.
	Top level design units:
		event_example
Loading snapshot worklib.event_example:sv .................... Done
xcelium> source /xcelium23.09/tools/xcelium/files/xmsimrc
xcelium> run
@0: process_A: Before triggering event e1 using ->>
@0: process_A: After triggering event e1 using ->>
@0: process_B: waiting for the event e1
@0: process_B: event e1 is triggered
xmsim: *W,RNQUIE: Simulation is complete.
xcelium> exit
TOOL:	xrun	23.09-s001: Exiting on Jul 21, 2025 at 22:14:50 EDT  (total: 00:00:01)
Done  
