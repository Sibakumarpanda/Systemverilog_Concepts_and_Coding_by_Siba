////////////////////////////////////////////////
  SystemVerilog Abstract class/ Virtual Class:
/////////////////////////////////////////////// 
- A class is said to be vitual class/Abstact class , when there is no object associated to it.    
- An abstract class is a special type of base class that is not intended to be instantiated and a set of derived classes can be created. 
- An abstract class is an incomplete class that may contain method implementation (or) may contain only the prototype of methods without actual implementation (known as pure virtual methods). 
- It can not be instantiated and it can only be derived.
- The virtual keyword is used in front of the class to differentiate it from the normal class.
- An abstract class is also known as a virtual class.
- Method type, number of arguments, and return type (if required) should be the same for the virtual methods in their derived classes.
- It is not mandatory to add methods in the abstract class. 
- Syntax:
  virtual class <class_name>
   ...
  endclass
