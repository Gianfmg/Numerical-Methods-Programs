clc
clear
//By Gianfmg
disp("Find y value in x by undetermined coeff")
//Function
function y=f(x)
    y=-3360 + 706*x -47*x^2 + x^3 
endfunction

function y=Pol(X,Y,x)
n=length(X)
C=ones(n,n)
    for i=2:n
    C(:,i)=C(:,i).*X.^(i-1)
    end
disp(C)
a=C\Y
disp(a)
y=a(1)
for k=2:n
    y=y+a(k)*x^(k-1)
end
endfunction

X=[9;13;18.5;22] 
Y=[-84;72;-53.125;72]
x=15.666667
y=Pol(X,Y,x)

printf("Polynomial Interpolator value P(15.666667)=%f",y)

