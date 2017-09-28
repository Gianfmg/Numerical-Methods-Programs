clc
clear
//By gianfmg
disp("Method of least squares")


X=[1,2,3,4,5,6,7,8,9,10]
Y=[6.578510,9.533055,11.785203,14.617738,16.805172,21.407532,24.712995,27.523414,31.063029,31.983999]
printf("Coordinate point table:\n\n")
printf("X=%f  Y=%f \n", X', Y')
n=length(X)
Sx=0
for i=1:n
    Sx=Sx+X(i)
end
Sy=0
for i=1:n
    Sy=Sy+Y(i)
end
Sxx=0
for i=1:n
    Sxx=Sxx+(X(i))^2
end
Sxy=0
for i=1:n
    Sxy=Sxy+(X(i)*Y(i))
end
a=(n*Sxy-Sx*Sy)/(n*Sxx-Sx*Sx)
b=(1/n)*(Sy - Sx*a)
C=Y-(a*X)-(b*ones(X))
ER=0
for k=1:n
    ER=(ER+(1/n)*(abs(C(k)^2)))
end
ER1=ER^0.5
printf("\n a=%f   b=%f\n\n",a,b)
printf("ER=%f" ,ER1)
p=1:1:10
for i=1:n
    plot(X(i),Y(i),'rd')
end
function y=f(x)
    y=a*(x)+b
endfunction
plot(p,f,'g')
xgrid()
