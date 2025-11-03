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


	
