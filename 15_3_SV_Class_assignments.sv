////////////////////////////////////////////
  Class Assignment in SystemVerilog :
///////////////////////////////////////////
Multiple handles for the same object example:
- In the below example, memory is created for object tr1. 
- Class handle tr2 can also point to the same object using a simple assignment operator.  After the assignment, anyone tr1 or tr2 handle can change the ‘data’ value.

//Example1:
class transaction;
  bit [31:0] data;
endclass :transaction

module class_example1;
  transaction tr1, tr2;
  initial begin
    tr1 = new();
    tr1.data = 5;
    tr2 = tr1;
    $display("tr1.data = %0h", tr1.data);
    $display("tr2.data = %0h", tr2.data);
    
    tr2.data = 10;
    $display("tr1.data = %0h", tr1.data);
    $display("tr2.data = %0h", tr2.data);
  end
endmodule :class_example1

//Logfile Output
tr1.data = 5
tr2.data = 5
tr1.data = a
tr2.data = a
