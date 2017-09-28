clc
clear
//By Gianfmg

function [x,er,ea,Iter]=Jacobi(A,b,x0,Tol,MaxIter)
    n=length(b)
    x=x0
    for Iter=1:MaxIter
        x0=x
        for i=1:n
            e=0
            for j=i+1:n
                e=e+A(i,j)*x0(j)
            end
            f=0
            for j=1:i-1
                f=f+A(i,j)*x0(j)
            end
            x(i)=(b(i)-e-f)/A(i,i)
        end
  
    ea=norm(x-x0,1)
    er=ea/norm(x,1)
    if Iter<=3 then 
    printf("Iteration=%i Error abs=%.6f",Iter,ea)
    disp(x,"x=")
    end
    if ea<Tol then
        break
    end
   end
    
endfunction
//Matrix
A=[10,8,-1;
   -4,10,3;
   9,-6,-18]
b=[10;6;-8]
//Initial value
x0=[7;-9;-6]
disp(A,"A=")
disp(b,"b=")
disp(x0,"x0=")
MaxIter=100
Tol=.001
[x,er,ea,Iter]=Jacobi(A,b,x0,Tol,MaxIter)
printf("Solution is found\n")
printf("Iteration=%i Error abs=%.6f",Iter,ea)
disp(x,"x=")
