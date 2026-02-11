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
g++  -o ../simv      -rdynamic  -Wl,-rpath='$ORIGIN'/simv.daidir -Wl,-rpath=./simv.daidir -Wl,-rpath=/apps/vcsmx/vcs/X-2025.06-SP1/linux64/lib -L/apps/vcsmx/vcs/X-2025.06-SP1/linux64/lib  -Wl,-rpath-link=./   objs/amcQw_d.o  _287_archive_1.so  SIM_l.o       rmapats_mop.o rmapats.o rmar.o rmar_nd.o  rmar_llvm_0_1.o rmar_llvm_0_0.o            -lvirsim -lerrorinf -lsnpsmalloc -lvfs      -lvcsnew -ldistsimclient -lsimprofile -luclinative /apps/vcsmx/vcs/X-2025.06-SP1/linux64/lib/vcs_tls.o   -Wl,-whole-archive  -lvcsucli    -Wl,-no-whole-archive          /apps/vcsmx/vcs/X-2025.06-SP1/linux64/lib/vcs_save_restore_new.o -ldl  -lc -lm -lpthread -ldl 
../simv up to date
CPU time: .643 seconds to compile + .440 seconds to elab + .546 seconds to link
Chronologic VCS simulator copyright 1991-2025
Contains Synopsys proprietary information.
Compiler version X-2025.06-SP1_Full64; Runtime version X-2025.06-SP1_Full64;  Feb 11 06:48 2026
Value of data = 0, id = 0
           V C S   S i m u l a t i o n   R e p o r t   
   
//Example2 :


//Example3 :


//Example4 :


//Example5 :
