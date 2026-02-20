/////////////////////////////////////////////
 Tricky examples based on SV Inheritance:
////////////////////////////////////////////
//Example1: Virtual method vs Non-virtual method Surprise
class base_class;
  
  function void display ();
    $display ("From Base Class Non Virtual Function Print");
  endfunction
  
  virtual function void vdisplay ();
    $display ("From Base Class Virtual Function Print");
  endfunction
  
endclass: base_class

class derived_class extends base_class;
  
  function void display ();
    $display ("From Derived Class Non Virtual Function Print");
  endfunction
  
  virtual function void vdisplay ();
    $display ("From Derived Class Virtual Function Print");
  endfunction
  
endclass: derived_class

module tb_top;  
  initial begin   
     base_class b;
     derived_class d;
     d = new();
     b = d;
     b.display();
     b.vdisplay();
     $display ("--------------------------");
     d.display();
     d.vdisplay();
  end  
endmodule:tb_top

//Logfile Output
Contains Synopsys proprietary information.
Compiler version X-2025.06-SP1_Full64; Runtime version X-2025.06-SP1_Full64;  Feb 18 21:15 2026
From Base Class Non Virtual Function Print
From Derived Class Virtual Function Print
--------------------------
From Derived Class Non Virtual Function Print
From Derived Class Virtual Function Print
           V C S   S i m u l a t i o n   R e p o r t 

//Example2: Virtual method vs Non-virtual method Surprise
class base_class;
  
  virtual function void display ();
    $display ("From Base Class Virtual Function Print");
  endfunction
  
  virtual function void vdisplay ();
    $display ("From Base Class Virtual Function Print");
  endfunction
  
endclass: base_class

class derived_class extends base_class;
  
  function void display ();
    $display ("From Derived Class Non Virtual Function Print");
  endfunction
  
  virtual function void vdisplay ();
    $display ("From Derived Class Virtual Function Print");
  endfunction
  
endclass: derived_class

module tb_top;  
  initial begin   
     base_class b;
     derived_class d;
     d = new();
     b = d;
     b.display();
     b.vdisplay();
     $display ("--------------------------");
     d.display();
     d.vdisplay();
  end   
endmodule:tb_top

//Logfile Output
Contains Synopsys proprietary information.
Compiler version X-2025.06-SP1_Full64; Runtime version X-2025.06-SP1_Full64;  Feb 18 21:17 2026
From Derived Class Non Virtual Function Print
From Derived Class Virtual Function Print
--------------------------
From Derived Class Non Virtual Function Print
From Derived Class Virtual Function Print
           V C S   S i m u l a t i o n   R e p o r t 

//Example3: Virtual method vs Non-virtual method Surprise

class base_class;
  
  function void display ();
    $display ("From Base Class Non Virtual Function Print");
  endfunction
  
  function void vdisplay ();
    $display ("From Base Class Non Virtual Function Print");
  endfunction
  
endclass: base_class

class derived_class extends base_class;
  
  virtual function void display ();
    $display ("From Derived Class Non Virtual Function Print");
  endfunction
  
  virtual function void vdisplay ();
    $display ("From Derived Class Virtual Function Print");
  endfunction
  
endclass: derived_class

module tb_top;  
  initial begin   
     base_class b;
     derived_class d;
     d = new();
     b = d;
     b.display();
     b.vdisplay();
     $display ("--------------------------");
     d.display();
     d.vdisplay();
  end   
endmodule:tb_top

//Logfile Output
Chronologic VCS simulator copyright 1991-2025
Contains Synopsys proprietary information.
Compiler version X-2025.06-SP1_Full64; Runtime version X-2025.06-SP1_Full64;  Feb 18 21:18 2026
From Base Class Non Virtual Function Print
From Base Class Non Virtual Function Print
--------------------------
From Derived Class Non Virtual Function Print
From Derived Class Virtual Function Print
           V C S   S i m u l a t i o n   R e p o r t 

//Example4: Virtual method vs Non-virtual method Surprise

class base_class;  
  function void display ();
    $display ("From Base Class Non Virtual Function Print");
  endfunction  
  function void vdisplay ();
    $display ("From Base Class Non Virtual Function Print");
  endfunction  
endclass: base_class

class derived_class extends base_class;  
  function void display ();
    $display ("From Derived Class Non Virtual Function Print");
  endfunction 
  function void vdisplay ();
    $display ("From Derived Class Non Virtual Function Print");
  endfunction  
endclass: derived_class

module tb_top;  
  initial begin   
     base_class b;
     derived_class d;
     d = new();
     b = d;
     b.display();
     b.vdisplay();
     $display ("--------------------------");
     d.display();
     d.vdisplay();
  end   
endmodule:tb_top

//Logfile Output

Contains Synopsys proprietary information.
Compiler version X-2025.06-SP1_Full64; Runtime version X-2025.06-SP1_Full64;  Feb 18 21:20 2026
From Base Class Non Virtual Function Print
From Base Class Non Virtual Function Print
--------------------------
From Derived Class Non Virtual Function Print
From Derived Class Non Virtual Function Print
           V C S   S i m u l a t i o n   R e p o r t 
//Example5:
class base_class;
  
  function void display ();
    $display ("From Base Class Non Virtual Function Print");
  endfunction
  
  function void vdisplay ();
    $display ("From Base Class Non Virtual Function Print");
  endfunction
  
endclass: base_class

class derived_class extends base_class;
  
  function void display1 ();
    $display ("From Derived Class Non Virtual Function Print");
  endfunction
  
  function void vdisplay1 ();
    $display ("From Derived Class Non Virtual Function Print");
  endfunction
  
endclass: derived_class

module tb_top;  
  initial begin   
     //base_class b;     
     derived_class d;
     d = new();     
     d.display1();
     d.vdisplay1();
     $display ("--------------------------");
     d.display();
     d.vdisplay();
  end   
endmodule:tb_top
//Logfile Output
Chronologic VCS simulator copyright 1991-2025
Contains Synopsys proprietary information.
Compiler version X-2025.06-SP1_Full64; Runtime version X-2025.06-SP1_Full64;  Feb 20 08:59 2026
From Derived Class Non Virtual Function Print
From Derived Class Non Virtual Function Print
--------------------------
From Base Class Non Virtual Function Print
From Base Class Non Virtual Function Print
           V C S   S i m u l a t i o n   R e p o r t 

//Example6: Constructor Execution Order
class base_class;  
  function new ();
    $display ("From Base class ");
  endfunction  
endclass: base_class

class derived_class extends base_class;  
  function new ();
    //$display ("From Derived class :Before super.new");
    super.new();
    $display ("From Derived class: After super.new");
  endfunction  
endclass :derived_class

module tb_top;
  initial begin
    derived_class d;
    d=new();    
  end   
endmodule :tb_top

//Logfile Output
Chronologic VCS simulator copyright 1991-2025
Contains Synopsys proprietary information.
Compiler version X-2025.06-SP1_Full64; Runtime version X-2025.06-SP1_Full64;  Feb 20 08:59 2026
From Base class 
From Derived class: After super.new
           V C S   S i m u l a t i o n   R e p o r t 

//Example7: $cast and Handle Assignment (Upcasting and Downcasting uses understanding)
class base_class;
  
endclass : base_class

class derived_class extends base_class;
  
endclass : derived_class

module tb_top;
  initial begin
    base_class b1,b2;
    derived_class d1,d2;
    d1= new();
    b1=d1; // Allowed : Upcast (implicit)
    
    //d2=b2; // Error: Downcast not allowed directly, so commented here
    //Hence we can use $cast to do Downcasting as below .Use $cast for safe downcasting
    if ($cast(d2, b2))         // OK: $cast returns 1 if successful
      $display("Casting worked Successfully");
    else
      $display("Casting failed");  
  end    
endmodule :tb_top
 
//Logfile Output
Chronologic VCS simulator copyright 1991-2025
Contains Synopsys proprietary information.
Compiler version X-2025.06-SP1_Full64; Runtime version X-2025.06-SP1_Full64;  Feb 20 09:00 2026
Casting worked Successfully
           V C S   S i m u l a t i o n   R e p o r t  

//Example8: Static vs Dynamic Type

class base_class;
  function display ();
    $display ("From BASE_CLASS : My name is Siba K Panda");
  endfunction 
endclass : base_class

class derived_class extends base_class;
  function display ();
    $display ("From DERIVED_CLASS : My name is Siba K Panda");
  endfunction  
endclass : derived_class

module tb_top;
  initial begin
    base_class    b;
    derived_class d;
    d=new ();
    b=d;
    b.display();  //Expectation is Derived class content should print(since b=d) , 
    //but its not happening here because in base class Non-virtual function is used
    d.display();   
  end     
endmodule :tb_top

//Logfile Output
Chronologic VCS simulator copyright 1991-2025
Contains Synopsys proprietary information.
Compiler version X-2025.06-SP1_Full64; Runtime version X-2025.06-SP1_Full64;  Feb 20 09:00 2026
From BASE_CLASS : My name is Siba K Panda
From DERIVED_CLASS : My name is Siba K Panda
           V C S   S i m u l a t i o n   R e p o r t 

//Example9:
class base_class;
  virtual function display ();
  //function display ();
    $display ("From BASE_CLASS : My name is Siba K Panda");
  endfunction  
endclass : base_class

class derived_class extends base_class;
  function display ();
    $display ("From DERIVED_CLASS : My name is Siba K Panda");
  endfunction  
endclass : derived_class

module tb_top;
  initial begin
    base_class    b;
    derived_class d;
    d=new ();
    b=d;
    b.display();//Expectation is Derived class content should print(since b=d) , 
    //Since in base class virtual function is used, hence we can get the Derived class content , But in previous example , it was not coming due to Non-virtual function
    d.display(); 
  end    
endmodule :tb_top
 
//Logfile Output
 Chronologic VCS simulator copyright 1991-2025
Contains Synopsys proprietary information.
Compiler version X-2025.06-SP1_Full64; Runtime version X-2025.06-SP1_Full64;  Feb 20 09:00 2026
From DERIVED_CLASS : My name is Siba K Panda
From DERIVED_CLASS : My name is Siba K Panda
           V C S   S i m u l a t i o n   R e p o r t 

//Example10:

//Example11:

//Example12:


//Example13:

//Example14:

//Example15:

