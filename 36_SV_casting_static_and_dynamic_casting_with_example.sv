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
    
////////////////////////////////////////////////////////////    
  Example1: Casting in SV  - Static casting Example1
///////////////////////////////////////////////////////////    
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

//////////////////////////////////////////    
  Dynamic Casting in SV with Example
///////////////////////////////////////////  
- Dynamic casting is used to cast the assigned values to the variables that might not be ordinarily valid. 
- The $cast is the system method. 
- The $cast can be either function or task
- Syntax:
  function int $cast(destination, source);
  task $cast(destination, source);
- In both $cast as a function or task, $cast will try to assign source value or expression to the destination variable. 
- If dynamic casting fails due to incompatible assignments, the destination variable will remain unchanged. 
- The only difference between $cast as a function and as a task is mentioned below.
- When $cast as a task: If $cast fails, it will cause a runtime error.
- When $cast as a function: As $cast as a function returns 1 for legal casting, otherwise it returns 0. But run time error will not occur for failed casting and the destination variable will be unchanged.

////////////////////////////////////////////////////////////    
  Example2: Casting in SV  - Dynamic casting Example1
            Here $cast is a task
///////////////////////////////////////////////////////////  
//In the below example, dynamic casting is used where source variable is integer and desitination variable is enum variable.
//When value assignment happens for other values than enumerated one, casting fails so that simulation terminated with run time error.
module dynamic_casting_example2;
  typedef enum {DIODE=10, BJT=100, MOSFET=250, FINFET=300} devices;
  initial begin
    devices dev;
    
    $cast(dev, 250 + 50);
    $display("A: Device used = %s",dev.name());
     
    $cast(dev, 10);
    $display("C: Device used = %s",dev.name());
    
    $cast(dev, 250 + 20);
    $display("B: Device used = %s",dev.name());
        
  end
endmodule :dynamic_casting_example2
  
//Logfile Output
A: Device used = FINFET
C: Device used = DIODE
Error-[STASKE_DCF] Dynamic cast failed
testbench.sv, 17
  Dynamic cast using '$cast' failed. The source expression is not yielding a 
  valid value for the destination variable.

           V C S   S i m u l a t i o n   R e p o r t   
////////////////////////////////////////////////////////////    
  Example3: Casting in SV  - Dynamic casting Example2
            Here $cast is a function
///////////////////////////////////////////////////////////  
//In below example , The first $cast is a valid assignment and the second $cast has an invalid assignment.
//Notice that, simulation is not terminated with run time error.
//NOTE: Dynamic casting is also used to cast the Base class handle to its derived class as mentioned in Polymorphism section.
module dynamic_casting_example3;
  typedef enum {DIODE=10, BJT=100, MOSFET=250, FINFET=300} devices;
  initial begin
    devices dev;
    
    if($cast(dev, 250 + 50))
      $display("A: Device used = %s",dev.name());
    else 
      $display("A: Dynamic casting failed");
    
    if($cast(dev, 250 + 20))
      $display("B: Device used = %s",dev.name());
     else 
      $display("B: Dynamic casting failed");
    
    if($cast(dev, 10))
      $display("C: Device used = %s",dev.name());
     else 
      $display("C: Dynamic casting failed");
  end
endmodule :dynamic_casting_example3

//Logfile Output
A: Device used = FINFET
B: Dynamic casting failed
C: Device used = DIODE
           V C S   S i m u l a t i o n   R e p o r t   




  
