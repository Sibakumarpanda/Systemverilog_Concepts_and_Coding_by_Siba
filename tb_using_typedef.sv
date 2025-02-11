//typedef usage and example:
//In complex testbenches some variable declarations might have a longer data-type specification or require to be used in multiple places in the testbench. 
//In such cases we can use a typedef to give a user-defined name to an existing data type. 
//The new data-type can then be used throughout the code and hence avoids the need to edit in multiple places if required.
 
//Example -1
module tb_using_typedef;

   typedef shortint unsigned u_shorti;
   typedef enum {RED, YELLOW, GREEN} e_light;
   typedef bit [7:0] ubyte;

initial begin    
   u_shorti   data = 32'hface_cafe;    
   e_light    light = GREEN;    
   ubyte     cnt = 8'hFF;
   $display ("light=%s data=0x%0h cnt=%0d", light.name(), data, cnt);
   end
endmodule
------------------------------
/*output :
ncsim> run
light=GREEN data=0xcafe cnt=255
ncsim: *W,RNQUIE: Simulation is complete */ 

//Example-2
module tb_without_using_typedef;
   shortint unsigned u_shorti;
   enum {RED, YELLOW, GREEN} e_light;
   bit [7:0] ubyte;
initial begin    
   u_shorti 	data = 32'hface_cafe;    
   e_light 	 light = GREEN;    
   ubyte 		cnt = 8'hFF;
   $display ("light=%s data=0x%0h cnt=%0d", light.name(), data, cnt);
end
endmodule
//Output: It will through error
