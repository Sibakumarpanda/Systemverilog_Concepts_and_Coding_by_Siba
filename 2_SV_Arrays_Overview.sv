SystemVerilog Arrays :
 -An array is a group of variables having the same data type. It can be accessed using an index value. 
 -An index is a memory address and the array value is stored at that address.
Types of an array:
  1. Fixed-size array in SystemVerilog
  2. Single dimensional array
  3. Multidimensional array
     a. Two-dimensional array.
     b. Three-dimensional array
 4.  Packed and Unpacked array in SystemVerilog
 5.  Dynamic array in SystemVerilog
 6.  Associative array in SystemVerilog

/********************************************/
1. Fixed-size Array in SystemVerilog
/*******************************************/
 - Array size is fixed throughout the simulation. 
 - Its value will be initialized with a ‘0’ value.
 - Fixed-size Arrays in SystemVerilog are arrays with a predetermined size that cannot be changed during simulation. 
 - The basic Fixed sized array is declered as below:
   // One-dimensional arrays
   bit [7:0] memory [0:255];        // 256 elements of 8-bit each
   int array1 [0:15];               // 16 elements of 32-bit integers
   logic [3:0] data [15:0];         // 16 elements of 4-bit logic

   // Multi-dimensional arrays
   int matrix [0:7][0:7];            // 8x8 matrix of integers
   logic [7:0] image [0:255][0:255]; // 256x256 image pixels

/********************************************/
2. Single Dimensional Array
/*******************************************/
- Array with 1- dimensions
- For example:
  int arr [3];
  int arr [2:0];
- The array assignment is as below: 
  int arr[3] = '{5,6,7};  // Declaration and assignment at a time
  Or
  int arr[3];     // First Declare the array
  arr[0] = 5;   // Here assign the values
  arr[1] = 6;
  arr[2] = 7;

//Example
module single_dim_arry_with_foreach_example;
  int array[5] = '{100, 200, 300, 400, 500};
  initial begin
    foreach (array[i]) begin
      $display("array[%0d] = %0d", i, array[i]);
    end
  end
endmodule
// Output
array[0] = 100
array[1] = 200
array[2] = 300
array[3] = 400
array[4] = 500
