clc
clear
//By Gianfmg
disp("Jacobi for linear ecuations with initial value")

//Vectors here
A=[-12,-4,6;0,-5,4;10,10,29]
b=[7;6;8]
//Initial value
x0=[-5;-8;-8]  
disp(A,"A=")
disp(b,"b=")
disp(x0,"x0=")
function x=metjac(A,b)
   [M,N]=size(A)
   x=x0
   for k=1:100  
     for i=1:M
     s=0
     s1=0
       for j=i+1:N
       s=s+A(i,j)*x0(j)
       end
       for j=1:i-1
       s1=s1+A(i,j)*x0(j)
       end
       x(i)=(b(i,1)-s-s1)/A(i,i) 
   end
   //Error calculation
Q=x0-x
e=0
   for R=1:M
   P=(abs(Q(R,1)))
   e=e+P
   end
   EA=e
   if k<=3

     printf("\nIteration= %i EA= %.6f\n",k,EA)
     disp(x,"x=")
  end

  if EA<=0.001      
       printf("\nSolution is found\n")
       printf("Iteration= %i EA= %.6f\n",k,EA)
       disp(x,"x=")
       break
    end   
    x0=x
  end
endfunction

x=metjac(A,b)
