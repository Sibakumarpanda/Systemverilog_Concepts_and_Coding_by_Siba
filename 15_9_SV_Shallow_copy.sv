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


//Example2:
class Header;
	int id;
	function new (int id);
		this.id = id;
	endfunction
	
	function showId();
		$display ("id=0x%0d", id);
	endfunction
endclass

class Packet;
	int 	addr;
	int 	data;
	Header 	hdr;
	
	function new (int addr, int data, int id);
		hdr = new (id);
		this.addr = addr;
		this.data = data;
	endfunction
	
	function display (string name);
		$display ("[%s] addr=0x%0h data=0x%0h id=%0d", name, addr, data, hdr.id);
	endfunction
endclass

module tb;
	Packet p1, p2;
	initial begin
		// Create a new pkt object called p1
		p1 = new (32'hface_cafe, 32'h1234_5678, 26);
		p1.display ("p1");
		
		// Shallow copy p1 into p2; p2 is a new object with contents in p1
		p2 = new p1;
		p2.display ("p2");
		
		// Now let's change the addr and id in p1
		p1.addr = 32'habcd_ef12;
		p1.data = 32'h5a5a_5a5a;
		p1.hdr.id = 17;
		p1.display ("p1");
		
		// Print p2 and see that hdr.id points to the hdr in p1, while
		// addr and data remain unchanged.
		p2.display ("p2");
	end
endmodule

//Logfile Output
Starting vcs inline pass...
1 module and 0 UDP read.
recompiling module tb
rm -f _cuarc*.so _csrc*.so pre_vcsobj_*.so share_vcsobj_*.so
if [ -x ../simv ]; then chmod a-x ../simv; fi
g++  -o ../simv      -rdynamic  -Wl,-rpath='$ORIGIN'/simv.daidir -Wl,-rpath=./simv.daidir -Wl,-rpath=/apps/vcsmx/vcs/X-2025.06-SP1/linux64/lib -L/apps/vcsmx/vcs/X-2025.06-SP1/linux64/lib  -Wl,-rpath-link=./   objs/amcQw_d.o  _286_archive_1.so  SIM_l.o       rmapats_mop.o rmapats.o rmar.o rmar_nd.o  rmar_llvm_0_1.o rmar_llvm_0_0.o            -lvirsim -lerrorinf -lsnpsmalloc -lvfs      -lvcsnew -ldistsimclient -lsimprofile -luclinative /apps/vcsmx/vcs/X-2025.06-SP1/linux64/lib/vcs_tls.o   -Wl,-whole-archive  -lvcsucli    -Wl,-no-whole-archive          /apps/vcsmx/vcs/X-2025.06-SP1/linux64/lib/vcs_save_restore_new.o -ldl  -lc -lm -lpthread -ldl 
../simv up to date
CPU time: .571 seconds to compile + .532 seconds to elab + .564 seconds to link
Chronologic VCS simulator copyright 1991-2025
Contains Synopsys proprietary information.
Compiler version X-2025.06-SP1_Full64; Runtime version X-2025.06-SP1_Full64;  Feb 15 04:53 2026
[p1] addr=0xfacecafe data=0x12345678 id=26
[p2] addr=0xfacecafe data=0x12345678 id=26
[p1] addr=0xabcdef12 data=0x5a5a5a5a id=17
[p2] addr=0xfacecafe data=0x12345678 id=17
           V C S   S i m u l a t i o n   R e p o r t   
