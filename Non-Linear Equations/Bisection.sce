clc
clear
//By Gianfmg
disp("Bisection Method")

//Insert your function here
function y=func(x)
    y=(-2*x)+(x^2)+(x^3)
endfunction

//Solving by bisection method
function [c]=MetBisection(a,b)
  for d=1:100
      c=(a+b)/2
      if (func(a)*func(c))<0
         a=a
         b=c
      elseif (func(b)*func(c))<0
              b=b
              a=c

  end
  EA=abs(a-b)
      if d<=5 
         printf("iter=%i c=%f f(c)=%f\n",d,c,func(c))
      end
      if EA<0.001
         printf ("Niter=%i c=%f f(c)=%f AbsErr=%f\n",d,c,func(c), EA)
      break
      end
    end
endfunction

//Change to your function here
printf("y=-2x + x^2 + x^3\n")
//Range
a=-1.000000
b=0.500000
printf("a=%f b=%f\n\n",a,b)

[c]=MetBisection(a,b)



