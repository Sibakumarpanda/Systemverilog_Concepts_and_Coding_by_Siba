///////////////////////////////////
   Static methods in SV classes :
//////////////////////////////////
Static Methods (static functions and static tasks)
- Static methods are the same as static variables that also follow class access rules and scope.
- Static functions and tasks can not be virtual
- They can access only static properties (static members) of a class. 
- Accessing non-static members leads to compilation errors as it is illegal to use. But non-static functions or tasks can access static variables.
- Both static methods and static members in a class can be accessed without creating an object.
- Summary :
   Method         variable           Comment
   ------------------------------------------
   Static         Non-static         Compilation Error(Illegal to use)
   Non-static     Static             Allowed
   static         static             Allowed
   Non static     Non-static         Allowed

//Example-1 : Static Methods examples (with object creation )  
class transaction;
  int id;
  static int s_id;
   
  function void incr_id(); // Non-static function
    s_id++;
    id++;
  endfunction
  
  static function void incr_s_id(); // Static function
    s_id++;
    //id++; // illegal access
  endfunction
  
endclass :transaction

module class_example1;
  transaction tr[5], tr_new;
  
  initial begin
    foreach (tr[i]) begin 
      tr[i] = new();
      tr[i].incr_s_id();
      $display("On calling incr_s_id: Value of s_id = %0h, id = %0h", tr[i].s_id, tr[i].id);
    end
    tr[0].s_id = 0; // s_id value reset to 0
    $display("***************************************************************************");
    
    foreach (tr[i]) begin 
      tr[i].incr_id();
      $display("On calling incr_id: Value of s_id = %0h, id = %0h", tr[i].s_id, tr[i].id);
    end
  end
endmodule :class_example1

//Logfile Output
Chronologic VCS simulator copyright 1991-2025
Contains Synopsys proprietary information.
Compiler version X-2025.06-SP1_Full64; Runtime version X-2025.06-SP1_Full64;  Feb  9 21:08 2026
On calling incr_s_id: Value of s_id = 1, id = 0
On calling incr_s_id: Value of s_id = 2, id = 0
On calling incr_s_id: Value of s_id = 3, id = 0
On calling incr_s_id: Value of s_id = 4, id = 0
On calling incr_s_id: Value of s_id = 5, id = 0
***************************************************************************
On calling incr_id: Value of s_id = 1, id = 1
On calling incr_id: Value of s_id = 2, id = 1
On calling incr_id: Value of s_id = 3, id = 1
On calling incr_id: Value of s_id = 4, id = 1
On calling incr_id: Value of s_id = 5, id = 1
           V C S   S i m u l a t i o n   R e p o r t    
      
//Example-2 : Static Methods examples (with object creation ) - Method : Static ,Variable: Non-static 
//Uses of Static Methods , Non-static Variable
   
class transaction; 
  int id;
  
  static function void incr_s_id(); // Static function
    id++; // illegal access
  endfunction
  
endclass :transaction

module class_example2;
  transaction tr[10];
  
  initial begin
    foreach (tr[i]) begin 
      tr[i] = new();
      tr[i].incr_s_id();
      $display("On calling incr_s_id: Value of id = %0h ", tr[i].id);
    end
  end
endmodule :class_example2 
   
//Logfile Output
Parsing design file 'design.sv'
Parsing design file 'testbench.sv'
Top Level Modules:
       class_example2
TimeScale is 1 ns / 1 ns

Error-[SV-AMC] Non-static member access
testbench.sv, 7
$unit, "id"
  Illegal access of non-static member 'id' from static method 
  'transaction::incr_s_id'.

1 error
CPU time: .313 seconds to compile   

//Example-3 : Static Methods examples (with object creation ) - Method : Non Static ,Variable: static   


//Example-4 : Static Methods examples (with object creation ) - Method : Static ,Variable: static 
   

//Example-5 : Static Methods examples (with object creation ) - Method : Non Static ,Variable: non static   
