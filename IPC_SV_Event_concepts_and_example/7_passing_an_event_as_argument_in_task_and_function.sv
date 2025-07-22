Passing an event as an argument in the task or function:
-An event can also be passed to a function or task as below.
  
//Example:
 module event_example();  
  function process_A(event e1);
    ->e1;
    $display("@%0t: process_A: e1 is triggered", $time);
  endfunction
  
  initial begin
    event e1;
    fork
      process_A(e1);
      begin
        $display("@%0t: process_B: waiting for the event e1", $time);
        wait(e1.triggered);
        $display("@%0t: process_B: event e1 is received", $time);
      end
    join
  end
endmodule
  
//Logfile Output using Cadence Xcelium Tool
 [2025-07-22 14:07:06 UTC] xrun -Q -unbuffered '-timescale' '1ns/1ns' '-sysv' '-access' '+rw' design.sv testbench.sv  
TOOL:	xrun	23.09-s001: Started on Jul 22, 2025 at 10:07:06 EDT
xrun: 23.09-s001: (c) Copyright 1995-2023 Cadence Design Systems, Inc.
      process_A(e1);
              |
xmvlog: *W,FUNTSK (testbench.sv,13|14): function called as a task without void'().
	Top level design units:
		event_example
Loading snapshot worklib.event_example:sv .................... Done
xcelium> source /xcelium23.09/tools/xcelium/files/xmsimrc
xcelium> run
@0: process_A: e1 is triggered
@0: process_B: waiting for the event e1
@0: process_B: event e1 is received
xmsim: *W,RNQUIE: Simulation is complete.
xcelium> exit
TOOL:	xrun	23.09-s001: Exiting on Jul 22, 2025 at 10:07:07 EDT  (total: 00:00:01)
Done 
