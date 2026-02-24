
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.MODEL SMALL
.STACK 100H

.DATA
SOURCE DB 1,2,3,4,5,6     ; Source array
DEST   DB 5 DUP(?)        ; Destination array
COUNT  DB 6               ; Number of elements

.CODE
MAIN PROC

    MOV AX, @DATA         ; Load data segment address
    MOV DS, AX            ; Initialize DS (Data Segment)
    MOV ES, AX            ; Initialize ES (Extra Segment)

    LEA SI, SOURCE        ; SI = address of SOURCE (Source Index)
    LEA DI, DEST          ; DI = address of DEST (Destination Index)

    MOV CL, COUNT         ; CL = number of elements (Counter register)
    MOV CH, 00H           ; Clear upper part of CX
                          
    CLD                   ; Clear Direction Flag (process forward)

COPY_LOOP:
    MOV AL, [SI]          ; Load byte from SOURCE into AL
    MOV [DI], AL          ; Store byte into DEST

    INC SI                ; Move to next source element
    INC DI                ; Move to next destination element

    LOOP COPY_LOOP        ; CX = CX - 1, repeat until zero

    MOV AH, 4CH           ; Terminate program
    INT 21H               ; DOS interrupt

MAIN ENDP
END MAIN

ret




