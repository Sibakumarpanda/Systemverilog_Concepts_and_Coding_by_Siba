//////////////////////////////////////////////////////////////
  System Verilog Command Line Args Concept with example :
/////////////////////////////////////////////////////////////
NOTE: Command Lines are used :
- In SV basically ,command-line arguments (specifically plusargs) are runtime arguments. (compile once, run multiple times with different args)
- They are evaluated during simulation, allowing to control simulation behavior—like changing seeds, verbosity or test cases—without need of recompile your code.
- Hence it avoids the testbench recompilation .
- In order to support different scenarios by passing the string in run command ($test$plusargs)
- In order to support different values with string ($value$plusargs) the command line args in system verilog are vey helpful 
- So , In SV , this kind of  information is provided to the simulation as an optional argument always starting with the + character.
- These arguments passed in from the command line are accessible in SV code via the following system functions called as plusargs.
- Syntax :
  $test$plusargs (user_string)
  $value$plusargs (user_string, variable)

- The function $test$plusargs is typically used when a value for the argument is not required. 
- It searches the list of plusargs for a user specified string.
- A variable can also be used to specify the string and any null character will be ignored. 
- If the prefix of one of the supplied plusargs matches all characters in the provided string, the function will return a non-zero integer and otherwise zero.

//////////////////////////////////////////////////////////////////////////////////
  Example1: SV Command Line- Basic example to understand  $test$plusargs uses 
//////////////////////////////////////////////////////////////////////////////////  
module testplusargs_tb_example1;
  initial begin
    if ($test$plusargs ("MY_DATAWIDTH_8"))
      $display ("Running the Scenario with Datawidth=8bit");
    
    if ($test$plusargs ("MY_DATAWIDTH_16"))
      $display ("Running the Scenario with Datawidth=16bit");
    
    if ($test$plusargs ("MY_DATAWIDTH_32"))
      $display ("Running the Scenario with Datawidth=32bit");

    if ($test$plusargs ("my_datawidth_8"))
      $display ("Running the Scenario with Datawidth=8bit (Lowercase)");
    
    if ($test$plusargs ("my_datawidth_16"))
      $display ("Running the Scenario with Datawidth=16bit (Lowercase)");
    
    if ($test$plusargs ("my_datawidth_32"))
      $display ("Running the Scenario with Datawidth=32bit (Lowercase)");

    if ($test$plusargs ("MY"))
      $display ("Running the Scenario with Substring as MY");

    if ($test$plusargs ("M"))
      $display ("Running the Scenario with Some string starting with letter M ");

    if ($test$plusargs ("Y"))
      $display ("Running the Scenario with Some string starting with letter Y ");

    if ($test$plusargs ("MY_"))
      $display ("Running the Scenario with Some string starting with MY_");
    
    if ($test$plusargs ("MY_DATAWIDTH"))
      $display ("Running the Scenario with Some string starting with MY_DATAWIDTH");

    if ($test$plusargs ("MYNAME"))
      $display ("MYNAME is Siba K Panda");
    
    if ($test$plusargs ("MY_NAME"))
      $display ("MY_NAME is Siba K Panda");
  end
endmodule :testplusargs_tb_example1

//Logfile Output
When running with +MY_DATAWIDTH_8 ,the below are the outut
Running the Scenario with Datawidth=8bit
Running the Scenario with Substring as MY
Running the Scenario with Some string starting with letter M 
Running the Scenario with Some string starting with MY_
Running the Scenario with Some string starting with MY_DATAWIDTH  

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
 Example2: SV Command Line- Basic example to understand  $value$plusargs uses with different kind of Format specifier
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/*
%d	Decimal conversion
%o	Octal conversion
%h, %x	Hexadecimal conversion
%b	Binary conversion
%e	Real exponential conversion
%f	Real decimal conversion
%g	Real decimal or exponential conversion
%s	String (no conversion)
*/
module valueplusargs_tb_example2;
  initial begin
    string var1 ,var2;
    bit [63:0] data;
    
    if ($value$plusargs ("MY_DATAWIDTH_8=%0d",data))
       $display ("Running the Scenario with Datawidth 8bit with value =%0d",data);
    
    if ($value$plusargs ("MY_DATAWIDTH_16=%0d",data))
       $display ("Running the Scenario with Datawidth 16bit with value =%0d",data);
    
    if ($value$plusargs ("MY_DATAWIDTH_32=%0d",data))
       $display ("Running the Scenario with Datawidth 32bit with value =%0d",data);

    if ($value$plusargs ("my_datawidth_8=%0d",data))
       $display ("Running the Scenario with Datawidth 8bit (Lowercase) with value =%0d",data);
    
    if ($value$plusargs ("my_datawidth_16=%0d",data))
       $display ("Running the Scenario with Datawidth 16bit (Lowercase) with value =%0d",data);
    
    if ($value$plusargs ("my_datawidth_32=%0d",data))
       $display ("Running the Scenario with Datawidth 32bit (Lowercase) with value =%0d",data);
    
    if ($value$plusargs ("MY_NAME=%s", var1))
        $display ("MY_NAME is = %s", var1);
    
    if ($value$plusargs ("+STRING=%s", var1))
        $display ("STRING with + char has a value %s", var1);  

   `ifdef RUNTIME_ERR
      if ($value$plusargs ("STRING=%0d", var2))
         $display ("STRING with %%0d has a value %s", var2);
   `endif

  end
endmodule :valueplusargs_tb_example2
  
//Logfile Output  
When running with +MY_DATAWIDTH_8=56, below is the output
Running the Scenario with Datawidth 8bit with value =56
           V C S   S i m u l a t i o n   R e p o r t   

When running with +MY_NAME=SIBA , below is the output
MY_NAME is = SIBA
           V C S   S i m u l a t i o n   R e p o r t 
  
/////////////////////////////////////////////////////////////////////////////////////////
  A Very Important Understanding between Preprocessor Defines & Command line args 
////////////////////////////////////////////////////////////////////////////////////////
- Preprocessor Defines  :     +define  
- Command Line args are :     $test$plusargs and $valueplusargs
- Both are passed via the command line (in run command while running test usually), they serve different stages of the design flow.
- Key Differences Between both are as follows .
  ---------------------------------------------------------------------------------------------------------------------------------------------
   Feature        Preprocessor Defines (+define+)                                      Plusargs (+arg)	
  ---------------------------------------------------------------------------------------------------------------------------------------------
  Timing		     Compile-time (Elaboration)                                            Runtime (Simulation)
  Purpose	       Controls static code structure (e.g., `ifdef)                         Controls dynamic simulation behavior	
  Function	     Modifies which code is included in the executable                     Read using $test$plusargs or $value$plusargs	
  Workflow	     Requires recompilation to change the value                            Compile once, run multiple times with different args	

  
