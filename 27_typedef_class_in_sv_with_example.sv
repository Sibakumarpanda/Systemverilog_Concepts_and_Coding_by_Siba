////////////////////////////////
   typedef Class in SV
/////////////////////////////////
-In certain cases, the class handle of another class is required even if it is not declared yet. In such cases, SystemVerilog provides a forward declaration of the class using the typedef keyword.
-Syntax:  typedef class <class_name>

//////////////////////////////////////////////////////////////
   Example1: typedef Class in SV - Without typedef keyword
//////////////////////////////////////////////////////////////
//In the example, the tr_B class object is created inside the transaction_A class even though the transaction_B class definition is unknown. 
//So, the compilation error is expected.
class transaction_A;
  bit [31:0] data;
  int id;
  transaction_B tr_B = new();
      
  function void display();
    $display("transaction_A: data = %0d and id = %0d", data, id);
    $display("transaction_B: addr = %0d", tr_B.addr);
  endfunction
endclass :transaction_A

class transaction_B;
  bit [31:0] addr = 200;
endclass :transaction_B

module class_example1;
  transaction_A tr_A;
  
  initial begin
    tr_A = new();
   
    tr_A.data = 100;
    tr_A.id = 1;
    tr_A.display();
  end
endmodule :class_example1
   
//Logfile Output
Error-[SE] Syntax error
  Following verilog source has syntax error :
  "testbench.sv", 9: token is '='
    transaction_B tr_B = new();
                        ^
1 error   
///////////////////////////////////////////////////////////
   Example2: 
///////////////////////////////////////////////////////////      
   
