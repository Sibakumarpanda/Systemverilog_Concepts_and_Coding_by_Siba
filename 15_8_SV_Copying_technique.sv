/////////////////////////////////
 Copying Techniques in SV :
/////////////////////////////////
-As we discussed earlier in the section class assignment in sv, multiple handles refer to the same object. 
-It means the same memory location will be allocated and which can be accessed by two different handles. 
-If any handle would like to change class properties, it will reflect the same changes when it is accessed by another handle.
-Based on the requirement if the user needs a separate copy of an object, copying techniques are used.
-Based on copying behavior, two techniques were introduced by SystemVerilog.
  1. Shallow copy
  2. Deep copy
