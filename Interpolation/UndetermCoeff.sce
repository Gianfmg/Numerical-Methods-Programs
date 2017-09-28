clc 
clear
//By Gianfmg
disp("Find value of point P0 by method of undetermined coefficients")

//Change to your matrix values here
x0=-3.000000
x1=-1.000000
x2=0.500000
x3=2.000000
y0=-12.000000
y1=2.000000
y2=-0.625
y3=8.00000
P0=-0.333333
A=[1,x0,x0^2,x0^3;
   1,x1,x1^2,x1^3;
   1,x2,x2^2,x2^3;
   1,x3,x3^2,x3^3 ]
//Points where function goes
b=[y0;y1;y2;y3]

x=A\b
//Your function
function y=f(x)
    y=(x^3)+(x^2)-(2*x)
endfunction
//Range
s=-5:0.1:5
plot(s,f)
plot(x0,y0,'rd')
plot(x1,y1,'rd')
plot(x2,y2,'rd')
plot(x3,y3,'rd')
xgrid()
printf("P(x)= %f + %fx + %fx^2 + %fx^3\n\n",x(1),x(2),x(3),x(4))
printf("x0=-3.000000, y0=-12.000000\n x1=-1.000000, y1=2.000000\n x2=0.500000, y2=-0.625\n x3=2.000000, y3=8.00000")
printf("\n\n")
EV=(x(1)+x(2)*(P0)+x(3)*(P0)^2+x(4)*(P0)^3)
printf( "Polynomial interpolator is P(%f) = %f",P0,EV)
plot(P0,EV,'gd')
