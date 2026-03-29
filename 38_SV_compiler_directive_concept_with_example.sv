///////////////////////////////////////////////////////////////////
   SystemVerilog compiler directives Concept with Example
//////////////////////////////////////////////////////////////////
- The compiler directives tell the compiler how it should process its input. 
- There are many compiler directives supported by SystemVerilog, out of which two will be discussed here.
- They are :
  `define
  `include

////////////////////////////////////
   SystemVerilog `define macro
///////////////////////////////////
- The SystemVerilog macro is a compiler directive that substitutes itself in the code with a defined context. 
- In simple words, wherever macro is used, it is replaced with macro context and gives compilation error in case of misuse.
- Syntax:  `define <macro_name> (<args>) <macro_context>
- Macro uses global space. It can be defined outside or inside of a module, class, program, etc with proper compilation order.
- Multi-line macro context is also possible using \. 
- But make sure after \, everything should be empty. Even a single space is also not accepted.
- “ is used to delimit lexical tokens without adding any white space for macro argument.
- `” overrides the lexical meaning of “. The macro argument allows string literals to be constructed using `”.
- `\ is used to include an escape sequence. For example: `\t will include \t. `\`” will include “

///////////////////////////////////////////////////////////////////////////////
      Example1:  `define macro Basic Example
///////////////////////////////////////////////////////////////////////////////   
//Example1: Compiler directive in SV - `define macro Basic Example
`define DATA_WIDTH 32
typedef enum {RED, GREEN} d_color_type;                 //dual color
typedef enum {BLACK, WHITE, GREY, ORANGE} m_color_type; //multi color

d_color_type dcolor;
m_color_type mcolor;

// single line macro  with conditional operator
`define DUAL_COLOR_CODE(dcolor) ((dcolor == RED)? 50: 100)

//Multiline macro
`define MULTI_COLOR_CODE(mcolor)  ((mcolor == BLACK)? 50 \
                                 :(mcolor == WHITE)? 100 \
                                 :(mcolor == GREY)? 150 \
                                 :200)

module define_example1;
  function local_fn(bit [`DATA_WIDTH-1:0] data);
    $display("Define WIDTH value = %0d, data = %0d", `DATA_WIDTH, data);
  endfunction
  
  initial begin
    local_fn(5);
    $display("Define context with conditional operator");
    $display("DUAL_COLOR_CODE = %0d", `DUAL_COLOR_CODE(RED));
    $display("DUAL_COLOR_CODE = %0d", `DUAL_COLOR_CODE(GREEN));
    
    $display("--------------------------");
    
    $display("MULTI_COLOR_CODE = %0d", `MULTI_COLOR_CODE(BLACK));
    $display("MULTI_COLOR_CODE = %0d", `MULTI_COLOR_CODE(GREY));
    $display("MULTI_COLOR_CODE = %0d", `MULTI_COLOR_CODE(ORANGE));
    $display("MULTI_COLOR_CODE = %0d", `MULTI_COLOR_CODE(WHITE));
    
    $display("--------------------------");
  end
endmodule :define_example1

//Logfile Output
Define WIDTH value = 32, data = 5
Define context with conditional operator
DUAL_COLOR_CODE = 50
DUAL_COLOR_CODE = 100
--------------------------
MULTI_COLOR_CODE = 50
MULTI_COLOR_CODE = 150
MULTI_COLOR_CODE = 200
MULTI_COLOR_CODE = 100
--------------------------
           V C S   S i m u l a t i o n   R e p o r t  
   
///////////////////////////////////////////////////////////////////////////////
   Example2: Compiler directive in SV - Example for function inside a macro
///////////////////////////////////////////////////////////////////////////////  
`define DATA_WIDTH 32
typedef enum {BLACK, WHITE, GREY, ORANGE} m_color_type;
m_color_type mcolor;

//Multiline macro
`define MULTI_COLOR_CODE(type) \
  function int decode(input type mcolor); \
    if(mcolor == BLACK) return 50; \
    else if(mcolor == WHITE) return 100; \
    else if(mcolor == GREY) return 150; \
    else return 200; \
endfunction
    
module define_example2;
  `MULTI_COLOR_CODE(m_color_type)

  initial begin
    $display("MULTI_COLOR_CODE = %0d", decode(BLACK));
    $display("MULTI_COLOR_CODE = %0d", decode(GREY));
    $display("MULTI_COLOR_CODE = %0d", decode(ORANGE));
    $display("MULTI_COLOR_CODE = %0d", decode(WHITE));
  end
endmodule :define_example2
   
//Logfile Output
MULTI_COLOR_CODE = 50
MULTI_COLOR_CODE = 150
MULTI_COLOR_CODE = 200
MULTI_COLOR_CODE = 100
           V C S   S i m u l a t i o n   R e p o r t 

///////////////////////////////////////////////////////////////////////////////
   Example3: Compiler directive in SV - Example for printing a string
///////////////////////////////////////////////////////////////////////////////  
`define display_string(name, str) \
  `"Hello `\t `\`"name`\`", This is System``str Tutorial.`"

// `"    --> overrides the lexical meaning of ".
// `\t   --> \t
// `\`"  --> "
// ``    --> delimits lexical tokens without adding any white space
module define_example3;
    initial begin
      $display("%s",`display_string(Siba, Verilog));
      $display("%s",`display_string(Subhra, C));
    end
endmodule :define_example3 
   
//Logfile Output
Hello 	 "Siba", This is SystemVerilog Tutorial.
Hello 	 "Subhra", This is SystemC Tutorial.
           V C S   S i m u l a t i o n   R e p o r t    

////////////////////////////////////
   SystemVerilog `include
///////////////////////////////////  
- The SystemVerilog `include directive is used to include another filename. 
- The double quote “<file_name>” is used in the `include directive.
- Syntax: `include "<file_name>"

///////////////////////////////////////////////////////////////////////////////
   Example4: Compiler directive in SV - `include basic example
///////////////////////////////////////////////////////////////////////////////  
//file.sv
class transaction;
  function void display();
    $display("This is transaction class");
  endfunction
endclass :transaction
   
//TB TOP Module   
`include "file.sv"
module tick_include_example;
    initial begin
      transaction tr = new();
      tr.display();
    end
endmodule  :tick_include_example

//Logfile output
This is transaction class
           V C S   S i m u l a t i o n   R e p o r t    
   
