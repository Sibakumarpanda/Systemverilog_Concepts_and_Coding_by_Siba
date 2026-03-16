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
   Example7: 
/////////////////////////////////////////////////////////////////////////////////////////////////////////   




//////////////////////////////////////////////////////////////////////////////////////////////////////////
   Example8: 
/////////////////////////////////////////////////////////////////////////////////////////////////////////   



//////////////////////////////////////////////////////////////////////////////////////////////////////////
   Example9: 
/////////////////////////////////////////////////////////////////////////////////////////////////////////   



//////////////////////////////////////////////////////////////////////////////////////////////////////////
   Example10: 
/////////////////////////////////////////////////////////////////////////////////////////////////////////   




//////////////////////////////////////////////////////////////////////////////////////////////////////////
   Example11: 
/////////////////////////////////////////////////////////////////////////////////////////////////////////   




//////////////////////////////////////////////////////////////////////////////////////////////////////////
   Example12: 
/////////////////////////////////////////////////////////////////////////////////////////////////////////   




//////////////////////////////////////////////////////////////////////////////////////////////////////////
   Example13: 
/////////////////////////////////////////////////////////////////////////////////////////////////////////   





//////////////////////////////////////////////////////////////////////////////////////////////////////////
   Example14: 
/////////////////////////////////////////////////////////////////////////////////////////////////////////      
   

   

//////////////////////////////////////////////////////////////////////////////////////////////////////////
   Example15: 
/////////////////////////////////////////////////////////////////////////////////////////////////////////     
   


//////////////////////////////////////////////////////////////////////////////////////////////////////////
   Example16: 
/////////////////////////////////////////////////////////////////////////////////////////////////////////     



      
//////////////////////////////////////////////////////////////////////////////////////////////////////////
   Example17: 
/////////////////////////////////////////////////////////////////////////////////////////////////////////     

   
   

//////////////////////////////////////////////////////////////////////////////////////////////////////////
   Example18: 
/////////////////////////////////////////////////////////////////////////////////////////////////////////     



//////////////////////////////////////////////////////////////////////////////////////////////////////////
   Example19: 
/////////////////////////////////////////////////////////////////////////////////////////////////////////     



      
//////////////////////////////////////////////////////////////////////////////////////////////////////////
   Example20: 
/////////////////////////////////////////////////////////////////////////////////////////////////////////     



//////////////////////////////////////////////////////////////////////////////////////////////////////////
   Example21: 
/////////////////////////////////////////////////////////////////////////////////////////////////////////     




//////////////////////////////////////////////////////////////////////////////////////////////////////////
   Example22: 
/////////////////////////////////////////////////////////////////////////////////////////////////////////     



//////////////////////////////////////////////////////////////////////////////////////////////////////////
   Example23: 
/////////////////////////////////////////////////////////////////////////////////////////////////////////     



//////////////////////////////////////////////////////////////////////////////////////////////////////////
   Example24: 
/////////////////////////////////////////////////////////////////////////////////////////////////////////     



//////////////////////////////////////////////////////////////////////////////////////////////////////////
   Example25: 
/////////////////////////////////////////////////////////////////////////////////////////////////////////      



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
      
   
