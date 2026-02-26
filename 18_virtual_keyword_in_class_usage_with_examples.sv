/////////////////////////////////////////////////////////
   virtual keyword in class and its uses with Examples:
////////////////////////////////////////////////////////
- The virtual keyword is used while defining the class method (virtual methods) and the class itself (Abstract class).
   
virtual functions and tasks in SystemVerilog :
- A virtual method is a virtual function or task from the base class which can be overridden by a method of its Derived class having the same signature (same method name and arguments).
- In simple words, 
   When a Derived class handle is assigned to its base class (means b=d), On calling a method using a base class handle, the base class method will be executed. 
   On declaring a method as a virtual method, a base class handle can call the method of its child class.
- Note: Once a virtual keyword is used for a base class method, all corresponding methods in derived classes become virtual. It is not necessary to put the ‘virtual’ keyword for derived class methods.
- Let’s understand it with below different examples.
- In below examples, a derived class object is created and then it is assigned to the base class handle.
     base_trans b;
     derive_trans d;
     d = new();
     b = d;

/////////////////////////////////////////////////////////////////////// 
  Example1: without virtual Keyword
   Notice that in the below example base class display() method is 
   called when it is not declared as virtual. 
//////////////////////////////////////////////////////////////////////// 
class base_trans;
  bit [31:0] data;
  int id;
  
  function void display();
    $display("FROM_BASE_CLASS: Value of data = %0h and id = %0h", data, id);
  endfunction
  
endclass :base_trans

class derived_trans extends base_trans;
  function void display();
    $display("FROM_DERIVED_CLASS: Value of data = %0h and id = %0h", data, id);
  endfunction  
endclass :derived_trans

module class_example1;
  initial begin
    derived_trans d;
    base_trans b;
    d = new();
    
    b = d;
    b.data = 5;
    b.id = 1;
    
    b.display();
    d.display();
  end
endmodule :class_example1
      
//Logfile Output
Starting vcs inline pass...
1 module and 0 UDP read.
recompiling module class_example1
rm -f _cuarc*.so _csrc*.so pre_vcsobj_*.so share_vcsobj_*.so
if [ -x ../simv ]; then chmod a-x ../simv; fi
g++  -o ../simv      -rdynamic  -Wl,-rpath='$ORIGIN'/simv.daidir -Wl,-rpath=./simv.daidir -Wl,-rpath=/apps/vcsmx/vcs/X-2025.06-SP1/linux64/lib -L/apps/vcsmx/vcs/X-2025.06-SP1/linux64/lib 
-Wl,-rpath-link=./   objs/amcQw_d.o  _287_archive_1.so  SIM_l.o       rmapats_mop.o rmapats.o rmar.o rmar_nd.o  rmar_llvm_0_1.o rmar_llvm_0_0.o            -lvirsim -lerrorinf -lsnpsmalloc -lvfs     
-lvcsnew -ldistsimclient -lsimprofile -luclinative /apps/vcsmx/vcs/X-2025.06-SP1/linux64/lib/vcs_tls.o   -Wl,-whole-archive  -lvcsucli    -Wl,-no-whole-archive         
/apps/vcsmx/vcs/X-2025.06-SP1/linux64/lib/vcs_save_restore_new.o -ldl  -lc -lm -lpthread -ldl 
../simv up to date
CPU time: .645 seconds to compile + .631 seconds to elab + .637 seconds to link
Chronologic VCS simulator copyright 1991-2025
Contains Synopsys proprietary information.
Compiler version X-2025.06-SP1_Full64; Runtime version X-2025.06-SP1_Full64;  Feb 26 10:38 2026
FROM_BASE_CLASS: Value of data = 5 and id = 1
FROM_DERIVED_CLASS: Value of data = 5 and id = 1
           V C S   S i m u l a t i o n   R e p o r t       

/////////////////////////////////////////////////////////////////////// 
  Example2: with virtual Keyword
  Notice that in the below example derived class display() method
  is printing when it is declared as virtual.
//////////////////////////////////////////////////////////////////////// 
class base_trans;
  bit [31:0] data;
  int id;
  
  virtual function void display();
    $display("FROM_BASE_CLASS: Value of data = %0h and id = %0h", data, id);
  endfunction
  
endclass :base_trans

class derived_trans extends base_trans;
  function void display();
    $display("FROM_DERIVED_CLASS: Value of data = %0h and id = %0h", data, id);
  endfunction  
endclass :derived_trans

module class_example2;
  initial begin
    derived_trans d;
    base_trans b;
    d = new();
    
    b = d;
    b.data = 5;
    b.id = 1;
    
    b.display();
    d.display();
    
    $display ("----------------------------------");
    
    d.data = 10;
    d.id = 2;
    
   
    b.display();
    d.display();
    
    $display ("----------------------------------");
    b.data = 5;
    b.id = 1;
    
    b.display();
    d.display();    
  end
endmodule :class_example2
   
//Logfile Output
Chronologic VCS simulator copyright 1991-2025
Contains Synopsys proprietary information.
Compiler version X-2025.06-SP1_Full64; Runtime version X-2025.06-SP1_Full64;  Feb 26 10:41 2026
FROM_DERIVED_CLASS: Value of data = 5 and id = 1
FROM_DERIVED_CLASS: Value of data = 5 and id = 1
----------------------------------
FROM_DERIVED_CLASS: Value of data = a and id = 2
FROM_DERIVED_CLASS: Value of data = a and id = 2
----------------------------------
FROM_DERIVED_CLASS: Value of data = 5 and id = 1
FROM_DERIVED_CLASS: Value of data = 5 and id = 1
           V C S   S i m u l a t i o n   R e p o r t      

/////////////////////////////////////////////////////////////////////// 
  Example-3 : Inheritance Example3
  
////////////////////////////////////////////////////////////////////////   



/////////////////////////////////////////////////////////////////////// 
  Example-4 : Inheritance Example4
  
////////////////////////////////////////////////////////////////////////    



/////////////////////////////////////////////////////////////////////// 
  Example-5 : Inheritance Example5
  
////////////////////////////////////////////////////////////////////////     
   
