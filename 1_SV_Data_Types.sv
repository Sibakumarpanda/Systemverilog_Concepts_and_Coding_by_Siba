//Some Basic Terms for understanding :

Signed and Unsigned  
  Signed:   can hold both positive and negative values.
  Unsigned: can hold positive values alone.

Literals : Fixed value in the program is called literal. In simple terms, it is known as constants. Its value can not be altered during the execution of the program.
Constants : The value of constants cannot be changed. It is read-only in nature.  
Variables: Variables can store any value in memory based on their data type. Its value can be changed during run time.

Data Types :
-A storage format having a specific range or type is called data type(In simple types of Data ).
-System verilog provides basically 2 types of state of data 
     2 state data type: It has bits 0 and 1
     4 state data type: It has bits 0, 1, X, and Z

/*********************** Various System verilog Data Type Catagory *****************************************************************/

1. Integer Data Types : int , integer ,shortint, longint , bit , byte , wire , reg, logic ,time
2. Real Data Types    : real, shortreal, realtime
3. void data Type 
4. string data Type
5. event data Type  
6. User defined Data Type
7. enumerations Data Type : enum
8. structure Data Type : struct
9. Union Data Type: union 
10. Class data Type : class  
  
/*******************************************************************************************************************************/
NOTE - In System Verilog all the Data types are of 2 state , except one data type that is of 4-state called logic data type
     - In Verilog all the Data types are of 4 state , except one data type that is of 2-state called  data type
     - All the below data types are explained with respect to below points :
            1. state of data type          
            2. Size of the Data Type
            3. signed/unsigned 
            4. Default value 
  
/********************************/
    Data Types Description
/*******************************/  
integer-  State : 4state data type, Size: 32-bit signed integer , Default Value = 32'bx
int-      State : 2state data type, Size: 32-bit signed integer , Default Value = 32'b0
shortint- State : 2state data type, Size: 16-bit signed integer , Default Value = 16'b0
longint-  State : 2state data type, Size: 64-bit signed integer , Default Value = 64'b0
bit-      State : 2state data type, Size: User-defined vector size , unsigned , Default Value = 1'b0
byte-     State : 2state data type, Size: 8-bit signed integer or ASCII character , Default value = 8'b0
logic-    State : 4state data type, Size: User-defined vector size, Can be signed or unsigned (depends on declaration) , Default value = 1'bx
reg-      State : 4state data type, Size: User-defined vector size, Can be signed or unsigned (depends on declaration) , Default value = 1'bx
wire-     State : 4state data type, Size: User-defined vector size, Can be signed or unsigned (depends on declaration), Default value = 1'bz
time-     State : 4state data type, Size: 64-bit unsigned integer , Default value = 64'b0

real-         State: Floating-point data type (simulated with 64-bit double precision) , Size: 64-bit double precision floating point (IEEE 754) ,Default Value: 0.0
                     It is Same as double in C, used for mathematical computations
shortreal-    State: Floating-point data type (simulated with 32-bit single precision) ,Size: 32-bit single precision floating point (IEEE 754) ,Default Value: 0.0
                     Same as float in C, more efficient for simulation than real
realtime-     State: Floating-point data type (same as real) ,Size: 64-bit double precision floating point (IEEE 754) ,Default Value: 0
                     Semantically identical to real, but used to explicitly indicate the variable represents simulation time values

void data Type- Its a  Non-existence data is known as a void data type. 
                It is usually used with functions where it’s return type is void.
                It can be specified as the return type of functions and tasks to indicate no return value.       
                For example :
                  function void display ();
	                   $display ("Am not going to return any value");
                  endfunction
  
                  task void display ();
	                   #10 $display ("Me neither");
                   endtask     

string data Type-  An ordered collection of characters is called a string data type. 
                   The length of string variables may vary during simulation, hence the variable having type string is dynamic in nature.

Event data type-   Data type event is a handle to a synchronization object. 
                   The object which is referenced by an event variable can be triggered and waited for. In detail we will study later
                   event is_empty; // declaration of is_empty event.  

User-defined types- User-defined types use keyword typedef which is an extension of SystemVerilog data type.
                    typedef int myint;  // Declaration
                    myint a,b;          // Usage of user defined data type.  

Enumeration data Type: A set of integral named constants is called an enumerated type. 
                       It defines a set of named values having an anonymous int type.
                       enum {red, yellow, green} traffic_signal;   //Anonymous int type -> red = 0, yellow = 1 and green = 2  

Why logic data type came in to picture in System Verilog ???
  - In Verilog behavior modeling, always, and initial procedural blocks use reg data type whereas, in dataflow modeling, continuous assignment uses wire data type. 
  - SystemVerilog allows driving signals in the ‘assign’ statements and procedural blocks using logic data type. 
  - The logic is a 4-state data type that allows capturing the Z or X behavior of the design. 

Structure Data Type:

Union Data Type:

Class Data Type:  

Real to int Data Type conversion :	  
  -Real numbers will be converted to integers by rounding the real number to the nearest integer instead of truncating it. 
  -If the fractional part is exactly 0.5, it will be rounded away from zero. 
  -Explicit conversion can be specified using casting or using system tasks. 
  -Directly assigning a real value to an integral type will also round instead of truncate.	 

  // Casting will perform rounding
     int'(2.0 * 3.0)
     shortint'({8'hab, 8'hef})

  // Using system tasks will truncate
     integer  	$rtoi ( real_val )
     real 		$itor ( int_val)	  
	  
	  
	  
