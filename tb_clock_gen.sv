//************************************ Clock generation using different constructs ***************************************************

//clock generation using always block
module tb_clock_gen;
  bit clk;
  
  always #5 clk= ~clk; // Time period =10ns ,clk frequency=100MHZ
  
  initial begin
    $dumpfile("clk.vcd");
    $dumpvars();    
    #100;
    $finish();
  end
  
endmodule 

//clock generation using for loop
module tb_clock_gen;
  bit clk;

  initial begin
  for (;;) begin
    #5 clk= ~clk;
  end
  end
  
  initial begin
    $dumpfile("clk.vcd");
    $dumpvars();
    
    #100;
    $finish();
  end  
endmodule 

//clock generation using forever
module tb_clock_gen;
  bit clk;

  initial begin
  forever 
    #5 clk= ~clk;
  end
  
  initial begin
    $dumpfile("clk.vcd");
    $dumpvars();    
    #100;
    $finish();
  end  
endmodule 

//clock generation using while loop
module tb_clock_gen;
  bit clk;
  int cnt=1;

  initial begin
    while(cnt==1) begin
    #5 clk= ~clk;
  end
  end
  
  initial begin
    $dumpfile("clk.vcd");
    $dumpvars();    
    #100;
    $finish();
  end  
endmodule 

//clock generation using do-while loop
module tb_clock_gen;
  bit clk;
  int cnt=1;
    
  initial begin
    do begin
    #5 clk= ~clk;
    end while (cnt==1);
  end
  
  initial begin
    $dumpfile("clk.vcd");
    $dumpvars();   
    #100;
    $finish();
  end
  
endmodule

// Write a task to generate a free clock of 100MHZ 
// NOTE: This can be done using only forever . Because in side task , we cannot write procedural block like initial , always etc
module task_clock_gen();
  reg clk ;
  initial 
    begin
      my_clk();
    end
  task my_clk();   //Task
    begin
      clk=1'b0;
      forever 
      #5 clk= ~clk;
    end
  endtask : my_clk
endmodule :task_clock_gen
