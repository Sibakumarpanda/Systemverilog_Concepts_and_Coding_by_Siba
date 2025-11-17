Unions in SystemVerilog :

-Unions are similar to structures that can contain different data types members except they share the same memory location. 
-Hence, it is memory efficient data structure. But it also restricts the user to use one member at a time.
-Syntax:
  union {
    <Data type> <member 1>;
    <Data type> <member 2>;
    ...;
   } <union_name>;

/*********************************************/
  Example1: Union basic example (using typedef)
/*********************************************/
module union_basic_example1;
  typedef union {
    bit   [15:0] salary;
    integer      id;
  } employee;
    
  initial begin
    employee emp;
    emp.salary = 'h800;
    $display("salary updated for EMP: %p", emp);
    emp.id     = 'd1234;
    $display("ID updated for EMP: %p", emp); //Note: Salary information will be lost
  end
endmodule :union_basic_example1

//Log File Output
salary updated for EMP: '{salary:'h800, id:Z}
ID updated for EMP: '{salary:'h0, id:1234}
