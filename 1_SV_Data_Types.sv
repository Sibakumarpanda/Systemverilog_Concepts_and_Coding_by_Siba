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
10. class data Type : class  
  
/*******************************************************************************************************************************/
NOTE - In System Verilog all the Data types are of 2 state , except one data type that is of 4-state called logic data type
     - In Verilog all the Data types are of 4 state , except one data type that is of 2-state called  data type


All the below data types are explained with respect to below points :
            1. state of data type          
            2. Size of the Data Type
            3. signed/unsigned 
            4. Default value 
  


int - 2 state data type, 32-bit signed integer

integer- 4 state data type, 32-bit signed integer

shortint- 2 state data type, 16-bit signed integer

longint -2 state data type, 64-bit signed integer

bit- 2 state data type, unsigned, user-defined vector size

byte -2 state data type, 8-bit signed integer or ASCII character

logic -4 state data type, unsigned, user-defined vector size

reg -4 state data type, unsigned, user-defined vector size

time -4 state data type, 64-bit unsigned integer

  
