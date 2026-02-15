///////////////////////////////////////
   Shallow copy in SystemVerilog :
///////////////////////////////////////
The shallow copy is used to copy:
-Class properties like integers, strings, instance handle, etc
-Nested objects are not copied, only instance handles are copied which means any changes are done in ‘nested copied object’ will also reflect in the ‘nested original object’ or vice-versa.
-The new() method is used for copying.
-Syntax:
       transaction tr1, tr2;
       tr1 = new();
       tr2 = new tr1;
-Here , tr2 = new tr1 will create a new object tr2 which is a copy of the tr1 object.

//Example1:
class error_trans;
  bit [31:0] err_data;
  bit error;
  
  function new(bit [31:0] err_data, bit error);
    this.err_data = err_data;
    this.error = error;
  endfunction
  
endclass :error_trans

class transaction;
  bit [31:0] data;
  int id;
  error_trans err_tr;
  
  function new();
    data = 100;
    id = 1;
    err_tr = new(32'hFFFF_FFFF, 1);
  endfunction
  
  function void display();
    $display("transaction: data = %0d, id = %0d", data, id);
    $display("error_trans: err_data = %0h, error = %0d\n", err_tr.err_data, err_tr.error);
  endfunction
  
endclass :transaction

module shallow_copy_example1;
  transaction tr1, tr2;
  
  initial begin
    tr1 = new();
    $display("Calling display method using tr1");
    tr1.display();
    
    tr2 = new tr1;
    $display("After shallow copy tr1 --> tr2");
    $display("Calling display method using tr2");
    tr2.display();
    $display("--------------------------------");
    
    tr1.data = 200;
    tr1.id = 2;
    tr1.err_tr.err_data = 32'h1234;
    tr1.err_tr.error = 0;
    
    $display("Calling display method using tr1");
    tr1.display();
    $display("Calling display method using tr2");
    tr2.display();
    
  end
endmodule :shallow_copy_example1

//Logfile Output

Chronologic VCS simulator copyright 1991-2025
Contains Synopsys proprietary information.
Compiler version X-2025.06-SP1_Full64; Runtime version X-2025.06-SP1_Full64;  Feb 15 04:41 2026
Calling display method using tr1
transaction: data = 100, id = 1
error_trans: err_data = ffffffff, error = 1

After shallow copy tr1 --> tr2
Calling display method using tr2
transaction: data = 100, id = 1
error_trans: err_data = ffffffff, error = 1

--------------------------------
Calling display method using tr1
transaction: data = 200, id = 2
error_trans: err_data = 1234, error = 0

Calling display method using tr2
transaction: data = 100, id = 1
error_trans: err_data = 1234, error = 0

           V C S   S i m u l a t i o n   R e p o r t 

NOTE:
- Here, error data is defined as ‘hFFFF_FFFF and the error bit is also set to 1. For any other value of err_data, the error bit is set to 0.
- Notice that , The data and id class properties are copied. The tr1 and tr2 class handles refer to separate memory locations. Thus, changing values using the tr1 class handle does not affect accessing class properties with the tr2 handle.
- The err_tr object handle is copied alone. On changing err_data = 32’h1234 and error = 0 using tr1 class handle, the same is accessible using tr2 class handle.
- To have separate memory for nested objects, deep copy provides a solution.
