System Verilog Class Introduction :
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

A class instance, handle and object :
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
 
