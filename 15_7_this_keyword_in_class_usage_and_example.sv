////////////////////////////////
   this keywords in classes :
///////////////////////////////
- To refer to class properties or methods of the current class instance, this keyword is used. 
- In simple terms, this keyword is a handle of the current class object. It shall be used only in non-static class methods.
- To resolves the ambiguity of a compiler when class properties and arguments passed to class methods when those same, this keyword is used nd its very useful.

//Example1 : Example without using this keyword :Here the properties/variable name declered in side class is same as the name passed as argument inside the method of class (Here due to same name , we will face problem , will not get expected output)
   
class transaction;
  bit [31:0] data;
  int id;
  
  function new (bit [31:0] data, int id);
    data = data; // Means Properties value (data) declered inside class  = Passed argument value (data)
    id = id;
  endfunction
endclass :transaction

module class_example1;
  initial begin
    transaction tr = new(5, 10);
    $display("Value of data = %0h, id = %0h", tr.data, tr.id);
  end
endmodule :class_example1   
   
//Logfile Output
 Starting vcs inline pass...
1 module and 0 UDP read.
recompiling module class_example1
rm -f _cuarc*.so _csrc*.so pre_vcsobj_*.so share_vcsobj_*.so
if [ -x ../simv ]; then chmod a-x ../simv; fi
g++  -o ../simv      -rdynamic  -Wl,-rpath='$ORIGIN'/simv.daidir -Wl,-rpath=./simv.daidir -Wl,-rpath=/apps/vcsmx/vcs/X-2025.06-SP1/linux64/lib -L/apps/vcsmx/vcs/X-2025.06-SP1/linux64/lib  -Wl,-rpath-link=./   objs/amcQw_d.o  _287_archive_1.so  SIM_l.o 
rmapats_mop.o rmapats.o rmar.o rmar_nd.o  rmar_llvm_0_1.o rmar_llvm_0_0.o            -lvirsim -lerrorinf -lsnpsmalloc -lvfs      -lvcsnew -ldistsimclient -lsimprofile -luclinative /apps/vcsmx/vcs/X-2025.06-SP1/linux64/lib/vcs_tls.o   -Wl,-whole-archive 
-lvcsucli    -Wl,-no-whole-archive          /apps/vcsmx/vcs/X-2025.06-SP1/linux64/lib/vcs_save_restore_new.o -ldl  -lc -lm -lpthread -ldl 
../simv up to date
CPU time: .643 seconds to compile + .440 seconds to elab + .546 seconds to link
Chronologic VCS simulator copyright 1991-2025
Contains Synopsys proprietary information.
Compiler version X-2025.06-SP1_Full64; Runtime version X-2025.06-SP1_Full64;  Feb 11 06:48 2026
Value of data = 0, id = 0
           V C S   S i m u l a t i o n   R e p o r t   
   
//Example2 : Example without using this keyword : Here the properties/variable name declered in side class is DIFFERENT as the name passed as argument inside the method of class (Here we will not see any issue/confusion)
   
class transaction;
  bit [31:0] data;
  int id;
  
  function new (bit [31:0] data1, int id1);
    data = data1; // Means Properties value (data) declered inside class  = Passed argument value (data1)
    id = id1;
  endfunction
endclass :transaction

module class_example2;
  initial begin
    transaction tr = new(5, 10);
    $display("Value of data = %0h, id = %0h", tr.data, tr.id);
  end
endmodule :class_example2
   
//Logfile Output
TimeScale is 1 ns / 1 ns
Starting vcs inline pass...
1 module and 0 UDP read.
recompiling module class_example2
rm -f _cuarc*.so _csrc*.so pre_vcsobj_*.so share_vcsobj_*.so
if [ -x ../simv ]; then chmod a-x ../simv; fi
g++  -o ../simv      -rdynamic  -Wl,-rpath='$ORIGIN'/simv.daidir -Wl,-rpath=./simv.daidir -Wl,-rpath=/apps/vcsmx/vcs/X-2025.06-SP1/linux64/lib -L/apps/vcsmx/vcs/X-2025.06-SP1/linux64/lib  -Wl,-rpath-link=./   objs/amcQw_d.o  _286_archive_1.so  SIM_l.o    
   rmapats_mop.o rmapats.o rmar.o rmar_nd.o  rmar_llvm_0_1.o rmar_llvm_0_0.o            -lvirsim -lerrorinf -lsnpsmalloc -lvfs      -lvcsnew -ldistsimclient -lsimprofile -luclinative /apps/vcsmx/vcs/X-2025.06-SP1/linux64/lib/vcs_tls.o   -Wl,-whole-archive  -lvcsucli    -Wl,-no-whole-archive          /apps/vcsmx/vcs/X-2025.06-SP1/linux64/lib/vcs_save_restore_new.o -ldl  -lc -lm -lpthread -ldl 
../simv up to date
CPU time: .504 seconds to compile + .412 seconds to elab + .470 seconds to link
Chronologic VCS simulator copyright 1991-2025
Contains Synopsys proprietary information.
Compiler version X-2025.06-SP1_Full64; Runtime version X-2025.06-SP1_Full64;  Feb 11 06:48 2026
Value of data = 5, id = a
           V C S   S i m u l a t i o n   R e p o r t    
   
//Example3 : Example with using this keyword :Here the properties/variable name declered in side class is same as the name passed as argument inside the method of class (It will work as expected)
   
class transaction;
  bit [31:0] data;
  int id;
  
  function new (bit [31:0] data, int id);
    this.data = data; // Means Properties value (data) declered inside class  = Passed argument value (data)
    this.id = id;
  endfunction
endclass :transaction

module class_example3;
  initial begin
    transaction tr = new(5, 10);
    $display("Value of data = %0h, id = %0h", tr.data, tr.id);
  end
endmodule :class_example3
   
//Logfile Output
Starting vcs inline pass...
1 module and 0 UDP read.
recompiling module class_example3
rm -f _cuarc*.so _csrc*.so pre_vcsobj_*.so share_vcsobj_*.so
if [ -x ../simv ]; then chmod a-x ../simv; fi
g++  -o ../simv      -rdynamic  -Wl,-rpath='$ORIGIN'/simv.daidir -Wl,-rpath=./simv.daidir -Wl,-rpath=/apps/vcsmx/vcs/X-2025.06-SP1/linux64/lib -L/apps/vcsmx/vcs/X-2025.06-SP1/linux64/lib  -Wl,-rpath-link=./   objs/amcQw_d.o  _286_archive_1.so  SIM_l.o    
rmapats_mop.o rmapats.o rmar.o rmar_nd.o  rmar_llvm_0_1.o rmar_llvm_0_0.o            -lvirsim -lerrorinf -lsnpsmalloc -lvfs      -lvcsnew -ldistsimclient -lsimprofile -luclinative /apps/vcsmx/vcs/X-2025.06-SP1/linux64/lib/vcs_tls.o   -Wl,-whole-archive  -lvcsucli    -Wl,-no-whole-archive          /apps/vcsmx/vcs/X-2025.06-SP1/linux64/lib/vcs_save_restore_new.o -ldl  -lc -lm -lpthread -ldl 
../simv up to date
CPU time: .572 seconds to compile + .436 seconds to elab + .501 seconds to link
Chronologic VCS simulator copyright 1991-2025
Contains Synopsys proprietary information.
Compiler version X-2025.06-SP1_Full64; Runtime version X-2025.06-SP1_Full64;  Feb 11 06:48 2026
Value of data = 5, id = a
           V C S   S i m u l a t i o n   R e p o r t    

//Example4 :
//Example for this keyword with static method
//Note that , this keyword usage in the static method is illegal. A compilation error is expected.  
class transaction;
  bit [31:0] data;
  int id;
  
  static function assign_val (bit [31:0] data, int id);
    this.data = data;
    this.id = id;
  endfunction
endclass :transaction

module class_example4;
  initial begin
    transaction tr = new();
    tr.assign_val(5,10);
    $display("Value of data = %0h, id = %0h", tr.data, tr.id);
  end
endmodule :class_example4
   
//Logfile Output
Parsing design file 'design.sv'
Parsing design file 'testbench.sv'
Error-[SV-IUTS] Illegal use of this and super
testbench.sv, 9
  Use of 'this' and 'super' is not allowed inside 'static' class-method or 
  class-member
Error-[SV-IUTS] Illegal use of this and super
testbench.sv, 10
  Use of 'this' and 'super' is not allowed inside 'static' class-method or 
  class-member
2 errors
CPU time: .416 seconds to compile
Exit code expected: 0, received: 255
Done   
     
//Example5 :
//Example for this keyword with non-static method call with static variable type
//Note that : function static or task static method call, it is possible to use this keyword.

class transaction;
  bit [31:0] data;
  int id;
  
  function static assign_val (bit [31:0] data, int id);
    this.data = data;
    this.id = id;
  endfunction
endclass :transaction

module class_example5;
  initial begin
    transaction tr = new();
    tr.assign_val(5,10);
    $display("Value of data = %0h, id = %0h", tr.data, tr.id);
  end
endmodule :class_example5

//Logfile Output
     
Starting vcs inline pass...
1 module and 0 UDP read.
recompiling module class_example5
rm -f _cuarc*.so _csrc*.so pre_vcsobj_*.so share_vcsobj_*.so
if [ -x ../simv ]; then chmod a-x ../simv; fi
g++  -o ../simv      -rdynamic  -Wl,-rpath='$ORIGIN'/simv.daidir -Wl,-rpath=./simv.daidir -Wl,-rpath=/apps/vcsmx/vcs/X-2025.06-SP1/linux64/lib -L/apps/vcsmx/vcs/X-2025.06-SP1/linux64/lib  -Wl,-rpath-link=./   objs/amcQw_d.o  _286_archive_1.so  SIM_l.o 
rmapats_mop.o rmapats.o rmar.o rmar_nd.o  rmar_llvm_0_1.o rmar_llvm_0_0.o            -lvirsim -lerrorinf -lsnpsmalloc -lvfs      -lvcsnew -ldistsimclient -lsimprofile -luclinative /apps/vcsmx/vcs/X-2025.06-SP1/linux64/lib/vcs_tls.o   -Wl,-whole-archive  -lvcsucli    
-Wl,-no-whole-archive          /apps/vcsmx/vcs/X-2025.06-SP1/linux64/lib/vcs_save_restore_new.o -ldl  -lc -lm -lpthread -ldl 
../simv up to date
CPU time: .538 seconds to compile + .443 seconds to elab + .517 seconds to link
Chronologic VCS simulator copyright 1991-2025
Contains Synopsys proprietary information.
Compiler version X-2025.06-SP1_Full64; Runtime version X-2025.06-SP1_Full64;  Feb 11 06:49 2026
Value of data = 5, id = a
           V C S   S i m u l a t i o n   R e p o r t      
