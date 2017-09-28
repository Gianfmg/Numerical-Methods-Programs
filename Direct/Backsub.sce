clc
clear
//By Gianfmg
//Back-substitution

function x=backsub(A,B)
    n=length(B)
    for i=n:-1:1
        s=0
        for j=i+1:n
           s=s+A(i,j)*x(j) 
        end
        x(i)=(B(i)-s)/A(i,i)
    end
endfunction

//Enter desired matrix here
A=[1,2,3;0,4,5;0,0,6]
B=[1;2;3]

x=backsub(A,B)
disp(A,"A=")
disp(B,"B=")
disp(x,"x=")

//This must result 0
disp(A*x-B,"Verific.")


