////////////////////////////////////////////////////////////////////////////
  System verilog disable block and disable statement concept with Example
////////////////////////////////////////////////////////////////////////////
- SystemVerilog provides a disable keyword to disable a named block that is currently executing. 
- If a block is not executing currently, then disable has no effect.
- The named task can also be terminated using the disable keyword.
- Syntax: disable <block_name/ statement_name>

////////////////////////////////////////////////////////////////////
  Example1: SV Disable block with disable Statement - Basic Example
/////////////////////////////////////////////////////////////////
In the below example, the following block/ statements are disabled
Disable statement using “disable disp_label”.
Disable initial block using “disable init_B” based on condition.
Disable fork block using “disable fork_D” before completion of process_4.
Disable named task using “disable task_E” in the middle of its execution.

  
