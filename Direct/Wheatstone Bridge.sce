clc
clear
//By Gianfmg
//Solution for a Wheatstone bridge
//O Represents resistance
//                 ___V1(N1)____
//                |             |
//             R1 O I1       I2 O R2
//                |     R5      |
//              N1|------O------|N2
//                |      I5     |
//             R3 O I3      I4  O R4
//                |_____N4______|
//
//Voltage is U
V1=5
V4=0
//Resistance values
r1=10
r2=20
r3=30
r4=40
r5=100000

A=[r1,0,0,0,0,1,0;
   0,r2,0,0,0,0,1;
   0,0,r3,0,0,-1,0;
   0,0,0,r4,0,0,-1;
   0,0,0,0,r5,1,-1;
   1,0,-1,0,1,0,0;
   0,1,0,-1,-1,0,0]
b=[V1,V1,-V4,-V4,0,0,0]'

//X values are [I1,I2,I3,I4,I5,U2,U3]
x=A\b
disp(x)

