Array Locator methods Overview :

- Array locator methods operate on queues, unpacked arrays, but their return type is a queue.
- An array locator methods do below operations
    Search an index or elements of the array
    Array traversal in an unspecified order
  
-  The array location methods can be classified into two types
      Element locator
      Index locator

Element locator Methods: 
  - In element locator type, locator methods iterate over all elements in an array, and then it is used to evaluate the expression specified ‘with’ clause and returns element/s in a queue. 
  - For some of the methods, the ‘with’ clause is optional.
  - The Element locator methods are as below
  
find          -Returns all elements satisfying the given expression.
find_first    -Returns the first element satisfying the given expression.
find_last     -Returns the last element satisfying the given expression.
unique        -Returns all elements with unique values or whose expression is unique 
min           -Returns the element with the minimum value or whose expression evaluates to a minimum.
max           -Returns the element with the maximum value or whose expression evaluates to a maximum.
