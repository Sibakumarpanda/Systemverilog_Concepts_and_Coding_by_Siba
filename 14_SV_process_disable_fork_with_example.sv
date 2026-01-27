System Verilog disable fork :
- The ‘disable fork’ statement terminates all outstanding or active processes.

//////////////////////////////////
  disable fork  Example1
//////////////////////////////////  
module disable_fork_example1; //disable fork example using fork...join process
  initial begin
    fork
      begin // process A
        $display("Process A started at time = %0t", $time); //0ns
        #10;
        $display("Process A completed at time = %0t", $time); //10ns
      end
      begin // process B
        $display("Process B started at time = %0t", $time); //0ns
        #15;
        $display("Process B completed at time = %0t", $time); //15ns
      end
      begin // process C
        $display("Process C started at time = %0t", $time); //0ns
        #20;
        $display("Process C completed at time = %0t", $time); //20ns
      end
    join
    disable fork;
    $display("fork...join completed at time = %0t", $time); //20ns
  end
endmodule :disable_fork_example1
      
//Log File Output
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Jan 19 09:20 2026
Process A started at time = 0
Process B started at time = 0
Process C started at time = 0
Process A completed at time = 10
Process B completed at time = 15
Process C completed at time = 20
fork...join completed at time = 20
           V C S   S i m u l a t i o n   R e p o r t       
      
//////////////////////////////////
  disable fork  Example2
//////////////////////////////////  
module disable_fork_example2; //disable fork example using fork...join_any process
  initial begin
    fork
      begin // process A
        $display("Process A started at time = %0t", $time); //0ns
        #10;
        $display("Process A completed at time = %0t", $time); //10ns
      end
      begin // process B
        $display("Process B started at time = %0t", $time); //0ns
        #15;
        $display("Process B completed at time = %0t", $time); //It will not executed due to effect of disable fork 
      end
      begin // process C
        $display("Process C started at time = %0t", $time); //0ns
        #20;
        $display("Process C completed at time = %0t", $time); //It will not executed due to effect of disable fork 
      end
    join_any
    disable fork;
    $display("fork...join_any completed at time = %0t", $time); //10ns
  end
endmodule :disable_fork_example2
      
//Log File Output
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Jan 19 09:24 2026
Process A started at time = 0
Process B started at time = 0
Process C started at time = 0
Process A completed at time = 10
fork...join_any completed at time = 10
           V C S   S i m u l a t i o n   R e p o r t       
      
//////////////////////////////////
  disable fork  Example3
//////////////////////////////////  
module disable_fork_example3; //disable fork example using fork...join_none process
  initial begin
    fork
      begin // process A
        $display("Process A started at time = %0t", $time); //It will not executed due to effect of disable fork
        #10;
        $display("Process A completed at time = %0t", $time); //It will not executed due to effect of disable fork
      end
      begin // process B
        $display("Process B started at time = %0t", $time); //It will not executed due to effect of disable fork
        #15;
        $display("Process B completed at time = %0t", $time); //It will not executed due to effect of disable fork
      end
      begin // process C
        $display("Process C started at time = %0t", $time); //It will not executed due to effect of disable fork
        #20;
        $display("Process C completed at time = %0t", $time); //It will not executed due to effect of disable fork
      end
    join_none
    disable fork;
    $display("fork...join_none completed at time = %0t", $time); //0ns
  end
endmodule :disable_fork_example3

//Log File Output
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Jan 19 09:25 2026
fork...join_none completed at time = 0
           V C S   S i m u l a t i o n   R e p o r t       

//////////////////////////////////
  disable fork  Example4
//////////////////////////////////  
module disable_fork_example4; //disable fork example using fork...join_any process
  initial begin
    fork
      begin // process A
        $display("Process A started at time = %0t", $time); //0ns
        #10;
        $display("Process A completed at time = %0t", $time); //10ns
      end
      begin // process B
        $display("Process B started at time = %0t", $time); //0ns
        #15;
        $display("Process B completed at time = %0t", $time); //It will not executed due to effect of disable fork 
      end
      begin // process C
        $display("Process C started at time = %0t", $time); //0ns
        #20;
        $display("Process C completed at time = %0t", $time); //It will not executed due to effect of disable fork 
      end
    join_any
    disable fork;
     #3;
     $display("fork...join_any completed at time = %0t", $time); //13ns
  end
endmodule :disable_fork_example4
      
//Log File Output
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Jan 19 09:27 2026
Process A started at time = 0
Process B started at time = 0
Process C started at time = 0
Process A completed at time = 10
fork...join_any completed at time = 13
           V C S   S i m u l a t i o n   R e p o r t      
      
//////////////////////////////////
  disable fork  Example5
//////////////////////////////////  
module disable_fork_example5; //disable fork example using fork...join_none process
  initial begin
    fork
      begin // process A
        $display("Process A started at time = %0t", $time); //It will not executed due to effect of disable fork
        #10;
        $display("Process A completed at time = %0t", $time); //It will not executed due to effect of disable fork
      end
      begin // process B
        $display("Process B started at time = %0t", $time); //It will not executed due to effect of disable fork
        #15;
        $display("Process B completed at time = %0t", $time); //It will not executed due to effect of disable fork
      end
      begin // process C
        $display("Process C started at time = %0t", $time); //It will not executed due to effect of disable fork
        #20;
        $display("Process C completed at time = %0t", $time); //It will not executed due to effect of disable fork
      end
    join_none
    disable fork;
    #2;  
      $display("fork...join_none completed at time = %0t", $time); //2ns
  end
endmodule :disable_fork_example5

//Log File Output
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Jan 19 09:28 2026
fork...join_none completed at time = 2
           V C S   S i m u l a t i o n   R e p o r t       

//////////////////////////////////
  disable fork  Example6
//////////////////////////////////
module disable_fork_example6; 
  initial begin
    fork
      #50 $display("Task1: Should print at %0tns", $time);
      #10 
      begin
      $display("Task2: Timeout at %0tns", $time);
      disable fork;
      end
    join
    #5    
    $display("After fork...join block: at %0tns", $time);
    // What prints? What doesn't?
   end
endmodule: disable_fork_example6
      
//LogFile Output
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Jan 26 21:31 2026
Task2: Timeout at 10ns
Task1: Should print at 50ns
After fork...join block: at 55ns
           V C S   S i m u l a t i o n   R e p o r t      
      
      
    

//////////////////////////////////
  disable fork  Example7
////////////////////////////////// 

//////////////////////////////////
  disable fork  Example8
////////////////////////////////// 
    
//////////////////////////////////
  disable fork  Example9
////////////////////////////////// 

//////////////////////////////////
  disable fork  Example10
//////////////////////////////////     

//////////////////////////////////
  disable fork  Example11
////////////////////////////////// 

//////////////////////////////////
  disable fork  Example12
////////////////////////////////// 


//////////////////////////////////
  disable fork  Example13
////////////////////////////////// 


//////////////////////////////////
  disable fork  Example14
//////////////////////////////////  


//////////////////////////////////
  disable fork  Example15
////////////////////////////////// 

//////////////////////////////////
  disable fork  Example16
//////////////////////////////////


//////////////////////////////////
  disable fork  Example17
//////////////////////////////////


//////////////////////////////////
  disable fork  Example18
//////////////////////////////////


//////////////////////////////////
  disable fork  Example19
//////////////////////////////////


//////////////////////////////////
  disable fork  Example20
//////////////////////////////////


//////////////////////////////////
  disable fork  Example21
//////////////////////////////////


//////////////////////////////////
  disable fork  Example22
//////////////////////////////////


//////////////////////////////////
  disable fork  Example23
//////////////////////////////////


//////////////////////////////////
  disable fork  Example24
//////////////////////////////////

//////////////////////////////////
  disable fork  Example25
//////////////////////////////////

//////////////////////////////////
  disable fork  Example26
//////////////////////////////////

//////////////////////////////////
  disable fork  Example27
//////////////////////////////////

//////////////////////////////////
  disable fork  Example28
//////////////////////////////////


//////////////////////////////////
  disable fork  Example29
//////////////////////////////////


//////////////////////////////////
  disable fork  Example30
//////////////////////////////////

//////////////////////////////////
  disable fork  Example31
//////////////////////////////////


//////////////////////////////////
  disable fork  Example32
//////////////////////////////////


//////////////////////////////////
  disable fork  Example33
//////////////////////////////////


//////////////////////////////////
  disable fork  Example34
//////////////////////////////////

//////////////////////////////////
  disable fork  Example35
//////////////////////////////////

//////////////////////////////////
  disable fork  Example36
//////////////////////////////////    
