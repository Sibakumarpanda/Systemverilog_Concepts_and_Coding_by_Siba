//////////////////////////////////////////////////////
  System verilog Callback concept with example
/////////////////////////////////////////////////////
- The callbacks are used to alter the behavior of the component without modifying its code. 
- The verification engineer provides a set of hook methods that helps to customize the behavior depending on the requirement.
- A simple example of callbacks can be the pre_randomize and post_randomize methods before and after the built-in randomize method call.
- Callback usage:
  Allows plug-and-play mechanism to establish a reusable verification environment.
  Based on the hook method call, the user-defined code is executed instead of the empty callback method.
  Simply, callbacks are the empty methods that can be implemented in the derived class to tweak the component behavior. 
  These empty methods are called callback methods and calls to these methods are known as callback hooks.

  ///////////////////////////////////////////////////////////////////////
     Example1: SV Callback - Basic Example to understand 
  ///////////////////////////////////////////////////////////////////////  
