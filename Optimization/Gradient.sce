clear
clc
//By Gianfmg
disp("Searching for minimum with gradient")  
//Function
function z=f(x,y)
   z=2*cos(x)+2*sin(y)
endfunction

function [grad]=gradiente(x,y)
     dx=-2*sin(x)
     dy=2*cos(y)
    grad=[dx,dy]
endfunction

function [h]=H(x,y)
    dxx=-2*cos(x)
    dyy=-2*sin(y)
    dxy=0
    dyx=0
    h=[dxx,dxy;dyx,dyy]
endfunction

j=0
P0=[0,0]
P=[2,5]  
Z=0
err=10000


printf("Between x=[0,8] y y=[0,8] function has\na minimum z=-4 near point (3.141593,4.712389)\n\n")

printf("z=2cos(x)+2sin(y)\n\n")
printf("Initial point Po=(2,5)")

x=[0:0.1:8]
y=[0:0.1:8]
n=length(x)
for i=1:n
    for i1=1:n
        u(i,i1)=f(x(i),y(i1))
    end
end
plot3d(x,y,u)

while max(abs(P-P0),abs(err))>0.001
    P0=P
    x=P(1)
    y=P(2)
    e=f(x,y)
    g=gradiente(x,y)
    h=H(x,y)
    P=P-g/h
    x=P(1)
    y=P(2)
    F=f(x,y)
    err=F-e
    j=j+1
    printf("\n \n Iteration %i \n Coordinates from minimum P[%f,%f]\n Value of minimum f(x,y)= %f \n Error err= %f\n ",j,P(1),P(2),F,err)
end
