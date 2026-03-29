////////////////////////////////////////////////////////////////////
  System Verilog Program Block Concept Understanding with example
///////////////////////////////////////////////////////////////////
Program Block :
- In Verilog, a module is a basic building block that contains wires, tasks, function declaration, continuous and procedural statements and hierarchies of other modules.
- The module construct behaves perfectly w.r.t. design implementation.
- While developing a testbench an engineer has to take care to avoid a race condition between design and testbench. 
- The program block is sensitive to the design signals changes that are declared in the module block are scheduled in the reactive region of the time slot.
- Syntax:
  program <program_name> <port_list>;
    ...
  endprogram
  
////////////////////////////////////  
  Program block purpose:
///////////////////////////////////  
- All elements within the program block are scheduled to execute in the reactive region. 
- This helps to avoid race-around conditions between Design (DUT) and Testbench (TB).
- It provides an execution entry point for the testbench.
- It encapsulates testbench Data in a single container. 

//////////////////////////////////////////////////////////  
   Similarities between Program and module block
//////////////////////////////////////////////////////////     
- A program block can instantiate another program block in the way how the module is instantiated another module block.
- Both can have no or more inputs, inout, and output ports.
- Both can have tasks, functions, variable declaration.
- Both can have continuous assignments, initial blocks, concurrent assertions, generate blocks, etc.

////////////////////////////////////////////////////////  
   Difference between program and module block
///////////////////////////////////////////////////////     
- A program block can not instantiate a module block. On the opposite side, a module block can instantiate another module or program block.
- A program block can not have an interface, user-defined primitives (UDP), always block or nested program.
- The initial block inside the program block is scheduled in the reactive region whereas the initial blocks inside the module lock are scheduled in the active region. 

/////////////////////////////////////////////////////////////////////////////////////////////////////////////
  Important Question (Tricky)- Generate a clock with 100MHZ frequency using module block and Program block
///////////////////////////////////////////////////////////////////////////////////////////////////////////// 
  
