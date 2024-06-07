OVDE_KOD SEGMENT
ASSUME CS:OVDE_KOD
MOV DX,0FFFBh ;се чува адресата на CSR во DX
MOV AL,99h ;се програмира 8255
OUT DX,AL ;се праќа командниот збор до 8255
NOVA_T:MOV DX,0FFF8h ;адресата на порта А
IN AL, DX ;се чита во AL
CMP AL,100d ;се споредува со 100
JB VKLUCI ;ако е под 100 се вклучува грејач
JNB ISKLUCI ;ако над 100 се исклучува
VKLUCI:MOV AL, 80h ;код за вклучување на грејачот
MOV DX, 0FFF9h ;адреса на порта B
OUT DX,AL ;се праќа на порта B
JMP NOVA_T ;се мери нова температура
ISKLUCI:MOV AL, 00h ;код за исклучување на грејачот
MOV DX,0FFF9h ;адреса на порта B
OVDEKOD:OUT DX,AL ;се праќа на порта B
ENDS ;крај на сегментот
END ;крај на програмата
