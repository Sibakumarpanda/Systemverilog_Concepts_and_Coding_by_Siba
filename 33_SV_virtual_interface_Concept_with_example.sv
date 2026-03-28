//////////////////////////////////////////////////////////
  Virtual Interface Concept Understanding with Example:
//////////////////////////////////////////////////////////
- In General , As we studied also earlier , Interface is nothing but the bundle of signals . Those signals may be directionless or directional as per uses/need.
- An interface represents signals that are used to connect design modules or testbench to the DUT and commonly known as a physical interface. 
- The design and physical interface are static in nature. Hence, they can not be used dynamically. 
- In modern testbench, randomized class objects are used and connect to the design dynamically.
- Hence, to bridge the gap between the static world of modules and the dynamic world of objects, a virtual interface is used as a pointer or handle for an actual interface.

///////////////////////////////////////
  Features of the virtual interface
///////////////////////////////////
- The virtual interface must be pointed to the actual or physical interface. This is also known as virtual interface initialization.
- Before accessing or driving to the virtual interface, it must be initialized otherwise it will cause a fatal run-time error as it has a null value.
- The virtual interfaces can be passed to the functions and tasks as an argument.
- The virtual interface can be declared as class properties and it initialized an argument to the constructor or procedurally.
- The dynamic object can be assigned to the virtual interface. Also, interface values are recorded in the dynamic object by accessing the virtual interface.
- They can be assigned to another virtual interface having the same type using ‘=’ operator.
- Syntax  :  virtual <interface_name> <interface_instance>
- Example :  virtual axi_interface  axi_intf 
  
