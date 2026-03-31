/////////////////////////////////////////////
 System verilog DPI Concept with Example
/////////////////////////////////////////////
-Direct Programming Interface (DPI) allows users to establish communication between foreign languages and SystemVerilog. 
-It has two separate layers as a foreign language layer and a SystemVerilog layer which are completely isolated.
-DPI allows having a heterogeneous system that connects and efficiently connects existing code written in other languages.
-DPI also allows calling functions and tasks from other languages or vice-versa using import/ export methods.
-These methods can communicate with the help of arguments and return value.

////////////////////////////////
   Import method with example 
////////////////////////////////
- SystemVerilog can call functions or tasks (methods) implemented in a foreign language, such methods are called import methods
- Syntax: import “DPI-C” function <return_type> <function_name> (<arguments if any>) 
 
 C file:
 #include <stdio.h>
  void addition(int a, int b) {
  printf("Addition of %0d and %0d is %0d\n", a, b, a+b);
}
 
SV file:
module tb;
  import "DPI-C" function void addition(int a, int b); 
  initial
  begin
    $display("Before add function call");
    addition(4,5);
    $display("After add function call");
  end 
endmodule
                                                                 
//Logfile Output
Before add function call
Addition of 4 and 5 is 9
After add function call                                                                 

/////////////////////////////////
  Export method with example 
////////////////////////////////
-A foreign language can call functions or tasks (methods) implemented in SystemVerilog, such methods are called export methods
-Syntax: export "DPI-C" function <function_name> 

C file:

#include <stdio.h>
//#include <svdpi.h>
extern void addition(int, int);

void c_caller() {
  printf("Calling addition function from c_caller\n");
  addition(4, 5);
}
 
SV file:
 
module tb;
  export "DPI-C" function addition; // This is not a function prototype
  import "DPI-C" context function void c_caller();  
  function void addition(int a, b);
    $display("Addition of %0d and %0d is %0d\n", a, b, a+b);
  endfunction
    
  initial
  begin
    c_caller();
  end
endmodule 

//Logfile Output
Calling addition function from c_caller
Addition of 4 and 5 is 9 
