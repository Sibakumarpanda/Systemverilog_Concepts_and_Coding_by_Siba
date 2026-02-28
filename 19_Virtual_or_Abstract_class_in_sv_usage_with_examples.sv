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
    
/////////////////////////////////////////////////////////////////////// 
  Example3: 
////////////////////////////////////////////////////////////////////////   



/////////////////////////////////////////////////////////////////////// 
  Example4: 
////////////////////////////////////////////////////////////////////////  



/////////////////////////////////////////////////////////////////////// 
  Example5: 
////////////////////////////////////////////////////////////////////////    



/////////////////////////////////////////////////////////////////////// 
  Example6: 
////////////////////////////////////////////////////////////////////////   



/////////////////////////////////////////////////////////////////////// 
  Example7: 
////////////////////////////////////////////////////////////////////////  



/////////////////////////////////////////////////////////////////////// 
  Example8: 
////////////////////////////////////////////////////////////////////////  




    
