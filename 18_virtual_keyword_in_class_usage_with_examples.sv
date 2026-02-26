/////////////////////////////////////////////////////////
   virtual keyword in class and its uses with Examples:
////////////////////////////////////////////////////////
- The virtual keyword is used while defining the class method (virtual methods) and the class itself (Abstract class).
   
virtual functions and tasks in SystemVerilog :
- A virtual method is a virtual function or task from the base class which can be overridden by a method of its Derived class having the same signature (same method name and arguments).
- In simple words, 
   When a Derived class handle is assigned to its base class (means b=d), On calling a method using a base class handle, the base class method will be executed. 
   On declaring a method as a virtual method, a base class handle can call the method of its child class.
- Note: Once a virtual keyword is used for a base class method, all corresponding methods in derived classes become virtual. It is not necessary to put the ‘virtual’ keyword for derived class methods.
- Let’s understand it with below different examples.
- In below examples, a derived class object is created and then it is assigned to the base class handle.
     base_trans b;
     derive_trans d;
     d = new();
     b = d;
