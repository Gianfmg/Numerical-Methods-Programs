clc
clear
//By Gianfmg
disp("LU Matrix Factorization")


function X=backsub(A,b)
    n=length (b)
    X=zeros(n,1)
    Ab=[A,b]
    for p=n:-1:1
        s=0
        for r=p+1:n
            s=s+A(p,r)*X(r)
        end
        X(p)=(b(p)-s)/A(p,p)
    end
endfunction

function y=forwsub(A,B)
    n=length(B)
    for i=1:n
        s=0
        for j=1:i-1
           s=s+A(i,j)*y(j) 
        end
        y(i)=(B(i)-s)/A(i,i)
    end
    disp(y,"Y=")
endfunction

//Creating LU Matrixes
function X=lum(A,b)
    n=length (b)
    X=zeros(n,1)
    U=[A]
    l=zeros(n,n)
    for p=1:n-1
        for r=p+1:n
        l(r,p)=U(r,p)/U(p,p)
        U(r,:)=U(r,:)-l(r,p)*U(p,:)
    end

end
l=l+eye(n,n)
disp(l,"L=")
disp(U,"U=")
y=forwsub(l,b)

X=backsub(U(1:n,1:n),y)
    
endfunction


//Insert matrix here
A=[5,3,9,2;
   5,11,9,1;
   10,8,9,1;
   3,7,9,10]
 
b=[2,8,0,6]'
 
disp(A,"A=")
disp(b,"b=")
X=lum(A,b)
disp(X,"X=")


