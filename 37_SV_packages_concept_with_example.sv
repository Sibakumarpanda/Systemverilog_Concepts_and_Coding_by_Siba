//////////////////////////////////////////////////////////////
  SystemVerilog package concept Understanding with Example
//////////////////////////////////////////////////////////////
- The SystemVerilog packages provide a systematic mechanism for sharing parameters, data, function, tasks, types, property to other interfaces, programs or modules that can be declared within a package.
- The package can be made accessible within the interface, programs, modules and other packages using an import keyword followed by scope resolution operator :: and what has to import. 
- An import mechanism provides controlled access based on what is imported
- Items in the package cannot have hierarchical references. 
- They are explicitly named scopes appearing at the same level as top-level modules or primitives.
- Syntax:
  package <package_name>;
    ...
  endpackage
  // To import package
  import <package_name> :: *;  // All package items are imported
  import <package_name> :: <method_name>;  // Only <method_name> is imported

//////////////////////////////////////////////////////////
   Example1: Package in SV  - A Basic example
//////////////////////////////////////////////////////////
//In the below example, a transaction class and pkg_funct() function is defined inside the package and it is instantiated in the module.
package my_pkg;
  class transaction_class;
    int data = 5;   
    function void display();
      $display("The value of data = %0d", data);
    endfunction
  endclass :transaction_class

  function pkg_funct();
    $display("Printing Inside pkg_funct");
  endfunction :pkg_funct
endpackage :my_pkg
  
//TB Module
import my_pkg::*;
module package_example1;
  initial begin
    transaction_class tr = new();
    tr.display();
    pkg_funct();
  end
endmodule :package_example1
  
//Logfile Output
The value of data = 5
Printing Inside pkg_funct
           V C S   S i m u l a t i o n   R e p o r t   
  
//////////////////////////////////////////////////////////
  Example2: Package in SV  - Explicit import example
//////////////////////////////////////////////////////////
//In the below example, a transaction class and pkg_funct() function is defined inside the package 
//But ,Out of transaction class and pkg_funct(), only the transaction class is imported. Thus, pkg_funct() is not accessible.
package my_pkg;

  class transaction_class;
    int data = 5;   
    function void display();
      $display("The value of data = %0d", data);
    endfunction
  endclass :transaction_class

  function pkg_funct();
    $display("Printing Inside pkg_funct");
  endfunction :pkg_funct

endpackage :my_pkg

//TB TOP
import my_pkg::transaction_class;
module package_example2;
  initial begin
    transaction_class tr = new();
    tr.display();
    //pkg_funct(); /// Not accessible
  end
endmodule :package_example2
  
//Logfile Output
The value of data = 5
           V C S   S i m u l a t i o n   R e p o r t     
/////////////////////////////////////////////////////////////////////////////////////////////////
  Example3: Package in SV  -  Package items are accessed using scope resolution operator example
////////////////////////////////////////////////////////////////////////////////////////////////
//Package items are accessed using scope resolution operator
package my_pkg_A;
  int data = 5;
  function pkg_funct();
    $display("my_pkg_A: Inside pkg_funct, data = %0d", data);
  endfunction
endpackage :my_pkg_A

package my_pkg_B;
  int data = 10;
  function pkg_funct();
    $display("my_pkg_B: Inside pkg_funct, data = %0d", data);
  endfunction
endpackage : my_pkg_B

//TB TOP
import my_pkg_A::*;
import my_pkg_B::*;
module package_example3;
  initial begin
    my_pkg_A::pkg_funct();
    my_pkg_B::pkg_funct();
  end
endmodule :package_example3
//Logfile Output
my_pkg_A: Inside pkg_funct, data = 5
my_pkg_B: Inside pkg_funct, data = 10
           V C S   S i m u l a t i o n   R e p o r t   
//////////////////////////////////////////////////////////
  Example4: 
//////////////////////////////////////////////////////////
  
  
