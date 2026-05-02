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
// Purpose : Generate 1GHZ clock with 50% Duty Cycle using always block
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
// Purpose : Generate 100MHZ clock with 70% Duty Cycle using always block
// Author  : Siba Kumar Panda
////////////////////////////////////////////////////////////////////////////////////////////////////////
//Question6. Generate 100MHZ clock with 70% Duty Cycle using always block

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

////////////////////////////////////////////////////////////////////////////////////////////////////////
//(c) Copyright Siba Kumar Panda, All rights reserved
// File    : 7_tb_clock_gen_with_dc.sv 
// Project : tb_clock_gen_with_various_duty_cycle.sv
// Purpose : Generate 200MHZ clock with 70% Duty Cycle using always block
// Author  : Siba Kumar Panda
////////////////////////////////////////////////////////////////////////////////////////////////////////
//Question7. Generate 200MHZ clock with 70% Duty Cycle using always block
/*
DUTY CYCLE = Thigh/ (Thigh+Tlow) = Thigh/ (Tperiod)
Given Frequency =200MHz , So Time Period = 1/Tperiod = 1/200MHz = 5ns
Hence from 5ns of total time period , 70% we have to take as Thigh and 30% as Tlow
70 % 5ns = 3.5ns =Thigh
30 % 5ns = 1.5ns =Tlow
*/

`timescale 1ns / 1ps   // unit = 1ns, precision = 1ps
module tb_clock_gen_with_dc_ex7;
  bit clk;
  always begin      // clk frequency=200MHz ,Time period =5ns , 3.5ns High and 1.5ns Low
    clk = 1'b1;
    #3.5;
    clk = 1'b0;
    #1.5;
  end
  initial begin
    $dumpfile("clk.vcd");
    $dumpvars();    
    #1000;
    $finish();
  end    
endmodule: tb_clock_gen_with_dc_ex7

////////////////////////////////////////////////////////////////////////////////////////////////////////
//(c) Copyright Siba Kumar Panda, All rights reserved
// File    : 8_tb_clock_gen_with_dc.sv 
// Project : tb_clock_gen_with_various_duty_cycle.sv
// Purpose : Generate 50MHZ clock with 70% Duty Cycle using always block
// Author  : Siba Kumar Panda
////////////////////////////////////////////////////////////////////////////////////////////////////////
//Question8. Generate 50MHZ clock with 70% Duty Cycle using always block

/*
DUTY CYCLE = Thigh/ (Thigh+Tlow) = Thigh/ (Tperiod)
Given Frequency =50MHz , So Time Period = 1/Tperiod = 1/50MHz = 20ns
Hence from 20ns of total time period , 70% we have to take as Thigh and 30% as Tlow
70 % 20ns = 14ns =Thigh
30 % 20ns = 6ns =Tlow
*/

`timescale 1ns / 1ps   // unit = 1ns, precision = 1ps
module tb_clock_gen_with_dc_ex8;
  bit clk;  
  always begin      // clk frequency=50MHz ,Time period =20ns , 14ns High and 6ns Low
    clk = 1'b1;
    #14;
    clk = 1'b0;
    #6;
  end
  initial begin
    $dumpfile("clk.vcd");
    $dumpvars();    
    #1000;
    $finish();
  end    
endmodule: tb_clock_gen_with_dc_ex8

////////////////////////////////////////////////////////////////////////////////////////////////////////
//(c) Copyright Siba Kumar Panda, All rights reserved
// File    : 9_tb_clock_gen_with_dc.sv 
// Project : tb_clock_gen_with_various_duty_cycle.sv
// Purpose : Generate 1GHZ clock with 70% Duty Cycle using always block
// Author  : Siba Kumar Panda
////////////////////////////////////////////////////////////////////////////////////////////////////////
//Question9. Generate 1GHZ clock with 70% Duty Cycle using always block
/*
DUTY CYCLE = Thigh/ (Thigh+Tlow) = Thigh/ (Tperiod)
Given Frequency =1GHz , So Time Period = 1/Tperiod = 1/1GHz = 1ns
Hence from 1ns of total time period , 70% we have to take as Thigh and 30% as Tlow
70 % 1ns = 0.7ns =Thigh
30 % 1ns = 0.3ns =Tlow
*/
`timescale 1ns / 1ps   // unit = 1ns, precision = 1ps
module tb_clock_gen_with_dc_ex9;
  bit clk;
  
  always begin      // clk frequency=1GHZ ,Time period =1ns , 0.7ns High and 0.3ns Low
    clk = 1'b1;
    #0.7;
    clk = 1'b0;
    #0.3;
  end      
  initial begin
    $dumpfile("clk.vcd");
    $dumpvars();    
    #1000;
    $finish();
  end    
endmodule: tb_clock_gen_with_dc_ex9

////////////////////////////////////////////////////////////////////////////////////////////////////////
//(c) Copyright Siba Kumar Panda, All rights reserved
// File    : 10_tb_clock_gen_with_dc.sv 
// Project : tb_clock_gen_with_various_duty_cycle.sv
// Purpose : Generate 2GHZ clock with 70% Duty Cycle using always block
// Author  : Siba Kumar Panda
////////////////////////////////////////////////////////////////////////////////////////////////////////
//Question10. Generate 2GHZ clock with 70% Duty Cycle using always block

/*
DUTY CYCLE = Thigh/ (Thigh+Tlow) = Thigh/ (Tperiod)
Given Frequency =2GHz , So Time Period = 1/Tperiod = 1/2GHz = 0.5ns
Hence from 0.5ns of total time period , 70% we have to take as Thigh and 30% as Tlow
70 % 0.5ns = 0.35ns =Thigh
30 % 0.5ns = 0.15ns =Tlow
*/

`timescale 1ns / 1ps   // unit = 1ns, precision = 1ps
module tb_clock_gen_with_dc_ex10;
  bit clk;
  
  always begin      // clk frequency=2GHZ ,Time period =0.5ns , 0.35ns High and 0.15ns Low
    clk = 1'b1;
    #0.35;
    clk = 1'b0;
    #0.15;
  end  
  initial begin
    $dumpfile("clk.vcd");
    $dumpvars();    
    #1000;
    $finish();
  end    
endmodule: tb_clock_gen_with_dc_ex10

////////////////////////////////////////////////////////////////////////////////////////////////////////
//(c) Copyright Siba Kumar Panda, All rights reserved
// File    : 11_tb_clock_gen_with_dc.sv 
// Project : tb_clock_gen_with_various_duty_cycle.sv
// Purpose : Generate 100MHZ clock with 75% Duty Cycle using always block
// Author  : Siba Kumar Panda
////////////////////////////////////////////////////////////////////////////////////////////////////////
//Question11. Generate 100MHZ clock with 75% Duty Cycle using always block
/*
DUTY CYCLE = Thigh/ (Thigh+Tlow) = Thigh/ (Tperiod)
Given Frequency =100MHz , So Time Period = 1/Tperiod = 1/100MHz = 10ns
Hence from 10ns of total time period , 75% we have to take as Thigh and 25% as Tlow
75 % 10ns = 7.5ns =Thigh
25 % 10ns = 2.5ns =Tlow
*/

`timescale 1ns / 1ps   // unit = 1ns, precision = 1ps
module tb_clock_gen_with_dc_ex11;
  bit clk;  
  always begin        // clk frequency=100MHZ ,Time period =10ns , 7.5ns High and 2.5ns Low
    clk = 1'b1;
    #7.5;
    clk = 1'b0;
    #2.5;
  end     
  initial begin
    $dumpfile("clk.vcd");
    $dumpvars();    
    #1000;
    $finish();
  end    
endmodule: tb_clock_gen_with_dc_ex11

////////////////////////////////////////////////////////////////////////////////////////////////////////
//(c) Copyright Siba Kumar Panda, All rights reserved
// File    : 12_tb_clock_gen_with_dc.sv 
// Project : tb_clock_gen_with_various_duty_cycle.sv
// Purpose : Generate 200MHZ clock with 75% Duty Cycle using always block
// Author  : Siba Kumar Panda
////////////////////////////////////////////////////////////////////////////////////////////////////////
//Question12. Generate 200MHZ clock with 75% Duty Cycle using always block
/*
DUTY CYCLE = Thigh/ (Thigh+Tlow) = Thigh/ (Tperiod)
Given Frequency =200MHz , So Time Period = 1/Tperiod = 1/200MHz = 5ns
Hence from 5ns of total time period , 75% we have to take as Thigh and 25% as Tlow
75 % 5ns = 3.75ns =Thigh
25 % 5ns = 1.25ns =Tlow
*/

`timescale 1ns / 1ps   // unit = 1ns, precision = 1ps
module tb_clock_gen_with_dc_ex12;
  bit clk;  
  always begin      // clk frequency=200MHZ ,Time period =5ns , 3.75ns High and 1.5ns Low
    clk = 1'b1;
    #3.75;
    clk = 1'b0;
    #1.25;
  end    
  initial begin
    $dumpfile("clk.vcd");
    $dumpvars();    
    #1000;
    $finish();
  end    
endmodule: tb_clock_gen_with_dc_ex12

////////////////////////////////////////////////////////////////////////////////////////////////////////
//(c) Copyright Siba Kumar Panda, All rights reserved
// File    : 13_tb_clock_gen_with_dc.sv 
// Project : tb_clock_gen_with_various_duty_cycle.sv
// Purpose : Generate 50MHZ clock with 75% Duty Cycle using always block
// Author  : Siba Kumar Panda
////////////////////////////////////////////////////////////////////////////////////////////////////////
//Question13. Generate 50MHZ clock with 75% Duty Cycle using always block
/*
DUTY CYCLE = Thigh/ (Thigh+Tlow) = Thigh/ (Tperiod)
Given Frequency =50MHz , So Time Period = 1/Tperiod = 1/50MHz = 20ns
Hence from 20ns of total time period , 75% we have to take as Thigh and 25% as Tlow
75 % 20ns = 15ns =Thigh
25 % 20ns = 5ns =Tlow
*/

`timescale 1ns / 1ps   // unit = 1ns, precision = 1ps
module tb_clock_gen_with_dc_ex13;
  bit clk; 
  always begin         // clk frequency=50MHZ ,Time period =20ns , 15ns High and 5ns Low
    clk = 1'b1;
    #15;
    clk = 1'b0;
    #5;
  end     
  initial begin
    $dumpfile("clk.vcd");
    $dumpvars();    
    #1000;
    $finish();
  end   
endmodule: tb_clock_gen_with_dc_ex13

////////////////////////////////////////////////////////////////////////////////////////////////////////
//(c) Copyright Siba Kumar Panda, All rights reserved
// File    : 14_tb_clock_gen_with_dc.sv 
// Project : tb_clock_gen_with_various_duty_cycle.sv
// Purpose : Generate 1GHZ clock with 75% Duty Cycle using always block
// Author  : Siba Kumar Panda
////////////////////////////////////////////////////////////////////////////////////////////////////////
//Question14. Generate 1GHZ clock with 75% Duty Cycle using always block
/*
DUTY CYCLE = Thigh/ (Thigh+Tlow) = Thigh/ (Tperiod)
Given Frequency =1GHz , So Time Period = 1/Tperiod = 1/1GHz = 1ns
Hence from 1ns of total time period , 75% we have to take as Thigh and 25% as Tlow
75 % 1ns = 0.75ns =Thigh
25 % 1ns = 0.25ns =Tlow
*/

`timescale 1ns / 1ps   // unit = 1ns, precision = 1ps
module tb_clock_gen_with_dc_ex14;
  bit clk;  
  always begin      // clk frequency=1GHZ ,Time period =1ns , 0.75ns High and 0.25ns Low
    clk = 1'b1;
    #0.75;
    clk = 1'b0;
    #0.25;
  end      
  initial begin
    $dumpfile("clk.vcd");
    $dumpvars();    
    #1000;
    $finish();
  end    
endmodule: tb_clock_gen_with_dc_ex14

////////////////////////////////////////////////////////////////////////////////////////////////////////
//(c) Copyright Siba Kumar Panda, All rights reserved
// File    : 15_tb_clock_gen_with_dc.sv 
// Project : tb_clock_gen_with_various_duty_cycle.sv
// Purpose : Generate 2GHZ clock with 75% Duty Cycle using always block
// Author  : Siba Kumar Panda
////////////////////////////////////////////////////////////////////////////////////////////////////////
//Question15. Generate 2GHZ clock with 75% Duty Cycle using always block
/*
DUTY CYCLE = Thigh/ (Thigh+Tlow) = Thigh/ (Tperiod)
Given Frequency =2GHz , So Time Period = 1/Tperiod = 1/2GHz = 0.5ns
Hence from 0.5ns of total time period , 75% we have to take as Thigh and 25% as Tlow
75 % 0.5ns = 0.375ns =Thigh
25 % 0.5ns = 0.125ns =Tlow
*/
`timescale 1ns / 1ps   // unit = 1ns, precision = 1ps
module tb_clock_gen_with_dc_ex15;
  bit clk;  
  always begin      // clk frequency=2GHZ ,Time period =0.5ns , 0.375ns High and 0.125ns Low
    clk = 1'b1;
    #0.375;
    clk = 1'b0;
    #0.125;
  end      
  initial begin
    $dumpfile("clk.vcd");
    $dumpvars();    
    #1000;
    $finish();
  end   
endmodule: tb_clock_gen_with_dc_ex15

////////////////////////////////////////////////////////////////////////////////////////////////////////
//(c) Copyright Siba Kumar Panda, All rights reserved
// File    : 16_tb_clock_gen_with_dc.sv 
// Project : tb_clock_gen_with_various_duty_cycle.sv
// Purpose : Generate 100MHZ clock with 80% Duty Cycle using always block
// Author  : Siba Kumar Panda
////////////////////////////////////////////////////////////////////////////////////////////////////////
//Question16. Generate 100MHZ clock with 80% Duty Cycle using always block
/*
DUTY CYCLE = Thigh/ (Thigh+Tlow) = Thigh/ (Tperiod)
Given Frequency =100MHz , So Time Period = 1/Tperiod = 1/100MHz = 10ns
Hence from 10ns of total time period , 80% we have to take as Thigh and 20% as Tlow
80 % 10ns = 8ns =Thigh
20 % 10ns = 2ns =Tlow
*/

`timescale 1ns / 1ps   // unit = 1ns, precision = 1ps
module tb_clock_gen_with_dc_ex16;
  bit clk; 
  always begin      // clk frequency=100MHZ ,Time period =10ns , 8ns High and 2ns Low
    clk = 1'b1;
    #8;
    clk = 1'b0;
    #2;
  end     
  initial begin
    $dumpfile("clk.vcd");
    $dumpvars();    
    #1000;
    $finish();
  end    
endmodule: tb_clock_gen_with_dc_ex16

////////////////////////////////////////////////////////////////////////////////////////////////////////
//(c) Copyright Siba Kumar Panda, All rights reserved
// File    : 17_tb_clock_gen_with_dc.sv 
// Project : tb_clock_gen_with_various_duty_cycle.sv
// Purpose : Generate 200MHZ clock with 80% Duty Cycle using always block
// Author  : Siba Kumar Panda
////////////////////////////////////////////////////////////////////////////////////////////////////////
//Question17. Generate 200MHZ clock with 80% Duty Cycle using always block
/*
DUTY CYCLE = Thigh/ (Thigh+Tlow) = Thigh/ (Tperiod)
Given Frequency =200MHz , So Time Period = 1/Tperiod = 1/200MHz = 5ns
Hence from 5ns of total time period , 80% we have to take as Thigh and 20% as Tlow
80 % 5ns = 4ns =Thigh
20 % 5ns = 1ns =Tlow
*/

`timescale 1ns / 1ps   // unit = 1ns, precision = 1ps
module tb_clock_gen_with_dc_ex17;
  bit clk; 
  always begin      // clk frequency=200MHZ ,Time period =5ns , 4ns High and 1ns Low
    clk = 1'b1;
    #4;
    clk = 1'b0;
    #1;
  end      
  initial begin
    $dumpfile("clk.vcd");
    $dumpvars();    
    #1000;
    $finish();
  end    
endmodule: tb_clock_gen_with_dc_ex17

////////////////////////////////////////////////////////////////////////////////////////////////////////
//(c) Copyright Siba Kumar Panda, All rights reserved
// File    : 18_tb_clock_gen_with_dc.sv 
// Project : tb_clock_gen_with_various_duty_cycle.sv
// Purpose : Generate 50MHZ clock with 80% Duty Cycle using always block
// Author  : Siba Kumar Panda
////////////////////////////////////////////////////////////////////////////////////////////////////////
//Question18. Generate 50MHZ clock with 80% Duty Cycle using always block
/*
DUTY CYCLE = Thigh/ (Thigh+Tlow) = Thigh/ (Tperiod)
Given Frequency =50MHz , So Time Period = 1/Tperiod = 1/50MHz = 20ns
Hence from 20ns of total time period , 80% we have to take as Thigh and 20% as Tlow
80 % 20ns = 16ns =Thigh
20 % 20ns = 4ns =Tlow
*/

`timescale 1ns / 1ps   // unit = 1ns, precision = 1ps
module tb_clock_gen_with_dc_ex18;
  bit clk;
  always begin         // clk frequency=50MHZ ,Time period =20ns , 16ns High and 4ns Low
    clk = 1'b1;
    #16;
    clk = 1'b0;
    #4;
  end    
  initial begin
    $dumpfile("clk.vcd");
    $dumpvars();    
    #1000;
    $finish();
  end    
endmodule: tb_clock_gen_with_dc_ex18

//Question19. Generate 1GHZ clock with 80% Duty Cycle using always block

//Question20. Generate 2GHZ clock with 80% Duty Cycle using always block




//Question21. Generate 100MHZ clock with 85% Duty Cycle using always block

//Question22. Generate 200MHZ clock with 85% Duty Cycle using always block

//Question23. Generate 50MHZ clock with 85% Duty Cycle using always block

//Question24. Generate 1GHZ clock with 85% Duty Cycle using always block

//Question25. Generate 2GHZ clock with 85% Duty Cycle using always block
