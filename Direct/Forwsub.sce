clc
clear
//By Gianfmg
//Progressive substitution
function x=forwsub(A,B)
    n=length(B)
    for i=1:n
        s=0
        for j=1:i-1
           s=s+A(i,j)*x(j) 
        end
        x(i)=(B(i)-s)/A(i,i)
    end
endfunction
//Matrix here
A=[1,2,3;0,4,5;0,0,6]'
B=[3;2;1]

x=forwsub(A,B)
disp(A,"A=")
disp(B,"B=")
disp(x,"x=")
disp(A*x-B,"Verific.")
