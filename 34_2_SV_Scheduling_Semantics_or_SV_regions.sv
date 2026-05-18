//////////////////////////////////////////////////////////////////////////
  SystemVerilog Scheduling Semantics  / SV various Regions Understanding
///////////////////////////////////////////////////////////////////////////
- The SystemVerilog scheduling semantics is used to describe SystemVerilog language element’s behavior and their interaction with each other. 
- This interaction is described with respect to event execution and its scheduling.
- The SystemVerilog process concurrently schedules elements such as always, always_comb, always_ff, always_latch, and initial procedural blocks,
  continuous assignments, asynchronous tasks and primitives.
- Processes are ultimately sensitive to event updates. 
- The terminology of event update describes any change in a variable or net state change.
- For example, always @(*) is sensitive for all variables or nets used. Any change in variable or net is considered as an event update. 
- Another example could be having multiple initial blocks in the code. 
- The evaluation order of these initial blocks can be arbitrary depending on simulator implementation.
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
- The simulator executes all the events in the current time slot and then moves to the next time slot. 
- This ensures that simulation always proceeds forward in time.
  
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
   -So , in this region sampling of Concurrent assertion takes place .

2. Pre-active region
   -The pre-active region is used especially for the PLI callback control point to allow user code to write and read values 
    and create events before evaluation of events in the active region.

3. Active region
   -The active region is used to hold current events being evaluated and can be processed in any order.
   -Execution of Continuous assignments of all modules . 
   -Execution of Blocking assignments of all modules.
   -Execution of $display and $finish commands. 
   -Read of all Nonblocking assignments. 
     
4. Inactive region
   -The inactive region holds events to be evaluated after processing all the active events. 
   -An explicit #0 delay is scheduled in the inactive region of the current time slot.

5. Pre-NBA region
   -The pre-NBA region is used especially for the PLI callback control points to allow user code to write and read values 
    and create events before evaluation of events in the NBA region.

6. NBA region
   -The NBA region is mainly used to update LHS of all nonblocking assignments whose RHS were evaluated in the active region.
   -Hence , we can say like , Write of all Nonblocking assignments happens in NBA Region .   

7. Post-NBA region
   -The post-NBA region is used especially for the PLI callback control point to allow user code to write and read values 
    and create events after evaluation of events in the NBA region.  

8. Pre-Observed region 
   -The pre observed is specially used for PLI callback control points  
     
9. Observed region
   -The observed region is used to evaluate concurrent assertion which was sampled in the preponed region. 
   -The property expression evaluation must occur only once in a time slot and its pass/fail code will be scheduled in the reactive region 
    of the same time slot.
   -For the clocking block construct in SystemVerilog, if input skew is an explicit #0, then the value sampled in the 
    observed region corresponds to that signal value.

10.Post observed region
   -The post observed is specially used for PLI callback control points that allow user code to read values 
    after evaluation of properties in the observed or earlier region.

11.Reactive region
   -The reactive region is used to schedule code specified in the program block and property expression pass/fail code. 
   -Also , In Reactive region 
    Executes continuous assignments in program block
    Executes blocking assignments in program block
    Execute $exit command
    Execute property expression pass/fail code.
    Thus, The reactive region is an important region to schedule events for the program block.

12.Postponed region
   -The $monitor and $strobe command execution happens in the postpone region. 
   - Similarly, it is also used to collect for functional coverage.   
   -The postponed region is used for the PLI callback control point that allows user code to be suspended until all active, 
    inactive, and NBA regions have completed. 
   -It is illegal to write values to any variable or net.
   -An event scheduling for the previous region in the current time slot is also illegal.
   -For clocking block construct in SystemVerilog, if input skew is not an explicit #0, then the value sampled in the postponed region 
    corresponds to that signal value.

/////////////////////////////////////////////////
  Highight of Operations (Important Points)
///////////////////////////////////////////////// 
-Concurrent assertion :     The concurrent assertion is sampled at a preponed region. 
                            It is evaluated at the observed region and the pass/fail code is scheduled in the reactive region.
-Non-blocking assignments : The RHS of all non-blocking assignments are evaluated at the active region and executed to update LHS in the NBA region.
-$monitor and $strobe:      $monitor and $strobe command execution happen in the postpone region.
-Clocking block constructs: If input skew is an explicit #0, then the value sampled in the observed region corresponds to that signal value
                            else it is sampled in the postponed region. 

///////////////////  
 PLI callback
///////////////////  
- In the pre-active region, the PLI callback control point allows user code to write or read values and create events before evaluation of 
  events in the active region. 
- Subsequently, the pre-NBA region does the same before evaluation of events in the NBA region. 
- And the post-NBA region does the same after evaluation of events in the NBA region. 
- In the post-observed region, PLI callback control points allow user code to read values after evaluation of properties in the observed or earlier region. 
- Finally, the postponed region is used for the PLI callback control point that allows user code to be suspended until all active, 
  inactive and NBA regions have completed. 
- It is illegal to write values to any variable or net. 
- An event scheduling for the previous region in the current time slot is also illegal.
  
////////////////
 Program block
/////////////////  
- The initial blocks within program blocks are scheduled in the reactive region 
  whereas initial blocks within module blocks are scheduled in the active region. 
- This avoids race around conditions between design and testbench code.
  
