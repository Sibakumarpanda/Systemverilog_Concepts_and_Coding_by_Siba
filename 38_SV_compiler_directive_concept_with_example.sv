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
