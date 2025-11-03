Associative array in SystemVerilog Overview :
 -An associate array is used where the size of a collection is not known or data space is sparse.
 -Associative array declaration:
  data_type array_name [ index_type ];  //	here index type can be of any type .Either it may be a string or int etc.
  bit[7:0] assoc_array [int];

Why do we need an associative array in SystemVerilog ???
 -In a dynamic array, we need to allocate memory before using it. But in an associative array, memory can be allocated when it is used.
 -A dynamic array is specific for a particular data type. 
 -When it comes to an associative array, elements of an array can be of any type. 
 -We can store the concatenation of various data types or class structures as well in associative array.
 -Basically , when the data size is unknown or data space is sparce,then at that time associative array is preferred .

Associative array methods :
	 1.  function int size();              //Returns the size of an associative array. Returns 0 if an array is empty
	 2.  function int num();            // Returns the number of entries of an associative array.
     3.  function int exists (input index) //Returns 1 if an element exists at a specified index else returns 0.
     4.  function int first (value) //Assign a value of the first index to the ‘value’ variable else returns 0 or an empty array.
     5.  function int last (value) //Assign a value of the last index to the ‘value’ variable else returns 0 or an empty array.
     6.  function int prev (value) //Assign a value of the previous index to the ‘value’ variable.
     7.  function int next (value) //Assign a value of the next index to the ‘value’ variable.
     8.  function void delete (input index) //Delete array entry for mentioned array index.
     9.  function void delete () //Delete complete array means all entries will be removed.
	
