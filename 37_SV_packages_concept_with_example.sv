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
