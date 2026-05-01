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
// File    : 2_clock_gen_with_dc.sv 
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




////////////////////////////////////////////////////////////////////////////////////////////////////////
//(c) Copyright Siba Kumar Panda, All rights reserved
// File    : 4_tb_clock_gen_with_dc.sv 
// Project : tb_clock_gen_with_various_duty_cycle.sv
// Purpose : Generate 1GHZ clock with 50% Duty Cycle using always block
// Author  : Siba Kumar Panda
////////////////////////////////////////////////////////////////////////////////////////////////////////
//Question4. Generate 1GHZ clock with 50% Duty Cycle using always block






//Question5. Generate 100MHZ clock with 70% Duty Cycle using always block

//Question6. Generate 200MHZ clock with 70% Duty Cycle using always block

//Question7. Generate 50MHZ clock with 70% Duty Cycle using always block

//Question8. Generate 1GHZ clock with 70% Duty Cycle using always block




//Question9. Generate 100MHZ clock with 75% Duty Cycle using always block

//Question10. Generate 200MHZ clock with 75% Duty Cycle using always block

//Question11. Generate 50MHZ clock with 75% Duty Cycle using always block

//Question12. Generate 1GHZ clock with 75% Duty Cycle using always block



//Question13. Generate 100MHZ clock with 80% Duty Cycle using always block

//Question14. Generate 200MHZ clock with 80% Duty Cycle using always block

//Question15. Generate 50MHZ clock with 80% Duty Cycle using always block

//Question16. Generate 1GHZ clock with 80% Duty Cycle using always block




//Question17. Generate 100MHZ clock with 85% Duty Cycle using always block

//Question18. Generate 200MHZ clock with 85% Duty Cycle using always block

//Question19. Generate 50MHZ clock with 85% Duty Cycle using always block

//Question20. Generate 1GHZ clock with 85% Duty Cycle using always block
