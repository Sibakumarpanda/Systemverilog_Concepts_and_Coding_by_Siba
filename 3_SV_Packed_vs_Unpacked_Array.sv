/**********************************/
Concept of Scalar Vs Vector
/**********************************/
 - Scalar : The data object which does not have a specific range for bit/logic/reg is a scalar.
  logic var1;
  bit var2;
 - Vector : The data object which has a specific range for bit/logic/reg is a vector.
  logic [5:0] var1;
  bit [2:0] var2;

/**********************************/
Packed and Unpacked array
/**********************************/
Packed array :  A packed array refers to the dimension mentioned before the variable or object name. This is also known as the vector width.
                Memory allocation is always a continuous set of information that is accessed by an array index.
                  
//Decleration
reg [5:0] array;    // [5:0] is packed dimension or vector width.
bit [2:0][3:0] array;

//Example
module packed_array_example;
  bit [2:0][3:0] array = '{4'h2, 4'h4, 4'h6};
  initial begin
    foreach (array[i]) begin
      $display("array[%0h] = %0h", i, array[i]);
    end
  end
endmodule :packed_array_example
//Output
array[2] = 2
array[1] = 4
array[0] = 6

Unpacked array : An unpacked array refers to the dimension mentioned after the variable or object name.
                 Memory allocation may or may not be a continuous set of information.

//Decleration:
reg arr [3:0];       // [3:0] is unpacked dimension.
int array [2:0][3:0];

//Example:
module unpacked_array_example;
  int array [2:0][3:0] = '{'{1, 2, 3, 4},
                           '{5, 6, 7, 8},
                           '{9, 10, 11, 12}
                          };
  initial begin
    foreach (array[i,j]) begin
      $display("array[%0d][%0d] = %0d", i, j, array[i][j]);
    end
  end
endmodule : unpacked_array_example

//Output
array[2][3] = 1
array[2][2] = 2
array[2][1] = 3
array[2][0] = 4
array[1][3] = 5
array[1][2] = 6
array[1][1] = 7
array[1][0] = 8
array[0][3] = 9
array[0][2] = 10
array[0][1] = 11
array[0][0] = 12

Combination of a packed and unpacked array :
All arrays mentioned above are types of static arrays.

//Example:
module packed_unpacked_comine_array_example;
  bit [4:0] array[2:0][1:0] = '{'{5'h5, 5'h1},
                                '{5'h10, 5'h2},
                                '{5'h15, 5'h3}
                               };
  initial begin
    foreach (array[i,j]) begin
      $display("array[%0h][%0h] = %0h", i, j, array[i][j]);
    end
  end
endmodule :packed_unpacked_comine_array_example

//Output
array[2][1] = 5
array[2][0] = 1
array[1][1] = 10
array[1][0] = 2
array[0][1] = 15
array[0][0] = 3
