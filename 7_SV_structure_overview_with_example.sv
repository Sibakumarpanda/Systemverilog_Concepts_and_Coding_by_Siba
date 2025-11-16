Structure in SystemVerilog :
 - A structure is an advanced data types in SV , which is the collection of Heterogenous Data member (different members of different data types) .
 - Where is, an array is the collection of Homogenous Data member (contains elements of the same data type ).
 - This makes structures different from an array.
 - Syntax:
   struct {
     <Data type> <member 1>;
     <Data type> <member 2>;
     ...;
   } <struct_name>;


/********************************************/
  Example1: Basic example of Structure
/********************************************/
module struct_example1;
  struct {
    string name;
    bit[31:0] salary;
    integer id;
  } employee;
    
  initial begin
    employee.name = "Alex";
    employee.salary = 'h10000;
    employee.id     = 'd1234;
    $display("employee: %p", employee);
    
    // Accessing individual struct member
    $display("employee: name = %s, salary = 0x%0h, id = %0d", employee.name, employee.salary, employee.id);
  end
endmodule :struct_example1

//Log File Output
employee: '{name:"Alex", salary:'h10000, id:1234}
employee:  name = Alex, salary = 0x10000, id = 1234

NOTE :
- In the above example, the “employee” struct name is used to store information. 
- Employee behaves reference handle to complete information (includes name, salary, and id of an employee). 
- Individual information also can be accessed. 
- Now, if we want to store another set of information for an employee. The typedef keyword allows creating multiple sets of information with different reference handles.

typedef structure in SV :
--------------------------
  
Syntax :
  typedef struct {
    <Data type> <member 1>;
    <Data type> <member 2>;
    ...;
  } <struct_name>;
  
/********************************************/
  Example2: example of typedef Structure
/********************************************/
module typedef_struct_example2;
  typedef struct {
    string name;
    bit[31:0] salary;
    integer id;
  } employee;
    
  initial begin
    employee e1, e2;
    e1.name = "Alex";
    e1.salary = 'h10000;
    e1.id     = 'd1234;
    $display("employee e1: %p", e1);
    
    e2.name = "Bob";
    e2.salary = 'h20000;
    e2.id     = 'd4321;
    $display("employee e2: %p", e2);
    $display("-------------------------------------------------");
    
    // Accessing individual struct member
    $display("employee e1: name = %s, salary = 0x%0h, id = %0d", e1.name, e1.salary, e1.id);
    $display("employee e2: name = %s, salary = 0x%0h, id = %0d", e2.name, e2.salary, e2.id);
  end
endmodule :typedef_struct_example2

//LogFile Output

employee e1: '{name:"Alex", salary:'h10000, id:1234}
employee e2: '{name:"Bob", salary:'h20000, id:4321}
-------------------------------------------------
employee e1: name = Alex, salary = 0x10000, id = 1234
employee e2: name = Bob, salary = 0x20000, id = 4321
  
Types of structures :
---------------------
   1. Packed structures
   2. Unpacked structures
