//////////////////////////////////////////
   Various array of objects in SV Class:
/////////////////////////////////////////
- SystemVerilog provides a fixed array, dynamic array and an associative array that can store a single data type. 
- Based on the requirement, a set of objects need to be created. Hence, an array of objects will be useful.

//Example1 - Fixed array of Objects
class transaction;
  bit [31:0] data;
  int id;
endclass :transaction

module class_example1;
  transaction tr[5];
  initial begin
    foreach(tr[i]) begin
      tr[i] = new();
      tr[i].data = i*i;
      tr[i].id = i+1;
    end    
    foreach(tr[i]) begin
      $display("tr[%0d].data = %0d, tr[%0d].id = %0d",i, tr[i].data, i, tr[i].id);
    end
  end
endmodule : class_example1

//Logfile Output
tr[0].data = 0, tr[0].id = 1
tr[1].data = 1, tr[1].id = 2
tr[2].data = 4, tr[2].id = 3
tr[3].data = 9, tr[3].id = 4
tr[4].data = 16, tr[4].id = 5

//Example2 - Dynamic array of Objects
