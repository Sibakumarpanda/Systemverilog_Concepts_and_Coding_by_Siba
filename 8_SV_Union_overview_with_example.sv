Unions in SystemVerilog :
-Unions are similar to structures that can contain different data types members except they share the same memory location. 
-Hence, it is memory efficient data structure. But it also restricts the user to use one member at a time.
-Syntax:
  union {
    <Data type> <member 1>;
    <Data type> <member 2>;
    ...;
   } <union_name>;
