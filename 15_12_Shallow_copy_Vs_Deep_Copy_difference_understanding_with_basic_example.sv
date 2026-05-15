///////////////////////////////////////
   Shallow copy in SystemVerilog :
///////////////////////////////////////
- Shallow copy is used to copy: Class properties like integers, strings and instance handle etc.
- Instance handles are copied which means any changes are done in ‘nested copied object’ will also reflect in the ‘nested original object’ or vice-versa.
- It will not copy : Nested objects are not copied.
- It uses the new() method is used for copying.
- Syntax:
       packet pkt1, pkt2;
       pkt1 = new();
       pkt2 = new pkt1; //will create a new object pkt2 which is a copy of the pkt1 object.

///////////////////////////////////////
   Deep copy in SystemVerilog :
///////////////////////////////////////
- Deep copy is also called as full copy .
- It performs a complete copy of an object.
- In Deep copy , nested Objects are also copied. (But in Shallow copy , as mentioned in above , nested objects are not copied)
- So,deep copy is the same as shallow copy except nested created objects are also copied by writing a custom method. 
- here deep_copy(), an extra method is written that does value assignments for an object which has to be copied (pkt1 object). 
- This ensures that pkt1 class properties are copied to the newly created pkt2 object.
- Syntax :
    packet pkt1;
    pkt1 = new();
    packet pkt2;  //here the object pkt2 is separately created.
    pkt2 = new();
    pkt2.deep_copy(pkt1);

///////////////////////////////////////////////////
   Difference between Shallow copy and Deep copy : 
//////////////////////////////////////////////////
-In Shallow copy , Instance handles are copied but Nested objects are not copied . Where as , In Deep copy , nested Objects are also copied.


///////////////////////////////////////
   Basic example Shallow copy :
///////////////////////////////////////  

  
