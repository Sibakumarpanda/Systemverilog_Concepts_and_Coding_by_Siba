Passing an event in the class constructor:
-When a class object is created, an event is passed to the constructor as shown in the below example.
  
//Example
 class transaction;
  event tr_e;
  
  function new(event e1);
    tr_e = e1;
  endfunction
  
  task process_A();
    #10;
    ->tr_e;
    $display("@%0t: process_A: tr_e is triggered", $time);
  endtask

  task process_B();
    $display("@%0t: process_B: waiting for the event tr_e", $time);
    wait(tr_e.triggered);
    $display("@%0t: process_B: event tr_e is received", $time);
  endtask
endclass

module event_example();
  transaction tr;
  event ev;
  
  initial begin
    tr = new(ev);
    fork
      tr.process_A();
      tr.process_B();
    join
  end
endmodule
  
//Logfile Output using Cadence Xcelium Tool
[2025-07-22 14:01:17 UTC] xrun -Q -unbuffered '-timescale' '1ns/1ns' '-sysv' '-access' '+rw' design.sv testbench.sv  
TOOL:	xrun	23.09-s001: Started on Jul 22, 2025 at 10:01:17 EDT
xrun: 23.09-s001: (c) Copyright 1995-2023 Cadence Design Systems, Inc.
	Top level design units:
		$unit_0x4ccdf83b
		event_example
Loading snapshot worklib.event_example:sv .................... Done
xcelium> source /xcelium23.09/tools/xcelium/files/xmsimrc
xcelium> run
@0: process_B: waiting for the event tr_e
@10: process_A: tr_e is triggered
@10: process_B: event tr_e is received
xmsim: *W,RNQUIE: Simulation is complete.
xcelium> exit
TOOL:	xrun	23.09-s001: Exiting on Jul 22, 2025 at 10:01:19 EDT  (total: 00:00:02)
Done  
