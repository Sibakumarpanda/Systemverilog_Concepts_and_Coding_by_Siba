//////////////////////////////////////////////////////////////////////////
  SystemVerilog Scheduling Semantics  / SV various Regions Understanding
///////////////////////////////////////////////////////////////////////////
- The SystemVerilog scheduling semantics is used to describe SystemVerilog language element’s behavior and their interaction with each other. 
- This interaction is described with respect to event execution and its scheduling.
- The SystemVerilog process concurrently schedules elements such as always, always_comb, always_ff, always_latch, and initial procedural blocks, continuous assignments, asynchronous tasks and primitives.
- Processes are ultimately sensitive to event updates. 
- The terminology of event update describes any change in a variable or net state change.
- For example, always @(*) is sensitive for all variables or nets used. Any change in variable or net is considered as an event update. 
- Another example could be having multiple initial blocks in the code. The evaluation order of these initial blocks can be arbitrary depending on simulator implementation.
- Programming Language Interface (PLI) callbacks are used to call a user-defined external routine of a foreign language. 
- Such PLI callbacks are also considered as an event that has to be evaluated.
  
////////////////////////
  Event Simulation
////////////////////////  
- The SystemVerilog language works on the evaluation and execution of such events. 
- So, it becomes important to understand how these events will be evaluated and executed.
- The events are scheduled in a particular order to render an event execution in a systematic way.
- The design takes some time cycles to respond to the driven inputs to produce outputs. 
- The simulator models the actual time for the design description that is commonly known as simulation time.
- A single time cycle or slot is divided into various regions and that helps out to schedule the events. 
- The simulator executes all the events in the current time slot and then moves to the next time slot. This ensures that simulation always proceeds forward in time.
  
//////////////////////////////////////
  Purpose of SystemVerilog regions
//////////////////////////////////////  
- The division of time slots into ordered regions provides predictable interaction between testbench components and design.
- The property expression can be safely evaluated and the testbench can react to assertion evaluation.
