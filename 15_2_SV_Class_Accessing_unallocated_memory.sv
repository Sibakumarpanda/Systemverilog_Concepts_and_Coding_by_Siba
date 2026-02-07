//////////////////////////////////
  Accessing unallocated memory :
///////////////////////////////////
- Many times a user experiences a null pointer dereference (or null object access) error during the simulation. What does it mean ???
- By default, the class handle points to no memory location which is commonly called null. 
- When the user tries to access a memory that does not exist, a null pointer dereference is expected.
- Note: null is not a string. So, a comparison with “null” will give a compilation error.
  
//Example1- Accessing unallocated memory Example
- Let’s understand with the below example:
- tr1 and tr2 are two handles of the same class. Out of them, memory is allocated for tr1 (i.e. object tr1 is created).
  
class transaction;
  bit [31:0] data;
  int id;
endclass :transaction

module class_example1;
  transaction tr1, tr2;
  initial begin
    tr1 = new();
    tr1.data = 5;
    tr1.id = 1;
    $display("Object pkt1.data = %0h, pkt1.id = %0h", tr1.data, tr1.id);
    
    tr2.data = 10;
    tr2.id = 2;
    $display("Object pkt2.data = %0h, id = %0h", tr2.data, tr2.id);
  end
endmodule :class_example1
  
//Logfile Ouput
Object pkt1.data = 5, pkt1.id = 1
*E,TRNULLID: NULL pointer dereference.
          File: ./testbench.sv, line = 16, pos = 6
         Scope: class_example
          Time: 0 FS + 0
./testbench.sv:16     tr2.data = 10;  
  
//Example2- Check for null memory access
- Premature termination of code can also be avoided by checking whether the handle is null or not.
  
class transaction;
  bit [31:0] data;
  int id;
endclass :transaction

module class_example2;
  transaction tr1, tr2;
  initial begin
    tr1 = new();
    if(tr1 != null) begin  // string "null" is not expected
      tr1.data = 5;
      tr1.id = 1;
      $display("Object tr1.data = %0h, tr1.id = %0h", tr1.data, tr1.id);
    end
    else $display("tr1 object is not created");
    
    if(tr2 != null) begin
      tr2.data = 10;
      tr2.id = 2;
      $display("Object tr2.data = %0h, tr2.id = %0h", tr2.data, tr2.id);
    end
    else $display("tr2 object is not created");   
  end
endmodule  :class_example2

//Logfile Output
Object tr1.data = 5, tr1.id = 1
tr2 object is not created  
