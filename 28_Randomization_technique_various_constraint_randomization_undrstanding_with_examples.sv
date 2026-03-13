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
    
