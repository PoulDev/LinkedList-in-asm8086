# LinkedList-in-asm8086
Linked List data structure implemented in Assembly 8086

You can read the basic explanation from [PoulDev/LinkedList-in-C](https://github.com/PoulDev/LinkedList-in-C)

### Allocating a new value (object) to memory
the `FIND_AVAIBLE_MEMORY` procedure searches for two adjacent memory cells that are empty ( that I'll call `object` ), the first one will be used to store the value, and in the second one will be stored the pointer to the next object

### Linking a new value
`LINK_VALUE` works by itering all the objects to find the last one, that can be recognized because it has `0xFF` as the value for the pointer.
At that point it writes the new object memory address over the old value ( that was `0xFF` )

### Itering the Linked List
How does it iters through the linked list?
It starts from the first object and it reads his pointer value.
If the pointer value is `0xFF` it stops, 
otherwise it read the pointer value of the pointed object and continues the check on that new object
this continues until it reach one object that has `0xFF` as the pointer

### Object Structure:
| Value | Pointer |
| ----- | ------- |
|   X   |   0xFF  |
|       |         |
