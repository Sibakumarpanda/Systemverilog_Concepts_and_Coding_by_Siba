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
//Uses of Non Static Methods , static Variable

class transaction;
  static int s_id;
   
  function void incr_id(); // Non-static function
    s_id++;
  endfunction
  
endclass :transaction

module class_example3;
  transaction tr[10];
  
  initial begin  
    foreach (tr[i]) begin 
      tr[i] = new();
      tr[i].incr_id();
      $display("On calling incr_id: Value of s_id = %0h", tr[i].s_id);
    end
  end
endmodule :class_example3
   
//Logfile Output
Contains Synopsys proprietary information.
Compiler version X-2025.06-SP1_Full64; Runtime version X-2025.06-SP1_Full64;  Feb  9 21:42 2026
On calling incr_id: Value of s_id = 1
On calling incr_id: Value of s_id = 2
On calling incr_id: Value of s_id = 3
On calling incr_id: Value of s_id = 4
On calling incr_id: Value of s_id = 5
On calling incr_id: Value of s_id = 6
On calling incr_id: Value of s_id = 7
On calling incr_id: Value of s_id = 8
On calling incr_id: Value of s_id = 9
On calling incr_id: Value of s_id = a
           V C S   S i m u l a t i o n   R e p o r t    

//Example-4 : Static Methods examples (with object creation ) - Method : Static ,Variable: static 
//Uses of Static Methods , static Variable
   
class transaction;
  static int s_id;
  
  static function void incr_s_id(); // Static function
    s_id++;
  endfunction  
endclass :transaction

module class_example4;
  transaction tr[10];
  
  initial begin
    foreach (tr[i]) begin 
      tr[i] = new();
      tr[i].incr_s_id();
      $display("On calling incr_s_id: Value of s_id = %0h", tr[i].s_id);
    end
    $display("***************************************************************************");    
  end
endmodule :class_example4   
   
//Logfile Output
Contains Synopsys proprietary information.
Compiler version X-2025.06-SP1_Full64; Runtime version X-2025.06-SP1_Full64;  Feb  9 21:42 2026
On calling incr_s_id: Value of s_id = 1
On calling incr_s_id: Value of s_id = 2
On calling incr_s_id: Value of s_id = 3
On calling incr_s_id: Value of s_id = 4
On calling incr_s_id: Value of s_id = 5
On calling incr_s_id: Value of s_id = 6
On calling incr_s_id: Value of s_id = 7
On calling incr_s_id: Value of s_id = 8
On calling incr_s_id: Value of s_id = 9
On calling incr_s_id: Value of s_id = a
***************************************************************************
           V C S   S i m u l a t i o n   R e p o r t    

//Example-5 : Static Methods examples (with object creation ) - Method : Non Static ,Variable: non static 
//Uses of Non Static Method ,Non static variable
   
class transaction;
  int id;   
  function void incr_id(); // Non-static function
    id++;
  endfunction  
endclass :transaction

module class_example5;
  transaction tr[10];
  
  initial begin    
    foreach (tr[i]) begin 
      tr[i] = new();
      tr[i].incr_id();
      $display("On calling incr_id: Value of id = %0h", tr[i].id);
    end
  end
endmodule :class_example5

//Logfile Output
Contains Synopsys proprietary information.
Compiler version X-2025.06-SP1_Full64; Runtime version X-2025.06-SP1_Full64;  Feb  9 21:42 2026
On calling incr_id: Value of id = 1
On calling incr_id: Value of id = 1
On calling incr_id: Value of id = 1
On calling incr_id: Value of id = 1
On calling incr_id: Value of id = 1
On calling incr_id: Value of id = 1
On calling incr_id: Value of id = 1
On calling incr_id: Value of id = 1
On calling incr_id: Value of id = 1
On calling incr_id: Value of id = 1
           V C S   S i m u l a t i o n   R e p o r t    
   
//Example-6 : Static Methods examples (with out object creation ) - Method : Static ,Variable: static 
//Uses of Static Methods , static Variable (without object creation )
class transaction;
  static int s_id;  
  static function void incr_s_id(); // Static function
    s_id++;
  endfunction  
endclass :transaction

module class_example6;
  transaction tr[5];  
  initial begin
    foreach (tr[i]) begin 
      $display("Before the incr_s_id function call");
      transaction::incr_s_id(); // Access static function without class handle
      $display("Value of s_id = %0h using scope resolution operator", transaction::s_id);
      $display("**********************************************************************");
      tr[i].incr_s_id(); // Access static function with class handle
      $display("Value of s_id = %0h using tr handle", tr[i].s_id);           
    end        
  end
endmodule :class_example6

//Logfile  Output
   
Chronologic VCS simulator copyright 1991-2025
Contains Synopsys proprietary information.
Compiler version X-2025.06-SP1_Full64; Runtime version X-2025.06-SP1_Full64;  Feb 10 20:28 2026
Before the incr_s_id function call
Value of s_id = 1 using scope resolution operator
**********************************************************************
Value of s_id = 2 using tr handle
Before the incr_s_id function call
Value of s_id = 3 using scope resolution operator
**********************************************************************
Value of s_id = 4 using tr handle
Before the incr_s_id function call
Value of s_id = 5 using scope resolution operator
**********************************************************************
Value of s_id = 6 using tr handle
Before the incr_s_id function call
Value of s_id = 7 using scope resolution operator
**********************************************************************
Value of s_id = 8 using tr handle
Before the incr_s_id function call
Value of s_id = 9 using scope resolution operator
**********************************************************************
Value of s_id = a using tr handle
           V C S   S i m u l a t i o n   R e p o r t    

//Example-7 : Static Methods examples (with out object creation ) - Method : Static ,Variable: Non static 
//Uses of Static Methods , Non static Variable (without object creation )

class transaction;
  int id;
  
  static function void incr_s_id(); // Static function
    id++;
  endfunction
  
endclass :transaction

module class_example7;
  transaction tr[5];
  
  initial begin
    foreach (tr[i]) begin 
      $display("Before the incr_s_id function call");
      transaction::incr_s_id(); // Access static function without class handle
      $display("Value of id = %0h using scope resolution operator", transaction::id);
      $display("**********************************************************************");
      tr[i].incr_s_id(); // Access static function with class handle
      $display("Value of id = %0h using tr handle", tr[i].id);           
    end    
    
  end
endmodule :class_example7
   
//Logfile Output
Top Level Modules:
       class_example7
TimeScale is 1 ns / 1 ns

Error-[SV-AMC] Non-static member access
testbench.sv, 7
$unit, "id"
  Illegal access of non-static member 'id' from static method 
  'transaction::incr_s_id'.

Error-[SV-IRTAV] Illegal reference to automatic variable
testbench.sv, 19
"$unit::transaction::id"
  Hierarchical reference to automatic variable 'id' is not legal.
  Declared at:
  "testbench.sv", 4

2 errors
CPU time: .355 seconds to compile
Exit code expected: 0, received: 255
Done   
   
//Example-8 : Static Methods examples (with out object creation ) - Method : Non Static ,Variable: static 
//Uses of Non Static Methods , static Variable (without object creation )
class transaction;
  static int s_id;
  
  function void incr_id(); // Non Static function
    s_id++;
  endfunction
  
endclass :transaction

module class_example8;
  transaction tr[5];
  
  initial begin
    foreach (tr[i]) begin 
      $display("Before the incr_id function call");
      transaction::incr_id(); // Access Non static function without class handle
      $display("Value of s_id = %0h using scope resolution operator", transaction::s_id);
      $display("**********************************************************************");
      tr[i].incr_id(); // Access Non static function with class handle
      $display("Value of id = %0h using tr handle", tr[i].s_id);           
    end    
    
  end
endmodule :class_example8
   
//Logfile Output
Top Level Modules:
       class_example8
TimeScale is 1 ns / 1 ns

Error-[ISRF] Illegal scoped reference found
testbench.sv, 17
"transaction::incr_id"
  Scoped reference to non-static class task/function 'transaction::incr_id' is
  not allowed.

1 error
CPU time: .357 seconds to compile
Exit code expected: 0, received: 255   

//Example-9 : Static Methods examples (with out object creation ) - Method : Non Static ,Variable: Non static    
//Uses of Non Static Methods , Non static Variable (without object creation )
class transaction;
  int id;  
  function void incr_id(); // Non Static function
    id++;
  endfunction  
endclass :transaction

module class_example8;
  transaction tr[5];
  
  initial begin
    foreach (tr[i]) begin 
      $display("Before the incr_id function call");
      transaction::incr_id(); // Access Non static function without class handle
      $display("Value of id = %0h using scope resolution operator", transaction::id);
      $display("**********************************************************************");
      tr[i].incr_id(); // Access Non static function with class handle
      $display("Value of id = %0h using tr handle", tr[i].id);           
    end    
    
  end
endmodule :class_example8

//Logfile Output     
Parsing design file 'design.sv'
Parsing design file 'testbench.sv'
Top Level Modules:
       class_example8
TimeScale is 1 ns / 1 ns

Error-[ISRF] Illegal scoped reference found
testbench.sv, 17
"transaction::incr_id"
  Scoped reference to non-static class task/function 'transaction::incr_id' is
  not allowed.
1 error
CPU time: .455 seconds to compile
Exit code expected: 0, received: 255     

////////////////////////////////////////////////////////////////////////////
  Concept of function static /task static (method static) in SV classes :
/////////////////////////////////////////////////////////////////////////////
        
- First of all , function static / task static method call is different from static function/static task as we discussed in above.
- It is now clear that non-static class members/variables can not be accessible from the static method. 
- What if the user wants to access automatic (non-static) members of the class ???
- It is possible to use the “function static” method call. This is also known as a non-static method call with a static variable lifetime. On calling “function static”, variables declared in function will be static.
- Note:
// static function
   static function void incr_s_id();
   ...
   endfunction
// Non-static function and variables declared in function will be static.
   function static int incr_id();
   ...
   endfunction

//Example-1 : Uses of function static or task static method call
   
class transaction;
  static int s_id;
  int id;
  
  function static int incr_id(); // Non-static function
    int status;                 // Behaves as a static variable.
    status = s_id++;
    id++;                      // non-static member is accessible
    return status;
  endfunction
  
endclass :transaction

module class_example1;
  transaction tr[5];
  int local_status;

  initial begin
    foreach (tr[i]) begin 
      tr[i] = new();
      local_status = tr[i].incr_id();
      $display("Value of s_id = %0h, id = %0h, local_status = %0h", tr[i].s_id, tr[i].id,  local_status);
    end
  end
endmodule :class_example1  
   
//Logfile Output
CPU time: .515 seconds to compile + .399 seconds to elab + .434 seconds to link
Chronologic VCS simulator copyright 1991-2025
Contains Synopsys proprietary information.
Compiler version X-2025.06-SP1_Full64; Runtime version X-2025.06-SP1_Full64;  Feb 10 21:15 2026
Value of s_id = 1, id = 1, local_status = 0
Value of s_id = 2, id = 1, local_status = 1
Value of s_id = 3, id = 1, local_status = 2
Value of s_id = 4, id = 1, local_status = 3
Value of s_id = 5, id = 1, local_status = 4
           V C S   S i m u l a t i o n   R e p o r t    

//Example-2  : Uses of function static or task static method call
class transaction; 
  int id;
  
  /* 
  static function void incr_s_id(); // Static function
    id++; // illegal access , But Still wanted to acess and see what error is coming
  endfunction
  */
  
  function static int incr_s_id(); // function static
    id++;                          // Inside function static , we can acess Non static variable
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
Chronologic VCS simulator copyright 1991-2025
Contains Synopsys proprietary information.
Compiler version X-2025.06-SP1_Full64; Runtime version X-2025.06-SP1_Full64;  Feb 10 21:19 2026
On calling incr_s_id: Value of id = 1 
On calling incr_s_id: Value of id = 1 
On calling incr_s_id: Value of id = 1 
On calling incr_s_id: Value of id = 1 
On calling incr_s_id: Value of id = 1 
On calling incr_s_id: Value of id = 1 
On calling incr_s_id: Value of id = 1 
On calling incr_s_id: Value of id = 1 
On calling incr_s_id: Value of id = 1 
On calling incr_s_id: Value of id = 1 
           V C S   S i m u l a t i o n   R e p o r t    
