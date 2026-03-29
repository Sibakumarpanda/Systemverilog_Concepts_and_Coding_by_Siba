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
    
//Example1: Casting in SV  - Static casting Example1
//In the below example, real to int, int to real, a string to int, expression in casting, concatenation in casting is used.
module static_casting_example1;
  string name;
  int num[3];
  real r_num;
  
  initial begin
    name = "A";
    r_num = 2.8;
    
    num[0] = int'(name); //Takes ascii value for string
    num[1] = int'(r_num);
    
    r_num = 2.125 + real'({4'h1, 4'hA});  // 'h1A = 'd26
    num[2] = int'((num[0] == 65)?r_num: 4.7);
    
    $display("casting from string to int: num[0] = %0d", num[0]);
    $display("casting from real to int: num[1] = %0d", num[1]);
    $display("casting from int to real: r_num = %0f", r_num);
    $display("casting an expression from real to int: num[2] = %0d", num[2]);
  end
endmodule :static_casting_example1  

//Logfile Outpt
casting from string to int: num[0] = 65
casting from real to int: num[1] = 3
casting from int to real: r_num = 28.125000
casting an expression from real to int: num[2] = 28
           V C S   S i m u l a t i o n   R e p o r t 
