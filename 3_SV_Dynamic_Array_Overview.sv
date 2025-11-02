Dynamic Array in SystemVerilog :
 -As name dynamic suggests, an array whose size can be changed during run time simulation.
 -The size of an array can be specified during run-time by using new[ ]. 
 -Note: By default, the size of a dynamic array is 0 unless a new[ ] is used.
 -Hence ,Dynamic array is a concept ,where the space does not exist,untill the array is explicetely created during run time.
 -Dynamic array is an unpacked array whose sizes can be changed during run time.
 -The methods used in dynamic array are : new[] , size(), delete()

Dynamic array declaration :
   bit [2:0] array []; 
   string str_arr [];
   array = new[2];  // To allocate the size of an array

Dynamic array Methods :
function int size()    - Returns the current size of a dynamic array
function void delete() - Delete array results in an empty dynamic array i.e. zero-sized array.
new[ ] - To create a memory. It can also be used to resize or copy a dynamic array.
 
Note: The new [ ] is different from the function new() which is used in the OOP concept. 
