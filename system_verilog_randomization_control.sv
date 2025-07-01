//---------------------------------------------------------------------------------------------------------
///////////////////////////////////////////////////////////////////////////////////////////////////////////
//(c) Copyright Siba Kumar Panda, All rights reserved
// File    : system_verilog_randomization_control.sv 
// Project : Understanding SV Randomization Control like srandom() , get_randstate(), set_randstate()
// Purpose : 
// Author  : Siba Kumar Panda
///////////////////////////////////////////////////////////////////////////////////////////////////////////

Concept of PRNG:
-A Pseudo-Random Number Generator (PRNG) is an algorithm that generates a sequence of numbers that look random, but are actually completely determined by a starting value called a seed.
-Think of it like a shuffle playlist that always plays the same songs in the same order if you start from the same point.

SystemVerilog Randomization Control: srandom(), get_randstate(), set_randstate() :
-These functions provide different ways to control random number generation in SystemVerilog. 
-Let me explain each with practical examples you can simulate.  

What is $srandom():  
-$srandom() is a SystemVerilog function—not part of plain Verilog.
-$srandom() is a system function used to initialize or change the seed for random number generation.
-The “s” in $srandom() stands for “seed”.
-Purpose: Seeds the random number generator (RNG) for a specific object.
-It Initializes or resets the RNG sequence
-Same seed produces same random sequence
-Affects only the object it's called on
-NOTE: $urandom() -It Generates 32 bit Unsigned integer (It is present in System Verilog Language)
-$srandom(42): It sets the seed, so if you run this test multiple times, you’ll get the same sequence of values every time after seeding.Super handy for debugging.

// Basic Examples to understand
//Example1:
  
class packet;
  rand int data;
endclass

module tb_top;
  initial begin
    packet p1 = new;
    packet p2 = new;
    
    p1.srandom(100);  // Seed p1's RNG with 100
    p2.srandom(100);  // Seed p2's RNG with same 100
    
    p1.randomize();
    p2.randomize();
    
    $display("1st Attempt: p1.data = %0d, p2.data = %0d", p1.data, p2.data);
    // Both will show same value because of same seed
        
    p2.srandom(50);  // Seed p2's RNG with 50
    p2.randomize();
    
    $display("2nd Attempt: p1.data = %0d, p2.data = %0d", p1.data, p2.data);
    // Now Both will show different value because of different seed
       
  end  
endmodule: tb_top  

//Log File Output using Synopsys VCS
  
 Starting vcs inline pass...
1 module and 0 UDP read.
recompiling module tb_top
rm -f _cuarc*.so _csrc*.so pre_vcsobj_*.so share_vcsobj_*.so
if [ -x ../simv ]; then chmod a-x ../simv; fi
g++  -o ../simv      -rdynamic  -Wl,-rpath='$ORIGIN'/simv.daidir -Wl,-rpath=./simv.daidir -Wl,-rpath=/apps/vcsmx/vcs/U-2023.03-SP2/linux64/lib -L/apps/vcsmx/vcs/U-2023.03-SP2/linux64/lib  -Wl,-rpath-link=./   objs/amcQw_d.o   _331_archive_1.so   SIM_l.o       rmapats_mop.o rmapats.o rmar.o rmar_nd.o  rmar_llvm_0_1.o rmar_llvm_0_0.o            -lvirsim -lerrorinf -lsnpsmalloc -lvfs    -lvcsnew -lsimprofile -luclinative /apps/vcsmx/vcs/U-2023.03-SP2/linux64/lib/vcs_tls.o   -Wl,-whole-archive  -lvcsucli    -Wl,-no-whole-archive          /apps/vcsmx/vcs/U-2023.03-SP2/linux64/lib/vcs_save_restore_new.o -ldl  -lc -lm -lpthread -ldl 
../simv up to date
CPU time: .342 seconds to compile + .376 seconds to elab + .310 seconds to link
Chronologic VCS simulator copyright 1991-2023
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Jul  1 10:22 2025
1st Attempt: p1.data = 1547241734, p2.data = 1547241734
2nd Attempt: p1.data = 1547241734, p2.data = -379405083
           V C S   S i m u l a t i o n   R e p o r t 
Time: 0 ns
CPU Time:      0.360 seconds;       Data structure size:   0.0Mb
Tue Jul  1 10:22:10 2025
Done

//Example-2:
module tb;  
  bit [31:0] a;
  int seed = 42;
  
  initial begin
    a = $urandom();  // Generate random number with default seed
    $display("1st Attempt: Before seeding: a = %0d", a);

    // Now set the seed and check the value of variable, the value should be different then previous
    $srandom(seed);

    a = $urandom();
    $display("2nd Attempt: After seeding with 42: a = %0d", a);
    
    $srandom(42);
    a = $urandom();
    $display("3rd Attempt : The value with same seed that is 42 : a = %0d", a); // Should same as previous one with seed 42
    
    //Now change the seed and observe the value , should display different value
    $srandom(43);

    a = $urandom();
    $display("4th Attempt : The value with seed 43 : a = %0d", a);
  end
endmodule  

//LogFile Output using Synopsys VCS
 Starting vcs inline pass...
1 module and 0 UDP read.
recompiling module tb
rm -f _cuarc*.so _csrc*.so pre_vcsobj_*.so share_vcsobj_*.so
if [ -x ../simv ]; then chmod a-x ../simv; fi
g++  -o ../simv      -rdynamic  -Wl,-rpath='$ORIGIN'/simv.daidir -Wl,-rpath=./simv.daidir -Wl,-rpath=/apps/vcsmx/vcs/U-2023.03-SP2/linux64/lib -L/apps/vcsmx/vcs/U-2023.03-SP2/linux64/lib  -Wl,-rpath-link=./   objs/amcQw_d.o   _332_archive_1.so   SIM_l.o       rmapats_mop.o rmapats.o rmar.o rmar_nd.o  rmar_llvm_0_1.o rmar_llvm_0_0.o            -lvirsim -lerrorinf -lsnpsmalloc -lvfs    -lvcsnew -lsimprofile -luclinative /apps/vcsmx/vcs/U-2023.03-SP2/linux64/lib/vcs_tls.o   -Wl,-whole-archive  -lvcsucli    -Wl,-no-whole-archive          /apps/vcsmx/vcs/U-2023.03-SP2/linux64/lib/vcs_save_restore_new.o -ldl  -lc -lm -lpthread -ldl 
../simv up to date
CPU time: .376 seconds to compile + .305 seconds to elab + .330 seconds to link
Chronologic VCS simulator copyright 1991-2023
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Jul  1 10:24 2025
1st Attempt: Before seeding: a = 98710838
2nd Attempt: After seeding with 42: a = 3414959125
3rd Attempt : The value with same seed that is 42 : a = 3414959125
4th Attempt : The value with seed 43 : a = 2541649413
           V C S   S i m u l a t i o n   R e p o r t 
Time: 0 ns
CPU Time:      0.340 seconds;       Data structure size:   0.0Mb
Tue Jul  1 10:24:17 2025
Done 
//////////////////////////////////////////////////////////////////////////////
What is get_randstate()?
-Returns a copy of the internal state of the RNG associated with the given object
-It captures or "saves" the current random generator state for an object or thread. 
-Purpose: Captures the current state of an object's RNG as a string.
-Saves exact position in random sequence
-String format is simulator-specific
-Useful for debugging and checkpoints  

What is set_randstate()?
-copies the given state into the internal state og an object's RNG.
-It restores a previously saved random state, allowing you to pick up randomization exactly where you left off. Super handy for repeating a specific random behavior—like recreating a bug exactly as it happened.
-Purpose: Restores a previously saved RNG state.
-Continues random sequence from saved point.
-Must use state from same simulator.
-Enables exact replay of random sequences

//Example3: uses of get_randstate()
class packet;
  rand int data;
endclass

module test;
  
  initial begin
    packet pkt = new;
    string state;
    
    pkt.srandom(42);
    pkt.randomize();
    $display("First random value: %0d", pkt.data);
    
    state = pkt.get_randstate();  // Save current RNG state
    $display("The state is : %s", state);
    
    pkt.randomize();
    $display("Second random value: %0d", pkt.data);
    
    // Later we can restore to this point...
  end
  
endmodule

//Logfile output using Synopsys VCS
  
Starting vcs inline pass...

1 module and 0 UDP read.
recompiling module test
rm -f _cuarc*.so _csrc*.so pre_vcsobj_*.so share_vcsobj_*.so
if [ -x ../simv ]; then chmod a-x ../simv; fi
g++  -o ../simv      -rdynamic  -Wl,-rpath='$ORIGIN'/simv.daidir -Wl,-rpath=./simv.daidir -Wl,-rpath=/apps/vcsmx/vcs/U-2023.03-SP2/linux64/lib -L/apps/vcsmx/vcs/U-2023.03-SP2/linux64/lib  -Wl,-rpath-link=./   objs/amcQw_d.o   _331_archive_1.so   SIM_l.o       rmapats_mop.o rmapats.o rmar.o rmar_nd.o  rmar_llvm_0_1.o rmar_llvm_0_0.o            -lvirsim -lerrorinf -lsnpsmalloc -lvfs    -lvcsnew -lsimprofile -luclinative /apps/vcsmx/vcs/U-2023.03-SP2/linux64/lib/vcs_tls.o   -Wl,-whole-archive  -lvcsucli    -Wl,-no-whole-archive          /apps/vcsmx/vcs/U-2023.03-SP2/linux64/lib/vcs_save_restore_new.o -ldl  -lc -lm -lpthread -ldl 
../simv up to date
CPU time: .329 seconds to compile + .299 seconds to elab + .339 seconds to link
Chronologic VCS simulator copyright 1991-2023
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Jul  1 10:49 2025
First random value: 1415942360
The state is : ZZZZ1Z0110X1ZZX0XZX001X00XXXX11XZXZXZXZXXZXXXZZZZXXXZXZXXXZXZXZX
Second random value: 273097285
           V C S   S i m u l a t i o n   R e p o r t 
Time: 0 ns
CPU Time:      0.330 seconds;       Data structure size:   0.0Mb
Tue Jul  1 10:49:31 2025
Done
  
// LogFile Output using Cadence Xcelium Tool
[2025-07-01 14:50:53 UTC] xrun -Q -unbuffered '-timescale' '1ns/1ns' '-sysv' '-access' '+rw' design.sv testbench.sv  
TOOL:	xrun	23.09-s001: Started on Jul 01, 2025 at 10:50:53 EDT
xrun: 23.09-s001: (c) Copyright 1995-2023 Cadence Design Systems, Inc.
    packet pkt = new;
               |
xmvlog: *W,VARIST (testbench.sv,10|15): Local static variable with initializer requires 'static' keyword.
    pkt.randomize();
                |
xmvlog: *W,FUNTSK (testbench.sv,14|16): function called as a task without void'().
    pkt.randomize();
                |
xmvlog: *W,FUNTSK (testbench.sv,20|16): function called as a task without void'().
	Top level design units:
		$unit_0x4ccdf83b
		test
Loading snapshot worklib.test:sv .................... Done
SVSEED default: 1
xcelium> source /xcelium23.09/tools/xcelium/files/xmsimrc
xcelium> run
First random value: -1854436627
The state is : global=1 ; instance=91778aed87ee5eb1 ; NC 00000000 ; RNC ; 0000000000000000
Second random value: 968358053
xmsim: *W,RNQUIE: Simulation is complete.
xcelium> exit
TOOL:	xrun	23.09-s001: Exiting on Jul 01, 2025 at 10:50:54 EDT  (total: 00:00:01)
Done

//Example4: uses of set_randstate()  
class packet;
  rand int data;
endclass

module test;
  
  initial begin
    packet pkt = new;
    string state;
    
    pkt.srandom(42);
    pkt.randomize();
    $display("First random value: %0d", pkt.data);
    
    state = pkt.get_randstate();  // Save current RNG state
    $display("The state is : %s", state);
    
    pkt.randomize();
    $display("Second random value: %0d", pkt.data);
    
    pkt.set_randstate(state);
    pkt.randomize();
    $display("Third random value: %0d", pkt.data); // should match previous value
       
  end  
endmodule  

//LogFile Output using Synopsys VCS
Starting vcs inline pass...

1 module and 0 UDP read.
recompiling module test
rm -f _cuarc*.so _csrc*.so pre_vcsobj_*.so share_vcsobj_*.so
if [ -x ../simv ]; then chmod a-x ../simv; fi
g++  -o ../simv      -rdynamic  -Wl,-rpath='$ORIGIN'/simv.daidir -Wl,-rpath=./simv.daidir -Wl,-rpath=/apps/vcsmx/vcs/U-2023.03-SP2/linux64/lib -L/apps/vcsmx/vcs/U-2023.03-SP2/linux64/lib  -Wl,-rpath-link=./   objs/amcQw_d.o   _332_archive_1.so   SIM_l.o       rmapats_mop.o rmapats.o rmar.o rmar_nd.o  rmar_llvm_0_1.o rmar_llvm_0_0.o            -lvirsim -lerrorinf -lsnpsmalloc -lvfs    -lvcsnew -lsimprofile -luclinative /apps/vcsmx/vcs/U-2023.03-SP2/linux64/lib/vcs_tls.o   -Wl,-whole-archive  -lvcsucli    -Wl,-no-whole-archive          /apps/vcsmx/vcs/U-2023.03-SP2/linux64/lib/vcs_save_restore_new.o -ldl  -lc -lm -lpthread -ldl 
../simv up to date
CPU time: .329 seconds to compile + .306 seconds to elab + .318 seconds to link
Chronologic VCS simulator copyright 1991-2023
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Jul  1 10:48 2025
First random value: 1415942360
The state is : ZZZZ1Z0110X1ZZX0XZX001X00XXXX11XZXZXZXZXXZXXXZZZZXXXZXZXXXZXZXZX
Second random value: 273097285
Third random value: 273097285
           V C S   S i m u l a t i o n   R e p o r t 
Time: 0 ns
CPU Time:      0.330 seconds;       Data structure size:   0.0Mb
Tue Jul  1 10:48:06 2025
Done

//LogFile Output Using Cadence Xcelium
[2025-07-01 14:53:15 UTC] xrun -Q -unbuffered '-timescale' '1ns/1ns' '-sysv' '-access' '+rw' design.sv testbench.sv  
TOOL:	xrun	23.09-s001: Started on Jul 01, 2025 at 10:53:15 EDT
xrun: 23.09-s001: (c) Copyright 1995-2023 Cadence Design Systems, Inc.
    packet pkt = new;
               |
xmvlog: *W,VARIST (testbench.sv,10|15): Local static variable with initializer requires 'static' keyword.
    pkt.randomize();
                |
xmvlog: *W,FUNTSK (testbench.sv,14|16): function called as a task without void'().
    pkt.randomize();
                |
xmvlog: *W,FUNTSK (testbench.sv,20|16): function called as a task without void'().
    pkt.randomize();
                |
xmvlog: *W,FUNTSK (testbench.sv,24|16): function called as a task without void'().
	Top level design units:
		$unit_0x4ccdf83b
		test
Loading snapshot worklib.test:sv .................... Done
SVSEED default: 1
xcelium> source /xcelium23.09/tools/xcelium/files/xmsimrc
xcelium> run
First random value: -1854436627
The state is : global=1 ; instance=91778aed87ee5eb1 ; NC 00000000 ; RNC ; 0000000000000000
Second random value: 968358053
Third random value: 968358053
xmsim: *W,RNQUIE: Simulation is complete.
xcelium> exit
TOOL:	xrun	23.09-s001: Exiting on Jul 01, 2025 at 10:53:16 EDT  (total: 00:00:01)
Done

///////////////////////////////////////////////////////////////////////////////
//Example5: Combined example by using both get_randstate() and set_randstate()  
class RandGen;
  rand int a, b, c, d;
endclass

module tb;  
  RandGen rg;
  string state;

  initial begin
    rg = new();

    // Set the seed and randomize
    $srandom(123); 
    void'(rg.randomize());
    $display("First a = %0d", rg.a);

    // Save state
    state = rg.get_randstate();
    $display("The state is : %s", state);

    // Randomize more
    void'(rg.randomize());
    $display("b = %0d", rg.b);

    void'(rg.randomize());
    $display("c = %0d", rg.c);

    // Restore and repeat
    rg.set_randstate(state);
    void'(rg.randomize());
    $display("Repeat b = %0d", rg.b); // should match previous b

    void'(rg.randomize());
    $display("Repeat c = %0d", rg.c); // should match previous c
    
  end
endmodule

//LogFile output using Synopsys VCS
  Starting vcs inline pass...

1 module and 0 UDP read.
recompiling module tb
rm -f _cuarc*.so _csrc*.so pre_vcsobj_*.so share_vcsobj_*.so
if [ -x ../simv ]; then chmod a-x ../simv; fi
g++  -o ../simv      -rdynamic  -Wl,-rpath='$ORIGIN'/simv.daidir -Wl,-rpath=./simv.daidir -Wl,-rpath=/apps/vcsmx/vcs/U-2023.03-SP2/linux64/lib -L/apps/vcsmx/vcs/U-2023.03-SP2/linux64/lib  -Wl,-rpath-link=./   objs/amcQw_d.o   _332_archive_1.so   SIM_l.o       rmapats_mop.o rmapats.o rmar.o rmar_nd.o  rmar_llvm_0_1.o rmar_llvm_0_0.o            -lvirsim -lerrorinf -lsnpsmalloc -lvfs    -lvcsnew -lsimprofile -luclinative /apps/vcsmx/vcs/U-2023.03-SP2/linux64/lib/vcs_tls.o   -Wl,-whole-archive  -lvcsucli    -Wl,-no-whole-archive          /apps/vcsmx/vcs/U-2023.03-SP2/linux64/lib/vcs_save_restore_new.o -ldl  -lc -lm -lpthread -ldl 
../simv up to date
CPU time: .361 seconds to compile + .295 seconds to elab + .323 seconds to link
Chronologic VCS simulator copyright 1991-2023
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Jul  1 10:58 2025
First a = -384116807
The state is : ZZZXX11ZXXZ11XZ11Z1X101X10X00XZ1XZZXZZZXZZZZXXXXXXZXZZZZZXZXZXXX
b = 1233360000
c = 1541889331
Repeat b = 1233360000
Repeat c = 1541889331
           V C S   S i m u l a t i o n   R e p o r t 
Time: 0 ns
CPU Time:      0.320 seconds;       Data structure size:   0.0Mb
Tue Jul  1 10:58:10 2025
Done
  
// Logfile Output by using Cadence Xcelium Tool 
  
[2025-07-01 14:59:43 UTC] xrun -Q -unbuffered '-timescale' '1ns/1ns' '-sysv' '-access' '+rw' design.sv testbench.sv  
TOOL:	xrun	23.09-s001: Started on Jul 01, 2025 at 10:59:44 EDT
xrun: 23.09-s001: (c) Copyright 1995-2023 Cadence Design Systems, Inc.
	Top level design units:
		$unit_0x4ccdf83b
		tb
Loading snapshot worklib.tb:sv .................... Done
SVSEED default: 1
xcelium> source /xcelium23.09/tools/xcelium/files/xmsimrc
xcelium> run
First a = 1491695440
The state is : global=1 ; instance=58e9775052c5e0b8 ; NC 00000000 ; RNC ; 0000000000000000
b = -1607702109
c = -913242203
Repeat b = -1607702109
Repeat c = -913242203
xmsim: *W,RNQUIE: Simulation is complete.
xcelium> exit
TOOL:	xrun	23.09-s001: Exiting on Jul 01, 2025 at 10:59:45 EDT  (total: 00:00:01)
Done
  
