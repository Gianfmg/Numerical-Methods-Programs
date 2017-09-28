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
            for j=1:n
                if i~=j then
                e=e+A(i,j)*x(j)
                end
            end
            f=0
            for j=1:i-1
                f=f+A(i,j)*x(j)
            end
            x(i)=(b(i)-e)/A(i,i)
        end
  //Calculate error
    ea=norm(x-x0)
    er=ea/(norm(x)+%eps)
    errconv=max(ea,er)
    if Iter<=3 then 
    printf("Iteration=%i Error abs=%.6f Error rel=%.6f",Iter,ea,er)
    disp(x,"x=")
    end
    if errconv<Tol then
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
printf("Iteration=%i Error abs=%.6f Error rel=%.6f",Iter,ea,er)
disp(x,"x=")
