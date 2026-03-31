//////////////////////////////////////////////////////////////
  System Verilog Command Line Args Concept with example :
/////////////////////////////////////////////////////////////
NOTE: Command Lines are used :
- In order to avoid the testbench recompilation 
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

  
