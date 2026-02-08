///////////////////////////////////
   Static methods in SV classes :
//////////////////////////////////
Static Methods (static functions and static tasks)
- Static methods are the same as static variables that also follow class access rules and scope.
- Static functions and tasks can not be virtual
- They can access only static properties (static members) of a class. 
- Accessing non-static members leads to compilation errors as it is illegal to use. But non-static functions or tasks can access static variables.
- Both static methods and static members in a class can be accessed without creating an object.
- Summary :
   Method         variable           Comment
   ------------------------------------------
   Static         Non-static         Compilation Error(Illegal to use)
   Non-static     Static             Allowed
   static         static             Allowed
   Non static     Non-static         Allowed
