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
   
   


   
