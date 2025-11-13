SystemVerilog Queue Overview:
 -A queue is a variable size and ordered collection of elements (Homogeneous element). 
 -To understand it is considered the same as a single-dimensional unpacked array that grows and reduces automatically if it is a bounded queue.
   
Types of queues in SV:
 -Bounded queue: Queue having a specific size or a limited number of entries.
 -Unbounded queue: Queue having non-specific queue size or unlimited entries.   
   
Declaration of a queue :  data_type  <queue_name> [$];
 For Example:
 bit q_1[$];     // Unbounded queue of bit
 byte q_2[$];    // Unbounded queue of byte
 int q_3 [$:9];  // Bounded queue with qsize = 10
 int q_4[$] = {5,6,7};

Different Queue methods :

Methods (functions)                                              Description
-------------------                                              ------------

insert (<index>, <item>)                                         Inserts an item at a specified index.

delete(<index>)                                                  Deletes an item at a specified index
delete                                                           Deletes all elements in the queue.

size()                                                           If the queue is not empty, return the number of items in the queue. Otherwise, it returns 0.

push_back(<item>)                                                Inserts an item at the end of the queue.

pop_back()                                                       Returns and removes the last item of the queue.

push_front(<item>)                                               Inserts an item at the front of the queue.

pop_front()                                                      Returns and removes the first item of the queue.

shuffle()                                                        Shuffles items in the queue
