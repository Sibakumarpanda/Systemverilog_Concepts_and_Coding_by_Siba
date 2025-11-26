//More Practice Examples using Various SV Looping Constructs:
****************Systemverilog_looping_constructs_example_by_Siba****************************

Question 1: Infinite Loop Detection using while loop ,Tricky Scenarios
module while_tricky;
  int count = 0;
  int arr[4] = '{1, 2, 3, 4};
  
  initial begin
    while (count < 4) begin
      $display("arr[%0d] = %0d", count, arr[count]);
      // Missing increment - what happens?
    end
  end
endmodule
//Log file Output - This creates an infinite loop because count never increments.

Question 2: Conditional Modification in Loop
module while_conditional;
  int x = 0;
  int y = 10;
  
  initial begin
    while (x < 5 && y > 0) begin
      x++;
      if (x == 3) y = 0;  // What happens next iteration?
      $display("x=%0d, y=%0d", x, y);
    end
  end
endmodule
//Log File Output
