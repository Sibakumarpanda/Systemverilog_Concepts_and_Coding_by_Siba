///////////////////////////////////////////////
   Parameterized classes in SV with Example:
//////////////////////////////////////////////
- Parameterized classes are useful when the same class needs to be instantiated differently. 
- The default parameter can be set in the class definition. These parameters can be overridden when it is instantiated.
- The parameter can be constant values and data types.

//////////////////////////////////////////////
   Example1: 
/////////////////////////////////////////// 
- In the below example, WIDTH = 2 and data_type = bit [2:0] are default parameters for packet_trans class.
- There are two objects created. Object tr1 uses default parameters while tr2 uses WIDTH = 3 and data type = int as parameters.
- An example shows that parameter values can be replaced during instantiation.
  packet_trans tr1;            // Default parameters are used i.e. WIDTH = 2 and D_TYPE = bit [2:0]
  packet_trans #(3, int) tr2;  // Default parameters are overridden with mentioned value. WIDTH = 3 and D_TYPE = int
- For tr1 object, default parameters WIDTH = 2 and type D_TYPE = bit [2:0] are not enough to store data = 7 and id = 15, so it is expected to get incorrect values on the calling display() function.
- For tr2, default parameters are overridden with WIDTH = 3 and D_TYPE = int to accommodate data = 7 and id = 15. So, it is expected to get assigned values on calling display() function 
- Data-type can be passed as a parameter.






//////////////////////////////////////////////
   Example2: 
///////////////////////////////////////////    
