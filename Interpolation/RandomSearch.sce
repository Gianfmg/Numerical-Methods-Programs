clc
clear
//By Gianfmg
disp("Finding line coefficient values by random search compared to least-squares")


X=[1,2,3,4,5,6,7,8,9,10]
Y=[6.578510,9.533055,11.785203,14.617738,16.805172,21.407532,24.712995,27.523414,31.063029,31.983999]

n=length(X)
f=zeros(X)
printf("Coordinate point table\n\n")
for i=1:10
    printf("X=%f    ", X(i))
    printf("Y=%f\n",Y(i))
end

plot(X,Y,'rd')
q=0
w=0
e=0
r=0
t=0

for i=1:n
    q=q+(X(i)*X(i))
    w=w+X(i)
    e=e+(X(i)*Y(i))
    r=r+Y(i)
end

a=(n*e-w*r)/(n*q-w*w)
b=(r-(w*a))/n

for i=1:n
    f(i)=a*X(i)+b
end

plot(X,f,'g')
for i=1:n
    t=t+abs(f(i)-Y(i))^2
end

Err=((1/n)*t)^(1/2)

printf("\n")
printf("Line coefficients: a=%f b=%f\n",a,b)
printf("Error=%f\n\n",Err)
printf("Random Search\n\n")

function Error=Err(X,Y,a,b)
    n=length(X)
    Error=0
    for i=1:n
        Error=Error+abs((a*X(i)+b)-Y(i))^2
    end
    Error=((Error/n)^0.5)
endfunction

//Random search
tic()
n=5000
X=[1,2,3,4,5,6,7,8,9,10]'
a=+40*rand(n,1)
b=-150+250*rand(n,1)
amax=max(a)
amin=min(a)
bmax=max(b)
bmin=min(b)
Error0=Err(X,Y,a(1),b(1))
for i=2:n
Error=Err(X,Y,a(i),b(i))
    if Error<Error0
        a0=a(i)
        b0=b(i)
        Error0=Error
    end
end


printf("amax=%f,amin=%f,bmax=%f,bmin=%f\n\n",amax,amin,bmax,bmin)
printf("Line Coefficients are: a=%f b=%f\n",a0,b0)
printf("Time=%f err=%f\n",toc(),Error0)
