///////////////////////////////////////////////////////////////////////////
   Concept of Data Encapsulation/Data Hiding in SV with Examples:
//////////////////////////////////////////////////////////////////////////
- Data encapsulation is a mechanism that combines class properties and methods.
- Data hiding is a mechanism to hide class members within the class. 
- They are not accessible outside of class scope. This avoids class member modification outside the class scope and its misuse.
- By default, all class members are accessible with class handles in SystemVerilog. To restrict access, access qualifiers are used.
- Local Access Qualifier - If a class member is declared as a local, they will be available to that class alone. 
  The child classes will not have access to a local class member of their parent class.

/////////////////////////////////////////////////////////////////////////////////////////////////////////////
  Example1: Data Encapsulation and Hiding -Local Access variable Examples ,Access outside of the class scope
//////////////////////////////////////////////////////////////////////////////////////////////////////////// 
//In the below example, the variable id is declared as a local variable. It is tried to access outside of class scope, which leads to a compilation error.
class pkt_trans;
  bit [31:0] data;
  local int id;
  function void display();
    $display("data = %0d and id = %0d", data, id);
    //$display("data = %0d ", data);
  endfunction
endclass :pkt_trans

module class_example1;
  pkt_trans tr;
  
  initial begin
    tr = new();
   
    tr.data = 100;
    tr.id = 1;
    
    tr.display();
  end
endmodule :class_example1

//Logfileoutput
 Error-[SV-ICVA-L] Illegal class variable access
testbench.sv, 22
  Local member 'id' of class 'pkt_trans' is not visible to scope 
  'class_example1'.
  Please make sure that the above member is accessed only from its own class 
  methods as it is declared as local.
  Please refer to the SystemVerilog LRM (1800-2012) Section 8.18 Data hiding 
  and encapsulation.
1 error    
///////////////////////////////////////////////////////////////////////////////////////////////////////////
  Example2: Data Encapsulation and Hiding -Local Access variable Examples ,Access With in the class scope
///////////////////////////////////////////////////////////////////////////////////////////////////////////
//There is no compilation error expected if the local variable is accessed within the class scope.
class pkt_trans;
  bit [31:0] data;
  local int id;

  function new();
    data = 100;
    id = 1;
  endfunction
  
  function void display();
    $display("data = %0d and id = %0d", data, id);
  endfunction
endclass :pkt_trans

module class_example2;
  pkt_trans tr;
  
  initial begin
    tr = new();
    tr.display();
  end
endmodule :class_example2
     
//Logfile Output
Contains Synopsys proprietary information.
Compiler version X-2025.06-SP1_Full64; Runtime version X-2025.06-SP1_Full64;  Mar 10 22:20 2026
data = 100 and id = 1
           V C S   S i m u l a t i o n   R e p o r t      

//////////////////////////////////////////////////////////////////////////////////////////////////////////
  Example3: Data Encapsulation and Hiding - Local Access method Examples ,Access outside of the class scope
/////////////////////////////////////////////////////////////////////////////////////////////////////////
//A class method display() is declared as local. So, calling the display() method outside of the class scope will lead to a compilation error.
class pkt_trans;
  bit [31:0] data;
  int id;

  function new();
    data = 100;
    id = 1;
  endfunction
  
  local function void display();
    $display("data = %0d and id = %0d", data, id);
  endfunction
endclass :pkt_trans

module class_example3;
  pkt_trans tr;
  
  initial begin
    tr = new();
    tr.display();
  end
endmodule :class_example3
     
//Logfile Output
Error-[SV-ICMA] Illegal class method access
testbench.sv, 23
  Local method 'display' of class 'pkt_trans' is not visible to scope 
  'class_example3'.
  Please make sure that the above method is called only from its own class 
  properties as it is declared as local.
1 error     
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  Example4: Data Encapsulation and Hiding - Local Access method Examples ,Access within the class scope
////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//There is no compilation error expected if the local display() method is accessed within the class scope.
class pkt_tran;
  bit [31:0] data;
  int id;

  function new();
    data = 100;
    id = 1;
    display();
  endfunction
  
  local function void display();
    $display("data = %0d and id = %0d", data, id);
  endfunction
endclass :pkt_tran

module class_example4;
  pkt_tran tr;
  
  initial begin
    tr = new();
  end
endmodule :class_example4
     
//Logfile Output
Chronologic VCS simulator copyright 1991-2025
Contains Synopsys proprietary information.
Compiler version X-2025.06-SP1_Full64; Runtime version X-2025.06-SP1_Full64;  Mar 10 22:25 2026
data = 100 and id = 1
           V C S   S i m u l a t i o n   R e p o r t 

///////////////////////////////////////////////////////////////////////////////////////////////////////
  Example5: 
//////////////////////////////////////////////////////////////////////////////////////////////////////


//////////////////////////////////////////////////////////////////////////////////////////////////////
  Example6: 
////////////////////////////////////////////////////////////////////////////////////////////////////////


////////////////////////////////////////////////////////////////////////////////////////////////////////
  Example7: 
////////////////////////////////////////////////////////////////////////////////////////////////////////
     
////////////////////////////////////////////////////////////////////////////////////////////////////////
  Example8: 
////////////////////////////////////////////////////////////////////////////////////////////////////////


///////////////////////////////////////////////////////////////////////////////////////////////////////
  Example9: 
///////////////////////////////////////////////////////////////////////////////////////////////////////



//////////////////////////////////////////////////////////////////////////////////////////////////////
  Example10: 
//////////////////////////////////////////////////////////////////////////////////////////////////////    
