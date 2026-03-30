/////////////////////////////////////////////////////////////////////
  System verilog Named Block and Statement Labels
////////////////////////////////////////////////////////////////////
- SystemVerilog provides feasibility to have names for blocks like begin..end, fork..join, fork..join_any or fork..join_none and statements.
- Syntax:  begin: <block_name>
            …
           end
          <label_name>: <statement>;
- Note:
  A label can not put before the end, join, join_any, join_none
  A label before the begin or fork and block name after the begin or fork can not be placed simultaneously.
