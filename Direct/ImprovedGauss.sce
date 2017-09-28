clc
clear
//By Gianfmg
disp("Improved Gauss") 


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


function X=gauss(A,b)
    n=length (b)
    X=zeros(n,1)
    Ab=[A,b]
    for p=1:n-1
        line=0
        [m,k]=max(Ab(p:n,p))
        k=k+p-1
        line=Ab(k,:)
        Ab(k,:)=Ab(p,:)
        Ab(p,:)=line
//      Look for maximum value and change of rows to reduce error
        for r=p+1:n
        l=Ab(r,p)/Ab(p,p)
        Ab(r,:)=Ab(r,:)-l*Ab(p,:)
    end
    disp(Ab,p,"Change of row=")
    end
    X=backsub(Ab(1:n,1:n),Ab(:,n+1))
    
endfunction


//Insert matrix here
A=[4,3,9,2;
   5,10,9,1;
   10,8,8,1;
   3,7,9,9]
 
b=[2,8,0,6]'
 
disp(A,"A=")
disp(b,"b=")
X=gauss(A,b)
disp(X,"X=")

