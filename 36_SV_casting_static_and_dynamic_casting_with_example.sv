//////////////////////////////////////////////////////////////
  SystemVerilog Casting Concept Understanding with Example
//////////////////////////////////////////////////////////////
- Casting is a process of converting from one data type into another data type for compatibility.
- Importance of Casting :
  In SystemVerilog, a data type is essential to mention while declaring a variable and it can hold values of the same data type.
  For example, the int data type can not hold real data type values. If we try doing so, it will lead to a compilation error. Casting helps to resolve this problem.
- There are two types of casting in SystemVerilog :
  Static Casting
  Dynamic Casting
    
//////////////////////////////////////////    
 Static Casting in SV with Example
///////////////////////////////////////////    
- As the name suggests, static casting is only applicable to fixed data types. It does not apply to the Object-Oriented programming concept.
- Syntax: <data_type>'(value or variable or expression)
- It converts values or variables from one data type to another data type.
- Static casting is checked during compile time. So, there will not be any run time error.
    
Static Casting Example
