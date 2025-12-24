// Similarity and Difference between Function and Task :

/*************************************************/
  Similarities between function and task
/*************************************************/  
-Can declare a static variable in automatic function
-Can declare an automatic variable in a static function
-Both support default arguments and arguments have input direction by default unless it is specified.
-Multiple statements can be written without using a begin .. end block.
-The default argument data type is logic unless it is specified.
-Passing value by name, reference, value and position is allowed.
-The “return” keyword is used to premature return from a task or function. The only difference is that function can return a value and a task can not return any value when the “return” keyword is used.
-By default tasks and functions are automatic in classes and they are commonly known as class methods.

/*************************************************/
  Differences between function and task
/*************************************************/  
Function                                                                                               Task
--------                                                                                               ------    
Can not contain simulation delay. so execute in the same time unit.                                    can or can not contain a simulation time delay. 

Can return a single value                                                                              Can return multiple values as output or inout argument.

Can not call another task                                                                              Can call another function or task
