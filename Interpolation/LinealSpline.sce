clear
clc
//By Gianfmg
disp("Interpolation by pieces")
//Function
printf("Function: y(x)=0.447111+1.207199*sin(x)")
printf("\n\nTabla 1. Point Coordinates:\nx0=0.500000, y0=1.025872\nx1=1.000000, y1=1.462933\nx2=1.500000, y2=1.651285\nx3=2.000000, y3=1.544813\nx4=2.500000, y4=1.169585\nx5=3.000000, y5=0.617470\nx6=3.500000, y6=0.023646\nx7=4.000000, y7=-0.466500\nx8=4.500000, y8=-0.732962\nx9=5.000000, y9=-0.710501\nx10=5.500000, y10=-0.404617\nx11=6.000000, y11=0.109801 ")
//Function points
x0=0.500000, y0=1.025872 
x1=1.000000, y1=1.462933 
x2=1.500000, y2=1.651285 
x3=2.000000, y3=1.544813 
x4=2.500000, y4=1.169585 
x5=3.000000, y5=0.617470 
x6=3.500000, y6=0.023646 
x7=4.000000, y7=-0.466500 
x8=4.500000, y8=-0.732962 
x9=5.000000, y9=-0.710501 
x10=5.500000, y10=-0.404617 
x11=6.000000, y11=0.109801
x=[x0,x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11]   
y=[y0,y1,y2,y3,y4,y5,y6,y7,y8,y9,y10,y11] 
xx=[0.750000,0.900000,1.750000,1.910000,2.200000,2.400000,3.250000,3.450000,3.750000,4.250000]

printf("\n\nPolynomic valuesn:\n")
for j=1:11
 for k=1:10
     a=x(j)
     b=x(j+1)
     if xx(k)>=a & xx(k)<=b
        pty=y(j) +((y(j+1)-y(j))/(x(j+1)-x(j)))*(xx(k)-x(j))
        printf("Px%g=%f Py(Px%g)=%f\n",k,xx(k),k,pty)
        plot(xx(k),pty,"rd") 
        end
    end
end
//Function
function y=f(x)
    y=0.447111+1.207199*sin(x)
endfunction 
//Range
a=0:0.1:2*%pi
plot(a,f,"k")
plot(x,y,"gd")
for j=1:11
    a=x(j)
    b=x(j+1)
    step=(b-a)/100
    for i=1:100
        X(i)=a+(i-1)*step
        y2(i)=y(j) +((y(j+1)-y(j))/(x(j+1)-x(j)))*(X(i)-x(j))
    end
plot(X,y2)
xgrid()
end
