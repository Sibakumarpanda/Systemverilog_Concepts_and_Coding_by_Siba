/////////////////////////////////////////////////////////////////
  Scope Resolution Operator in SV with Example:
////////////////////////////////////////////////////////////////
- The scope resolution operator is used to refer a static class member without its handle.
- Symbol of scope resolution operator –  ::
- Syntax     <class_name>::<class member>
- Left hand side of the scope resolution operator :: should be a class type name, package name, covergroup type name, coverpoint or cross name, typedef name. 
- The right hand side of the operator should be an identifier like a variable or method name.  

/////////////////////////////////////////////////////////////////
   Scope Resolution operator wide uses :
////////////////////////////////////////////////////////////////    
   1. Defining extern function
   2. Accessing static methods and functions
   3. Using package
   4. Avoid namespace collision    
     
- The scope resolution operator provides:
- Access to static members (methods and class properties), enumerations, type declaration from outside the class hierarchy.
- The derived classes can access public or protected class members of their base class.
- Access to type declarations and enumeration named constants declared inside the class from outside the class hierarchy or from within derived classes.
- Accessing automatic class members (class properties and methods) has an illegal scope of access.
- Also, scope resolution operator can be used to access package members.  
- Classes and other scopes can have same identifier names and may create a namespace collision if referred to without specifying the scope. The scope resolution operator :: uniquely identifies a member or parameter of a given class.
- They are also used to access static variables and methods, parameters and local parameters of a class from outside the class. 
- It also allows access to public and protected members of a base class from within the derived class.

//////////////////////////////////////////////////////////////////////////////////////////////
  Example1: Acessing static properties and statice methods using Scope Resolution Operator
/////////////////////////////////////////////////////////////////////////////////////////////  
//Example1: Acessing static properties and static methods using Scope Resolution Operator 
class packet_trans;
  bit [31:0] data;
  static int id;
  
  static function disp(int id);
    $display("PRINTING_FROM_STATIC_FUNC: Value of id = %0h", id);
  endfunction
  
  function auto_disp(int id);
    $display("PRINTING_FROM_NONSTATIC_FUNC:Value of id = %0h", id);
  endfunction
endclass : packet_trans

module class_example1;
  initial begin
    packet_trans::id = 5;
    packet_trans::disp(packet_trans::id);
    
    //packet_trans::data = 2; // illegal
    //packet_trans::auto_disp(packet_trans::id); // illegal
  end
endmodule :class_example1  

//Logfile Output
Contains Synopsys proprietary information.
Compiler version X-2025.06-SP1_Full64; Runtime version X-2025.06-SP1_Full64;  Mar  7 09:14 2026
PRINTING_FROM_STATIC_FUNC: Value of id = 5
           V C S   S i m u l a t i o n   R e p o r t  
  
///////////////////////////////////////////////////////////////////////////////////////////////////
  Example2: Acessing NON static properties and NON static methods using Scope Resolution Operator
//////////////////////////////////////////////////////////////////////////////////////////////////
//Example2: Acessing NON static properties and NON static methods using Scope Resolution Operator 
class packet_trans;
  bit [31:0] data; //Non Static Properties
  int id;          //Non Static Properties
  
  function auto_disp1(int id);   //Non Static Method
    $display("PRINTING_FROM_NONSTATIC_FUNC: Value of id = %0h", id);
  endfunction
  
  function auto_disp2(int id);  //Non Static Method
    $display("PRINTING_FROM_NONSTATIC_FUNC:Value of id = %0h", id);
  endfunction
endclass : packet_trans

module class_example2;
  initial begin
    packet_trans::id = 5; //illegal
    packet_trans::auto_disp1(packet_trans::id); //illegal
    
    packet_trans::data = 2; // illegal
    packet_trans::auto_disp2(packet_trans::id); // illegal
  end
endmodule :class_example2
  
//Logfile Output
Error-[ISRF] Illegal scoped reference found
testbench.sv, 19
"packet_trans::auto_disp1"
  Scoped reference to non-static class task/function 
  'packet_trans::auto_disp1' is not allowed.
    
Error-[ISRF] Illegal scoped reference found
testbench.sv, 22
"packet_trans::auto_disp2"
  Scoped reference to non-static class task/function 
  'packet_trans::auto_disp2' is not allowed.

2 errors
CPU time: .690 seconds to compile
Exit code expected: 0, received: 255
Done    
    
///////////////////////////////////////////////////////////////////////////////////////////////////
  Example3: Scope Resolution operator uses- with extern function
//////////////////////////////////////////////////////////////////////////////////////////////////
class packet_class;
  rand bit [3:0] data;  
  extern function display ();   //Decleration of function inside the class , but Definition outside the class  
endclass : packet_class
        
function packet_class::display();
  $display ("The value of data is =%0d",data);      
endfunction :display
        
module tb_top;  
  initial begin
    packet_class pkt;
    pkt=new();
    
    for (int i=0;i<10;i++) begin
      pkt.randomize();
      pkt.display();
    end
  end         
endmodule :tb_top
    
//Logfile Output
    
The value of data is =9
The value of data is =11
The value of data is =10
The value of data is =7
The value of data is =0
The value of data is =3
The value of data is =10
The value of data is =3
The value of data is =0
The value of data is =9
           V C S   S i m u l a t i o n   R e p o r t     
    
///////////////////////////////////////////////////////////////////////////////////////////////////
  Example4: Scope Resolution operator uses- Accessing static methods and functions
//////////////////////////////////////////////////////////////////////////////////////////////////  
class packet_class;  
  static rand bit [3:0] data;    
  static function display();  
    $display ("The value of data is =%0d",data);    
  endfunction :display  
endclass :packet_class 
    
module tb_top;  
  initial begin
    packet_class pkt;   
    pkt=new();        
    for(int i=0;i<10;i++) begin
      packet_class::data= pkt.randomize();
      packet_class::display();
    end       
  end          
endmodule :tb_top
    
//Logfile Outut
    
The value of data is =1
The value of data is =1
The value of data is =1
The value of data is =1
The value of data is =1
The value of data is =1
The value of data is =1
The value of data is =1
The value of data is =1
The value of data is =1
           V C S   S i m u l a t i o n   R e p o r t     

///////////////////////////////////////////////////////////////////////////////////////////////////
  Example5: Scope Resolution operator uses- Using in package
//////////////////////////////////////////////////////////////////////////////////////////////////    
package my_pkg;
  typedef enum bit {FALSE,TRUE} e_bool;
endpackage :my_pkg

module tb_top;
  bit val;  
  initial begin
    val=my_pkg::TRUE;
    $display("val=0x%0h",val);      
  end   
endmodule :tb_top

//Logfile Output
val=0x1
           V C S   S i m u l a t i o n   R e p o r t     
    
