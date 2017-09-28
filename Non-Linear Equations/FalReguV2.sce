clc
clear
//By Gianfmg
disp("Find 0 by regula falsi")
function y=F(x)
    y=-3360 + 706*x - 47*x^2 +x^3
endfunction

function [c,yc,err,iter,err1,err2]=bisec(F,a,b,tol,MaxIter)
    err1=0
    err2=0
    ya=F(a)
    yb=F(b)
    if ya*yb>0 then
        printf("Function has no 0")
    else
        for iter=1:MaxIter
            c=b-(yb*(b-a))/(yb-ya)
            yc=F(c)
            if yc==0
                a=c
                b=c
            elseif ya*yc<0
                yb=yc
                b=c
            elseif yb*yc<0
                ya=yc
                a=c
            end
           err1=abs(b-a)
           err2=abs(yc)
           err=min(err1,err2)
            if err<tol
               break
            end
            if iter<=5
                printf("iter=%i c=%f f(c)=%f err=%f err1=%f err2=%f\n",iter,c,yc,err,err1,err2)
            end
        end
    end
endfunction


a=13
b=18.5
tol=0.001
MaxIter=100

[c,yc,err,iter,err1,err2]=bisec(F,a,b,tol,MaxIter)
printf("iter=%i c=%f f(c)=%f err=%f err1=%f err2=%f",iter,c,yc,err,err1,err2)
