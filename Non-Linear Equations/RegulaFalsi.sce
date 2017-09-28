clc 
clear
//By Gianfmg
disp("Find 0 by Regula Falsi")

//Insert function here
function y=func(x)
    y=(-2*x)+(x^2)+(x^3)
endfunction


function [c]=FalP(a,b)
  for d=1:100
      c=b-((func(b)*(b-a))/(func(b)-func(a)))
      if (func(a)*func(c))<0
         a=a
         b=c
      elseif (func(b)*func(c))<0
             b=b
             a=c
      end     
  Q1=abs(b-a)
  Q2=abs(func(c))
      if d<=5
        printf("iter=%i c=%f f(c)=%f\n",d,c,func(c))
      end
      if Q1<=tol
        printf("Niter=%i c=%f f(c)=%f Err=%f\n",d,c,func(c),Q1)
        break
      elseif Q2<=tol
        printf("Niter=%i c=%f f(c)=%f Err=%f\n",d,c,func(c),Q2)
        break            
      end
   end
endfunction

//Change to your function here
printf("y=-2x + x^2 + x^3\n")
//Tolerance for error
tol=0.001
//Range
a=-1.000000
b=0.500000
printf("a=%f b=%f\n\n", a,b)

[c]=FalP(a,b)
