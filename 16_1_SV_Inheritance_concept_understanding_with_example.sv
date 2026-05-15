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

/////////////////////////////////////////////////////////////////////////////////////////////////////// 
  Example-1 : Inheritance Example1
  A derived_class is an extended class from its base_class (Parent class)
  A derived_class can access its base_class properties (data variable) and methods (disp_b function)
///////////////////////////////////////////////////////////////////////////////////////////////////////  
class base_class;
  bit [31:0] data;  
  function void disp_b();
    $display("Value of data = %0h", data);
  endfunction
endclass :base_class

class derived_class extends base_class;
  int id;  
  function void disp_d();
    $display("Value of id = %0h", id);
  endfunction
endclass :derived_class

module class_example1;
  initial begin
    derived_class d;
    d = new();
    d.data = 5; // derived_class is updating property of its base_class
    d.id = 1;
    
    d.disp_b(); // derived_class is accessing method of its base_class
    d.disp_d();
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
    
/////////////////////////////////////////////////////////////////////// 
  Example-3 : Inheritance Example3
  //Overriding base class members (when both the child and base class 
    have the same naming convention for class properties and method)
 //The child class properties and methods override base class properties 
  and methods when both the child and base class have the same naming convention 
  for class properties and method.
//////////////////////////////////////////////////////////////////////// 
class parent_trans;
  bit [31:0] data = 100;
  int id = 1;
  
  function void display();
    $display("From Base Class: Value of data = %0d and id = %0d", data, id);
  endfunction
endclass :parent_trans

class child_trans extends parent_trans;
  bit [31:0] data = 200;
  int id = 2;
  
  function void display();
    $display("From Child Class: Value of data = %0d and id = %0d", data, id);
  endfunction
endclass :child_trans

module class_example;
  initial begin
    child_trans c_tr;
    c_tr = new();

    c_tr.display();
  end
endmodule :class_example
    
//Logfile Output
Chronologic VCS simulator copyright 1991-2025
Contains Synopsys proprietary information.
Compiler version X-2025.06-SP1_Full64; Runtime version X-2025.06-SP1_Full64;  Feb 16 21:45 2026
From Child Class: Value of data = 200 and id = 2
           V C S   S i m u l a t i o n   R e p o r t    
    
/////////////////////////////////////////////////////////////////////// 
  Example-4 : Inheritance Example4
  //when both the child and base class have the Different naming 
  convention for class properties and method,then what will happen???

////////////////////////////////////////////////////////////////////////   
class parent_trans;
  bit [31:0] data = 100;
  int id = 1;
  
  function void display();
    $display("From Base Class: Value of data = %0d and id = %0d", data, id);
  endfunction
endclass :parent_trans

class child_trans extends parent_trans;
  bit [31:0] data1 = 200;
  int id1 = 2;
  
  function void display1();
    $display("From Child Class: Value of data = %0d and id = %0d", data, id);
    $display("From Child Class: Value of data1 = %0d and id1 = %0d", data1, id1);
  endfunction
endclass :child_trans

module class_example;
  initial begin
    child_trans c_tr;
    c_tr = new();    
    c_tr.display1();   
    c_tr.display();    
  end
endmodule :class_example
    
//Logfile Output
    
Contains Synopsys proprietary information.
Compiler version X-2025.06-SP1_Full64; Runtime version X-2025.06-SP1_Full64;  Feb 16 21:46 2026
From Child Class: Value of data = 100 and id = 1
From Child Class: Value of data1 = 200 and id1 = 2
From Base Class: Value of data = 100 and id = 1
           V C S   S i m u l a t i o n   R e p o r t 

/////////////////////////////////////////////////////////////////////// 
  Example-5 : Inheritance Example5
  //Accessing class members in Inheritance
 //Based on the handle of a class, the corresponding method will be 
  called.
////////////////////////////////////////////////////////////////////////       

class parent_trans;
  bit [31:0] data;
  int id;
  
  function void display();
    $display("Base: Value of data = %0d and id = %0d", data, id);
  endfunction
endclass :parent_trans

class child_trans extends parent_trans;
  bit [31:0] data;
  int id;
  
  function void display();
    $display("Child: Value of data = %0d and id = %0d", data, id);
  endfunction
endclass :child_trans

module class_example;
  initial begin
    parent_trans p_tr;
    child_trans c_tr;
    
    p_tr = new();
    c_tr = new();
    
    p_tr.data = 100;
    p_tr.id = 1;

    c_tr.data = 200;
    c_tr.id = 2;
    
    p_tr.display();
    c_tr.display();
  end
endmodule :class_example
    
//Logfile Output
Contains Synopsys proprietary information.
Compiler version X-2025.06-SP1_Full64; Runtime version X-2025.06-SP1_Full64;  Feb 17 21:28 2026
Base: Value of data = 100 and id = 1
Child: Value of data = 200 and id = 2
           V C S   S i m u l a t i o n   R e p o r t 
   
/////////////////////////////////////////////////////////////////////// 
  Example-6 : Inheritance Example6
////////////////////////////////////////////////////////////////////////    
class mypacket;  
  bit [2:0] header;
  bit       encode;
  bit [2:0] mode;
  bit [7:0] data;
  bit       stop;
  
  function new (bit [2:0] header=3'h1 ,bit[2:0] mode=5);   
    this.header  =header;
    this.encode  =0;
    this.mode    =mode;
    //this.data  =data;
    this.stop    =1;   
  endfunction
  
  function display();
    $display ("FROM BASE CLASS=>mypacket CLASS: Header =0x%0h,encode=%0b,mode=0x%0h,stop=%0b",this.header,this.encode,this.mode,this.stop);   
  endfunction
  
endclass :mypacket

class networkpacket extends mypacket;
  bit       parity;
  bit [1:0] crc;
  
  function new ();   
    super.new();
    this.parity=1;
    this.crc=3;    
  endfunction
  
  function display();   
    super.display();
    $display ("FROM DERIVED CLASS=>networkpacket CLASS: Header =0x%0h,encode=%0b,mode=0x%0h,stop=%0b,parity=%0b,crc=%0h",this.header,this.encode,this.mode,this.stop,this.parity,this.crc);    
  endfunction
     
endclass :networkpacket

module tb_top;
  
  initial begin    
    mypacket      pkt0;
    networkpacket pkt1;
        
    pkt0=new( ); 
    pkt0.display();//Means here : header=1 , encode=0, mode=5, stop=1     
    pkt1=new();
    pkt1.display();//Means here : header=1 , encode=0, mode=5, stop=1 ,parity= 1, crc=3        
  end     
endmodule :tb_top
    
//Logfile Output
    
Chronologic VCS simulator copyright 1991-2025
Contains Synopsys proprietary information.
Compiler version X-2025.06-SP1_Full64; Runtime version X-2025.06-SP1_Full64;  Feb 17 21:30 2026
FROM BASE CLASS=>mypacket CLASS: Header =0x1,encode=0,mode=0x5,stop=1
FROM BASE CLASS=>mypacket CLASS: Header =0x1,encode=0,mode=0x5,stop=1
FROM DERIVED CLASS=>networkpacket CLASS: Header =0x1,encode=0,mode=0x5,stop=1,parity=1,crc=3
           V C S   S i m u l a t i o n   R e p o r t 

/////////////////////////////////////////////////////////////////////// 
  Example-7 : Inheritance Example7
//////////////////////////////////////////////////////////////////////// 
class Packet;
   int addr; 
   function new (int addr);
      this.addr = addr;
   endfunction
  
  function display ();
    $display ("[FROM_BASE_CLASS] addr=0x%0h", addr);
  endfunction  
endclass :Packet
 
class ExtPacket extends Packet;
  int data;
 
   function new (int addr, data);
      super.new (addr);
      this.data = data;
   endfunction
 
  function display ();
    $display ("[FROM_CHILD_CLASS] addr=0x%0h data=0x%0h", addr, data);
  endfunction
  
endclass :ExtPacket
 
module tb_top;
  Packet      bc;   // bc stands for BaseClass
  ExtPacket   sc;   // sc stands for SubClass
 
  initial begin
    bc = new (32'hface_cafe);
    bc.display ();
 
    sc = new (32'hfeed_feed, 32'h1234_5678);  
    sc.display ();
  end
  
endmodule :tb_top
    
//Logfile output
Contains Synopsys proprietary information.
Compiler version X-2025.06-SP1_Full64; Runtime version X-2025.06-SP1_Full64;  Feb 17 21:36 2026
[FROM_BASE_CLASS] addr=0xfacecafe
[FROM_CHILD_CLASS] addr=0xfeedfeed data=0x12345678
           V C S   S i m u l a t i o n   R e p o r t     
