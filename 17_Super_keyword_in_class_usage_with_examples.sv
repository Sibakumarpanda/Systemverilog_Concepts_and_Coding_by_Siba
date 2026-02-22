/////////////////////////////////////////
 Super Keyword in class and its usage:
////////////////////////////////////////
- The super keyword is used in a child or derived class to refer to class members of its immediate base class.
- Syntax: super.<base_class_member>;  // It has to be used in derived class
- Base class members are overridden by its derived class on access by derived class handle if both class members have the same name for class properties and methods. 
- To refer to base class members in such a context, the super keyword is useful. 
- To understand the usage of the super keyword, Below are the two examples. 
- The first example does not use a super keyword while the second example uses a super keyword.
 
- In the below examples, 
- The data variable is a class property of both base and derived class.
- The display() method is also used in both classes

 ////////////////////////////////////////////
   Example1: Example without super keyword
 ////////////////////////////////////////////
 /* Example1 : Example without super keyword
- In the below examples, 
- The data variable is a class property of both base and derived class.
- The display() method is also used in both classes
*/

class base_trans;
  bit [31:0] data;  
  function void display();
    $display("FROM_BASE_CLASS: Value of data = %0h", data);
  endfunction  
endclass :base_trans

class derived_trans extends base_trans;
  bit [31:0] data;  
  function void display();
    $display("FROM_DERIVED_CLASS: Value of data = %0h", data);
  endfunction  
endclass :derived_trans

module class_example1;
  initial begin
    base_trans b;
    derived_trans d;
    b = new();
    d = new();   
    
    d.data = 5; // data variable in base class will have default value as 0.
    d.display();
    
    b.display();
  end
endmodule :class_example1
 
//Logfile Output
 Contains Synopsys proprietary information.
Compiler version X-2025.06-SP1_Full64; Runtime version X-2025.06-SP1_Full64;  Feb 21 23:22 2026
FROM_DERIVED_CLASS: Value of data = 5
FROM_BASE_CLASS: Value of data = 0
           V C S   S i m u l a t i o n   R e p o r t 

 ////////////////////////////////////////////
   Example2: Example with super keyword
 ////////////////////////////////////////////
/* Example2 : Example with super keyword
- In the below examples, 
- The data variable is a class property of both base and derived class.
- The display() method is also used in both classes
*/
class base_trans;
  bit [31:0] data;  
  function void display();
    $display("FROM_BASE_CLASS: Value of data = %0h", data);
  endfunction  
endclass :base_trans

class derived_trans extends base_trans;
  bit [31:0] data;
  function void display();
    super.data = 3;
    super.display();
    $display("FROM_DERIVED_CLASS: Value of data = %0h", data);
  endfunction  
endclass :derived_trans

module class_example2;
  initial begin
    base_trans b;
    derived_trans d;
    b = new();
    d = new();   
    
    d.data = 5; 
    d.display();
    
    b.display();
  end
endmodule :class_example2
 
 //Logfile Output
Contains Synopsys proprietary information.
Compiler version X-2025.06-SP1_Full64; Runtime version X-2025.06-SP1_Full64;  Feb 21 23:26 2026
FROM_BASE_CLASS: Value of data = 3
FROM_DERIVED_CLASS: Value of data = 5
FROM_BASE_CLASS: Value of data = 0
           V C S   S i m u l a t i o n   R e p o r t 

NOTE: 
- In the first example, the value for the data variables in the child class is updated. The display method from the child class is called using the child class handle.
- Similarly, in the second example, the display() method from child class is called using child class handle, but the super keyword makes a difference. 
- The super.data assignment assigns value to the data variable of the base class. Also, super.display() method calls display() method of its base class.
- In the case of multilevel inheritance, class members are inherited one level up. The super.super.<class_member> is not allowed.
 
////////////////////////////////////////////////////
  Usage of the super keyword in the constructor :
 //////////////////////////////////////////////////
 - By default, the SystemVerilog compiler calls super.new() function calls automatically from extended class. 
 - But if there are any arguments used in the new() function call, then the user has to call super.new(<argument_list>) explicitly. 
  - The super.new() function call shall be the first line in the derived class constructor because the Base class must be initialized before the derived class.
   
 ///////////////////////////////////////////////
   Example3: Example of super keyword 
             with arguments in the constructor
 ///////////////////////////////////////////////
/*
-By default, the SystemVerilog compiler calls super.new() function calls automatically from extended class. 
 - But if there are any arguments used in the new() function call, then the user has to call super.new(<argument_list>) explicitly. 
 - The super.new() function call shall be the first line in the derived class constructor because the base class must be initialized before the derived class.
 */
class base_trans;
  bit [31:0] data;
  
  function new(bit [31:0] data);
    this.data = data;
    $display("FROM_BASE_CLASS: Value of data = %0h", data);
  endfunction
  
endclass :base_trans

class derived_trans extends base_trans;
  bit [31:0] data;
  
  function new(bit [31:0] data_b, data_d);
    super.new(data_b);
    this.data = data_d;
    $display("FROM_DERIVED_CLASS : Value of data = %0h", data);
  endfunction

endclass :derived_trans

module class_example1;
  initial begin
    derived_trans d_tr;
    d_tr = new(5, 7);
  end
endmodule :class_example1

//Logfile Output
Chronologic VCS simulator copyright 1991-2025
Contains Synopsys proprietary information.
Compiler version X-2025.06-SP1_Full64; Runtime version X-2025.06-SP1_Full64;  Feb 22 09:31 2026
FROM_BASE_CLASS: Value of data = 5
FROM_DERIVED_CLASS : Value of data = 7
           V C S   S i m u l a t i o n   R e p o r t    

 /////////////////////////////////////////////////
   Example4: Example of super keyword
             without arguments in the constructor
 //////////////////////////////////////////////////
/*
- This example is a little tricky. 
- Usually, we create an object for both base and derived class and then do a method call and assign values to their class properties. 
- To prove that SystemVerilog does super.new() function calls internally. 
- An object is only created for the derived class and then the derived class handle is assigned to its base class. 
- This is required to refer to the memory location for a base class that is created on super.new() call. 
- Later base class data variable value is assigned. 
- On calling display() method for the corresponding class handle, to print respective class properties.
- Notice that the data variable has different values for base and child class since they are declared in both classes.
*/
    
class base_trans;
  bit [31:0] data;
  int id;
  
  function void display();
    $display("FROM_BASE_CLASS : Value of data = %0d, id = %0d", data, id);
  endfunction
endclass :base_trans

class derived_trans extends base_trans;
  bit [31:0] data;
  
  function void display();
    $display("FROM_DERIVED_CLASS : Value of data = %0d, id = %0d", data, id);
  endfunction
endclass :derived_trans

module class_example2;
  initial begin
    base_trans b_tr;
    derived_trans d_tr;
    d_tr = new();
    
    d_tr.data = 5;
    d_tr.id   = 2;
    
    b_tr = d_tr;
    b_tr.display();
    d_tr.display();
    $display ("---------------------------------------------");
    
    b_tr.data = 10;
    b_tr.id   = 1;  
    b_tr.display();
    d_tr.display();
  end
endmodule :class_example2  

//Logfile Output
Contains Synopsys proprietary information.
Compiler version X-2025.06-SP1_Full64; Runtime version X-2025.06-SP1_Full64;  Feb 22 09:44 2026
FROM_BASE_CLASS : Value of data = 0, id = 2
FROM_DERIVED_CLASS : Value of data = 5, id = 2
---------------------------------------------
FROM_BASE_CLASS : Value of data = 10, id = 1
FROM_DERIVED_CLASS : Value of data = 5, id = 1
           V C S   S i m u l a t i o n   R e p o r t    
