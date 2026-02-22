/////////////////////////////////////////
 Super Keyword in class and its usage:
////////////////////////////////////////
- The super keyword is used in a child or derived class to refer to class members of its immediate base class.
- Syntax: super.<base_class_member>;  // It has to be used in derived class
- Parent class members are overridden by its derived class on access by child class handle if both class members have the same name for class properties and methods. 
- To refer to base class members in such a context, the super keyword is useful. To understand the usage of the super keyword, let me explain with two examples. 
- The first example does not use a super keyword while the second example uses a super keyword.
- In the below examples, 
- The data variable is a class property of both base and derived class.
- The display() method is also used in both classes
