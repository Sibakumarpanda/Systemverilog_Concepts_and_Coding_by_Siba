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

/********************************************/
 3. Multidimensional array
/********************************************/
 -A multidimensional array is also known as an array of an array. 
 -In mathematics, we studied matrix, this can be understood as a multidimensional matrix.
 -It may be 2-dimensional , 3-dimensional etc

Two-dimensional array:

int array[6][2] = '{'{1, 100}, '{2, 200}, '{3, 300}, '{4,400}, '{5, 500}, '{6, 600}}; // Declaration and assignment at a time

int arr[6][2]; // Declaration
arr[0][0] = 1; // Assignment
arr[0][1] = 100;

arr[1][0] = 2;
arr[1][1] = 200;

arr[2][0] = 3;
arr[2][1] = 300;

arr[3][0] = 4;
arr[3][1] = 400;

arr[4][0] = 5;
arr[4][1] = 500;

arr[5][0] = 6;
arr[5][1] = 600;

//Example :
module two_dim_arry_with_foreach_example;
  int array[6][2] = '{'{1, 100}, '{2, 200}, '{3, 300}, '{4,400}, '{5, 500}, '{6, 600}};
  initial begin
    foreach (array[i,j]) begin
      $display("array[%0d][%0d] = %0d", i,j, array[i][j]);
    end
  end
endmodule
//Output:
array[0][0] = 1
array[0][1] = 100
array[1][0] = 2
array[1][1] = 200
array[2][0] = 3
array[2][1] = 300
array[3][0] = 4
array[3][1] = 400
array[4][0] = 5
array[4][1] = 500
array[5][0] = 6
array[5][1] = 600

Three-dimensional array :
int array[3][3][3] = '{'{'{1, 10, 100}, '{2, 20, 200}, '{3, 30, 300}},
                       '{'{4, 40, 400}, '{5, 50, 500}, '{6, 60, 600}},
                       '{'{7, 70, 700}, '{8, 80, 800}, '{9, 90, 900}}
                      };

//Example:
module three_dim_arry_with_foreach_example;
  int array[3][3][3] = '{'{'{1, 10, 100}, '{2, 20, 200}, '{3, 30, 300}},
                         '{'{4, 40, 400}, '{5, 50, 500}, '{6, 60, 600}},
                         '{'{7, 70, 700}, '{8, 80, 800}, '{9, 90, 900}}
                        };
  initial begin
    foreach (array[i,j, k]) begin
      $display("array[%0d][%0d][%0d] = %0d", i,j, k, array[i][j][k]);
    end
  end
endmodule
//Output
array[0][0][0] = 1
array[0][0][1] = 10
array[0][0][2] = 100
array[0][1][0] = 2
array[0][1][1] = 20
array[0][1][2] = 200
array[0][2][0] = 3
array[0][2][1] = 30
array[0][2][2] = 300
array[1][0][0] = 4
array[1][0][1] = 40
array[1][0][2] = 400
array[1][1][0] = 5
array[1][1][1] = 50
array[1][1][2] = 500
array[1][2][0] = 6
array[1][2][1] = 60
array[1][2][2] = 600
array[2][0][0] = 7
array[2][0][1] = 70
array[2][0][2] = 700
array[2][1][0] = 8
array[2][1][1] = 80
array[2][1][2] = 800
array[2][2][0] = 9
array[2][2][1] = 90
array[2][2][2] = 900
