/////////////////////////////////////////////
   Extern method in Classes with example
/////////////////////////////////////////////
- An extern method provides a facility for class methods to define them outside of the class body.
- If the method definition is lengthy (many lines of code inside a method), the extern method provides better readability and cleaner implementation of the class.
- An extern keyword is used for method declaration and a class name with a scope resolution operator is used for method definition.
- Method definition and declaration should have the same number of argument lists, data types, and argument names.
- For the extern function return type should be the same if used.

///////////////////////////////////////////////////////
   Example1:  Extern method in Classes, basic example
//////////////////////////////////////////////////////
//The following example has both extern function and extern task implemented.
class pkt_trans;
  bit [31:0] data;
  int id;

  extern function void display();
  extern task delay();
endclass :pkt_trans

function void pkt_trans::display();
  $display("data = %0d and id = %0d", data, id);
endfunction :display
    
task pkt_trans::delay();
  #50;
  $display("Time = %0.0t, delayed data = %0d", $time, data);
endtask :delay

module class_example1;
  pkt_trans tr;
  
  initial begin
    tr = new();
   
    tr.data = 100;
    tr.id = 1;
    
    tr.display();
    tr.delay();
  end
endmodule :class_example1 
     
//Logfile Output
Contains Synopsys proprietary information.
Compiler version X-2025.06-SP1_Full64; Runtime version X-2025.06-SP1_Full64;  Mar  7 21:49 2026
data = 100 and id = 1
Time = 50, delayed data = 100
           V C S   S i m u l a t i o n   R e p o r t      
