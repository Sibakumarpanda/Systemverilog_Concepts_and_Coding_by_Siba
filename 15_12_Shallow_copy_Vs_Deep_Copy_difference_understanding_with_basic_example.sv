///////////////////////////////////////
   Shallow copy in SystemVerilog :
///////////////////////////////////////
- Shallow copy is used to copy: Class properties like integers, strings and instance handle etc.
- Instance handles are copied which means any changes are done in ‘nested copied object’ will also reflect in the ‘nested original object’ or vice-versa.
- It will not copy : Nested objects are not copied.
- It uses the new() method is used for copying.
- Syntax:
       packet pkt1, pkt2;
       pkt1 = new();
       pkt2 = new pkt1;   //will create a new object pkt2 which is a copy of the pkt1 object.

///////////////////////////////////////
   Deep copy in SystemVerilog :
///////////////////////////////////////
- Deep copy is also called as full copy.
- It performs a complete copy of an object.
- In Deep copy , Nested Objects are also copied. (But in Shallow copy , as mentioned in above , Nested objects are not copied)
- So,deep copy is the same as shallow copy except Nested created objects are also copied by writing a custom method. 
- here deep_copy(), an extra method is written that does value assignments for an object which has to be copied (pkt1 object). 
- This ensures that pkt1 class properties are copied to the newly created pkt2 object.
- Syntax :
    packet pkt1;
    pkt1 = new();
    packet pkt2;  //here the object pkt2 is separately created.
    pkt2 = new();
    pkt2.deep_copy(pkt1);

///////////////////////////////////////////////////
   Difference between Shallow copy and Deep copy : 
//////////////////////////////////////////////////
-In Shallow copy , Instance handles are copied but Nested objects are not copied . Where as , In Deep copy , nested Objects are also copied.

///////////////////////////////////////
   Basic example Shallow copy :
///////////////////////////////////////  
class packet;
	int 	addr;
	int 	data;		
	function display ();
		$display ("addr=0x%0h data=0x%0h ", addr, data);
	endfunction  
endclass :packet

module tb_top_shallow_copy; 
	packet pkt1, pkt2;  
	initial begin		
       pkt1= new();
       pkt1.addr= 32'hface_cafe;
       pkt1.data= 32'h1234_5678;
       pkt1.display ();
				
	   pkt2 = new pkt1;   // Shallow copy pkt1 into pkt2, pkt2 is a new object with contents in pkt1
	   pkt2.display ();
		
	   // Now Let's change the addr and data in pkt1 and observe
	   pkt1.addr = 32'habcd_ef12;
	   pkt1.data = 32'h5a5a_5a5a;
       pkt1.display ();
		
	   // Print pkt2 and see that addr and data are not changed even if pkt1 changed.
       pkt2.display ();
	end
endmodule :tb_top_shallow_copy

//Logfile output
addr=0xfacecafe data=0x12345678 
addr=0xfacecafe data=0x12345678 
addr=0xabcdef12 data=0x5a5a5a5a 
addr=0xfacecafe data=0x12345678 
           V C S   S i m u l a t i o n   R e p o r t 
   
///////////////////////////////////////
   Basic example Deep copy :
///////////////////////////////////////  
class packet;
	int 	addr;
	int 	data;		
	function display();
		$display ("addr=0x%0h data=0x%0h ", addr, data);
	endfunction	
	// Deep copy method - copies contents from source object to this object
	function void deep_copy(packet src);
		this.addr = src.addr;
		this.data = src.data;
	endfunction  
endclass :packet

module tb_top_deep_copy;
	packet pkt1, pkt2;	
	initial begin		
		pkt1 = new();
		pkt1.addr = 32'hface_cafe;
		pkt1.data = 32'h1234_5678;
		$display("pkt1 at original ------->");
		pkt1.display();
				
		pkt2 = new();	          // Create pkt2 as a separate object		
		pkt2.deep_copy(pkt1);     // Deep copy: copy contents from pkt1 to pkt2      
		$display("pkt2 after Deep copy ------->");
		pkt2.display();
		
		// Now Let's change the addr and data in pkt1 and observe
		$display("Ater Modifying pkt1 ----->");
		pkt1.addr = 32'habcd_ef12;
		pkt1.data = 32'h5a5a_5a5a;
		$display("pkt1 modified ------->");
		pkt1.display();
		
		// pkt2 remains unchanged - demonstrating deep copy
		$display("pkt2 not changed after pkt1 modification ------------>");
		pkt2.display();
		
		// Verify both objects are independent
		$display("\n--- Verification ---");
		if (pkt1.addr != pkt2.addr)
			$display("SUCCESS: pkt1 and pkt2 are independent objects");
		else
			$display("FAILED: Objects are still linked");
	end
endmodule :tb_top_deep_copy
	
//Logfile output	
pkt1 at original ------->
addr=0xfacecafe data=0x12345678 
pkt2 after Deep copy ------->
addr=0xfacecafe data=0x12345678 
Ater Modifying pkt1 ----->
pkt1 modified ------->
addr=0xabcdef12 data=0x5a5a5a5a 
pkt2 not changed after pkt1 modification ------------>
addr=0xfacecafe data=0x12345678 

--- Verification ---
SUCCESS: pkt1 and pkt2 are independent objects
           V C S   S i m u l a t i o n   R e p o r t 
