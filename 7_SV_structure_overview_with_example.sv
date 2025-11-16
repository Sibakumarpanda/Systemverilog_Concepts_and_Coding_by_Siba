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

Packed structures :
 - Similar to a packed array, if memory allocated for variables in a structure is contiguous, then it is called a packed structure.
 - For creating the packed structure , we need to explicitely declare the structure with keyword as packed . (By Default the structure is unpacked in nature) 
 - Only packed data types are allowed in packed structures.
 - Ex. A string is not a packed data type, so code will not compile. 
 - To use string as a data type in structure, unpack structures can be used.
 - The “packed” keyword is used to declare a packed structure.
  
/***********************************************/
  Example3: example of typedef Packed Structure
/**********************************************/
module packed_struct_example3;
  typedef struct packed {   
    bit[31:0] salary;
    integer   id;
  } employee;
    
  initial begin
    employee emp1, emp2;
    emp1.salary = 'h10000;
    emp1.id     = 'd1234;
    $display("EMP1: %p", emp1);
    
    emp2.salary = 'h12000;
    emp2.id     = 'd4321;
    $display("EMP2: %p", emp2);
  end
endmodule  :packed_struct_example3

//Log File Output

EMP1: '{salary:'h10000, id:1234}
EMP2: '{salary:'h12000, id:4321}

Unpacked structures :
 - A structure is said to be unpacked , if memory allocated for the variables inside struture are not contineous.
 - An unpacked structure is not as memory efficient as packed data structures.
 - By default, a structure is unpacked in nature.
  
/*************************************************/
  Example4: example of typedef unpacked Structure
/*************************************************/  
 module unpacked_struct_example4;
  typedef struct {
    string     name;
    bit [31:0] salary;
    integer    id;
  } employee;
    
  initial begin
    employee emp1, emp2;
    emp1.name = "Alex";
    emp1.salary = 'h10000;
    emp1.id     = 'd1234;
    $display("EMP1: %p", emp1);
    
    emp2.name = "John";
    emp2.salary = 'h12000;
    emp2.id     = 'd4321;
    $display("EMP2: %p", emp2);
  end
endmodule :unpacked_struct_example4

//Log File Output
EMP1: '{name:"Alex", salary:'h10000, id:1234}
EMP2: '{name:"John", salary:'h12000, id:4321}

Passing a structure in function or task :
- In the below example, two functions are used for allocating information to structure members and another function to print the structure. 
- Similarly, a structure can be used as an input argument for tasks.
 
/*************************************************/
  Example5: Passing a structure in function
/*************************************************/  
module passing_struct_in_function_task_example5;
  
 typedef struct {      //Bydefault the structure is Unpacked 
    string name;
    bit[31:0] salary;
    integer id;
  } employee;
    
  function void print_struct(employee emp);
    $display("EMP: %p", emp);
  endfunction
  
  function employee create_struct(string name, bit [31:0] salary, integer id);
    employee emp;
    emp.name   = name;
    emp.salary = salary;
    emp.id     = id;
    return emp;
  endfunction
  
  initial begin
    employee emp1, emp2;
    emp1 = create_struct("Alex",'h10000, 'd1234);
    emp2 = create_struct("John",'h12000, 'd4321);
    print_struct(emp1);
    print_struct(emp2);
  end
endmodule : passing_struct_in_function_task_example5

//Log File Output
EMP: '{name:"Alex", salary:'h10000, id:1234}
EMP: '{name:"John", salary:'h12000, id:4321}
 
NOTE:
------ 
 - In a packed structure, if any data type is 4-state, then the complete structure is treated as a 4-state structure.
 - The packed structure is by default unsigned in nature. To declare a packed signed structure, the below syntax is used.
 - Syntax for packed signed structure :
      typedef struct packed signed {
                <Data type> <member 1>;
                <Data type> <member 2>;
                ...;
      } <struct_name>;
