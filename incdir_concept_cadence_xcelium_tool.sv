//---------------------------------------------------------------------------------------------------------
///////////////////////////////////////////////////////////////////////////////////////////////////////////
//(c) Copyright Siba K Panda, All rights reserved
// File    : incdir_concept_cadence_xcelium_tool.sv
// Project : Understanding the include directory and run file
// Purpose :
// Author  : Siba K Panda
///////////////////////////////////////////////////////////////////////////////////////////////////////////

-Cadence Xcelium is a simulation tool used in the design and verification of digital integrated circuits (ICs).
-What is +incdir in Cadence Xcelium ?
- +incdir stands for "include directory".
-It tells the simulator where to look for header files when compiling your System Verilog or Verilog code.

Example:-

`include "my_defs.svh"

This line includes another file into our current file.
But for this to work, the simulator needs to know where my_defs.svh is located.

That's what +incdir+<path> does!

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

xrun +incdir+./include src/top.sv src/dut.sv

"Run simulation on top.sv and dut.sv, and check ./include folder for any included header files."


| Part                | Meaning                                                                                       |
| ------------------- | --------------------------------------------------------------------------------------------- |
| `xrun`              | This is the **Cadence Xcelium simulator** command                                             |
| `+incdir+./include` | Tells the simulator to look for `\\`include`files (like`.svh`) inside the `./include\` folder |
| `src/top.sv`        | Your **top-level module** (testbench or main logic)                                           |
| `src/dut.sv`        | The **design under test** (e.g., adder, ALU, etc.)                                            |


Real time example:


project/
├── include/
│   └── my_defs.svh
├── src/
│   ├── top.sv
│   └── dut.sv




inside top.sv:

`include "my_defs.svh"
 
Now when you compile using Xcelium, you must tell it where to find my_defs.svh

 
1️⃣ include/my_defs.svh

// This is a simple macro definition
`define MY_MACRO  1
 
 
2️⃣ src/dut.sv

module dut(input logic clk);
  initial begin
    $display("DUT is running with clk = %0b", clk);
  end
endmodule
 
 
3️⃣ src/top.sv

`include "my_defs.svh"

module top;
  logic clk;

  dut u_dut(.clk(clk));

  initial begin
    if (`MY_MACRO)
      $display("MY_MACRO is defined as 1");
    else
      $display("MY_MACRO is not defined");
 
    #5 $finish;
  end
endmodule
 
 
 //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
How to Run with Xcelium:

cd project
xrun +incdir+./include ./src/top.sv ./src/dut.sv
 
"Run simulation on top.sv and dut.sv, and check ./include folder for any included header files."
 
 /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

If you want waveform also:
xrun +incdir+./include ./src/top.sv ./src/dut.sv -gui
 
 
 
✅ Expected Output:

MY_MACRO is defined as 1
DUT is running with clk = x


*************************************run file(run.f)*********************************

what is runfile(run.f) in cadence xcelium?

run file (run.f) to list all your files, include directories, and compile options in one place

Two ways:-

1.  Without run.f (Long command every time)
2.  With run.f (Clean, simple command every time)

Without run.f -> Typing Long Command Every Time

Imagine our project has:

Includes in /include
Source files in /src
Testbench files in /tb
UVM library usage

///////////

we need to type this full command every time you simulate:

xrun +incdir+./include +incdir+./tb +incdir+$UVM_HOME/src\
/src/dut.sv\
/src/top.sv\
/tb/test pkg.sv \
/tb/testbench.sv
-uvm -access +rwc -linedebug -gui

Problem with this method:

Long and hard to maintain
If you forget a file or option -simulation fails
You have to type (or copy-paste) every time


2. With run.f -> Write Once, Use Forever

we need to write this inside a file called run.f:

+incdir+./include
+incdir+./tb
+incdir+$UVM_HOME/src

/src/dut.sv
/src/top.sv
/tb/test pkg.sv
/tb/testbench.sv

//////////////////////////

Then run this short command every time:

xrun -f run.f -uvm -access +rwc -linedebug -gui

"Run simulation using the file list from run.f, enable UVM, allow signal access for debugging, add line debugging info, and
open the GUI when done."

1. Xcelium reads the run.f
2. Compiles all the files listed inside
3. Builds the UVM environment (if used)
4. Gives full access to signals (so you can view them in waves)
5. Runs simulation with debug info
6. Opens SimVision GUI at the end with waveform loaded

-> What is -access +rwc in simple words?
"here simulator, allow to read/write/observe all signals, so we can dump them in waveforms and debug them."

->What is -linedebug?
"Keep information that links the simulation to the exact lines of code, for better debugging in GUI."

->What is -gui?
"Open SimVision GUI after simulation, so we can view waveforms and debug interactively."


Advantage with this method:

Easier to maintain and edit
Safer-you won't forget files
Clean and professional practice


/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

1 +incdir+./include
Means: "Look inside the ./include folder for any \include' header files."
Example:
If your top.sv has

include "macros.svh"

The simulator knows it can find macros.svh inside ./include.

///////////////////////////////////////////

2 +incdir+./tb
Means: "Also look inside the ./tb folder for \include' files."
       we may have our testbench files using some header files like test_config.svh.

///////////////////////////////////////////////

3 +incdir+$UVM_HOME/src

Means: "Also include the UVM library headers from the environment variable $UVM_HOME."
        $UVM_HOME is set in your machine to point to the UVM installation directory.

////////////////////////////////////////////


4  ./src/dut.sv

Means: "Compile this source file -your design under test."
Example:  adder, ALU, or whatever DUT module you created.


//////////////////////////////////////////////


5  ./src/top.sv

Means: "Compile this source file -your top-level testbench or design wrapper."
       It may instantiate the DUT and start the simulation.

///////////////////////////////////////////////


6  ./tb/test_pkg.sv

Means: "Compile this file-your UVM testbench package."
Example: Contains your UVM test class, sequences, or environment.


package test_pkg;
class my_test extends uvm_test;
....
endclass
endpackage

//////////////////////////////////////////////

7   ./tb/testbench.sv

Means: "Compile this file -your UVM testbench instantiation or top-level test."
       This is often your UVM run_test() entry point or test module.

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
Line Purpose:

+incdir+./include -> Add include directory for macros or typedefs
+incdir+./tb      -> Add testbench directory for include files
+incdir+$UVM_HOME/src -> Add standard UVM library includes
./src/dut.sv -> Compile the design under test
./src/top.sv -> Compile the top module or testbench
./tb/test_pkq.sv -> Compile the UVM test package
./tb/testbench.sv -> compile and run the uvm testbench
