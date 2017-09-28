clc
clear
//By Gianfmg
disp("Find original function by Newton polynomial interpolator and value on point p")

printf("Function: y=0.447111+1.207199*sin(x)\n")
printf("\nTabla x           y\nx0=1.000000, y0=1.462933\nx1=2.000000, y1=1.544813\nx2=3.000000, y2=0.617470\nx3=4.000000, y3=-0.466500\nx4=5.000000, y4=-0.710501\nx5=6.000000, y5=0.109801\n")
//Function constants
C1=0.447111, C2=1.207199

x0=1.000000, y0=1.462933 
x1=2.000000, y1=1.544813 
x2=3.000000, y2=0.617470 
x3=4.000000, y3=-0.466500 
x4=5.000000, y4=-0.710501 
x5=6.000000, y5=0.109801 
x=[x0;x1;x2;x3;x4;x5]
y=[y0;y1;y2;y3;y4;y5]
//Point
p=3.133105

function[fctp,d]=InterpolNewton(x,y,p)
    n=length(x)
a(1)=y(1)
for k =1:n-1
   d(k,1)=(y(k+1)-y(k))/(x(k+1)-x(k))
end
for j=2:n-1
   for k=1:n-j
      d(k,j)=(d(k+1,j-1)-d(k,j-1))/(x(k+j)-x(k))
   end
end
for j=2:n
   a(j)=d(1,j-1)
end
Df(1)=1
c(1)=a(1)
for j=2:n
   Df(j)=(p-x(j-1)).*Df(j-1)
   c(j)=a(j).*Df(j)
end
fctp=sum(c)
endfunction
[fctp,d]=InterpolNewton(x,y,p)

fo=0.447111+1.207199*sin(p)
EA=abs(fctp-fo)
ER=abs(fctp-fo)/fo
function y=z(p)
     y=0.447111+1.207199*sin(p)
endfunction

printf("\nPolynomial coefficients\n")
printf ("a0=%f\n",y(1))
printf ("a1=%f\n",d(1,1))
printf ("a2=%f\n",d(1,2))
printf ("a3=%f\n",d(1,3))
printf ("a4=%f\n",d(1,4))
printf ("a5=%f\n",d(1,5))
printf("x=%f, f(x)=%f, P(x)=%f, EA=%f, ER=%f",p,fo,fctp,EA,ER)

a=0:0.1:6.5
plot(a,z)
xgrid()
for i=1:6
    plot(x(i),y(i),'gd')
end
plot(p,fctp,'rd')

xx=(0:0.07:7)
for i=1:101
    yy(1,i)=InterpolNewton(x,y,xx(i))
end
plot(xx,yy,'k')
