clc
clear
//By Gianfmg
disp("Lagrange Polynomial Interpolator")
//Find original function and value of point x
//Function
disp("Function: y = 0.447111 + 1.207199*sin(x)")
printf("\n x0=0.765348, y0=1.283443\n x1=2.990572, y1=0.628731\n x2=3.604571, y2=-0.092042\n x3=5.171929, y3=-0.634849\n")

//Function Constants
C1=0.447111, C2=1.207199
//Function value in 4 points
x0=0.765348, y0=1.283443 
x1=2.990572, y1=0.628731 
x2=3.604571, y2=-0.092042 
x3=5.171929, y3=-0.634849 

xr=[x0;x1;x2;x3]
Y=[y0,y1,y2,y3]
x=3.133105
//Function here
y = C1 + C2*sin(x)
//Plot range
p=(0:0.065:6.435)

function [coef]=Lagrange(xr,Y)
    n=length(xr)
    for i=1:n
        mult=1
        for j=1:n
            if i<>j
                mult=mult*(x-xr(j))/(xr(i)-xr(j))
             end
         end
         L(i)=mult
         coef(i)=Y(i)*L(i)
end
endfunction

function w=Func(p)
w=C1 + C2*sin(p)
endfunction

[coef]=Lagrange(xr,Y)
L1=coef(1)+coef(2)+coef(3)+coef(4)
//Error calculation
EA=abs(y-L1)
ER=EA/abs(y)
//Value on point x
printf("x=%f f(x)=%f P(x)=%f ErAbs=%f ErRel=%f",x,y,L1,EA,ER)

z=zeros(1,100)
q=zeros(1,100)
coef=zeros(4)

for k=1:100
    q(k)=p(k)
     n=length(xr)
    for i=1:n
        mult=1
        for j=1:n
            if i<>j
                mult=mult*(q(k)-xr(j))/(xr(i)-xr(j))
             end
         end
         L(i)=mult
         coef(i)=Y(i)*L(i) 
end
    z(k)=coef(1)+coef(2)+coef(3)+coef(4)
end  

//Red function is real function and blue is approximation by Lagrange
clf(1) 
scf(1) 
plot(p,Func,"r")
xgrid()
plot(p,z,"b")
plot(x0,y0,"d",x1,y1,"d",x2,y2,"d",x3,y3,"d")
