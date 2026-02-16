////////////////////////////////////////////////////
  SystemVerilog Inheritance Concept Understanding:
////////////////////////////////////////////////////
- Inheritance is the concept of OOP.
- It is the process which allows users to create an extended class from the existing class. 
- The existing class is commonly known as Base class /Parent class/Super class .
- The newly created extended class is known as a Derived class/ Child class/ Subclass.
- The “extends” keyword is used to inherit the child class from its base class.
- Child class has access to class properties and class methods of its base class. Thus, inheritance grants re-usability.
- Along with existing class properties and methods, a child class can also add new properties and methods based on the requirement.
- A child class can modify its base class properties and methods without disturbing the base class.
- Multilevel inheritance is also possible in SystemVerilog. A derived class can also further extended, this is multilevel inheritance.

Class Nomenclature :
-Parent Class : Base class, Superclass
-Child  Class : Derived class, Subclass, Extended class  

/////////////////////////////////////////////////////////////////////// 
  Example-1 : Inheritance Example1
  A child_trans is an extended class from its parent_trans (base class)
  A child_class can access its base class properties (data variable) 
  and methods (disp_p function)
////////////////////////////////////////////////////////////////////////  
class parent_trans;
  bit [31:0] data;
  
  function void disp_p();
    $display("Value of data = %0h", data);
  endfunction
endclass :parent_trans

class child_trans extends parent_trans;
  int id;
  
  function void disp_c();
    $display("Value of id = %0h", id);
  endfunction
endclass :child_trans

module class_example1;
  initial begin
    child_trans c_tr;
    c_tr = new();
    c_tr.data = 5; // child class is updating property of its base class
    c_tr.id = 1;
    
    c_tr.disp_p(); // child class is accessing method of its base class
    c_tr.disp_c();
  end
endmodule :class_example1
    
//Logfile Output
    
Chronologic VCS simulator copyright 1991-2025
Contains Synopsys proprietary information.
Compiler version X-2025.06-SP1_Full64; Runtime version X-2025.06-SP1_Full64;  Feb 16 10:24 2026
Value of data = 5
Value of id = 1
           V C S   S i m u l a t i o n   R e p o r t     
    
/////////////////////////////////////////////////////////////////////// 
  Example-2 : Inheritance Example2
  Multilevel Inheritance Example1
//////////////////////////////////////////////////////////////////////// 
class parent_trans;
  bit [31:0] data_p;
  
  function void disp_p();
    $display("parent_trans: Value of data = %0h", data_p);
  endfunction
endclass :parent_trans

class child1_trans extends parent_trans;
  bit [31:0] data_c1;
  
  function void disp_c1();
    $display("child1_trans: Value of data = %0h", data_c1);
  endfunction
endclass :child1_trans

class child2_trans extends parent_trans;
  bit [31:0] data_c2;
  
  function void disp_c2();
    $display("child2_trans: Value of data = %0h", data_c2);
  endfunction
endclass :child2_trans

class child_A_trans extends child1_trans;
  bit [31:0] data_cA;
  
  function void disp_cA();
    $display("child_A_trans: Value of data = %0h", data_cA);
  endfunction
endclass :child_A_trans

class child_B_trans extends child_A_trans;
  bit [31:0] data_cB;
  
  function void disp_cB();
    $display("child1_2_trans: Value of data = %0h", data_cB);
  endfunction
endclass :child_B_trans

module class_example2;
  initial begin
    child_B_trans cB_tr;
    cB_tr = new();
    cB_tr.data_p = 2;
    cB_tr.data_c1 = 4;
    cB_tr.data_cA = 6;
    cB_tr.data_cB = 8;
    //cB_tr.data_c2 = 3;  // Not possible as child_B_trans is not child class of child2_trans.
    
    cB_tr.disp_p();
    cB_tr.disp_c1();
    cB_tr.disp_cA();
    cB_tr.disp_cB();
  end
endmodule :class_example2  
    
//Logfile Output
Chronologic VCS simulator copyright 1991-2025
Contains Synopsys proprietary information.
Compiler version X-2025.06-SP1_Full64; Runtime version X-2025.06-SP1_Full64;  Feb 16 10:32 2026
parent_trans: Value of data = 2
child1_trans: Value of data = 4
child_A_trans: Value of data = 6
child1_2_trans: Value of data = 8
           V C S   S i m u l a t i o n   R e p o r t     
    
