
SHOWUNI MACRO
    
     MOV AH,9
     LEA DX,UN
     INT 21H
       
ENDM 

SHOWERROR MACRO
    
   MOV AH,09
   MOV DX,OFFSET ERRORMSG
   INT 21H 
   
ENDM

DATA SEGMENT
     ARRAY DB 1,4,2,3,8,6,7,5,9
     AVG DB ?
     MSG DB "AVERAGE = $"
     UN DB "---AZAD DEHAGHAN---","$"
     ERRORMSG DB "--- ERROR. INVALID INPUT --- ","$"
ENDS

CODE SEGMENT 
    ASSUME DS:DATA CS:CODE
START:
      MOV AX,DATA
      MOV DS,AX
      
      
          MOV AH,01H
          INT 21H
           
           
          CMP AL,'1'
          JE PROCESS_CASE_1
          
          CMP AL,'2'
          JE PROCESS_CASE_2
          
          CMP AL,'3'
          JE EXIT_PROGRAM 
            
          JMP INVALID_CASE  

      
      PROCESS_CASE_1: 
      
          SHOWUNI
          JMP EXIT_PROGRAM
                       
                       
                       
      PROCESS_CASE_2:
      
          LEA SI,ARRAY 
          
          MOV AH,9 
          LEA DX,MSG
          INT 21H
    
          MOV AX,00
          MOV BL,9
    
          MOV CX,9 
          LOOP1:
               ADD AL,ARRAY[SI]
               INC SI
          LOOP LOOP1
    
          DIV BL
    
          ADD AL,30H
          
          MOV AH,2
          MOV DL,AL
          INT 21H
          
          JMP EXIT_PROGRAM
      
      
      
      INVALID_CASE:
      
          SHOWERROR
          JMP EXIT_PROGRAM
        
        
      
      EXIT_PROGRAM:
         MOV AH,4CH
         INT 21H
      
      
      
   
ENDS
END START