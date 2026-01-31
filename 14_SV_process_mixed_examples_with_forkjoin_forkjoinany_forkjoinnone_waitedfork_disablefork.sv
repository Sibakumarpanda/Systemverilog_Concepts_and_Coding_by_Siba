System Verilog Mixed examples with using forkjoin , forkjoinany, forkjoinnone, waitedfork, disablefork :

Key Interview Questions:
Q: Difference between disable fork and disable block_name?
A: disable fork kills processes; disable block_name jumps to end of block

Q: When to use join vs join_none vs join_any?
A: join=wait all, join_none=don't wait, join_any=wait one

Q: What's the execution model of fork-join?
A: Concurrent execution within the fork block

Q: How to handle clean termination?
A: Use wait fork + disable fork or named blocks

Q: Most common pitfall with fork-join?
A: Shared variable races and variable capture in loops

//////////////////
  Example-1
//////////////////
