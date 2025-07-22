Merging events in SV :
-An event can be assigned to another event. Hence, waiting for either event will be unblocked by either event triggering.

Merging events example :
-There are two events e1 and e2.
-In process_A, an event e2 variable is assigned with the e1 variable and an event e2 is triggered.
-In process_B, the wait() construct is waiting for event e1 to be triggered. 
-Due to event merging, even though process_B is unblocked due to e2 event triggering even though it is waiting for event e1.
  
//Example Code
module event_example();
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
endmodule

//LogFile Output using Synopsys Tool

[2025-07-22 05:19:35 UTC] xrun -Q -unbuffered '-timescale' '1ns/1ns' '-sysv' '-access' '+rw' design.sv testbench.sv  
TOOL:	xrun	23.09-s001: Started on Jul 22, 2025 at 01:19:36 EDT
xrun: 23.09-s001: (c) Copyright 1995-2023 Cadence Design Systems, Inc.
	Top level design units:
		event_example
Loading snapshot worklib.event_example:sv .................... Done
xcelium> source /xcelium23.09/tools/xcelium/files/xmsimrc
xcelium> run
@0: process_B: waiting for the event e1
@10: process_A: event e2 is triggered
@10: process_B: event e1 is received
xmsim: *W,RNQUIE: Simulation is complete.
xcelium> exit
TOOL:	xrun	23.09-s001: Exiting on Jul 22, 2025 at 01:19:37 EDT  (total: 00:00:01)
Done
