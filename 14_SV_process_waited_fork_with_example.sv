System Verilog wait fork :
- The ‘wait fork’ statement is used to wait for all forked processes to be completed.

//////////////////////////////////
  wait fork  Example1
//////////////////////////////////  
module wait_fork_example1; //wait fork example using fork...join process
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
    wait fork;
    $display("fork...join completed at time = %0t", $time); //20ns
  end
endmodule :wait_fork_example1

//Log File Output
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Jan 19 09:49 2026
Process A started at time = 0
Process B started at time = 0
Process C started at time = 0
Process A completed at time = 10
Process B completed at time = 15
Process C completed at time = 20
fork...join completed at time = 20
           V C S   S i m u l a t i o n   R e p o r t       
      
    
//////////////////////////////////
  wait fork  Example2
////////////////////////////////// 
module wait_fork_example2; //wait fork example using fork...join_any process
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
    join_any
    wait fork;
    $display("fork...join_any completed at time = %0t", $time); //20ns
  end
endmodule :wait_fork_example2
      
//Log File Output
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Jan 19 09:51 2026
Process A started at time = 0
Process B started at time = 0
Process C started at time = 0
Process A completed at time = 10
Process B completed at time = 15
Process C completed at time = 20
fork...join_any completed at time = 20
           V C S   S i m u l a t i o n   R e p o r t       
      

//////////////////////////////////
  wait fork  Example3
////////////////////////////////// 
module wait_fork_example3; //wait fork example using fork...join_none process
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
    join_none
    wait fork;
    $display("fork...join_none completed at time = %0t", $time); //20ns
  end
endmodule :wait_fork_example3

//LogFile Output
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Jan 19 09:52 2026
Process A started at time = 0
Process B started at time = 0
Process C started at time = 0
Process A completed at time = 10
Process B completed at time = 15
Process C completed at time = 20
fork...join_none completed at time = 20
           V C S   S i m u l a t i o n   R e p o r t      
    
//////////////////////////////////
  wait fork  Example4
////////////////////////////////// 
module wait_fork_example4; //wait fork example using fork...join_any process
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
    join_any
    wait fork;
    #5;
    $display("fork...join_any completed at time = %0t", $time); //25ns
  end
endmodule :wait_fork_example4

//LogFile Output
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Jan 19 09:53 2026
Process A started at time = 0
Process B started at time = 0
Process C started at time = 0
Process A completed at time = 10
Process B completed at time = 15
Process C completed at time = 20
fork...join_any completed at time = 25
           V C S   S i m u l a t i o n   R e p o r t       
    
//////////////////////////////////
  wait fork  Example5
////////////////////////////////// 
module wait_fork_example5; //wait fork example using fork...join_none process
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
    join_none
    wait fork;
     #5;
    $display("fork...join_none completed at time = %0t", $time); //20ns
  end
endmodule :wait_fork_example5
      
//Logfile Output
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Jan 19 09:54 2026
Process A started at time = 0
Process B started at time = 0
Process C started at time = 0
Process A completed at time = 10
Process B completed at time = 15
Process C completed at time = 20
fork...join_none completed at time = 25
           V C S   S i m u l a t i o n   R e p o r t       
      
//////////////////////////////////
  wait fork  Example6
////////////////////////////////// 


//////////////////////////////////
  wait fork  Example7
//////////////////////////////////



//////////////////////////////////
  wait fork  Example8
//////////////////////////////////



//////////////////////////////////
  wait fork  Example9
//////////////////////////////////


//////////////////////////////////
  wait fork  Example10
//////////////////////////////////


//////////////////////////////////
  wait fork  Example11
//////////////////////////////////


//////////////////////////////////
  wait fork  Example12
//////////////////////////////////


//////////////////////////////////
  wait fork  Example13
//////////////////////////////////


//////////////////////////////////
  wait fork  Example14
//////////////////////////////////


//////////////////////////////////
  wait fork  Example15
//////////////////////////////////    
    
