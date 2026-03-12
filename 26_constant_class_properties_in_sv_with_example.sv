//////////////////////////////////////
   Constant class properties in SV:
/////////////////////////////////////  
-To make class properties read-only, a const specifier is used. Since class objects are dynamic in nature, SystemVerilog provides two types of constants
-Global constants ,Instance constants
-In both types, class properties have to specify with the const keyword.
-The class methods can not use a const specifier.
-Global constants: During variable declaration, an initial value is assigned, such class properties known as global constants. The value of a variable can not be changed after the declaration of the variable.
-Instance constants:During variable declaration, an initial value is not assigned, such class properties are known as instance constants. An instance constant allows a user to assign value in run time only once in the class constructor.

////////////////////////////////////////////////////////////////
 Example1 : Constant class properties in SV -Global constants
////////////////////////////////////////////////////////////////
//During variable declaration, an initial value is assigned, such class properties known as global constants. The value of a variable can not be changed after the declaration of the variable.
class pkt_trans;
  bit [31:0] data;
  const int id = 1;
  
  function void display();
    $display("data = %0d and id = %0d", data, id);
  endfunction
endclass :pkt_trans

module class_example1;
  pkt_trans tr;
  
  initial begin
    tr = new();
    tr.data = 100;
    //tr.id = 2;    // If we will try to change here id value , then we will get below error 
                    // Error-[IUCV] Invalid use of 'const'.
    tr.display();
  end
endmodule :class_example1   

//Logfile output
Contains Synopsys proprietary information.
Compiler version X-2025.06-SP1_Full64; Runtime version X-2025.06-SP1_Full64;  Mar 12 09:42 2026
data = 100 and id = 1
           V C S   S i m u l a t i o n   R e p o r t     
   
////////////////////////////////////////////////////////////////
 Example2 : Constant class properties in SV -Instant constants
////////////////////////////////////////////////////////////////
//During variable declaration, an initial value is not assigned, such class properties are known as instance constants. 
//An instance constant allows a user to assign value in run time only once in the class constructor.
class pkt_trans;
  bit [31:0] data;
  const int id;
  
  function new();
    data = 100;
    id = 1;             // run time assignment only once
  endfunction
  
  function void display();
    $display("data = %0d and id = %0d", data, id);
  endfunction
endclass :pkt_trans

module class_example2;
  pkt_trans tr;
  
  initial begin
    tr = new();
    tr.data = 200;
    //tr.id = 2; // Invalid const usage
    tr.display();
  end
endmodule :class_example2

//Logfile Output
Contains Synopsys proprietary information.
Compiler version X-2025.06-SP1_Full64; Runtime version X-2025.06-SP1_Full64;  Mar 12 09:42 2026
data = 200 and id = 1
           V C S   S i m u l a t i o n   R e p o r t    
   
