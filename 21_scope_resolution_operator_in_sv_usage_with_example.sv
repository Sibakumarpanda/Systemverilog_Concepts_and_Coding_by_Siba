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
