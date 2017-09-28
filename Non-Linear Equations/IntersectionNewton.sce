clc
clear
//By Gianfmg
disp("Intersection point between 2 functions by Newton")

//Insert a non-linear equation system with 2 or more equations
function F=Func(x0)
    x=x0(1)
    y=x0(2)
    f1=x^2-y
    f2=-x^2-y+18
    F=[f1;f2]
endfunction


function J=Newton(x0)
    x=x0(1)
    y=x0(2)
    J(1,1)=2*x
    J(1,2)=-1
    J(2,1)=-2*x
    J(2,2)=-1
    
endfunction

disp("F(x,y) es=")
printf("F1=x^2-y\n")
printf("F2=-x^2-y+18\n\n")
printf("Initial point is Po(1,1)\n\n")
//Initial point
x0=[1;1]
for i=1:100
F=Func(x0)
J=Newton(x0)

dx=J\-F
x0=x0+dx
EA=norm(F)

     if i==1
       printf("Iteration=%i\n",i)
       disp(x0,"x=")
       disp(F,"F(x)")
       printf("Convergence error=%f\n",EA)
     
     elseif i<=5
       printf("Iteration=%i\n",i)
       disp(x0,"x0=")
       disp(F,"F(x0)")
       printf("Convergence error=%f\n",EA)
      end
      if EA<=0.001
         printf("Iteration=%i",i)
         disp(x0,"x0=")
         disp(F,"F(x0)")
         printf("Convergence error=%f\n",EA)
      break
      end
end


G1=scf(1)
clf(G1)
xgrid()
//Plot range
x2=(-4:.1:4)
f1=x2.^2
f2=-x2.^2+18
plot(x2,f1)
plot(x2,f2,)
plot(3,9,"rd")



