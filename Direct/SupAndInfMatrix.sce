clear
clc
//By Gianfmg
disp("Superior and inferior matrix solving")

A=[5,4,9;0,4,8;0,0,10] //Superior matrix
b1=[9,8,9]'            //Superior matrix independent values
B=[3,0,0;2,3,0;2,9,6]  //Inferior matrix
b2=[2,9,5]'            //Inferior matrix independent values

function X=MatSup(A)
    n=length (b1)
    for i=n:-1:1
       X(i)=((b1(i,1))/(A(i,i)))
            for j=i+1:n
                X(i)=X(i)-((A(i,j)*X(j))/(A(i,i)))
        end
    end
    
endfunction

X=MatSup(A)
disp(A,"Initial Matrix")
disp(b1,"Independent values")
disp(X,"Superior matrix results=")

function X2=MatInf(B)
    n=length (b2)
    for i=1:n
       X2(i)=((b2(i,1))/(B(i,i)))
            for j=1:i-1
                X2(i)=X2(i)-((B(i,j)*X2(j))/(B(i,i)))
        end
    end
    
endfunction

X2=MatInf(B)
disp(B,"Initial Matrix")
disp(b2,"Independent values")
disp(X2,"Inferior matrix results=")


