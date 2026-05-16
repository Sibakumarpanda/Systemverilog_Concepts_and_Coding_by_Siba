//////////////////////////////////
  SystemVerilog Polymorphism:
//////////////////////////////////
-Poly means "Many" and Morph means "Forms" .
-Hence , Polymorphism means having many forms. 
-A base class handle can invoke methods of its Derived class which has the same name. Hence, an object can take many forms. 
-As we know, the derived class object can override methods of its base class. 
-Similarly, the base class object can also override the method of one of the Derived classes. 
-It means a base class method has different forms based on derived class implementation.
-To use many forms of the method, the virtual keyword must be used in the method definition.
   
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  Example1 : Polymorphism Basic Example
  //In this example, derived_trans_a, derived_trans_b and derived_trans_c are derived from the base_trans (base class) 
  //All Derived class handles are assigned to the base class handle. 
  //Using Polymorphism concept, the base class handle can invoke Derived class methods as shown here 
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////  
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

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
 Example2_1 : Polymorphism - Derived class handle is assigned to the base class (base_class_handle = derived_class_handle , ie b=d)
 //Here , Both base and Derived classes have the same name of class properties (data and id variable)
 //In this example a derived_trans class is extended from the base_trans class.
 //An object is created from the derived class. 
 //Later a derived class handle is assigned to the base class handle. 
 //Depending on properties declaration (class variables) in base and derived class, memory allocation differs.
 //Notice that here, value assignment (data and id variables) using the base class handle is written first and then 
 //a derived class handle is used to assign the values to variables.
 //Since here ,variables are declared in both classes, separate memory is allocated. 
 //Hence, base class values are not overridden by its derived class.  
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////                   
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

module class_example2_1;
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
endmodule :class_example2_1
                  
//Log File Output
Contains Synopsys proprietary information.
Compiler version X-2025.06-SP1_Full64; Runtime version X-2025.06-SP1_Full64;  Mar  4 21:41 2026
FROM_BASE_CLASS: Value of data = 10, id = 1
FROM_DERIVED_CLASS: Value of data = 5, id = 2
           V C S   S i m u l a t i o n   R e p o r t                   
                 
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
 Example2_2 : Polymorphism -Derived class handle is assigned to the base class (base_class_handle = derived_class_handle , ie b=d)
 //Here, Both base and Derived classes have the same name of class properties (data and id variables) and virtual method is used in base class
 //In this example a derived_trans class is extended from the base_trans class.
 //An object is created from the derived class. 
 //Later a derived class handle is assigned to the base class handle. 
 //Depending on properties declaration (class variables) in base and derived class, memory allocation differs.
 //Notice that here, value assignment (data and id variables) using the base class handle is written first and then a derived class handle 
 //is used to assign the values to variables.
 //Since here ,variables are declared in both classes, separate memory is allocated. 
 //But due to use of virtual methosd in base class , base class values are overridden by derived class.  
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////                 
class base_trans;
  bit [31:0] data;
  int id;  
  virtual function void display(); //virtual method is used here , see carefully
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

module class_example2_2;
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
endmodule :class_example2_2

//Logfile Output
Contains Synopsys proprietary information.
FROM_DERIVED_CLASS: Value of data = 5, id = 2
FROM_DERIVED_CLASS: Value of data = 5, id = 2
           V C S   S i m u l a t i o n   R e p o r t                  

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
 Example3_1 : Polymorphism -Derived class handle is assigned to the base class (base_class_handle = derived_class_handle , ie b=d)
 //Here , in this example ,Only base class has class properties declared.
 //derived_trans class is extended from the base_trans class.
 //An object is created from the derived class. 
 //Later a derived class handle is assigned to the base class handle. 
 //Depending on properties declaration (class variables) in base and derived class, memory allocation differs.
 //Notice that ,value assignment (data and id variables) using the base class handle is written first and 
 //then a derived class handle is used to assign the values to variables.
 //Since here ,variables are only declared in the base class, both classes will have access to the same memory location.
 //Hence, values changed by child class also reflect when it is accessed by the base class handle.               
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////    
class base_trans;
  bit [31:0] data;
  int id; 
  function void display();
    $display("FROM_BASE_CLASS: Value of data = %0d, id = %0d", data, id);
  endfunction
endclass :base_trans

class derived_trans extends base_trans;   
  function void display();
    $display("FROM_DERIVED_CLASS: Value of data = %0d, id = %0d", data, id);
  endfunction
endclass :derived_trans

module class_example3_1;
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
endmodule :class_example3_1

//Logfile Output
Chronologic VCS simulator copyright 1991-2025
Contains Synopsys proprietary information.
Compiler version X-2025.06-SP1_Full64; Runtime version X-2025.06-SP1_Full64;  Mar  5 06:17 2026
FROM_BASE_CLASS: Value of data = 5, id = 2
FROM_DERIVED_CLASS: Value of data = 5, id = 2
           V C S   S i m u l a t i o n   R e p o r t                   

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
 Example3_2 :  Polymorphism -Derived class handle is assigned to the base class (base_class_handle = derived_class_handle , ie b=d)
 //Here in this example, Only base class has class properties declared and virtual method is used in base class
 //A derived_trans class is extended from the base_trans class.
 //An object is created from the derived class. 
 //Later a derived class handle is assigned to the base class handle. 
 //Depending on properties declaration (class variables) in base and derived class, memory allocation differs.
 //Notice that, value assignment (data and id variables) using the base class handle is written first and 
 //then a derived class handle is used to assign the values to variables.
 //Since here ,variables are only declared in the base class, both classes will have access to the same memory location. 
 // Hence, values changed by child class also reflect when it is accessed by the base class handle
 // But the difference wrto previous Example3_2 is , due to usage of virtual method in base class , when we are try to access through base
 // class handle , we will get derived class content (means base class is overrided , due to usage of virtual method + b=d)  
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////  
class base_trans;
  bit [31:0] data;
  int id;  
  virtual function void display();
    $display("FROM_BASE_CLASS: Value of data = %0d, id = %0d", data, id);
  endfunction
endclass :base_trans

class derived_trans extends base_trans;   
  function void display();
    $display("FROM_DERIVED_CLASS: Value of data = %0d, id = %0d", data, id);
  endfunction
endclass :derived_trans

module class_example3_2;
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
endmodule :class_example3_2
                   
//Logfile Output                   
Contains Synopsys proprietary information.
Compiler version X-2025.06-SP1_Full64; Runtime version X-2025.06-SP1_Full64;  Mar  5 06:21 2026
FROM_DERIVED_CLASS: Value of data = 5, id = 2
FROM_DERIVED_CLASS: Value of data = 5, id = 2
           V C S   S i m u l a t i o n   R e p o r t                    

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
   Example4 : Polymorphism - A base class handle is assigned to the Derived class (derived_class_handle = base_class_handle that is d=b)
   // Now, Let’s try to assign a base class handle to the Derived class. This will lead to a compilation error. 
   // As we observe compilation error when a base_class_handle is assigned to the derived_class_handle. 
   // Let’s see how to resolve this problem using “Dynamic Casting” in coming Example5
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////  
class base_trans;
  bit [31:0] data;
  int id;  
  function void display();
    $display("FROM_BASE_CLASS: Value of data = %0d, id = %0d", data, id);
  endfunction
endclass :base_trans

class derived_trans extends base_trans;  
  function void display();
    $display("FROM_DERIVED_CLASS: Value of data = %0d, id = %0d", data, id);
  endfunction
endclass :derived_trans

module class_example4;
  initial begin
    base_trans b;
    derived_trans d;
    d = new();

    d = b;     //base class handle is assigned to the derived class

    b.data = 10;
    b.id   = 1;
    
    d.data = 5;
    d.id   = 2;
    
    b.display();
  end
endmodule :class_example4

//Logfile Output
Error-[SV-ICA] Illegal class assignment
testbench.sv, 29
"d = b;"
  Expression 'b' on rhs is not a class or a compatible class and hence cannot 
  be assigned to a class handle on lhs.
  Source type: class $unit::base_trans
  Target type: class $unit::derived_trans
  Please make sure that the lhs and rhs expressions are compatible.
1 error
CPU time: .410 seconds to compile      

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
 Example5 : Polymorphism -A base class handle is assigned to the Derived class (Derived_class_handle = base_class_handle) with dynamic casting
 //Now, replace assignment = with $cast(, ) and carefully observe/analyse the result 
 //The run time error is still expected because the base class handle is not pointing to an object that is compatible with derived class handle
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
class base_trans;
  bit [31:0] data;
  int id;
  function void display();
    $display("FROM_BASE_CLASS: Value of data = %0d, id = %0d", data, id);
  endfunction
endclass : base_trans

class derived_trans extends base_trans; 
  function void display();
    $display("FROM_DERIVED_CLASS: Value of data = %0d, id = %0d", data, id);
  endfunction
endclass :derived_trans

module class_example5;
  initial begin
    base_trans b;
    derived_trans d;
    b = new();

    $cast(d, b);

    b.data = 10;
    b.id   = 1;
    
    d.data = 5;
    d.id   = 2;
    
    b.display();
  end
endmodule : class_example5     

//Logfile Output
Error-[DCF] Dynamic cast failed
testbench.sv, 26
  Casting of source class type 'base_trans' to destination class type 
  'derived_trans' failed due to type mismatch.
  Please ensure matching types for dynamic cast
           V C S   S i m u l a t i o n   R e p o r t 
      
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
 Example6 :  Polymorphism : Solution to Example 4 and 5
 //To resolve this, we need to assign a derived class handle to the base class handle.
 //so that ,the base class handle should be compatible with the derived class. 
 //Notice that an object is created for the derived class here whereas, in example5, an object was created for the base class. 
 //This was required otherwise null pointer dereference is expected.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
class base_trans;
  bit [31:0] data;
  int id;
  function void display();
    $display("FROM_BASE_CLASS: Value of data = %0d, id = %0d", data, id);
  endfunction
endclass :base_trans

class derived_trans extends base_trans; 
  function void display();
    $display("FROM_DERIVED_CLASS: Value of data = %0d, id = %0d", data, id);
  endfunction
endclass :derived_trans

module class_example6;
  initial begin
    base_trans b;
    derived_trans d;
    d = new();

    b = d; //or $cast(b, d);
    $cast(d, b);

    b.data = 10;
    b.id   = 1;
    
    d.data = 5;
    d.id   = 2;
    
    d.display();
    b.display();
  end
endmodule :class_example6      

//Logfile Output
Contains Synopsys proprietary information.
Compiler version X-2025.06-SP1_Full64; Runtime version X-2025.06-SP1_Full64;  Mar  5 10:01 2026
FROM_DERIVED_CLASS: Value of data = 5, id = 2
FROM_BASE_CLASS: Value of data = 5, id = 2
           V C S   S i m u l a t i o n   R e p o r t   
      
////////////////////////////////////
 Example7 :
///////////////////////////////////   


////////////////////////////////////
 Example8 :
/////////////////////////////////// 


    
