// SV: System task and function usage
$time -returns the current simulation time as a 64-bit unsigned integer. 
$stime -returns the lower 32-bits of the current simulation time as an unsigned integer. 
$realtime- returns the current simulation time as a real number.
$deposit(<variable>, <value>); - Sets a net to a particular value and then simulates with the net set to that new value. The value change is propagated throughout the nets and registers being driven by the variable that has been set.
Example:
`define MEM_INIT_COMMON(mem_path)\
    $deposit(`SIBA_KUMAR_DUT_PATH.``mem_path``_TEST1, 0); \
    $deposit(`SIBA_KUMAR_DUT_PATH.``mem_path``_TEST_RNM, 0); \
