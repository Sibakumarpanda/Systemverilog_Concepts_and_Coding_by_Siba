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
       pkt2 = new pkt1; //will create a new object pkt2 which is a copy of the pkt1 object.

///////////////////////////////////////
   Deep copy in SystemVerilog :
///////////////////////////////////////
- Deep copy is also called as full copy .
- It performs a complete copy of an object.
- In Deep copy , nested Objects are also copied. (But in Shallow copy , as mentioned in above , nested objects are not copied)
- So,deep copy is the same as shallow copy except nested created objects are also copied by writing a custom method. 
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
       pkt2.display ( );
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
