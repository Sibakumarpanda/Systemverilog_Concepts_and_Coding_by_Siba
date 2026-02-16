/////////////////////////////////
   Deep copy in SystemVerilog :
/////////////////////////////////  
- Unlike shallow copy, full or deep copy performs a complete copy of an object.
- The deep copy is the same as shallow copy except nested created objects are also copied by writing a custom method. 
- Syntax :
    transaction tr1;
    tr1=new()
    transaction tr2;
    tr2=new()
    tr2.deep_copy(tr1);

//Example-1
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
  
  function deep_copy(transaction tr);
    this.data = tr.data;
    this.id = tr.id;
    this.err_tr.err_data = tr.err_tr.err_data;
    this.err_tr.error = tr.err_tr.error;
  endfunction
endclass :transaction

module deep_copy_example1;
  transaction tr1, tr2;
  
  initial begin
    tr1 = new();
    $display("Calling display method using tr1");
    tr1.display();
    
    tr2 = new();
    tr2.deep_copy(tr1);
    $display("After deep copy tr1 --> tr2");
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
endmodule :deep_copy_example1

//Logfile Output
Chronologic VCS simulator copyright 1991-2025
Contains Synopsys proprietary information.
Compiler version X-2025.06-SP1_Full64; Runtime version X-2025.06-SP1_Full64;  Feb 16 07:47 2026
Calling display method using tr1
transaction: data = 100, id = 1
error_trans: err_data = ffffffff, error = 1

After deep copy tr1 --> tr2
Calling display method using tr2
transaction: data = 100, id = 1
error_trans: err_data = ffffffff, error = 1

--------------------------------
Calling display method using tr1
transaction: data = 200, id = 2
error_trans: err_data = 1234, error = 0

Calling display method using tr2
transaction: data = 100, id = 1
error_trans: err_data = ffffffff, error = 1

           V C S   S i m u l a t i o n   R e p o r t 
