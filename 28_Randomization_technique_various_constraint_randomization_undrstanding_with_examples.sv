//////////////////////////////////////////////////////////////////
   Randomization in SystemVerilog - Concept and understanding
//////////////////////////////////////////////////////////////////
-Randomization is a process of producing random values of the mentioned data type.
-As SystemVerilog also deals with objects, the $random method from Verilog is not sufficient for randomizing an object.

 ////////////////////////////    
    Need for Randomization :
 ////////////////////////////      
 -With increasing complexity of the design, there are high chances to have more bugs in the design when it is written for the first time. 
 -To verify DUT thoroughly, a verification engineer needs to provide many stimuli. 
 -There can be multiple cross combinations of variables in a real system. So, it is not possible practically to write directed cases to verify every possible combination. 
 -So, it is very much required to have randomization in the verification testbench.
      
///////////////////////////////      
  Advantages of Randomization:
///////////////////////////////      
 -It has the capability of finding hidden bugs with some random combination.
 -Constraint-based randomization provides possible random values instead of a complete random range.
 -It provides flexibility to have random values based on user-defined probability.
 -SystemVerilog randomization provides flexibility to disable randomization for a particular variable in a class as well as disable particular constraints based on the requirement.
 -It saves time and effort in verification instead of writing a test for every possible scenario.

/////////////////////////////////////
   Uses of rand and randc Keywords:
////////////////////////////////////    
- To randomize a class object, the following keywords are used while declaring class variables.
  rand
  randc
- rand Keyword : On randomizing an object, the rand keyword provides uniformly distributed random values.
- syntax: rand bit [4:0] value; // values are between 0 to 31 
- On randomizing, any values within 5’h0 to 5’h1F will be generated with equal probability   
- randc Keyword : On randomizing an object, the randc keyword provides random value without repeating the same value unless a complete range is covered. 
- Once all values are covered, the value will repeat. This ensures that to have all possible values without repeating the same value unless every value is covered.
- Syntax : randc bit [1:0] value;   // Possible values = 0, 1, 2, 3
- Possible random value generated:  2, 3, 1, 0, 3, 2, 0, 1..
    
////////////////////////////////////////
  Need of Constraints in Randomizaion:
///////////////////////////////////////
- In a design-specific scenario, DUT works only for a particular range of inputs as per feature. 
- To satisfy this need, constraint becomes extremely important in randomization. Constraint block represents constraints for random variables. 
- Syntax for constraint block:         constraint <constraint_name> {<expression/ condition>; }
- Constraints block must have a unique name within a class.
- Constraint block can call a function to get constraint values as the return value from the function.
- Constraints are written inside curly braces.
- For a particular class, constraint blocks can be written inside a class or outside a class using extern keywords.
- Expressions or conditions can be written inside a constraint block.   

/////////////////////////////////////////
   Various types of Constraints: 
////////////////////////////////////////
- Inside keyword in constraints with rand Keyword
- Inside keyword in constraints with randc Keyword   
- If else in constraints
- Implication operator in constraint
- foreach loop in constraint
- Dist keyword in constraints
- Inheritance in constraint
- Function in constraint
- Disable randomization
- Static constraints
- Unique constraint
- Bidirectional constraint
- Solve Before in constraint
- Inline constraints
- Soft constraint
- Randomization methods
- randcase in SV

//////////////////////////////////////////////////////////////////////////////////////////////////////////
   Example1: Constraints Randomization -Using inside keyword + rand keyword
/////////////////////////////////////////////////////////////////////////////////////////////////////////
//The inside keyword is helpful when randomized values have to be in the provided range.
//The provided range in a bracket can be constant, parameter, define, or variable.
//Example1: Constraints Randomization -Using inside keyword + rand keyword
//Various ways/patterns to write inside constarints as below:
/*
Basic Syntax                           :  constraint <constraint_name> {<variable> inside {. . . .}; }
To specify range of values             :  constraint <constraint_name> {<variable> inside {[10:20]}; }
To specify set of values               :  constraint <constraint_name> {<variable> inside {40, 70, 80}; }
Combination of set of values and range :  constraint <constraint_name> {<variable> inside {4, 7, 8, [10:20], 25, 30, [40:70]}; }
Define based range in constraint       :  constraint <constraint_name> {<variable> inside {[`START_RANGE:`END_RANGE]}; }
Variable based range in constraint     :  constraint <constraint_name> {<variable> inside {[<var1>:<var2>]}; }
Parameter based range in constraint    :  constraint <constraint_name> {<variable> inside {[<param1>:<param2>]}; }
Inverted inside constraint             :  constraint <constraint_name> { !(<variable> inside {[10:20]}); }   
*/
   
`define START_RANGE 35
`define END_RANGE 45

class packet_item #(parameter int p1 = 10, p2 = 20);
  rand bit [7:0] value1; //8 bit means , 256 number of combinations (0-255)
  rand bit [7:0] value2;
  rand bit [7:0] value3;
  rand bit [7:0] value4;
  rand bit [7:0] value5;
  rand bit [7:0] value6;
  rand bit [7:0] value7;
  
  constraint value1_c {value1 inside {[10:20]};} // constant value based range
  
  constraint value2_c {value2 inside {40,70, 80};} // Set of values
  
  constraint value3_c {value3 inside {[10:20], 21, 23, [25:30], 40, 70, 80};} // Mix
  
  constraint value4_c {!(value4 inside {[100:200]});} // Inverted Range
  
  constraint value5_c {value5 inside {[value1:value2]};} // range using variable 
  
  constraint value6_c {value6 inside {[`START_RANGE:`END_RANGE]};} // Define based range
  
  constraint value7_c {value7 inside {[p1:p2]};} // parameter based range
  
endclass :packet_item

module constraint_example1;
  packet_item  item;
  //packet_item #(100, 200) item; //We can write like this , if we want to override the Original Parameter value some different value.
  
  
  initial begin
    item = new();
    
    repeat(3) begin
      item.randomize();
      //$display("value1 = %0d, value2 = %0d, value3 = %0d, value4 = %0d, value5 = %0d, value6 = %0d, value7 = %0d", item.value1, item.value2, item.value3, item.value4, item.value5, item.value6,  item.value7);
      $display("Printing : value1 = %0d ", item.value1);
      $display("Printing : value2 = %0d ", item.value2);
      $display("Printing : value3 = %0d ", item.value3);
      $display("Printing : value4 = %0d ", item.value4);
      $display("Printing : value5 = %0d ", item.value5);
      $display("Printing : value6 = %0d ", item.value6);
      $display("Printing : value7 = %0d ", item.value7);
      $display("****************************************************************************************************************************");
      $display("value1 = %0d, value2 = %0d, value3 = %0d, value4 = %0d, value5 = %0d, value6 = %0d, value7 = %0d", item.value1, item.value2, item.value3, item.value4, item.value5, item.value6,  item.value7);
      $display("****************************************************************************************************************************");
    end
  end
endmodule :constraint_example1

//Logfile Output
Printing : value1 = 16 
Printing : value2 = 40 
Printing : value3 = 20 
Printing : value4 = 208 
Printing : value5 = 33 
Printing : value6 = 43 
Printing : value7 = 10 
****************************************************************************************************************************
value1 = 16, value2 = 40, value3 = 20, value4 = 208, value5 = 33, value6 = 43, value7 = 10
****************************************************************************************************************************
Printing : value1 = 15 
Printing : value2 = 70 
Printing : value3 = 10 
Printing : value4 = 12 
Printing : value5 = 54 
Printing : value6 = 43 
Printing : value7 = 11 
****************************************************************************************************************************
value1 = 15, value2 = 70, value3 = 10, value4 = 12, value5 = 54, value6 = 43, value7 = 11
****************************************************************************************************************************
Printing : value1 = 14 
Printing : value2 = 70 
Printing : value3 = 17 
Printing : value4 = 240 
Printing : value5 = 32 
Printing : value6 = 40 
Printing : value7 = 15 
****************************************************************************************************************************
value1 = 14, value2 = 70, value3 = 17, value4 = 240, value5 = 32, value6 = 40, value7 = 15
****************************************************************************************************************************
           V C S   S i m u l a t i o n   R e p o r t 
   
//////////////////////////////////////////////////////////////////////////////////////////////////////////
   Example2: Constraints Randomization -Implement 'randc' function in SystemVerilog
/////////////////////////////////////////////////////////////////////////////////////////////////////////   
//In the below example implementation, the my_randc function is used to mimic randc behavior for 3 bits ‘data‘  variable. 
//The ‘mask‘ having a width of 8 bits (= 2^3) is used to check whether the data value has been covered already or not.
module tb_top;
  bit [2:0] data;  // variable which provide random value
  bit [7:0] mask;

  function bit [2:0] my_randc;
    while(1) begin
      data = $random;
      if(!mask[data]) begin
        mask[data] = 1;
        return data;
      end
      else if(&mask) begin 
        mask = 0;
        mask[data] = 1;
        break;
      end
    end
    return data;
  endfunction :my_randc
  
  initial begin
    repeat(3) begin
      repeat(8)
        $display("data = %0d", my_randc());
      $display("------------");
    end
  end
endmodule : tb_top   

//Logfile Output
data = 4
data = 1
data = 3
data = 5
data = 2
data = 6
data = 7
data = 0
------------
data = 5
data = 4
data = 3
data = 2
data = 0
data = 6
data = 7
data = 1
------------
data = 0
data = 1
data = 3
data = 6
data = 4
data = 2
data = 5
data = 7
------------
           V C S   S i m u l a t i o n   R e p o r t       
   
//////////////////////////////////////////////////////////////////////////////////////////////////////////
 Example3: Constraints Randomization : Constraints Randomization -Using inside keyword + randc keyword
/////////////////////////////////////////////////////////////////////////////////////////////////////////   
`define START_RANGE 3
`define END_RANGE 5

class packet_item #(parameter int p1 = 5, p2 = 7);
  randc bit [2:0] value1; //3 bit means , 8 number of combinations (0-7)
  randc bit [2:0] value2;
  randc bit [2:0] value3;
  randc bit [2:0] value4;
  randc bit [2:0] value5;
  randc bit [2:0] value6;
  randc bit [2:0] value7;
  
  constraint value1_c {value1 inside {[1:3]};} // constant value based range
  
  constraint value2_c {value2 inside {4,6,7};} // Set of values
  
  constraint value3_c {value3 inside {[0:2], 3, 5, [6:7]};} // Mix
  
  constraint value4_c {!(value4 inside {[5:7]});} // Inverted Range
  
  constraint value5_c {value5 inside {[value1:value2]};} // range using variable 
  
  constraint value6_c {value6 inside {[`START_RANGE:`END_RANGE]};} // Define based range
  
  constraint value7_c {value7 inside {[p1:p2]};} // parameter based range
  
endclass :packet_item

module constraint_example;
  packet_item  item;
  //packet_item #(100, 200) item; //We can write like this , if we want to override the Original Parameter value some different value.
   
  initial begin
    item = new();
    
    repeat(10) begin
      item.randomize();
      /*
      $display("Printing : value1 = %0d ", item.value1);
      $display("Printing : value2 = %0d ", item.value2);
      $display("Printing : value3 = %0d ", item.value3);
      $display("Printing : value4 = %0d ", item.value4);
      $display("Printing : value5 = %0d ", item.value5);
      $display("Printing : value6 = %0d ", item.value6);
      $display("Printing : value7 = %0d ", item.value7);
      */
      $display("****************************************************************************************************************************");
      $display("value1 = %0d, value2 = %0d, value3 = %0d, value4 = %0d, value5 = %0d, value6 = %0d, value7 = %0d", item.value1, item.value2, item.value3, item.value4, item.value5, item.value6,  item.value7);
      $display("****************************************************************************************************************************");
    end
  end
endmodule
      
//Logfile Output
****************************************************************************************************************************
value1 = 2, value2 = 6, value3 = 7, value4 = 0, value5 = 2, value6 = 5, value7 = 5
****************************************************************************************************************************
****************************************************************************************************************************
value1 = 3, value2 = 4, value3 = 3, value4 = 4, value5 = 3, value6 = 3, value7 = 6
****************************************************************************************************************************
****************************************************************************************************************************
value1 = 1, value2 = 7, value3 = 2, value4 = 1, value5 = 6, value6 = 4, value7 = 7
****************************************************************************************************************************
****************************************************************************************************************************
value1 = 3, value2 = 4, value3 = 5, value4 = 2, value5 = 4, value6 = 5, value7 = 6
****************************************************************************************************************************
****************************************************************************************************************************
value1 = 2, value2 = 7, value3 = 0, value4 = 3, value5 = 3, value6 = 3, value7 = 5
****************************************************************************************************************************
****************************************************************************************************************************
value1 = 1, value2 = 6, value3 = 1, value4 = 4, value5 = 5, value6 = 4, value7 = 7
****************************************************************************************************************************
****************************************************************************************************************************
value1 = 2, value2 = 7, value3 = 6, value4 = 0, value5 = 2, value6 = 4, value7 = 5
****************************************************************************************************************************
****************************************************************************************************************************
value1 = 3, value2 = 6, value3 = 1, value4 = 1, value5 = 3, value6 = 3, value7 = 6
****************************************************************************************************************************
****************************************************************************************************************************
value1 = 1, value2 = 4, value3 = 5, value4 = 2, value5 = 4, value6 = 5, value7 = 7
****************************************************************************************************************************
****************************************************************************************************************************
value1 = 1, value2 = 6, value3 = 7, value4 = 3, value5 = 3, value6 = 5, value7 = 7
****************************************************************************************************************************
           V C S   S i m u l a t i o n   R e p o r t       

//////////////////////////////////////////////////////////////////////////////////////////////////////////
   Example4: Constraints Randomization -If else in constraints
/////////////////////////////////////////////////////////////////////////////////////////////////////////   
//Based on the If-else condition, values for the variable can be assigned. It is similar to a normal if-else condition.
class packet_item;
  rand bit [7:0] value;
  rand enum {LOW, HIGH} scale;

  constraint scale_c { if(scale == LOW) value < 50;
                       else             value >= 50;
                     }
endclass :packet_item

module constraint_example4;
  packet_item pkt;
  
  initial begin
    pkt = new();
    
    repeat(5) begin
      pkt.randomize();
      $display("scale = %s, value = %0d", pkt.scale.name(), pkt.value);
    end
  end
endmodule :constraint_example4
      
//Logfile Output
scale = HIGH, value = 150
scale = HIGH, value = 121
scale = HIGH, value = 192
scale = HIGH, value = 104
scale = LOW, value = 34
           V C S   S i m u l a t i o n   R e p o r t       

//////////////////////////////////////////////////////////////////////////////////////////////////////////
   Example5: Constraints Randomization -Using if-else if-else
/////////////////////////////////////////////////////////////////////////////////////////////////////////   
class packet_item;
  rand bit [7:0] value;
  rand enum {LOW, MID, HIGH} scale;

  constraint scale_c { if(scale == LOW) value < 30;
                       else if(scale == MID) { value >= 30; value <= 70; }
                       else value > 70;
                     }
endclass :packet_item

module constraint_example5;
  packet_item pkt;
  
  initial begin
    pkt = new();
    
    repeat(10) begin
      pkt.randomize();
      $display("scale = %s, value = %0d", pkt.scale.name(), pkt.value);
    end
  end
endmodule :constraint_example5
      
//Logfile Output
scale = HIGH, value = 150
scale = HIGH, value = 124
scale = HIGH, value = 192
scale = MID, value = 69
scale = MID, value = 36
scale = HIGH, value = 118
scale = LOW, value = 18
scale = MID, value = 47
scale = MID, value = 67
scale = HIGH, value = 150
           V C S   S i m u l a t i o n   R e p o r t       

//////////////////////////////////////////////////////////////////////////////////////////////////////////
   Example6: Constraints Randomization - Using conditional operator (Will work like if -else condition)
/////////////////////////////////////////////////////////////////////////////////////////////////////////   
//Example6: Constraints Randomization - Using conditional operator (Will work like if -else condition)
class packet_item;
  rand bit [7:0] value;
  rand enum {LOW, HIGH} scale;

  constraint c1 { value == ((scale == LOW) ? 20: 90); }
  
endclass : packet_item

module constraint_example6;
  packet_item pkt;
  
  initial begin
    pkt = new();
    
    repeat(5) begin
      pkt.randomize();
      $display("scale = %s, value = %0d", pkt.scale.name(), pkt.value);
    end
  end
endmodule :constraint_example6
                                                                     
//Logfile Output
scale = HIGH, value = 90
scale = LOW, value = 20
scale = HIGH, value = 90
scale = LOW, value = 20
scale = LOW, value = 20
           V C S   S i m u l a t i o n   R e p o r t                                                                      

//////////////////////////////////////////////////////////////////////////////////////////////////////////
   Example7: Constraints Randomization -Implication operator in constraint
/////////////////////////////////////////////////////////////////////////////////////////////////////////   
//Implication operator (->) declares the relation between two variables.
//For an implication operator in constraint, it declares the relation between expression and constraint.
//If the LHS expression of -> holds true, the RHS constraint is considered.
//Syntax: <expression> -> <constraint>

class packet_item;
  rand bit [3:0] value;
  rand enum {LOW, HIGH} scale;

  constraint scale_c { (scale == LOW) -> value <10; }
endclass :packet_item

module constraint_example7;
  packet_item pkt;
  
  initial begin
    pkt = new();
    
    repeat(5) begin
      pkt.randomize();
      $display("scale = %s, value = %0d", pkt.scale.name(), pkt.value);
    end
  end
endmodule :constraint_example7

//Logfile Output
scale = HIGH, value = 11
scale = HIGH, value = 1
scale = LOW, value = 8
scale = HIGH, value = 0
scale = LOW, value = 1
           V C S   S i m u l a t i o n   R e p o r t                                                                      

//////////////////////////////////////////////////////////////////////////////////////////////////////////
   Example8: Constraints Randomization -foreach loop in constraint
/////////////////////////////////////////////////////////////////////////////////////////////////////////   

//Same as foreach loop, array constraints can also be implemented using foreach loop to iterate over array elements.
//Syntax: constraint <constraint_name> { foreach(variable[i]) 
//                                             variable[i] <condition>
//                                        }

typedef enum {LOW, MID1, MID2, HIGH} scale;

class packet_item;
  rand bit [7:0] value[scale];
  rand bit [3:0] array[];
  
  constraint val_arr_size_c { value.size() == 4;} 
    
  constraint value_arr_c  { foreach(value[i]) {
                             value[i] < 100;
                             (i == LOW) -> value[i] < 30;
                             (i == HIGH) -> value[i] > 70;
                             (i == MID1) -> value[i] inside {[30:50]};
                             (i == MID2) -> value[i] inside {[51:70]};
                           }
                         }
    
  constraint array_size_c {array.size() inside {[2:5]};}
  
  constraint array_c    { foreach(array[i]) 
                              { array[i] > i*i; } 
                        }
    
endclass : packet_item

module constraint_example8;
  packet_item pkt;
  
  initial begin
    pkt = new();
    
    repeat(5) begin
      pkt.randomize();
      foreach(pkt.value[i]) begin
        $display("value[%s] = %0d", i.name(), pkt.value[i]);
      end
      foreach(pkt.array[i]) begin
        $display("array[%0d] = %0d", i, pkt.array[i]);
      end
      $display("***************************************");
    end
  end
endmodule :constraint_example8

//Logfile Output
value[LOW] = 10
value[MID1] = 30
value[MID2] = 67
value[HIGH] = 73
array[0] = 8
array[1] = 8
***************************************
value[LOW] = 8
value[MID1] = 44
value[MID2] = 67
value[HIGH] = 85
array[0] = 6
array[1] = 10
***************************************
value[LOW] = 24
value[MID1] = 30
value[MID2] = 59
value[HIGH] = 94
array[0] = 4
array[1] = 7
array[2] = 12
array[3] = 14
***************************************
value[LOW] = 16
value[MID1] = 34
value[MID2] = 60
value[HIGH] = 81
array[0] = 13
array[1] = 12
array[2] = 9
array[3] = 13
***************************************
value[LOW] = 2
value[MID1] = 34
value[MID2] = 64
value[HIGH] = 88
array[0] = 6
array[1] = 7
array[2] = 13
***************************************
           V C S   S i m u l a t i o n   R e p o r t                          
//////////////////////////////////////////////////////////////////////////////////////////////////////////
  Example9: Constraints Randomization -Distribution constraint using dist keyword
/////////////////////////////////////////////////////////////////////////////////////////////////////////   
//The dist keyword is helpful whenever to have weighed distribution during randomization.
//The probability occurrence of random values can be controlled using the dist keyword.
//How to allocate weighted distribution?
//There are two ways to provide weightage for values.
//Using :/ operator
//Using := operator

//Syntax for the operator:
//value :/ weightage
//value := weightage
//Where ,Value - Random value of the variable
//Where, Weightage - weight for random variable i.e. occurrence of value can be specified.

//:/ operator
//For specific value: Assign mentioned weight to that value
//For range of values ([<range1>: <range2>]):  Assigns weight/(number of value) to each value in that range

//:= operator
//For a specific value or range of value, the mentioned weight is assigned.

class packet_item;
  rand bit [7:0] value1;
  rand bit [7:0] value2;

  constraint value1_c {value1 dist {3:/4, [5:8] :/ 7}; }
  constraint value2_c {value2 dist {3:=4, [5:8] := 7}; }

endclass : packet_item

module constraint_example9;
  packet_item pkt;
  
  initial begin
    pkt = new();
    
    repeat(5) begin
      pkt.randomize();
      $display("value1 (with :/) = %0d, value2 (with :=)= %0d", pkt.value1, pkt.value2);
    end
  end
endmodule :constraint_example9
                         
//Logfile Output
value1 (with :/) = 3, value2 (with :=)= 8
value1 (with :/) = 5, value2 (with :=)= 5
value1 (with :/) = 3, value2 (with :=)= 7
value1 (with :/) = 3, value2 (with :=)= 6
value1 (with :/) = 3, value2 (with :=)= 6
           V C S   S i m u l a t i o n   R e p o r t                         

////////////////////////////////////////////////////////////////////////////////////////////////////////////////
   Example10: Constraints Randomization - Inheritance in constraint (with out any constraint in Derived class)
////////////////////////////////////////////////////////////////////////////////////////////////////////////////  
// So Here in Derived class , It will take the base class constraints . Its Obvious , Due to Simple inheritance 

class base_class;
  rand bit [5:0] value;
  constraint value_c1 {value > 0; value < 10;}
endclass :base_class

class derived_class extends base_class;
  //constraint value_c2 {value inside {[10:30]};}
endclass :derived_class

module constraint_example10;
  base_class    b;
  derived_class d;
  
  initial begin
    b = new();
    d = new();
    repeat(3) begin
      b.randomize();
      $display("FROM_BASE_CLASS : value = %0d", b.value); // For Base class , it will take the values between 0 to 10
    end
    $display("*****************************************");
    repeat(3) begin
      d.randomize();
      $display("FROM_DERIVED_CLASS: value = %0d", d.value); // For Derived class also , it will take the values between 0 to 10
    end
  end
endmodule :constraint_example10
                         
//Logfile Output
FROM_BASE_CLASS : value = 2
FROM_BASE_CLASS : value = 3
FROM_BASE_CLASS : value = 6
*****************************************
FROM_DERIVED_CLASS: value = 1
FROM_DERIVED_CLASS: value = 9
FROM_DERIVED_CLASS: value = 3
           V C S   S i m u l a t i o n   R e p o r t                          
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  Example11: Constraints Randomization - Inheritance in constraint ( By using both Base and Derived class constraint with Different Name)
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////   
//If we clearly observe here , Here the Base class and Derived class Constraint name are different as well as constraint for both class also different
// Hence , Constraint error is Expected . [Constraints are inconsistent and cannot be solved]

class base_class;
  rand bit [5:0] value;
  constraint value_c1 {value > 0; value < 10;}
endclass :base_class

class derived_class extends base_class;
  constraint value_c2 {value inside {[10:30]};}
endclass :derived_class

module constraint_example11;
  base_class    b;
  derived_class d;
  
  initial begin
    b = new();
    d = new();
    repeat(3) begin
      b.randomize();
      $display("FROM_BASE_CLASS : value = %0d", b.value);
    end
    $display("*****************************************");
    repeat(3) begin
      d.randomize();
      $display("FROM_DERIVED_CLASS: value = %0d", d.value);
    end
  end
endmodule :constraint_example11

//Logfile Output
Error-[CNST-CIF] Constraints inconsistency failure
testbench.sv, 27
  Constraints are inconsistent and cannot be solved.
  Please check the inconsistent constraints being printed above and rewrite 
  them.

FROM_DERIVED_CLASS: value = 0
           V C S   S i m u l a t i o n   R e p o r t      
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
   Example12: Constraints Randomization - Inheritance in constraint ( By using both Base and Derived class constraint With Same Name)
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////   
//Constraint blocks for a Base class can be overridden by its Derived class. -This is called as constraint Overriding
//Thus, the Inherited class can modify constraints based on the requirement. 
//NOTE- To do the same, constraint block nomenclature/Constraint Name must be the same
class base_class;
  rand bit [5:0] value;
  constraint value_c1 {value > 0; value < 10;}
endclass :base_class

class derived_class extends base_class;
  constraint value_c1 {value inside {[10:30]};}
endclass :derived_class

module constraint_example12;
  base_class    b;
  derived_class d;
  
  initial begin
    b = new();
    d = new();
    repeat(3) begin
      b.randomize();
      $display("FROM_BASE_CLASS : value = %0d", b.value);
    end
    $display("*****************************************");
    repeat(3) begin
      d.randomize();
      $display("FROM_DERIVED_CLASS: value = %0d", d.value);
    end
  end
endmodule :constraint_example12

//Log File Output
Contains Synopsys proprietary information.
Compiler version X-2025.06-SP1_Full64; Runtime version X-2025.06-SP1_Full64;  Mar 22 09:21 2026
Warning : License for product VCS-BASE-RUNTIME will expire within 9 days, on: 30-mar-2026.

If you would like to temporarily disable this message, set 
 the VCS_LIC_EXPIRE_WARNING environment variable to the number of days
before expiration that you want this message to start (the minimum is 0).
FROM_BASE_CLASS : value = 2
FROM_BASE_CLASS : value = 3
FROM_BASE_CLASS : value = 6
*****************************************
FROM_DERIVED_CLASS: value = 11
FROM_DERIVED_CLASS: value = 30
FROM_DERIVED_CLASS: value = 14
           V C S   S i m u l a t i o n   R e p o r t       

//////////////////////////////////////////////////////////////////////////////////////////////////////////
   Example13: Constraints Randomization -Function in constraint
/////////////////////////////////////////////////////////////////////////////////////////////////////////   
//Sometimes constraint value has to be decided based on a mathematical model or some certain calculations. 
//There is a possibility where calculation may differ based on input provided.
//Writing a complete code inside a constraint block may create confusion. 
//So, a separate function can be written which has these mathematical calculations. 
//A function can be called in various constraints by passing input arguments. 
//The same function can be used as a method call by a created object or by the inherited child class

class packet_item;
  rand bit [5:0] value;
  rand bit sel;
  constraint value_c {value == get_values(sel);}
  
  function bit [5:0] get_values(bit sel);
    return (sel? 'h10: 'h20);
  endfunction
endclass :packet_item

module constraint_example13;
  packet_item pkt;
  
  initial begin
    pkt = new();
    
    repeat(3) begin
      pkt.randomize();
      $display("constraint: sel=%0d value = %0h", pkt.sel,pkt.value);
    end
    $display("On functiopn call: value = %0h", pkt.get_values(1));
  end
endmodule :constraint_example13

//Logfile Output
Contains Synopsys proprietary information.
Compiler version X-2025.06-SP1_Full64; Runtime version X-2025.06-SP1_Full64;  Mar 22 09:23 2026
Warning : License for product VCS-BASE-RUNTIME will expire within 9 days, on: 30-mar-2026.

If you would like to temporarily disable this message, set 
 the VCS_LIC_EXPIRE_WARNING environment variable to the number of days
before expiration that you want this message to start (the minimum is 0).
constraint: sel=1 value = 10
constraint: sel=0 value = 20
constraint: sel=1 value = 10
On functiopn call: value = 10
           V C S   S i m u l a t i o n   R e p o r t       

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
   Example14: Constraints Randomization -Disable Randomization (Complete class randomization on/off using rand_mode() ,Means Disable/enable class Randomization )
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////       
//Randomization can be disabled using the rand_mode method.
//rand_mode() is a function which returns 1 if randomization is enabled else returns 0.
//By default, rand_mode is enabled. I.e. rand_mode(1)
//To disable randomization, rand_mode(0) is used.
//Randomization can be enabled once again for the previously disabled case.
//Randomization needs to be disabled or enabled (if disabled before) before calling the randomize() method.
//Methods of using rand_mode
//Complete class randomization can be disabled           <object_handle>.rand_mode(0);
//Particular variable randomization can be disabled      <object_handle>.<variable>.rand_mode(0);

class packet_item;
  rand bit [7:0] value1;
  rand bit [7:0] value2;

  constraint value1_c {value1 inside {[10:30]};}
  constraint value2_c {value2 inside {40,70, 80};}

endclass :packet_item

module constraint_example14;
  packet_item pkt;
  
  initial begin
    pkt = new();
    
    pkt.randomize();
    $display("Before disabling randomization: value1 = %0d, value2 = %0d", pkt.value1, pkt.value2);
    
    pkt.rand_mode(0);  // To disable randomization for all class variables
    pkt.randomize();
    $display("After disabling randomization for all variables in a class (Retain old values): value1 = %0d, value2 = %0d", pkt.value1, pkt.value2);
    
    pkt.rand_mode(1);  // To enable randomization
    pkt.randomize();
    $display("After enabling randomization: value1 = %0d, value2 = %0d", pkt.value1, pkt.value2);
    
    pkt.value2.rand_mode(0);  // To disable randomization for value2 variable alone
    pkt.randomize();
    $display("After disabling randomization for value2 variables in a class: value1 = %0d, value2 = %0d", pkt.value1, pkt.value2);
    
    $display("rand_mode function returns for value1 = %0d, value2 = %0d", pkt.value1.rand_mode(), pkt.value2.rand_mode());
  end
endmodule :constraint_example14  

 //Logfile Output 
Before disabling randomization: value1 = 14, value2 = 70
After disabling randomization for all variables in a class (Retain old values): value1 = 14, value2 = 70
After enabling randomization: value1 = 15, value2 = 80
After disabling randomization for value2 variables in a class: value1 = 22, value2 = 80
rand_mode function returns for value1 = 1, value2 = 0
           V C S   S i m u l a t i o n   R e p o r t 
      
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
   Example15: Constraints Randomization -Disable Randomization ( using constraint_mode() ,Means Disable/enable constraint in class) 
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////     
//Disable Constraint
//Similar to disabling randomization, the constraint can also be disabled.
//constraint_mode() is a function which returns 1 if constraint is enabled and else returns 0.
//By default, constraint mode is enabled i.e. constraint_mode(1)
//To disable constraint, constraint_mode(0) is used.
//A constraint can be enabled once again for the previously disabled case.
//A Constraint needs to be disabled or enabled (if disabled before) before calling the randomize() method.

class packet_item;
  rand bit [7:0] value1;
  rand bit [7:0] value2;

  constraint value1_c {value1 inside {[10:30]};}
  constraint value2_c {value2 inside {40,70, 80};}

endclass :packet_item

module constraint_example15;
  packet_item pkt;
  
  initial begin
    pkt = new();
    
    pkt.randomize();
    $display("Before disabling constraint");
    $display("PKT: value1 = %0d, value2 = %0d", pkt.value1, pkt.value2);
        
    pkt.value2_c.constraint_mode(0);  // To disable constraint for value2 using handle item2
    pkt.randomize();
    $display("After disabling constraint for all value2 alone");
    $display("PKT: value1 = %0d, value2 = %0d", pkt.value1, pkt.value2);
    $display("constraint_mode function returns for value1 = %0d, value2 = %0d",pkt.value1_c.constraint_mode(), pkt.value2_c.constraint_mode());
  end
endmodule :constraint_example15   
      
//Logfile Output
Before disabling constraint
PKT: value1 = 14, value2 = 70
After disabling constraint for all value2 alone
PKT: value1 = 15, value2 = 63
constraint_mode function returns for value1 = 1, value2 = 0
           V C S   S i m u l a t i o n   R e p o r t       

//////////////////////////////////////////////////////////////////////////////////////////////////////////
   Example16: Constraints Randomization - Static constraints
/////////////////////////////////////////////////////////////////////////////////////////////////////////     
//A static constraint is shared across all class instances. It is similar to a static variable in a class.
//Syntax:  static constraint <constraint name> {. . .;}
//The below example has a class with two variables. 
//Value2 has static constraint enabled.
//Two separate objects are created to notice that constraint for value2 solves to give the same value for both class objects.
//whereas non-static constraint for value1 solves to give different values. 
//On disabling static constraint, randomizing value2 has given different values.
//This clearly shows static constraint is shared across all class instances.

class packet_item;
  rand bit [7:0] value1;
  rand bit [7:0] value2;

  constraint value1_c {value1 inside {[10:30]};}
  static constraint value2_c {value2 inside {40,70, 80};}

endclass :packet_item

module constraint_example16;
  packet_item pkt1, pkt2;
  
  initial begin
    pkt1 = new();
    pkt2 = new();
    
    pkt1.randomize();
    pkt2.randomize();
    $display("Before disabling constraint");
    $display("item1: value1 = %0d, value2 = %0d", pkt1.value1, pkt1.value2);
    $display("item2: value1 = %0d, value2 = %0d", pkt2.value1, pkt2.value2);
    
    pkt2.value2_c.constraint_mode(0);  // To disable constraint for value2 using handle item2
    pkt1.randomize();
    pkt2.randomize();
    $display("After disabling constraint for all value2 alone");
    $display("item1: value1 = %0d, value2 = %0d", pkt1.value1, pkt1.value2);
    $display("item2: value1 = %0d, value2 = %0d", pkt2.value1, pkt2.value2);
  end
endmodule :constraint_example16

//Logfile Output
Before disabling constraint
item1: value1 = 14, value2 = 70
item2: value1 = 11, value2 = 70
After disabling constraint for all value2 alone
item1: value1 = 15, value2 = 63
item2: value1 = 30, value2 = 72
           V C S   S i m u l a t i o n   R e p o r t       
      
//////////////////////////////////////////////////////////////////////////////////////////////////////////
   Example17: Constraints Randomization - unique constraint
/////////////////////////////////////////////////////////////////////////////////////////////////////////     
//As the name suggests, a unique constraint is useful to generate unique values for variables and elements in an array (Fixed array, associative array, dynamic array, and queue)
//Syntax:   constraint <constraint name> {unique {array or variable};}
typedef enum {M0, M1, M2, M3} scale_e;

class packet_item;
  rand bit [7:0] value[scale_e];
  rand bit [3:0] array[5];
  rand bit [2:0] val1, val2, val3, val4;
  scale_e scale;
  
  constraint array_c   { unique {array}; }
  constraint value_c { unique {value}; 
                         value.size == scale.num;
                         foreach (value[i]) 
                           value[i] inside {[50:60]}; 
                       }
  constraint val_c {unique {val1, val2, val3, val4}; }
  
endclass :packet_item

module constraint_example17;
  packet_item pkt;
  
  initial begin
    pkt = new();
    
    repeat(5) begin
      pkt.randomize();
      $display("val1 = %0d, val2 = %0d, val3 = %0d, val4 = %0d", pkt.val1, pkt.val2, pkt.val3, pkt.val4);
      foreach(pkt.value[i]) begin
        $display("value[%s] = %0d", i.name(), pkt.value[i]);
      end
      foreach(pkt.array[i]) begin
        $display("array[%0d] = %0d", i, pkt.array[i]);
      end
      $display("************************************************************************************");
    end
  end
endmodule :constraint_example17
   
//Logfile Output
val1 = 7, val2 = 4, val3 = 5, val4 = 3
value[M0] = 60
value[M1] = 53
value[M2] = 58
value[M3] = 56
array[0] = 14
array[1] = 3
array[2] = 15
array[3] = 6
array[4] = 9
************************************************************************************
val1 = 1, val2 = 2, val3 = 7, val4 = 3
value[M0] = 51
value[M1] = 58
value[M2] = 53
value[M3] = 52
array[0] = 2
array[1] = 3
array[2] = 13
array[3] = 9
array[4] = 12
************************************************************************************
val1 = 4, val2 = 7, val3 = 2, val4 = 1
value[M0] = 60
value[M1] = 56
value[M2] = 50
value[M3] = 53
array[0] = 2
array[1] = 4
array[2] = 10
array[3] = 14
array[4] = 7
************************************************************************************
val1 = 5, val2 = 2, val3 = 4, val4 = 3
value[M0] = 57
value[M1] = 55
value[M2] = 53
value[M3] = 58
array[0] = 2
array[1] = 15
array[2] = 10
array[3] = 13
array[4] = 5
************************************************************************************
val1 = 3, val2 = 1, val3 = 4, val4 = 7
value[M0] = 50
value[M1] = 57
value[M2] = 58
value[M3] = 54
array[0] = 13
array[1] = 12
array[2] = 9
array[3] = 11
array[4] = 2
************************************************************************************
           V C S   S i m u l a t i o n   R e p o r t       

//////////////////////////////////////////////////////////////////////////////////////////////////////////
   Example18: Constraints Randomization - Bidirectional constraint
/////////////////////////////////////////////////////////////////////////////////////////////////////////     
//SystemVerilog solves constraints parallelly for all random variables and makes sure no constraint fails.
//While solving the constraint, the value of a variable can be impacted because of another variable

class packet_item;
  rand bit [7:0] val1, val2, val3, val4;
  rand bit t1, t2;
  
  constraint val_c {val2 > val1; 
                    val3 == val2 - val1;
                    val4 < val3;
                    val4 == val1/val3; 
                   }
  
  constraint t_c { (t1 == 1) -> t2 == 0;}
endclass :packet_item

module constraint_example18;
  packet_item pkt;
  
  initial begin
    pkt = new();
    
    repeat(5) begin
      pkt.randomize();
      $display("val1 = %0d, val2 = %0d, val3 = %0d, val4 = %0d", pkt.val1, pkt.val2, pkt.val3, pkt.val4);
      $display("t1 = %0h, t2 = %0h", pkt.t1, pkt.t2);
    end
  end
endmodule :constraint_example18
      
//Logfile Output
val1 = 117, val2 = 208, val3 = 91, val4 = 1
t1 = 0, t2 = 0
val1 = 116, val2 = 254, val3 = 138, val4 = 0
t1 = 1, t2 = 0
val1 = 14, val2 = 21, val3 = 7, val4 = 2
t1 = 0, t2 = 0
val1 = 46, val2 = 187, val3 = 141, val4 = 0
t1 = 0, t2 = 1
val1 = 97, val2 = 128, val3 = 31, val4 = 3
t1 = 0, t2 = 1
           V C S   S i m u l a t i o n   R e p o r t       

//////////////////////////////////////////////////////////////////////////////////////////////////////////
   Example19: Constraints Randomization - Solve Before in constraints (Example without solve before)
/////////////////////////////////////////////////////////////////////////////////////////////////////////     
//As discussed in the bidirectional constraint, there is a possibility that the value of a variable can impact another variable value due to the bidirectional nature.
//By default, a constraint solver has an equal probability solving algorithm.
//In certain cases, there is a requirement to solve constraints in a certain order. This changes the probability of value occurrence.
//Important things to note:
//The dependency order of variables should not be bidirectional.
//For example:  solve x before y; and solve y before x;  // This is not allowed
//randc is not allowed.
//Only integers are allowed.
class packet_item;
  rand bit [7:0] val;
  rand bit en;
  
  constraint en_c { if(en == 1) { val inside {[0:100]}; } }
endclass :packet_item

module constraint_example19;
  packet_item pkt;
  
  initial begin
    pkt = new();
    
    repeat(5) begin
      pkt.randomize();
      $display("en = %0d, val = %0d", pkt.en, pkt.val);
    end
  end
endmodule :constraint_example19
                   
//Logfile Output
en = 0, val = 150
en = 0, val = 115
en = 0, val = 64
en = 0, val = 209
en = 0, val = 18
           V C S   S i m u l a t i o n   R e p o r t                          
//////////////////////////////////////////////////////////////////////////////////////////////////////////
   Example20: Constraints Randomization - Solve Before in constraints (Example with solve before)

/////////////////////////////////////////////////////////////////////////////////////////////////////////     
class packet_item;
  rand bit [7:0] val;
  rand bit en;
  
  constraint en_c { solve en before val;
                    if(en == 1) { val inside {[0:100]}; }
                  }
endclass :packet_item

module constraint_example20;
  packet_item pkt;
  
  initial begin
    pkt = new();
    
    repeat(5) begin
      pkt.randomize();
      $display("en = %0d, val = %0d", pkt.en, pkt.val);
    end
  end
endmodule :constraint_example20

//Logfile Output
en = 1, val = 11
en = 0, val = 115
en = 1, val = 32
en = 0, val = 209
en = 0, val = 18
           V C S   S i m u l a t i o n   R e p o r t                    
//////////////////////////////////////////////////////////////////////////////////////////////////////////
  Example21: Constraints Randomization - Inline constraints
/////////////////////////////////////////////////////////////////////////////////////////////////////////     
//Till now, what we have seen about writing a constraint in class. 
//There is a possibility that constraints need to be modified during randomization.
//An example could be scenario generation with a specific value as shown below example.
//The important thing to note that inline constraints do not override constraints written inside the class. 
//Constraint solver considers both constraints inside the class and inline constraints. 
//Any conflict in these constraints leads to randomization failure. How to resolve randomization failure can be discussed in soft constraint. 
//An inline constraint is written on calling a randomize() method using the “with” keyword.
class packet_item;
  rand bit [7:0] val1, val2;
 
  constraint val1_c {val1 > 100; val1 < 200;}
  constraint val2_c {val2 > 5; val2 < 80;}
  
endclass :packet_item

module constraint_example21;
  packet_item pkt;
  
  initial begin
    pkt = new();
    
    repeat(5) begin
      pkt.randomize();
      $display("Before inline constraint: val1 = %0d, val2 = %0d", pkt.val1, pkt.val2);
           
      pkt.randomize with {val1 > 150; val1 < 160;};
      pkt.randomize with {val2 inside {[10:15]};};
      $display("After inline constraint: val1 = %0d, val2 = %0d", pkt.val1, pkt.val2);
      $display("****************************************************************");
    end
  end
endmodule :constraint_example21

//Logfile Output
Before inline constraint: val1 = 121, val2 = 75
After inline constraint: val1 = 161, val2 = 12
****************************************************************
Before inline constraint: val1 = 176, val2 = 42
After inline constraint: val1 = 113, val2 = 13
****************************************************************
Before inline constraint: val1 = 194, val2 = 76
After inline constraint: val1 = 161, val2 = 13
****************************************************************
Before inline constraint: val1 = 128, val2 = 42
After inline constraint: val1 = 104, val2 = 14
****************************************************************
Before inline constraint: val1 = 114, val2 = 79
After inline constraint: val1 = 179, val2 = 15
****************************************************************
           V C S   S i m u l a t i o n   R e p o r t                    

//////////////////////////////////////////////////////////////////////////////////////////////////////////
   Example22: Constraints Randomization - Without Soft Constraint
/////////////////////////////////////////////////////////////////////////////////////////////////////////     
//Soft constraint
//As discussed in inline constraint, it is possible to change constraints during randomization and inline constraints should not conflict with constraints written in the class to avoid randomization failure. 
//But sometimes there is a requirement to change constraints in such a way that it may conflict with constraints inside the class. 
//For example, in the case of an error injection scenario, the variable value has to be randomized out of valid values to generate error scenarios.
//This can be done by using soft constraints to avoid randomization failures.
//By default, constraints are hard constraints in nature. 
//To mention constraints as a soft, specifically “soft” keyword has to be used.
class packet_item;
  rand bit [7:0] val;
 
  constraint val_c {val inside {5, [10:15]};}
endclass :packet_item

module constraint_example22;
  packet_item pkt;
  
  initial begin
    pkt = new();
    
    repeat(5) begin
      pkt.randomize();
      $display("Before inline constraint: val = %0d", pkt.val);
           
      pkt.randomize with {val inside {[20:30]};};
      $display("After inline constraint: val = %0d", pkt.val);
      $display("*********************************************");
    end
  end
endmodule :constraint_example22
                   
//Logfile Output
=======================================================

Solver failed when solving following set of constraints 


rand bit[7:0] val; // rand_mode = ON 

constraint val_c    // (from this) (constraint_mode = ON) (testbench.sv:15)
{
   (val inside {5, [10:15]});
}
constraint WITH_CONSTRAINT    // (from this) (constraint_mode = ON) (testbench.sv:28)
{
   (val inside {[20:30]});
}

=======================================================
Note-[CNST-SATE] Standalone test extracted
  A standalone test-case for this failure has automatically been extracted 
  from randomize serial 2 partition 1.
  To reproduce the error using the extracted testcase, please use the 
  following command:
  cd /home/runner/./simv.cst/testcases;
  vcs -sverilog extracted_r_2_p_1_inconsistent_constraints.sv -R
  To reproduce the error using the original design and verbose logging, re-run
  simulation using:
  simv +ntb_solver_debug=trace +ntb_solver_debug_filter=2
  To reproduce the error using the original design and debug the error with 
  Verdi/DVE:
  1. re-compile the original design with -debug_access+all, if not already 
  done so
  	% vcs -debug_access+all <other options>
  2. re-run the simulation interactively with -gui/-verdi
  	% simv -gui/-verdi <other options>
  3. enter the following commands to begin interactive constraint 
  inconsistency debug within Verdi/DVE
  	I. set the breakpoint:	verdi/dve> stop -solver -serial 2
  	II. run the simulation till it stops:	verdi/dve> run
  	III. step in the constraint solver:	verdi/dve> step -solver
Error-[CNST-CIF] Constraints inconsistency failure
testbench.sv, 28
  Constraints are inconsistent and cannot be solved.
  Please check the inconsistent constraints being printed above and rewrite 
  them.
//////////////////////////////////////////////////////////////////////////////////////////////////////////
   Example23: Constraints Randomization - With Soft Constraint
/////////////////////////////////////////////////////////////////////////////////////////////////////////     
//To mention constraints as a soft, specifically “soft” keyword has to be used.
class packet_item;
  rand bit [7:0] val;
 
  constraint val_c {soft val inside {5, [10:15]};}
endclass :packet_item

module constraint_example23;
  packet_item pkt;
  
  initial begin
    pkt = new();
    
    repeat(5) begin
      pkt.randomize();
      $display("Before inline constraint: val = %0d", pkt.val);
           
      pkt.randomize with {val inside {[20:30]};};
      $display("After inline constraint: val = %0d", pkt.val);
      $display("*********************************************");
    end
  end
endmodule :constraint_example23
     
//Logfile Output
Before inline constraint: val = 11
After inline constraint: val = 23
*********************************************
Before inline constraint: val = 12
After inline constraint: val = 21
*********************************************
Before inline constraint: val = 11
After inline constraint: val = 23
*********************************************
Before inline constraint: val = 10
After inline constraint: val = 22
*********************************************
Before inline constraint: val = 12
After inline constraint: val = 27
*********************************************
           V C S   S i m u l a t i o n   R e p o r t      

//////////////////////////////////////////////////////////////////////////////////////////////////////////
   Example24: Constraints Randomization - randcase in SystemVerilog
/////////////////////////////////////////////////////////////////////////////////////////////////////////     
//Randcase is a case statement that randomly selects one of its branch statements based on the probability of each statement.
/*Syntax:

randcase
  item 1: <statement 1>;
  item 2: <statement 2>;
  item 3: <statement 3>;
  ...
  …
  item n: <statement n>;
endcase
*/
//How to calculate the probability of each branch statement?
//The probability of any item is calculated by the value of an item divided by the sum of all item values.
//Ex: P(item1) = item1/sum(item 1..n)
//randcase can also be written inside the module.
  
class packet_item;
  int cnt_arr[int];
  real i_sum;
  
  function void randcase_testing();
    repeat(10) begin
      randcase
        2: begin $display("Selected 2"); cnt_arr[2]++; end
        3: begin $display("Selected 3"); cnt_arr[3]++; end
        5: begin $display("Selected 5"); cnt_arr[5]++; end
        7: begin $display("Selected 7"); cnt_arr[7]++; end
      endcase
    end
    foreach(cnt_arr[i]) begin
      i_sum += i;
    end
    foreach(cnt_arr[i]) begin
      $display("Probability for %0d = %0f in 1 iteration", i, i/i_sum);
      $display("cnt_arr[%0d] = %0d", i, cnt_arr[i]);
      $display("Probability for cnt_arr[%0d] = %0f", i, cnt_arr[i]/10.0);
      $display("---------------------------------");
    end
  endfunction :randcase_testing
  
endclass :packet_item
     
module constraint_example24;
  packet_item pkt;
    
  initial begin
    pkt = new();
    pkt.randcase_testing();
  end
endmodule  :constraint_example24

//Logfile Output
Selected 7
Selected 5
Selected 2
Selected 2
Selected 3
Selected 7
Selected 7
Selected 7
Selected 7
Selected 5
Probability for 2 = 0.117647 in 1 iteration
cnt_arr[2] = 2
Probability for cnt_arr[2] = 0.200000
---------------------------------
Probability for 3 = 0.176471 in 1 iteration
cnt_arr[3] = 1
Probability for cnt_arr[3] = 0.100000
---------------------------------
Probability for 5 = 0.294118 in 1 iteration
cnt_arr[5] = 2
Probability for cnt_arr[5] = 0.200000
---------------------------------
Probability for 7 = 0.411765 in 1 iteration
cnt_arr[7] = 5
Probability for cnt_arr[7] = 0.500000
---------------------------------
           V C S   S i m u l a t i o n   R e p o r t 
Time: 0 ns     
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
   Example25: Constraints Randomization - pre_randomize and post_randomize methods basic Example which also include constraint_mode(0)
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////      
/*
Randomization methods
The randomize() method call is used to randomize class variables based on constraints if they are written. 
Along with randomize() method, SystemVerilog provides two callbacks

pre_randomize()
post_randomize()

A sequence of execution of methods:
pre_randomize() -> randomize() -> post_randomize()

pre_randomize method
It is used to do an activity just before randomization. This may involve disabling constraint for a particular variable (constraint_mode(0))or disabling randomization itself (rand_mode(0)). Refer disable randomization for more details.

post_randomize method
It is used to do an activity after randomization. This may involve printing randomized values of a class variable. Override the randomized value of a class variable.

*/

class packet_item;
  rand bit [7:0] val1;
  rand bit [7:0] val2;
 
  constraint val1_c {val1 > 100; val1 < 200;}
  constraint val2_c {val2 > 5; val2 < 8;}
  
  function void pre_randomize();
    $display("Inside pre_randomize");
    val2_c.constraint_mode(0);
  endfunction
  
  function void post_randomize();
    $display("Inside post_randomize");
    $display("val1 = %0d, val2 = %0d", this.val1, this.val2);
  endfunction
  
endclass :packet_item

module constraint_example25;
  packet_item pkt;
  
  initial begin
    pkt = new();
    pkt.randomize();
  end
endmodule :constraint_example25

//Logfile Output
Inside pre_randomize
Inside post_randomize
val1 = 121, val2 = 247
           V C S   S i m u l a t i o n   R e p o r t      

//////////////////////////////////////////////////////////////////////////////////////////////////////////
   Example26: 
/////////////////////////////////////////////////////////////////////////////////////////////////////////     



//////////////////////////////////////////////////////////////////////////////////////////////////////////
   Example27: 
/////////////////////////////////////////////////////////////////////////////////////////////////////////     



//////////////////////////////////////////////////////////////////////////////////////////////////////////
   Example28: 
/////////////////////////////////////////////////////////////////////////////////////////////////////////     



//////////////////////////////////////////////////////////////////////////////////////////////////////////
   Example29: 
/////////////////////////////////////////////////////////////////////////////////////////////////////////     



//////////////////////////////////////////////////////////////////////////////////////////////////////////
   Example30: 
/////////////////////////////////////////////////////////////////////////////////////////////////////////           
      
   
