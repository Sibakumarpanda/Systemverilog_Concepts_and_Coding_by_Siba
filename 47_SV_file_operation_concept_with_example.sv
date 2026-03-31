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
     Example2: SV File Operation- How to open in read and append modes ?
//////////////////////////////////////////////////////////////////////////////     
- By default a file is opened in the write w mode. 
- The file can also be opened in other modes by providing the correct mode type. 
- The following table shows all the different modes a file can be opened in.

Argument	Description
"r"	        Open for reading
"w"	        Create for writing, overwrite if it exists
"a"	        Create if file does not exist, else append; open for writing at end of file
"r+"	    Open for update (reading and writing)
"w+"	    Truncate or create for update
"a+"	    Append, open or create for update at EOF
- In the following example code, we will see how to use the different file access modes as described in the table above.
- We can see from the log output shown below, all three variables have a different value and each one points to the same file, but with different access permissions.  
  
module tb_top_example2;
  initial begin
  	int fd_w, fd_r, fd_a, fd_wp, fd_rp, fd_ap;

    fd_w = $fopen ("./todo.txt", "w"); 	// Open a new file in write mode and store file descriptor in fd_w
    fd_r = $fopen ("./todo.txt", "r"); 	// Open in read mode
    fd_a = $fopen ("./todo.txt", "a"); 	// Open in append mode


    if (fd_w)     
      $display("WRITE_MODE-File was opened successfully : %0d", fd_w);
    else      	  
      $display("WRITE_MODE-File was NOT opened successfully : %0d", fd_w);

    if (fd_r)     
      $display("READ_MODE-File was opened successfully : %0d", fd_r);
    else      	  
      $display("READ_MODE-File was NOT opened successfully : %0d", fd_r);

    if (fd_a)     
      $display("APPEND_MODE-File was opened successfully : %0d", fd_a);
    else      	  
      $display("APPEND_MODE-File was NOT opened successfully : %0d", fd_a);

    // Close the file descriptor
    $fclose(fd_w);
    $fclose(fd_r);
    $fclose(fd_a);
  end
endmodule  :tb_top_example2
  
//Logfile Output
WRITE_MODE-File was opened successfully : -2147483645
READ_MODE-File was opened successfully : -2147483644
APPEND_MODE-File was opened successfully : -2147483643
           V C S   S i m u l a t i o n   R e p o r t 
  
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


     
