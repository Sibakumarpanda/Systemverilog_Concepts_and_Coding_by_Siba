/////////////////////////////////////
    SystemVerilog Polymorphism:
//////////////////////////////////////
-Polymorphism means having many forms. A base class handle can invoke methods of its Derived class which has the same name. Hence, an object can take many forms. 
-As we know, the derived class object can override methods of its base class. 
-Similarly, the base class object can also override the method of one of the Derived classes. 
-It means a base class method has different forms based on derived class implementation.
-To use many forms of the method, the virtual keyword must be used in the method definition.

    
/////////////////////////////////////////
  Example1 : Polymorphism Basic Example
/////////////////////////////////////////  
//Example-1 : Polymorphism Basic Example
//In this example, derived_a, derived_b and derived_c are derived from the base class. 
//All Derived class handles are assigned to the base class handle. 
//Using Polymorphism concept, the base class handle can invoke Derived class methods as shown here .

class base_trans;
  bit [31:0] data;
  int id;
  
  virtual function void display();
    $display("FROM_BASE_CLASS: Value of data = %0d, id = %0d", data, id);
  endfunction
endclass :base_trans

class derived_trans_a extends base_trans;
  function void display();
    $display("FROM_DERIVED_A_CLASS: Value of data = %0d, id = %0d", data, id);
  endfunction
endclass : derived_trans_a

class derived_trans_b extends base_trans;
  function void display();
    $display("FROM_DERIVED_B_CLASS: Value of data = %0d, id = %0d", data, id);
  endfunction
endclass :derived_trans_b

class derived_trans_c extends base_trans;
  function void display();
    $display("FROM_DERIVED_C_CLASS: Value of data = %0d, id = %0d", data, id);
  endfunction
endclass :derived_trans_c

module class_example1;
  initial begin
    base_trans b1, b2, b3;
    derived_trans_a d1 = new();
    derived_trans_b d2 = new();
    derived_trans_c d3 = new();
    
    d1.data = 200;
    d1.id   = 2;
    
    d2.data = 300;
    d2.id   = 3;
    
    d3.data = 400;
    d3.id   = 4;
     
    b1 = d1;
    b2 = d2;
    b3 = d3;
    
    b1.display();
    b2.display();
    b3.display();
    $display ("**************************************************");
    
    b1.data = 100;
    b1.id   = 1;
    
    b1.display();
    b2.display();
    b3.display();
  end
endmodule :class_example1
    
//Log File Output
Contains Synopsys proprietary information.
Compiler version X-2025.06-SP1_Full64; Runtime version X-2025.06-SP1_Full64;  Mar  4 20:26 2026
FROM_DERIVED_A_CLASS: Value of data = 200, id = 2
FROM_DERIVED_B_CLASS: Value of data = 300, id = 3
FROM_DERIVED_C_CLASS: Value of data = 400, id = 4
**************************************************
FROM_DERIVED_A_CLASS: Value of data = 100, id = 1
FROM_DERIVED_B_CLASS: Value of data = 300, id = 3
FROM_DERIVED_C_CLASS: Value of data = 400, id = 4
           V C S   S i m u l a t i o n   R e p o r t     

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
 Example2_1 : Polymorphism -Derived class handle is assigned to the base class (base_class_handle = derived_class_handle , ie b=d)
              Both base and Derived classes have the same name of class properties
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// 
 //Example-2_1 : Polymorphism -Derived class handle is assigned to the base class (base_class_handle = derived_class_handle , ie b=d)
//PartA: Both base and Derived classes have the same name of class properties (data and id variables).
//In this example a derived_trans class is extended from the base_trans class.
//An object is created from the derived class. 
//Later a derived class handle is assigned to the base class handle. 
//Depending on properties declaration (class variables) in base and derived class, memory allocation differs.
//Notice that here, value assignment (data and id variables) using the base class handle is written first and then a derived class handle is used to assign the values to variables.
//Since here ,variables are declared in both classes, separate memory is allocated. Hence, base class values are not overridden by its child class.
                  
class base_trans;
  bit [31:0] data;
  int id;
  
  function void display();
    $display("FROM_BASE_CLASS: Value of data = %0d, id = %0d", data, id);
  endfunction
endclass :base_trans

class derived_trans extends base_trans;
  bit [31:0] data;
  int id;
  
  function void display();
    $display("FROM_DERIVED_CLASS: Value of data = %0d, id = %0d", data, id);
  endfunction
endclass :derived_trans

module class_example2;
  initial begin
    base_trans b;
    derived_trans d;
    d = new();
      
    b = d;
    
    b.data = 10;
    b.id   = 1;
    
    d.data = 5;
    d.id   = 2;
    
    b.display();
    d.display();
  end
endmodule :class_example2
                  
//Log File Output
Contains Synopsys proprietary information.
Compiler version X-2025.06-SP1_Full64; Runtime version X-2025.06-SP1_Full64;  Mar  4 21:41 2026
FROM_BASE_CLASS: Value of data = 10, id = 1
FROM_DERIVED_CLASS: Value of data = 5, id = 2
           V C S   S i m u l a t i o n   R e p o r t                   
                 
////////////////////////////////////
 Example2_2 :
///////////////////////////////////     


////////////////////////////////////
 Example3 :
///////////////////////////////////     


////////////////////////////////////
 Example4 :
///////////////////////////////////  


////////////////////////////////////
 Example5 :
///////////////////////////////////  


////////////////////////////////////
 Example6 :
///////////////////////////////////


////////////////////////////////////
 Example7 :
///////////////////////////////////   


////////////////////////////////////
 Example8 :
/////////////////////////////////// 


    
