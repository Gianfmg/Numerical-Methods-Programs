clc
clear
//By Gianfmg
disp("Secant method with initial values")

//Your function here
disp("y=0-2*x+1*x^2+x^3")
function y=Func(x)
   y=-(2*x)+(x.^2)+(x.^3)
endfunction

//Initial values
x0=-0.666667
x1=-0.466667
printf("x0=%f x1=%f\n",x0,x1)

f1=scf(1)
clf(f1)
xgrid()
//Plot range
x2=(-1:.1:1)
y=Func(x2)
plot(x2,y)

function x=MetSecant(x0,x1)
    for p=1:100
        x=x1-((Func(x1)*(x1-x0))/(Func(x1)-Func(x0)))
        //Calculate error
        EA=abs(x-x1)
        ER=abs(Func(x))
        
        if p<=5
        printf("iter=%i x=%f F(x)=%f EA=%f\n",p,x,Func(x),EA)
        plot(x,Func(x),"rd")
        end
        
        if EA<0.001 & ER<0.001
  printf("Solution: Niter=%i x=%f F(x)=%f EA=%f\n",p,x,Func(x),max(EA,ER))
        plot(x,Func(x),"rd")
        break
        
        end

        x0=x1
        x1=x        
    end
endfunction

x=MetSecant(x0,x1)
