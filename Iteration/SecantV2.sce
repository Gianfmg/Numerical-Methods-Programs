clc
clear
//By Gianfmg
//Secant method V2
function y=F(x)
    y=-3360 + 706*x - 47*x^2 +x^3
endfunction

function [x2,yx2,err,iter,err1,err2]=Sec(F,x0,x1,tol,MaxIter)
yx0=F(x0)
yx1=F(x1)
for iter=1:MaxIter
           x2=x1-(yx1*(x1-x0))/(yx1-yx0)
           yx2=F(x2)
           err1=abs(x2-x1)
           err2=abs(yx2)
           err=max(err1,err2)
           x0=x1
           x1=x2
           yx0=yx1
           yx1=yx2
            if err<tol
               break
            end
            if iter<=5
                printf("iter=%i c=%f f(c)=%f err=%f err1=%f err2=%f\n",iter,x2,yx2,err,err1,err2)
            end
end
endfunction


x0=14
x1=14.6
tol=0.001
MaxIter=100

[x2,yx2,err,iter,err1,err2]=Sec(F,x0,x1,tol,MaxIter)
printf("iter=%i x2=%f f(x2)=%f err=%f err1=%f err2=%f",iter,x2,yx2,err,err1,err2)
