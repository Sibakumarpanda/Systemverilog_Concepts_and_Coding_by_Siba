//Summary Sheet on various case statments in verilog and System verilog:

Basic Case Statements : 
case-Exact match
casex-Both x and z treated as Don't care
casez-Only z is treated as don’t care
  
SystemVerilog Enhanced Case Statements:
priority case ()-Enforces that at least one match exists,
priority casez()-Priority with high-impedance match
unique case ()-Enforces exactly one match
unique casez ()-Unique with high-impedance match
  
Synthesis Directives:
parallel_case (Directive for synthesis)
full_case (Directive for synthesis)
Conditional Statements:
priority if (Enforces that at least one condition is true)
unique if (Enforces exactly one condition is true)
iff (Conditional port connection)


Key Differences among above:
case vs casex vs casez:
case: Exact match (including x and z)
casex: Treats x and z as don't-care
casez: Treats z as don't-care
  
priority vs unique:
priority: At least one branch must match (runtime warning if not)
unique: Exactly one branch must match (runtime warning if multiple or none)
  
parallel_case vs full_case:
parallel_case: Synthesis directive suggesting cases are mutually exclusive
full_case: Synthesis directive suggesting all cases are covered (no default needed)
  
SystemVerilog vs Verilog:
always_comb is preferred over always @* in SystemVerilog
priority and unique are SystemVerilog features
parallel_case and full_case are Verilog synthesis directives (less preferred in SystemVerilog)
 
  
