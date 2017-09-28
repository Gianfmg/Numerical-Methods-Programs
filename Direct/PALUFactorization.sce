clc
clear
//By Gianfmg
disp("PA=LU Factorization")

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


function X=gauss(A,b)
    n=length (b)
    X=zeros(n,1)
    U=[A]
    l=zeros(n,n)
    P=eye(n,n)
    for p=1:n-1
        line=0
        line2=0
        line3=0
        [m,k]=max(abs(U(p:n,p)))
        k=k+p-1
        line=U(k,:)
        U(k,:)=U(p,:)
        U(p,:)=line
        line2=l(k,:)
        l(k,:)=l(p,:)
        l(p,:)=line2
        line3=P(k,:)
        P(k,:)=P(p,:)
        P(p,:)=line3
        for r=p+1:n
        l(r,p)=U(r,p)/U(p,p)
        U(r,:)=U(r,:)-l(r,p)*U(p,:)
    end

end
l=l+eye(n,n)
disp(U,"U=")
disp(l,"L=")

PB=P*b
disp(P,"P=")
disp(PB,"PB=")

y=forwsub(l,PB)

X=backsub(U(1:n,1:n),y)
    
endfunction

//Change matrix values here
A=[4,3,9,2;
   5,10,9,1;
   10,8,8,1;
   3,7,9,9]
 
b=[2,8,0,6]'


disp(A,"A=")
disp(b,"b=")
X=gauss(A,b)
disp(X,"X=")
