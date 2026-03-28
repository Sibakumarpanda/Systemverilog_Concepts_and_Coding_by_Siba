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

////////////////////////////////////
  SystemVerilog regions
////////////////////////////////////  
-Before going to SV regions . Lets recall once the verilog regions.
-The Verilog regions are:  Active -> Inactive -> NBA ->Postponed   [4 Regions]
-Coming to Systemverilog , 3 more regions have been added on top of the existing verilog regions . So SV has 7 regions 
-They are :  Preponed -> Active -> Inactive ->NBA ->Observed -> Reactive -> Postponed   [It becomes 7 Regions]
-On next , In SV , we can see that some some sub-regions are also added. They are as below.  
    1. Preponed region
    2. Pre-active region
    3. Active region
    4. Inactive region
    5. Pre-NBA region
    6. NBA region
    7. Post-NBA region
    8. Pre observed region
    9. Observed region
    10.Post observed region
    11.Reactive region
    12.Postponed region  
//////////////////////////////////////////////
  Explanation and uses of all Regions  
//////////////////////////////////////////////  
1. Preponed region
   -The preponed regions is executed once in each time slot that has used in sampling concurrent assertions
   -So , in this region sampling of Concurrent assertion takes place 

2. Pre-active region
   -The pre-active region is used especially for the PLI callback control point to allow user code to write and read values and create events before evaluation of events in the active region.

3. Active region
   -The active region is used to hold current events being evaluated and can be processed in any order.
   -Execution of Continuous assignments of all modules  
   -Execution of Blocking assignments of all modules
   -Execution of $display and $finish commands. 
   -Read of all Nonblocking assignments 
     
4. Inactive region
   -The inactive region holds events to be evaluated after processing all the active events. 
   -An explicit #0 delay is scheduled in the inactive region of the current time slot.

5. Pre-NBA region
   -The pre-NBA region is used especially for the PLI callback control points to allow user code to write and read values and create events before evaluation of events in the NBA region.

6. NBA region
   -The NBA region is mainly used to update LHS of all nonblocking assignments whose RHS were evaluated in the active region.
   -Hence , we   

Post-NBA region
The pre-active region is used especially for the PLI callback control point to allow user code to write and read values and create events after evaluation of events in the NBA region.  


  
