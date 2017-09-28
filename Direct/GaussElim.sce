clear
clc
//By Gianfmg
disp("Gauss Elimination") 

//Matrixes
A= [5,3,9,2;5,11,9,1;10,8,9,1;3,7,9,10]
b=[2,8,0,6]'
AB=[A,b]

//Matrix solving by Gauss elimintation
//This transforms the matrix to a superior matrix
function AB=GaussFunc(AB)
    n= length (b)
    for p=1:n-1
        for i=p+1:n
            L(i,p)=AB(i,p)/AB(p,p)
            AB(i,:)=((AB(i,:))-(L(i,p)*(AB(p,:))))
            end
    end
    
    
endfunction

AB=GaussFunc(AB)
disp(A,"A=")
disp(AB,"AB=")
n=length(b)
disp(b,"b=")
C=AB(1:n,1:n)

d=AB(1:n,n+1)

//Solving the superior matrix created
function X=MatSup(C)
    n=length (b)
    for i=n:-1:1
       X(i)=((d(i,1))/(C(i,i)))
            for j=i+1:n
                X(i)=X(i)-((C(i,j)*X(j))/(C(i,i)))
        end
    end
    
endfunction

X=MatSup(C)
disp(X,"X=")




