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
  
//////////////////////////////////////////////////////////////
  A basic Example to understand interface concept : Example1
/////////////////////////////////////////////////////////////  
- In the below multiplier example, the run() method from the drive class is driving the virtual interface. 

program test(mult_if inf);
  class drive;
    virtual mult_if inf;
    
    // constructor
    function new(virtual mult_if inf);
      this.inf = inf; // virtual interface intialization
    endfunction
    
    task run();
      #5;
      inf.a = 'd5; 
      inf.b = 'd6;
      inf.en = 1;
      #10 inf.en = 0;
      wait(inf.ack);
      $display("%0t: a=%d b=%d, out=%d", $time, inf.a,inf.b,inf.out);
    
      #25;
      inf.a = 'd20; 
      inf.b = 'd7;
      #5ns inf.en = 1;
      #6 inf.en = 0;
      wait(inf.ack);
      $display("%0t: a=%d b=%d, out=%d", $time, inf.a,inf.b,inf.out);
    
      #25;
      inf.a = 'd10; 
      inf.b = 'd4;
      #6ns inf.en = 1;
      #5 inf.en = 0;
      wait(inf.ack);
      $display("%0t: a=%d b=%d, out=%d", $time, inf.a,inf.b,inf.out);
      #10;
      $finish;
    endtask
  endclass
  
  initial begin
    drive drv = new(inf);
    drv.run();
  end
endprogram : test

//Logfile Output
15: a=  5 b=  6, out=   30
51: a= 20 b=  7, out=  140
87: a= 10 b=  4, out=   40  
  
//////////////////////////////////////////////////////////////
  A basic Example to understand interface concept : Example2
/////////////////////////////////////////////////////////////  
- Now, let try to randomize the class to provide random stimulus to the DUT using a virtual interface.
  
program test(mult_if inf);
  class drive;
    rand bit [7:0] a, b;
  endclass
  
  initial begin
    virtual mult_if vif;
    drive drv = new();
    vif = inf;
    repeat(3) begin
      assert(drv.randomize());
      @(posedge vif.clk);
      vif.a = drv.a;
      vif.b = drv.b;
      #2 vif.en = 1;
      #5 inf.en = 0;
      wait(vif.ack);
      $display("%0t: a=%d b=%d, out=%d", $time, vif.a,vif.b,vif.out);
      #20;
    end
    #10;
    $finish;
  end
endprogram  :test

//Logfile Output
9: a=163 b=143, out=23309
37: a=214 b=151, out=32314
65: a=  1 b=222, out=  222
  
