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
- Advantages of Abstract class :
  To keep the program organized and understandable, it forms a group of classes.
  Common methods can be placed in the abstract class and these methods can be inherited by derived classes.
    
///////////////////////////////////////////////////////////////////////////////////////////////////// 
  Example1: Virtual/Abstract Class example- Behaviour check , Without virtual keyword in the class
////////////////////////////////////////////////////////////////////////////////////////////////////
// Example-1 : Behaviour check , Without virtual keyword in the class
class base_trans;
  bit [31:0] data;
  int id;
  
  function void display();
    $display("FROM_BASE_CLASS : Value of data = %0h and id = %0h", data, id);
  endfunction
  
endclass : base_trans

module class_example1;
  initial begin
    base_trans b;
    b = new();
    
    b.data = 5;
    b.id = 1;
    b.display();
  end
endmodule :class_example1
    
//Logfile Output
Chronologic VCS simulator copyright 1991-2025
Contains Synopsys proprietary information.
Compiler version X-2025.06-SP1_Full64; Runtime version X-2025.06-SP1_Full64;  Feb 28 09:06 2026
FROM_BASE_CLASS : Value of data = 5 and id = 1
           V C S   S i m u l a t i o n   R e p o r t   
    
///////////////////////////////////////////////////////////////////////////////////////////// 
  Example2: Virtual/Abstract Class example- An Abstract class/Virtual class instantiation
////////////////////////////////////////////////////////////////////////////////////////////// 
// As we know , virtual class is a class , when there is NO object associated to it 
//As discussed earlier abstract class is not expected to be instantiated. Hence , In the below example,Since we are instantiating an virtual/abstrace class ,  a compilation error is expected for the abstract class

virtual class base_trans; //Virtual or Abstract class created with keyword virtual
  bit [31:0] data;
  int id;
  
   function void display();
     $display("FROM_BASE_CLASS: Value of data = %0h and id = %0h", data, id);
  endfunction
endclass :base_trans

module class_example2;
  initial begin
    base_trans b;
    b = new();
    
    b.data = 5;
    b.id = 1;
    b.display();
  end
endmodule :class_example2

//Logfile Output
    
Top Level Modules:
       class_example2
TimeScale is 1 ns / 1 ns
Error-[SV-ACCNBI] An abstract class cannot be instantiated
testbench.sv, 18
class_example2, "b = new();"
  Instantiation of the object 'b' can not be done because its type 
  'base_trans' is an abstract base class.
  Perhaps there is a derived class that should be used.
1 error    
    
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// 
  Example3: Examples for abstract class- An abstract class with a derived class
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////  
// Example-3 : Examples for abstract class- An abstract class with a derived class
//A Derived class can be extended from an abstract class is the same as how it is extended normally using the extends keyword. 
//The Derived class is instantiated as shown in the below example.
virtual class base_trans;
  bit [31:0] data;
  int id;
  
  function void display();
    $display("FROM_BASE_CLASS: Value of data = %0h and id = %0h", data, id);
  endfunction
endclass :base_trans

class derived_trans extends base_trans;
  function void display();
    $display("FROM_DERIVED_CLASS: Value of data = %0h and id = %0h", data, id);
  endfunction  
endclass :derived_trans

module class_example3;
  initial begin
    derived_trans d;
    d = new();
    
    d.display();
    
    d.data = 5;
    d.id = 1;
    d.display();      
  end
endmodule :class_example3

//Logfile Outpt
Contains Synopsys proprietary information.
Compiler version X-2025.06-SP1_Full64; Runtime version X-2025.06-SP1_Full64;  Mar  1 01:10 2026
Warning : License for product VCS-BASE-RUNTIME will expire within 30 days, on: 30-mar-2026.
If you would like to temporarily disable this message, set 
 the VCS_LIC_EXPIRE_WARNING environment variable to the number of days
before expiration that you want this message to start (the minimum is 0).
FROM_DERIVED_CLASS: Value of data = 0 and id = 0
FROM_DERIVED_CLASS: Value of data = 5 and id = 1
           V C S   S i m u l a t i o n   R e p o r t     
    
/////////////////////////////////////////////////////////////////////// 
  Example4: An abstract class with Derived class handle assignment
////////////////////////////////////////////////////////////////////////  
// Example-4 : An abstract class with Derived class handle assignment
//In the below example, an object for the Derived class is created and its handle is assigned to its Base class handle. 
//This is to show that the Base class handle can access its method.
virtual class base_trans;
  bit [31:0] data;
  int id;
  
  function void display();
    $display("FROM_BASE_CLASS: Value of data = %0h and id = %0h", data, id);
  endfunction
endclass :base_trans

class derived_trans extends base_trans;
  function void display();
    $display("FROM_DERIVED_CLASS: Value of data = %0h and id = %0h", data, id);
  endfunction  
endclass : derived_trans

module class_example4;
  initial begin
    base_trans b;
    derived_trans d;
    d = new();
       
    b = d;
    b.data = 5;
    b.id = 1;
    b.display();
    d.display();
  end
endmodule :class_example4
    
//Logfile Output
Contains Synopsys proprietary information.
Compiler version X-2025.06-SP1_Full64; Runtime version X-2025.06-SP1_Full64;  Mar  1 01:13 2026
Warning : License for product VCS-BASE-RUNTIME will expire within 30 days, on: 30-mar-2026.

If you would like to temporarily disable this message, set 
 the VCS_LIC_EXPIRE_WARNING environment variable to the number of days
before expiration that you want this message to start (the minimum is 0).
FROM_BASE_CLASS: Value of data = 5 and id = 1
FROM_DERIVED_CLASS: Value of data = 5 and id = 1
           V C S   S i m u l a t i o n   R e p o r t     

////////////////////////////////////////////////////////////////////////////////////////////// 
  Example5: An abstract class with Derived class handle assignment with little modification
/////////////////////////////////////////////////////////////////////////////////////////////    
virtual class base_trans;
  bit [31:0] data1;
  int id1;
  
  function void display();
    $display("FROM_BASE_CLASS: Value of data1 = %0h and id1 = %0h", data1, id1);
  endfunction
endclass :base_trans

class derived_trans extends base_trans;
  bit [31:0] data2;
  int id2;
  
  function void display();
    $display("FROM_DERIVED_CLASS: Value of data2 = %0h and id2 = %0h", data2, id2);
    $display("FROM_DERIVED_CLASS: Value of data1 = %0h and id1 = %0h", data1, id1);
  endfunction  
endclass : derived_trans

module class_example5;
  initial begin
    base_trans b;
    derived_trans d;
    d = new();
    
    d.data2 = 10;
    d.id2 = 2;
    b = d;
    
    b.display();
    d.display();
  end
endmodule :class_example5

//Logfile Output
Contains Synopsys proprietary information.
Compiler version X-2025.06-SP1_Full64; Runtime version X-2025.06-SP1_Full64;  Mar  1 01:16 2026
Warning : License for product VCS-BASE-RUNTIME will expire within 30 days, on: 30-mar-2026.

If you would like to temporarily disable this message, set 
 the VCS_LIC_EXPIRE_WARNING environment variable to the number of days
before expiration that you want this message to start (the minimum is 0).
FROM_BASE_CLASS: Value of data1 = 0 and id1 = 0
FROM_DERIVED_CLASS: Value of data2 = a and id2 = 2
FROM_DERIVED_CLASS: Value of data1 = 0 and id1 = 0
           V C S   S i m u l a t i o n   R e p o r t     

///////////////////////////////////////////////////////////////////////////////////// 
  Example6: Virtual/Abstract Class example- An abstract class with a virtual method
////////////////////////////////////////////////////////////////////////////////////   
// Example-6 : An abstract class /Virtual class with a virtual method
virtual class base_trans;
  bit [31:0] data;
  int id;
  
  virtual function void display();
    $display("FROM_BASE_CLASS: Value of data = %0h and id = %0h", data, id);
  endfunction
endclass :base_trans

class derived_trans extends base_trans;
  function void display();
    $display("FROM_DERIVED_CLASS: Value of data = %0h and id = %0h", data, id);
  endfunction  
endclass :derived_trans

module class_example6;
  initial begin
    base_trans b;
    derived_trans d;
    d = new();
    
    b = d;
    b.data = 5;
    b.id = 1;
    b.display();
    d.display();
    $display ("-----------------------------------------");
    d.data=10;
    d.id=2;
    d.display();
    b.display();
    
  end
endmodule :class_example6

//Logfile Output
Contains Synopsys proprietary information.
Compiler version X-2025.06-SP1_Full64; Runtime version X-2025.06-SP1_Full64;  Mar  1 01:20 2026
Warning : License for product VCS-BASE-RUNTIME will expire within 30 days, on: 30-mar-2026.
If you would like to temporarily disable this message, set 
 the VCS_LIC_EXPIRE_WARNING environment variable to the number of days
before expiration that you want this message to start (the minimum is 0).
FROM_DERIVED_CLASS: Value of data = 5 and id = 1
FROM_DERIVED_CLASS: Value of data = 5 and id = 1
-----------------------------------------
FROM_DERIVED_CLASS: Value of data = a and id = 2
FROM_DERIVED_CLASS: Value of data = a and id = 2
           V C S   S i m u l a t i o n   R e p o r t 
  
/////////////////////////////////////////////////////////////////////// 
  Example7: 
////////////////////////////////////////////////////////////////////////  



/////////////////////////////////////////////////////////////////////// 
  Example8: 
////////////////////////////////////////////////////////////////////////  




    
