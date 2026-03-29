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
   
