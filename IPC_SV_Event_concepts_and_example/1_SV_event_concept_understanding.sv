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
