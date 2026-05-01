//************************************ Clock generation with various Duty Cycle ***************************************************
////////////////////////////////////////////////////////////////////////////////////////////////////////
//(c) Copyright Siba Kumar Panda, All rights reserved
// File    : 1_tb_clock_gen_with_dc.sv 
// Project : tb_clock_gen_with_various_duty_cycle.sv
// Purpose : Generate 100MHZ clock with 50% Duty Cycle using always block
// Author  : Siba Kumar Panda
////////////////////////////////////////////////////////////////////////////////////////////////////////
//Question1. Generate 100MHZ clock with 50% Duty Cycle using always block
/*
DUTY CYCLE = Thigh/ (Thigh+Tlow) = Thigh/ (Tperiod)
Given Frequency =100MHz , So Time Period = 1/Tperiod = 1/100MHz = 10ns
Hence from 10ns of total time period , 50% we have to take as Thigh and 50% as Tlow
50% 10ns = 5ns =Thigh
50% 10ns = 5ns =Tlow
*/
`timescale 1ns / 1ps   // unit = 1ns, precision = 1ps
module tb_clock_gen_with_dc_ex1;
  bit clk;  
  always #5 clk= ~clk;  // clk frequency=100MHZ ,Time period =10ns , 5ns High and 5ns Low
  
  initial begin
    $dumpfile("clk.vcd");
    $dumpvars();    
    #1000;
    $finish();
  end    
endmodule: tb_clock_gen_with_dc_ex1

////////////////////////////////////////////////////////////////////////////////////////////////////////
//(c) Copyright Siba Kumar Panda, All rights reserved
// File    : 2_tb_clock_gen_with_dc.sv 
// Project : tb_clock_gen_with_various_duty_cycle.sv
// Purpose : Generate 200MHZ clock with 50% Duty Cycle using always block
// Author  : Siba Kumar Panda
////////////////////////////////////////////////////////////////////////////////////////////////////////
//Question2. Generate 200MHZ clock with 50% Duty Cycle using always block
/*
DUTY CYCLE = Thigh/ (Thigh+Tlow) = Thigh/ (Tperiod)
Given Frequency =200MHz , So Time Period = 1/Tperiod = 1/200MHz = 5ns
Hence from 5ns of total time period , 50% we have to take as Thigh and 50% as Tlow
50 % 5ns = 2.5ns =Thigh
50 % 5ns = 2.5ns =Tlow
*/
`timescale 1ns / 1ps   // unit = 1ns, precision = 1ps
module tb_clock_gen_with_dc_ex2;
  bit clk;
  always #2.5 clk= ~clk;  // clk frequency=200MHZ ,Time period =5ns , 2.5ns High and 2.5ns Low
  
  initial begin
    $dumpfile("clk.vcd");
    $dumpvars();    
    #1000;
    $finish();
  end    
endmodule: tb_clock_gen_with_dc_ex2

////////////////////////////////////////////////////////////////////////////////////////////////////////
//(c) Copyright Siba Kumar Panda, All rights reserved
// File    : 3_tb_clock_gen_with_dc.sv 
// Project : tb_clock_gen_with_various_duty_cycle.sv
// Purpose : Generate 50MHZ clock with 50% Duty Cycle using always block
// Author  : Siba Kumar Panda
////////////////////////////////////////////////////////////////////////////////////////////////////////
//Question3. Generate 50MHZ clock with 50% Duty Cycle using always block
/*
DUTY CYCLE = Thigh/ (Thigh+Tlow) = Thigh/ (Tperiod)
Given Frequency =50MHz , So Time Period = 1/Tperiod = 1/50MHz = 20ns
Hence from 20ns of total time period , 50% we have to take as Thigh and 50% as Tlow
50 % 20ns = 10ns =Thigh
50 % 20ns = 10ns =Tlow
*/
`timescale 1ns / 1ps   // unit = 1ns, precision = 1ps
module tb_clock_gen_with_dc_ex3;
  bit clk;

  always #10 clk= ~clk;  // clk frequency=50MHZ ,Time period =20ns , 10ns High and 10ns Low
  
  initial begin
    $dumpfile("clk.vcd");
    $dumpvars();    
    #1000;
    $finish();
  end   
endmodule: tb_clock_gen_with_dc_ex3

////////////////////////////////////////////////////////////////////////////////////////////////////////
//(c) Copyright Siba Kumar Panda, All rights reserved
// File    : 4_tb_clock_gen_with_dc.sv 
// Project : tb_clock_gen_with_various_duty_cycle.sv
// Purpose : Generate 1GZ clock with 50% Duty Cycle using always block
// Author  : Siba Kumar Panda
////////////////////////////////////////////////////////////////////////////////////////////////////////
//Question4. Generate 1GHZ clock with 50% Duty Cycle using always block

/*
DUTY CYCLE = Thigh/ (Thigh+Tlow) = Thigh/ (Tperiod)
Given Frequency =1GHz , So Time Period = 1/Tperiod = 1/1GHz = 1ns
Hence from 1ns of total time period , 50% we have to take as Thigh and 50% as Tlow
50 % 1ns = 0.5ns =Thigh
50 % 1ns = 0.5ns =Tlow
*/
`timescale 1ns / 1ps   // unit = 1ns, precision = 1ps
module tb_clock_gen_with_dc_ex4;
  bit clk;  
  always #0.5 clk= ~clk;  // clk frequency=1GHZ ,Time period =1ns , 0.5ns High and 0.5ns Low  
  
  initial begin
    $dumpfile("clk.vcd");
    $dumpvars();    
    #1000;
    $finish();
  end    
endmodule: tb_clock_gen_with_dc_ex4

////////////////////////////////////////////////////////////////////////////////////////////////////////
//(c) Copyright Siba Kumar Panda, All rights reserved
// File    : 5_tb_clock_gen_with_dc.sv 
// Project : tb_clock_gen_with_various_duty_cycle.sv
// Purpose : Generate 2GHZ clock with 50% Duty Cycle using always block
// Author  : Siba Kumar Panda
////////////////////////////////////////////////////////////////////////////////////////////////////////
//Question5. Generate 2GHZ clock with 50% Duty Cycle using always block

/*
DUTY CYCLE = Thigh/ (Thigh+Tlow) = Thigh/ (Tperiod)
Given Frequency =2GHz , So Time Period = 1/Tperiod = 1/2GHz = 0.5ns
Hence from 0.5ns of total time period , 50% we have to take as Thigh and 50% as Tlow
50 % 0.5ns = 0.25ns =Thigh
50 % 0.5ns = 0.25ns =Tlow
*/
`timescale 1ns / 1ps   // unit = 1ns, precision = 1ps
module tb_clock_gen_with_dc_ex5;
  bit clk;
  
  always #0.25 clk= ~clk;  // clk frequency=2GHZ ,Time period =0.5ns , 0.25ns High and 0.25ns Low 
  initial begin
    $dumpfile("clk.vcd");
    $dumpvars();    
    #1000;
    $finish();
  end    
endmodule: tb_clock_gen_with_dc_ex5

////////////////////////////////////////////////////////////////////////////////////////////////////////
//(c) Copyright Siba Kumar Panda, All rights reserved
// File    : 6_tb_clock_gen_with_dc.sv 
// Project : tb_clock_gen_with_various_duty_cycle.sv
// Purpose : Generate 100MZ clock with 70% Duty Cycle using always block
// Author  : Siba Kumar Panda
////////////////////////////////////////////////////////////////////////////////////////////////////////
//Question6. Generate 100MZ clock with 70% Duty Cycle using always block

/*
DUTY CYCLE = Thigh/ (Thigh+Tlow) = Thigh/ (Tperiod)
Given Frequency =100MHz , So Time Period = 1/Tperiod = 1/100MHz = 10ns
Hence from 10ns of total time period , 70% we have to take as Thigh and 30% as Tlow
70 % 10ns = 7ns =Thigh
30 % 10ns = 3ns =Tlow
*/

`timescale 1ns / 1ps      // unit = 1ns, precision = 1ps
module tb_clock_gen_with_dc_ex6;
  bit clk;
  
  always begin      // clk frequency=100MHz ,Time period =10ns , 7ns High and 3ns Low
    clk = 1'b1;
    #7;
    clk = 1'b0;
    #3;
  end
     
  initial begin
    $dumpfile("clk.vcd");
    $dumpvars();    
    #1000;
    $finish();
  end    
endmodule: tb_clock_gen_with_dc_ex6

//Question7. Generate 200MHZ clock with 70% Duty Cycle using always block

//Question8. Generate 50MHZ clock with 70% Duty Cycle using always block

//Question9. Generate 1GHZ clock with 70% Duty Cycle using always block

//Question10. Generate 2GHZ clock with 70% Duty Cycle using always block




//Question11. Generate 100MHZ clock with 75% Duty Cycle using always block

//Question12. Generate 200MHZ clock with 75% Duty Cycle using always block

//Question13. Generate 50MHZ clock with 75% Duty Cycle using always block

//Question14. Generate 1GHZ clock with 75% Duty Cycle using always block

//Question15. Generate 2GHZ clock with 75% Duty Cycle using always block



//Question16. Generate 100MHZ clock with 80% Duty Cycle using always block

//Question17. Generate 200MHZ clock with 80% Duty Cycle using always block

//Question18. Generate 50MHZ clock with 80% Duty Cycle using always block

//Question19. Generate 1GHZ clock with 80% Duty Cycle using always block

//Question20. Generate 2GHZ clock with 80% Duty Cycle using always block




//Question21. Generate 100MHZ clock with 85% Duty Cycle using always block

//Question22. Generate 200MHZ clock with 85% Duty Cycle using always block

//Question23. Generate 50MHZ clock with 85% Duty Cycle using always block

//Question24. Generate 1GHZ clock with 85% Duty Cycle using always block

//Question25. Generate 2GHZ clock with 85% Duty Cycle using always block
