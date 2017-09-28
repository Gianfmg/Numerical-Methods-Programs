clc
clear
//By Gianfmg
//Newton V2
function y=F(x)
    y=-3360 + 706*x - 47*x^2 +x^3
endfunction

function dy=df(x)
    dy=706 - 94*x +3*x^2
endfunction

function [x1,yx1,err,iter,err1,err2]=Newton(F,df,x0,tol,MaxIter)
yx0=F(x0)
for iter=1:MaxIter
           x1=x0-(yx0/df(x0))
           yx1=F(x1)
           err1=abs(x1-x0)
           err2=abs(yx1)
           err=min(err1,err2)
           x0=x1
           yx0=yx1
            if err<tol
               break
            end
            if iter<=5
                printf("iter=%i x1=%f f(x1)=%f err=%f err1=%f err2=%f\n",iter,x1,yx1,err,err1,err2)
            end
end
endfunction


x0=14
tol=0.001
MaxIter=100

[x1,yx1,err,iter,err1,err2]=Newton(F,df,x0,tol,MaxIter)
printf("iter=%i x1=%f f(x1)=%f err=%f err1=%f err2=%f",iter,x1,yx1,err,err1,err2)
