/////////////////////////////////////////////
  Static properties in System verilog class :
//////////////////////////////////////////////  
- A static keyword is used in a class member to denote class has static properties or static methods.
  
Static Properties (static variables) :
- The static variable declared inside a class with static keyword shares a single memory location across all class instances.
- Synatx: static <data type> <variable name> 
- NOTE: For unique value as per requirement, a user should use a static keyword in such a scenario.  

//Example1 - Example with Non static and Static Static variable uses
- In the below example, we will have two variables “static int s_id” (static variable) and “int id” (non-static variable). 
- There are 5 instances of a class that has been created and both variables are incremented by 1 in the constructor method of a class. 
- The intention is to have a unique id for each class instance.  

class transaction;
  int id;
  static int s_id;
  automatic int a_id;
  
  function new ();
    s_id++;
    id++;
    a_id++;
  endfunction
endclass :transaction

module class_example1;
  transaction tr[5];
  initial begin
    foreach (tr[i]) begin 
      tr[i] = new();
      $display("Value of Non Static Variable :id = %0h, Static Variable s_id = %0h ,Automatic Variable a_id = %0h", tr[i].id, tr[i].s_id, tr[i].a_id);
    end
  end
endmodule  :class_example1
  
//Logfile Output  
Contains Synopsys proprietary information.
Compiler version X-2025.06-SP1_Full64; Runtime version X-2025.06-SP1_Full64;  Feb  8 09:28 2026
Value of Non Static Variable :id = 1, Static Variable s_id = 1 ,Automatic Variable a_id = 1
Value of Non Static Variable :id = 1, Static Variable s_id = 2 ,Automatic Variable a_id = 1
Value of Non Static Variable :id = 1, Static Variable s_id = 3 ,Automatic Variable a_id = 1
Value of Non Static Variable :id = 1, Static Variable s_id = 4 ,Automatic Variable a_id = 1
Value of Non Static Variable :id = 1, Static Variable s_id = 5 ,Automatic Variable a_id = 1
           V C S   S i m u l a t i o n   R e p o r t 
