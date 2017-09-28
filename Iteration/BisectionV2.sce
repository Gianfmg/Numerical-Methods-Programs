clc
clear
//By Gianfmg
//Bisection V2
function y=F(x)
    y=-3360 + 706*x - 47*x^2 +x^3
endfunction

function [c,yc,err,iter]=bisec(F,a,b,tol,MaxIter)
    ya=F(a)
    yb=F(b)
    if ya*yb>0 then
        printf("Function has no 0")
    else
        for iter=1:MaxIter
            c=(a+b)/2
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
           err=abs(b-a)
            if err<tol
               break
            end
            if iter<=5
                printf("iter=%i c=%f f(c)=%f err=%f\n",iter,c,yc,err)
            end
        end
    end
endfunction


a=13
b=18.5
tol=0.001
MaxIter=100

[c,yc,err,iter]=bisec(F,a,b,tol,MaxIter)
printf("iter=%i c=%f f(c)=%f err=%f",iter,c,yc,err)
