S SEGMENT
    DW 32 DUP(?)
S ENDS     

D SEGMENT
    N1 DB 1FH
    N2 DB 3AH
     
    R DW ? 
D ENDS   

C segment
      
      MAIN PROC FAR
        
        ASSUME CS:C , DS:D , SS: S        
     
        MOV AX,D
        MOV DX,AX  
        
        MOV AL,N1
        MUL N2   
        
        MOV R,AX
   

      MAIN ENDP
      
C ENDS

END MAIN


