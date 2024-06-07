# Zadaca2-8086

На сликата е даден блок дијаграм за тек на еден хемиски процес. Процесот се состои од читање температура
и вклучување грејач се додека не се достигне 100оC. За комуникација µP користи 8255 на адреса FFF8h. На
портата А е сензор за температура, а на B грејач. Да се напише соодветна асемблерска програма. 



**Resenie:**

Алгоритмот кој го опишува процесот на скенирање на матричната тастатура е даден на следнава слика:  

![Screenshot (1)](https://github.com/Ristova123/Zadaca2-8086/blob/main/Diagram%208086%202.png)

```
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

```
![Screenshot (2)](https://github.com/Ristova123/Zadaca2-8086/blob/main/Zadaca2%208086%20code.png)
![Screenshot (3)](https://github.com/Ristova123/Zadaca2-8086/blob/main/Zadaca2.1%208086%20code.png)

**Develop by:**

[Tamara Ristova ](https://github.com/Ristova123)


**Subject**

Microcomputer's systems

**Built With**

This project is built using the following tools:

- [8086 simulator](https://emu8086-microprocessor-emulator.en.softonic.com/?ex=RAMP-2046.0): Assembler and emulator for the Intel 8085 microprocessor.

**Getting Started**

To get a local copy up and running, follow these steps.

**Prerequisites**

In order to run this project you need:

A working computer
Connection to internet
Setup

**How to Run**

To run the program, you need an 8086 emulator or assembler. You can use emulators like DOSBox or TASM (Turbo Assembler). Here's how to run the program using 8086 simulator:

1. Download and install 8086 simulator from [here](https://emu8086-microprocessor-emulator.en.softonic.com/?ex=RAMP-2046.0).
2. Clone this repository to your local machine.
3. Open 8086 simulator and load the `Zadaca2 8086.asm` file.
4. Assemble the code by pressing the Assemble button.
5. Run the program by pressing the Run button or by pressing F10.
