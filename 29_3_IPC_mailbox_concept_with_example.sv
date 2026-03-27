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
   Example2: 
///////////////////////////////////////////////////////////////////////////////////


////////////////////////////////////////////////////////////////////////////////////
   Example3: 
///////////////////////////////////////////////////////////////////////////////////


////////////////////////////////////////////////////////////////////////////////////
   Example4: 
///////////////////////////////////////////////////////////////////////////////////



////////////////////////////////////////////////////////////////////////////////////
   Example5: 
///////////////////////////////////////////////////////////////////////////////////

