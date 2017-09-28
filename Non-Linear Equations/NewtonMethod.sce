clc
clear
//By Gianfmg
disp("Find 0 by Newton method")

//Insert your function here
function y=Func(x)
 y=(-2*x)+(x.^2) + (x.^3)
endfunction

//Slope of function
function m=Pend(x)
    m=-2+(2*x) +(3*x^2)
endfunction


f1=scf(1)
clf(f1)
xgrid()
//Range of plot
x1=(0:.1:3)
y=Func(x1)
plot(x1,y)


function x=MetNewton(x0)
  for p=1:100
      x=x0-((Func(x0))/(Pend(x0)))
      //Calculate error
      EA=abs(x-x0)
      ER=abs(Func(x))
      if p<=5
      printf("iter=%i  x=%f  F(x)=%f\n", p,x,Func(x))
      plot(x,Func(x),"rd")
      end
      if EA<0.001
      printf("Solution: Niter=%i x=%f F(x)=%f ErrAbs=%f",p,x,Func(x),EA)
      break
      elseif ER<0.001
      printf("Solution: Niter=%i x=%f F(x)=%f ErrAbs=%f",p,x,Func(x),ER)
      plot(x,Func(x),"rd")
      break            
      end
      x0=x        
  end
endfunction

//Initial value
x0=-0.666667
//Put your function here
disp("y= -2*x + x^2+ x^3")
printf("x0=%f\n\n", x0)

x=MetNewton(x0)
