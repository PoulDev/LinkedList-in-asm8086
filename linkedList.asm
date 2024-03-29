.org 256
.data         
    starting_address DW 00h
.code     
    ; Initialize the Linked List                 
    MOV DX, [starting_address]
    CALL FIND_AVAIBLE_MEMORY     
    MOV [BX], 01h
    MOV [BX+1], 255d 
    MOV starting_address, BX
    
    ; The following code links
    ; some values to the list
 
    MOV DX, 02h ; Linking 2
    CALL LINK_VALUE
 
    MOV DX, 03h ; Linking 3
    CALL LINK_VALUE
 
    MOV DX, 04h ; Linking 4
    CALL LINK_VALUE
 

 
    MOV AH, 21h
    INT 16h   

LINK_VALUE PROC
    CALL FIND_AVAIBLE_MEMORY
    MOV [BX], DX
    MOV [BX+1], 255d       
    MOV DX, BX ; We store the new object address
               ; in the DX register for later
    MOV BX, starting_address
    iterlist:
    CMP [BX+1], 255d
    JE link_object   
    MOV BX, [BX+1]
    JMP iterlist
 
 
    link_object:
    MOV [BX+1], DX   
    RET
ENDP


FIND_AVAIBLE_MEMORY PROC 
    ; This procedure searches two near
    ; memory cells that are empty ( not used ( I hope ) )  
    MOV BX, 100h      
    loopstart:     
    CMP [BX], 00h
    JE found
    
    INC BX
    JMP loopstart
    
    found:
    CMP [BX+1], 00h
    JE exit
    INC BX
    JMP loopstart
    
    exit:
    RET  
   
ENDP                     
