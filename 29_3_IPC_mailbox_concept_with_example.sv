///////////////////////////////////////////////////
   System Verilog Mailbox concept with example :
//////////////////////////////////////////////////
- A SystemVerilog mailbox is a way of communication between different processes to exchange data. 
- One process can put data into a mailbox that stores data internally and can be retrieved by another process. 
- Mailbox behaves as first-in, first-out (FIFO).
- Different types of Mailbox Types are :
  Generic mailbox
  Parameterized mailbox
- The mailboxes can be further categorized based on the size as :
  Bounded mailbox
  Unbounded mailbox

///////////////////////
  Generic mailbox 
//////////////////////
- The generic mailbox can be put or get data of any data_type like int, bit, byte, string, etc. By default, the mailbox is a typeless or generic mailbox.
- Syntax: mailbox <mailbox_name>

///////////////////////////
  Parameterized mailbox 
//////////////////////////
- The parameterized mailbox can be put or get data of particular data_type. 
- The parameterized mailbox is useful when data_type needs to be fixed. For differences in data_type, a compilation error is expected.
- Syntax: mailbox #(<type>) <mailbox_name>
          Example: mailbox #(int) mb;

///////////////////////////
  Bounded mailbox
//////////////////////////
- If the size of the mailbox is defined then it is a bounded mailbox. 
- When the mailbox is full, no further data can be put in the mailbox until an item or data is get from the mailbox.

///////////////////////////
  Unbounded mailbox
//////////////////////////
-The size is not defined. An unbounded mailbox has unlimited size.

///////////////////////////////
   Mailbox methods
//////////////////////////////
Method name                                                                               Description

function new(int bound = 0)                                                               Returns mailbox handle. An argument represents bounded mailbox size otherwise, it is an unbounded mailbox
   
task put(<data>)                                                                          Blocking method that stores data in the mailbox.
   
function int try_put(<data>)                                                              The non-blocking method that stores data in the mailbox if it is not full and returns 1 else 0.
   
task get(ref <data>)                                                                      Blocking method to retrieve data from the mailbox
   
function int try_get(ref <data>)                                                          The non-blocking method which returns data if a mailbox is non-empty else returns 0.
   
task peek(ref <data>)                                                                     Copies data from the mailbox without removing it from a mailbox
   
function int try_peek(ref <data>)                                                         Tries to copy data from the mailbox without removing it from a mailbox
   
function int num()                                                                        Returns number of entries in the mailbox

////////////////////////////////////////////////////////////////////////////////////
   Example1: IPC Mailbox- Generic mailbox (Bounded mailbox )example
///////////////////////////////////////////////////////////////////////////////////
module mailbox_example1();
  mailbox mb = new(3);
  
  task process_A();
    int value = 5;
    string name = "STRING";
    mb.put(value);
    $display("Put data = %0d", value);
    mb.put("STRING");
    $display("Put data = %s", name);
  endtask

  task process_B();
    int value;
    string name;
    mb.get(value);
    $display("Retrieved data = %0d", value);
    mb.get(name);
    $display("Retrieved data = %s", name);
  endtask
  
  initial begin
    fork
      process_A();
      process_B();
    join
  end  
endmodule :mailbox_example1
   
//Logfile Output
Put data = 5
Put data = STRING
Retrieved data = 5
Retrieved data = STRING
           V C S   S i m u l a t i o n   R e p o r t    

////////////////////////////////////////////////////////////////////////////////////
   Example2: IPC Mailbox- Generic mailbox (Unbounded mailbox ) example 
///////////////////////////////////////////////////////////////////////////////////
module mailbox_example2();
  mailbox mb = new();
  
  task process_A();
    int value;
    repeat(10) begin
      value = $urandom_range(1, 50);
      mb.put(value);
      $display("Put data = %0d", value);
    end
    $display("----------------------");
  endtask

  task process_B();
    int value;
    repeat(10) begin
      mb.get(value);
      $display("Retrieved data = %0d", value);
    end
  endtask
  
  initial begin
    fork
      process_A();
      process_B();
    join
  end
endmodule : mailbox_example2
   
//Logfile Output
Put data = 40
Put data = 49
Put data = 20
Put data = 48
Put data = 7
Put data = 3
Put data = 20
Put data = 26
Put data = 19
Put data = 17
----------------------
Retrieved data = 40
Retrieved data = 49
Retrieved data = 20
Retrieved data = 48
Retrieved data = 7
Retrieved data = 3
Retrieved data = 20
Retrieved data = 26
Retrieved data = 19
Retrieved data = 17
           V C S   S i m u l a t i o n   R e p o r t 
   
////////////////////////////////////////////////////////////////////////////////////
   Example3: IPC Mailbox- Parameterized mailbox example
///////////////////////////////////////////////////////////////////////////////////
module mailbox_example3();
  mailbox #(string) mb = new(3);
  
  task process_A();
    string name = "Alex";
    mb.put(name);
    $display("Put data = %s", name);
    name = "Robin";
    mb.put(name);
    $display("Put data = %s", name);
  endtask

  task process_B();
    string name;
    mb.get(name);
    $display("Retrieved data = %s", name);
    mb.get(name);
    $display("Retrieved data = %s", name);
  endtask
  
  initial begin
    fork
      process_A();
      process_B();
    join
  end
endmodule :mailbox_example3
   
//Logfile Output
Put data = Alex
Put data = Robin
Retrieved data = Alex
Retrieved data = Robin
           V C S   S i m u l a t i o n   R e p o r t 
   
////////////////////////////////////////////////////////////////////////////////////
   Example4: IPC Mailbox- try_get, try_put example
///////////////////////////////////////////////////////////////////////////////////
module mailbox_example4();
  mailbox mb = new(3);
  
  task process_A();
    int value;
    repeat(5) begin
      value = $urandom_range(1, 50);
      if(mb.try_put(value))
        $display("successfully try_put data = %0d", value);
      else begin
        $display("failed while try_put data = %0d", value);
        
        $display("Number of messages in the mailbox = %0d", mb.num());
      end
    end
    $display("---------------------------------------");
  endtask

  task process_B();
    int value;
    repeat(5) begin
      if(mb.try_get(value))
        $display("Successfully retrieved try_get data = %0d", value);
      else begin
        $display("Failed in try_get data");
        
        $display("Number of messages in the mailbox = %0d", mb.num());
      end
    end
  endtask
  
  initial begin
    fork
      process_A();
      process_B();
    join
  end
  
endmodule :mailbox_example4
   
//Logfile output
   
successfully try_put data = 40
successfully try_put data = 49
successfully try_put data = 20
failed while try_put data = 48
Number of messages in the mailbox = 3
failed while try_put data = 7
Number of messages in the mailbox = 3
---------------------------------------
Successfully retrieved try_get data = 40
Successfully retrieved try_get data = 49
Successfully retrieved try_get data = 20
Failed in try_get data
Number of messages in the mailbox = 0
Failed in try_get data
Number of messages in the mailbox = 0
           V C S   S i m u l a t i o n   R e p o r t   

////////////////////////////////////////////////////////////////////////////////////
  Example5: IPC Mailbox- peek and try_peek example
///////////////////////////////////////////////////////////////////////////////////
module mailbox_example5();
  mailbox mb = new(3);
  
  task process_A();
    int value;
    repeat(3) begin
      value = $urandom_range(1, 50);
      mb.put(value);
      $display("put data = %0d", value);
    end
    $display("----------------------------------");
  endtask

  task process_B();
    int value;
    mb.peek(value); // message is not removed
    $display("peek data = %0d", value);
    mb.peek(value); // message is not removed
    $display("peek data = %0d", value);
    if(mb.try_peek(value))
      $display("Successful try_peek data = %0d", value);
    else begin
      $display("Failed in try_peek");
    end
    $display("----------------------------------");
    repeat(3) begin
      mb.get(value);
      $display("get data = %0d", value);
    end
   $display("----------------------------------");
   if(mb.try_peek(value))
      $display("Successful try_peek data = %0d", value);
    else begin
      $display("Failed in try_peek");
    end
  endtask
  
  initial begin
    fork
      process_A();
      process_B();
    join
  end
endmodule :mailbox_example5

//Logfile Output
put data = 40
put data = 49
put data = 20
----------------------------------
peek data = 40
peek data = 40
Successful try_peek data = 40
----------------------------------
get data = 40
get data = 49
get data = 20
----------------------------------
Failed in try_peek
           V C S   S i m u l a t i o n   R e p o r t    
