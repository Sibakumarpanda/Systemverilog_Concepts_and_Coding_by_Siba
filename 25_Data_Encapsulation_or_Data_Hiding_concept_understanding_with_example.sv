///////////////////////////////////////////////////////////////////////////
   Concept of Data Encapsulation/Data Hiding in SV with Examples:
//////////////////////////////////////////////////////////////////////////
- Data encapsulation is a mechanism that combines class properties and methods.
- Data hiding is a mechanism to hide class members within the class. 
- They are not accessible outside of class scope. This avoids class member modification outside the class scope and its misuse.
- By default, all class members are accessible with class handles in SystemVerilog. To restrict access, access qualifiers are used.
- Local Access Qualifier - If a class member is declared as a local, they will be available to that class alone. 
  The child classes will not have access to a local class member of their parent class.
