/////////////////////////////////////
 System Verilog Class Introduction :
////////////////////////////////////
- class is a user-defined datatype, an OOP construct,which can be used to encapsulate data members (property) and member functions like tasks/functions (methods) which operate on the data.
- The Object-Oriented Programming (OOP) concept is based on an object which is nothing but a container for various data types, functions, tasks etc. 
- It provides data abstraction. Classes allow objects to create and delete dynamically. 
- It also provides a mechanism like a handle or an object pointer that is used to access the object or assign it to some other handle.
- Class properties include data members of the different data types.
- Class methods include functions and tasks present inside classes.

//A basic class syntax:
class <class_name>;
  <data members>  // class properties

  // class methods
  function <function_name>;
  . . .
  endfunction

  task<task_name>;
  . . .
  endtask
endclass  
  
/////////////////////////////////////////
  A class instance, handle and object :
/////////////////////////////////////////  
- A class defines a data type and an object.
- Basically the instance/variable of class is called handle .
- Also an object handle is nothing but a pointer for an object.
- Once the handle is newed ,means explicitely called with a constructor new (), at that time memory allocation is done .And we can say the object is created for the class.  
- NOTE : If an object is not created, then the default value for the class handle is null. 
  
// Basic code Snippet
class transaction;
  // class properties and methods
endclass

transaction tr; // variable of class data_type transaction or class handle
tr = new(); // memory is allotted for class handle .
 
////////////////////////////////////////
  Concept of Constructor in class:
/////////////////////////////////////// 
- The new function used in the above code snippet is called a class constructor. 
- SystemVerilog class has a built-in new method.
- Default values for 2 state variables = 0 , 4 state variables – X
- User-defined new function can be written.
   function new();
      // code specific
   endfunction

   function void new();  // This is invalid as void return type is used
      // code specific
   endfunction
  
- Though the new function does not have any return type, it can be assigned to the left-hand side class handle as below in two ways .
  //1st way
  transaction tr; // variable of class data_type transaction or class handle
  tr = new(); // memory is allotted for class handle .
  
  //2nd way
  transaction tr = new(); // This is possible. Declaration of class handle and object creation in a single line

//Example1 - constructor with passing argument
- An argument can be passed to the constructor.
  
class transaction;
  bit [31:0] data;
  int id;
  
  function new (bit [31:0] m_data);
    $display("Printing Inside constructor");
    data = m_data;
  endfunction
endclass : transaction

module class_example1;
  initial begin
    transaction tr = new(10);
    $display("Value of data = %0h", tr.data);
  end
endmodule :class_example1
  
//Output
Printing Inside constructor
Value of data = a  
 
///////////////////////////////    
  Accessing class methods :
/////////////////////////////// 
- Till now, we have seen how to access class properties. 
- Similarly, class methods (tasks and functions) can be accessed using a class handle.
- In the below example, update (task) and print (function) methods are accessed by handle tr.
 
//Example2
class transaction;
  bit [31:0] data;
  int id;
  
  task update(bit [31:0] m_data, int m_id);
    data = m_data;
    id = m_id;
  endtask
  
  function print(transaction tr);
    $display("Value of data = %0h and id = %0h", tr.data, tr.id);
  endfunction
endclass :transaction

module class_example2;
  initial begin
    transaction tr = new();
    tr.update(5, 9);
    tr.print(tr);
  end
endmodule :class_example2  
 
// Output
 Value of data = 5 and id = 9
