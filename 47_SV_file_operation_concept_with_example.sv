///////////////////////////////////////////////////////////////////////////
  SV File Operation Concept with example
///////////////////////////////////////////////////////////////////////////
   1. How to open and close a file ?
   2. How to open in read and append modes ?
   3. How to read and write to a file ?
   4. How to read until end of file ?
   5. How to parse a line for values ?
   6. What are multichannel file descriptors ?

//////////////////////////////////////////////////////////////////////////////
    Example1: SV File Operation- How to open and close a file ?
//////////////////////////////////////////////////////////////////////////////  
/*
- A file can be opened for either read or write using the $fopen() system task. 
- This task will return a 32-bit integer handle called a file descriptor. 
- This handle should be used to read and write into that file until it is closed. 
- The file descriptor can be closed with the $fclose() system task. 
- No further reads or writes to the file descriptor is allowed once it is closed.
  In below example , we will declare a int variable called fd to hold the file descriptor. 
  fd is initially zero, and gets a valid value from $fopen() and can be checked to see if the file opened successfully. The file is finally closed when $fclose() is executed  
*/ 

module tb_top_example1;
  initial begin
  	//Declare an integer variable to hold the file descriptor
  	int fd;

  	// Open a file called "note.txt" in the current folder with a "read" permission
  	// If the file does not exist, then fd will be zero
    fd = $fopen ("./note.txt", "r");
    if (fd)  
      $display("READ-File was opened successfully : %0d", fd);
    else     
      $display("READ-File was NOT opened successfully : %0d", fd);

    //Open a file called "note.txt" in the current folder with a "write" permission
    //"fd" now points to the same file, but in write mode
    fd = $fopen ("./note.txt", "w");
    if (fd)  
      $display("WRITE-File was opened successfully : %0d", fd);
    else     
      $display("WRITE-File was NOT opened successfully : %0d", fd);

    //Close the file descriptor
    $fclose(fd);
  end
endmodule  :tb_top_example1

//Logfile Output
Warning-[STASKW_CO] Cannot open file
testbench.sv, 22
  The file './note.txt' could not be opened. No such file or directory.
  Please ensure that the file exists with proper permissions.

READ-File was NOT opened successfully : 0
WRITE-File was opened successfully : -2147483645
           V C S   S i m u l a t i o n   R e p o r t 

//////////////////////////////////////////////////////////////////////////////
     Example2: 
//////////////////////////////////////////////////////////////////////////////     


//////////////////////////////////////////////////////////////////////////////
     Example3: 
//////////////////////////////////////////////////////////////////////////////      


//////////////////////////////////////////////////////////////////////////////
     Example4: 
//////////////////////////////////////////////////////////////////////////////   



//////////////////////////////////////////////////////////////////////////////
     Example5: 
//////////////////////////////////////////////////////////////////////////////      



//////////////////////////////////////////////////////////////////////////////
     Example6: 
////////////////////////////////////////////////////////////////////////////// 


     
