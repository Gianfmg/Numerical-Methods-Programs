clc
clear
//By Gianfmg
disp("Plotting function using Newton 5 and 10 point, Linear Spline 6 and 11, Cubic Spline 6 and 11")

//Function
function y=f(x)
    v=3
    y=1/(1+v*x^2)
endfunction

function y=InterpolNewton(x,X,Y)
  // interpolate values y at points x using data vectors X and Y
  n = length(X);
  // build coefficient table 
  D = diag(Y);
  for m = 1:n
    for i = 1:n-m
      j = i+m;
      D(i,j) = (D(i+1,j)-D(i,j-1))/(X(j)-X(i));
    end
  end

  y = Y(1)*ones(length(x));
  for k = 2:n
    s = D(1,k);
    for i = 1:k-1
      s = s.*(x-X(i)*ones(length(x)));

    end
    y = y+s;
  end
endfunction

function y=InterTrozos(X,Y,x)
    n=length(X)
    y=0
    a=Y
    b=0
    for i=1:n-1
        if X(i)<=x&x<=X(i+1)
            b=(Y(i+1)-Y(i))/(X(i+1)-X(i))
            y=a(i)+b*(x-X(i))
            break
        end
    end
endfunction

function [a,b,c,d]=Coef(Y,x)
    n=length(Y)
    c=zeros(n,1)
    for i=1:n-1
        h(i)=x(i+1)-x(i)
    end
    for i=2:n-1
        R(i-1)=6*(((Y(i+1)-Y(i))/h(i))-((Y(i)-Y(i-1))/h(i-1)))
    end
    for i=2:n-1
        C(i,i-1)=h(i-1)
        C(i,i)=2*(h(i-1)+h(i))
        C(i,i+1)=h(i)
    end
    c(2:n-1)=(C(2:n-1,2:n-1)\R)
    for i=1:n-1
        d(i)=(c(i+1)-c(i))/h(i)
        b(i)=((-c(i)*h(i))/2)+((-d(i)*(h(i)^2))/6)+((Y(i+1)-Y(i))/h(i))
        a(i)=Y(i)
    end
endfunction
function y=Spline(X,Y,x,a,b,c,d)
    y=0
    n=length(X)
    for i=1:n-1
        if X(i)<=x&x<=X(i+1)
            y=a(i)+b(i)*(x-X(i))+(c(i)/2)*(x-X(i)).^2+d(i)/6*(x-X(i)).^3
            break
        end
    end
endfunction
function ER=ERPN(x,PN)
    n=length(x)
    ER=0
    for i=1:n
        ER=ER+abs((f(x(i))-PN(i))^2)
    end
    ER=((ER)^0.5)/sqrt(n)
endfunction
lb=-5
rb=5
Npasos=100
paso=(rb-lb)/Npasos
x=zeros(Npasos+1)
y=zeros(Npasos+1)
X=[-5,-3,-1,1,3,5]'
for i=1:length(X)
    Y(i)=f(X(i))
end
x1=[-4,-2,0,2,4]'
X2=[-5,-4,-3,-2,-1,0,1,2,3,4,5]'
for i=1:length(X2)
    Y2(i)=f(X2(i))
end
x2=[-4.5,-3.5,-2.5,-1.5,-0.5,0.5,1.5,2.5,3.5,4.5]'
printf("Newton table 5th order\n")
for i=1:length(X)
    printf("X=%f Y=%f\n",X(i),Y(i))
end
printf("\nPolynomial values are:\n")
for i=1:length(x1)
    PN(i)=InterpolNewton(x1(i),X,Y)
    printf("x05=%f PN=%f\n",x1(i),PN(i))
end
ERPN5=ERPN(x1,PN)
printf("\nError ERPN5=%f\n\n",ERPN5)
scf(0)
for i=1:Npasos+1
    x(i)=lb+(i-1)*paso
    y(i)=f(x(i))
    y2(i)=InterpolNewton(x(i),X,Y)
end
plot(X,Y,"ro",x,y,"k",x,y2,"b")
xgrid
printf("Newton table 10th order\n")
for i=1:length(X2)
    printf("X=%f Y=%f\n",X2(i),Y2(i))
end
printf("\nPolynomial values are:\n")
for i=1:length(x2)
    PN(i)=InterpolNewton(x2(i),X2,Y2)
    printf("x05=%f PN=%f\n",x2(i),PN(i))
end
ERPN10=ERPN(x2,PN)
printf("\nError ERPN10=%f\n",ERPN10)
scf(1)
for i=1:Npasos+1
    x(i)=lb+(i-1)*paso
    y2(i)=InterpolNewton(x(i),X2,Y2)
end
plot(X2,Y2,"ro",x,y,"k",x,y2,"b")
xgrid
printf("\nTable for linear Spline in 6 points\n")
for i=1:length(X)
    printf("X=%f Y=%f\n",X(i),Y(i))
end
printf("\nPolynomial values are:\n")
for i=1:length(x1)
    PN(i)=InterTrozos(X,Y,x1(i))
    printf("x05=%f PN=%f\n",x1(i),PN(i))
end
ERLN6=ERPN(x1,PN)
printf("\nError ERLN6=%f\n\n",ERLN6)
scf(2)
for i=1:Npasos+1
    x(i)=lb+(i-1)*paso
    y2(i)=InterTrozos(X,Y,x(i))
end
plot(X,Y,"ro",x,y,"k",x,y2,"g")
xgrid
printf("Tble for linear Spline in 11 pointss\n")
for i=1:length(X2)
    printf("X=%f Y=%f\n",X2(i),Y2(i))
end
printf("\nPolynomial values are:\n")
for i=1:length(x2)
    PN(i)=InterTrozos(X2,Y2,x2(i))
    printf("x05=%f PN=%f\n",x2(i),PN(i))
end
ERLN11=ERPN(x2,PN)
printf("\nError ERLN11=%f\n\n",ERLN11)
scf(3)
for i=1:Npasos+1
    x(i)=lb+(i-1)*paso
    y2(i)=InterTrozos(X2,Y2,x(i))
end
plot(X2,Y2,"ro",x,y,"k",x,y2,"g")
xgrid
[a,b,c,d]=Coef(Y,X)
printf("Table for cubic Spline in 6 points\n")
for i=1:length(X)
    printf("X=%f Y=%f\n",X(i),Y(i))
end
printf("\nPolynomial values are:\n")
for i=1:length(x1)
    PN(i)=Spline(X,Y,x1(i),a,b,c,d)
    printf("x05=%f PN=%f\n",x1(i),PN(i))
end
ERCs5=ERPN(x1,PN)
printf("\nError ERCs5=%f\n\n",ERCs5)
scf(4)
for i=1:Npasos+1
    x(i)=lb+(i-1)*paso
    y2(i)=Spline(X,Y,x(i),a,b,c,d)
end
plot(X,Y,"ro",x,y,"k",x,y2,"g")
xgrid
[a,b,c,d]=Coef(Y2,X2)
printf("Table for cubic Spline in 11 points\n")
for i=1:length(X2)
    printf("X=%f Y=%f\n",X2(i),Y2(i))
end
printf("\nPolynomial values are:\n")
for i=1:length(x2)
    PN(i)=Spline(X2,Y2,x2(i),a,b,c,d)
    printf("x05=%f PN=%f\n",x2(i),PN(i))
end
ERCs11=ERPN(x2,PN)
printf("\nError ERCs11=%f\n",ERCs11)
scf(5)
for i=1:Npasos+1
    x(i)=lb+(i-1)*paso
    y2(i)=Spline(X2,Y2,x(i),a,b,c,d)
end
plot(X2,Y2,"ro",x,y,"k",x,y2,"g")
xgrid
printf("\n-------Table--------\n")
printf("Newton 5=%f\n",ERPN5)          //First table
printf("Newton 10=%f\n",ERPN10)        //Second table
printf("Linear Spline 6=%f\n",ERLN6)   //Third table
printf("Linear Spline 11=%f\n",ERLN11) //Fourth table
printf("Cubic Spline 6=%f\n",ERCs5)    //Fifth table
printf("Cubic Spline 11=%f\n",ERCs11)  //Sixth table
