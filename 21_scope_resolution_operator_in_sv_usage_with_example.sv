/////////////////////////////////////////////////////////////////
  Scope Resolution Operator in SV with Example:
////////////////////////////////////////////////////////////////
- The scope resolution operator is used to refer a static class member without its handle.
- Symbol of scope resolution operator –  ::
- Syntax
  <class_name>::<class member>
- The scope resolution operator provides:
- Access to static members (methods and class properties), enumerations, type declaration from outside the class hierarchy.
- The derived classes can access public or protected class members of their base class.
- Access to type declarations and enumeration named constants declared inside the class from outside the class hierarchy or from within derived classes.
- Accessing automatic class members (class properties and methods) has an illegal scope of access.
- Also, scope resolution operator can be used to access package members.  

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
