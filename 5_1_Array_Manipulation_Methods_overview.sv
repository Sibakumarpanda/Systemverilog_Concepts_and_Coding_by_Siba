Array manipulation methods Overview:

 - SystemVerilog provides built-in methods for array locator , ordering, ,reduction, iterator index querying.
 - In array manipulation methods, it iterates over array elements and evaluates the expression using the ‘with’ clause.
 - ‘with’ clause
    The expression to be evaluated when iterating over the array elements can be specified using the ‘with’ clause. 
    The iterator argument can be specified with some local variable which is used to refer to the current element of an array in the expression. 
    However, it is not mandatory to use a local variable and if it is not used then the ‘item’ keyword is referred as a by-default keyword.
 - Example:
      //With local variable 
      arr.find(x) with (x.color == YELLOW);

     //Without local variable
     arr.find with (item.color == YELLOW);

  -Here, color is a class variable of an enum type. The above example shows how to use the find method with and without a local variable.

