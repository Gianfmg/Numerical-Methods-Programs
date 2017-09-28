clear
clc
//By Gianfmg
disp("First function analytic derivative and derivation by Newton Polynomy")

C1=0.447111
C2=1.207199
X=[0.500000, 1.000000, 1.500000, 2.000000, 2.500000, 3.000000, 3.500000, 4.000000, 4.500000, 5.000000, 5.500000]
Y=[1.025872, 1.462933, 1.651285, 1.544813, 1.169585, 0.617470, 0.023646, -0.466500, -0.732962, -0.710501, -0.404617 ]

h=0.5
n=length(X)
printf("C1=%f,  ",C1)
printf("C2=%f\n\n",C2)
printf("Coordinate point table\n\n")  
for i=1:n
    printf("x%d=%f,  ",i-1,X(i))
    printf("y%d=%f\n",i-1,Y(i))
end
//Function
function Y=f(X)
    Y=0.447111+1.207199*sin(X)
endfunction

dera=1.207199*cos(2.5)
derr=(f(2.5)-f(2.5-h))/h
Err1=abs((dera-derr)/dera)

derp=((f(2.5+h))-(f(2.5)))/h
Err2=abs((dera-derp)/dera)

derc=(f(2.5+h)-f(2.5-h))/(2*h)
Err3=abs((dera-derc)/dera)

derc2=(-f(2.5+(2*h))+(8*f(2.5+h))-(8*f(2.5-h))+f(2.5-(2*h)))/(12*h)
Err4=abs((dera-derc2)/dera)

printf("\nValue of analytic derivative y´(2.5)=%f\n", dera)
printf("Value of regressive derivative with 0.5 step y´(2.5)=%f\n",derr)
printf("Relative aproximation error Err=%f\n\n",Err1)
printf("Value of progressive derivative with 0.5 step y´(2.5)=%f\n",derp)
printf("Relative aproximation error Err=%f\n\n",Err2)
printf("Value of center derivative with 0.5 step y´(2.5)=%f\n",derc)
printf("Relative aproximation error Err=%f\n\n",Err3)
printf("Value of center derivative with 0.5 step of h^4 value y´(2.5)=%f\n",derc2)
printf("Relative aproximation error Err=%f\n\n",Err4)

dera2=1.207199*cos(2.3)

function [fp,d] = newinter(X,Y,p)
n = length(X);
a(1) = Y(1);
for k =1:n-1
   d(k,1)=(Y(k+1)-Y(k))/(X(k+1)-X(k));
end
for j=2:n-1
   for k=1:n-j
      d(k,j)=(d(k+1,j-1)-d(k,j-1))/(X(k+j)-X(k));
   end
end

for j=2:n
   a(j)=d(1,j-1);
end
Df(1)=1;
c(1)=a(1);
for j=2:n
   Df(j)=(p-X(j-1)).*Df(j-1);
   c(j)=a(j).*Df(j);
end
fp=sum(c);
endfunction

p0=2.2
p1=2.25
p2=2.3
p3=2.35
p4=2.4
h2=0.05

[fp0,d] = newinter(X,Y,p0)
[fp1,d] = newinter(X,Y,p1)
[fp2,d] = newinter(X,Y,p2)
[fp3,d] = newinter(X,Y,p3)
[fp4,d] = newinter(X,Y,p4)

FP=[fp0,fp1,fp2,fp3,fp4]
P=[p0,p1,p2,p3,p4]

printf("Coordinate point table of Newton Polynomy\n\n")

for i=1:5
    printf("x%d=%f,  ",i-1,P(i))
    printf("y%d=%f\n",i-1,FP(i))
end

derr2=(fp2-fp1)/h2
Err5=abs((dera2-derr2)/dera2)

derp2=(fp3-fp2)/h2
Err6=abs((dera2-derp2)/dera2)

derc2=(fp3-fp1)/(2*h2)
Err7=abs((dera2-derc2)/dera2)

derc22=(-fp4+(8*fp3)-(8*fp1)+fp0)/(12*h2)
Err8=abs((dera2-derc22)/dera2)

printf("\nValue of analytic derivative y´(2.5)=%f\n", dera2)
printf("Value of regressive derivative with 0.5 step y´(2.5)=%f\n",derr2)
printf("Relative aproximation error Err=%f\n\n",Err5)
printf("Value of progressive derivative with 0.5 step y´(2.5)=%f\n",derp2)
printf("Relative aproximation error Err=%f\n\n",Err6)
printf("Value of center derivative with 0.5 step y´(2.5)=%f\n",derc2)
printf("Relative aproximation error Err=%f\n\n",Err7)
printf("Value of center derivative with 0.5 step of h^4 value y´(2.5)=%f\n",derc22)
printf("Relative aproximation error Err=%f\n\n",Err8)

