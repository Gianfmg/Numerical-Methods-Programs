clc
clear
//By Gianfmg
disp("Golden-section search")
//Finds function local minimum and maximum
c1=0.447111
c2=1.207199

printf("C1=%f, C2=%f\n\n",c1,c2)
a=0.5
b=6
epsilon=0.0000001
iter=200
tau=0.61803398875
k=0
j=0
function y=f(x)
    y=0.447111+1.207199*sin(x)
endfunction
x1=a+(1-tau)*(b-a)
x2=a+tau*(b-a)

f_x1=f(x1)
f_x2=f(x2)
while ((abs(b-a)>epsilon) & (k<iter))
    k=k+1
    if(f_x1<f_x2)
        b=x2
        x2=x1
        x1=a+(1-tau)*(b-a) 
        f_x1=f(x1)
        f_x2=f(x2)  
    else
        a=x1
        x1=x2
        x2=a+tau*(b-a)
        f_x1=f(x1)
        f_x2=f(x2)
        end
k=k+1
end

if (f_x1<f_x2)
    printf("Local minimum point of function\n")
    printf("min[f(x)]=%f  at  x=%f\n\n", f_x1, x1)
    plot(x1,f_x1,'rd')
else
    printf("Local minimum point of function\n")
    printf("min[f(x)]=%f  at  x=%f\n\n", f_x2, x2) 
    plot(x2,f_x2,'rd') 
end

a=0.5
b=6
j=0
function y=g(x)
    y=-0.447111-1.207199*sin(x)
endfunction

xx1=a+(1-tau)*(b-a)
xx2=a+tau*(b-a)
g_x1=g(xx1)
g_x2=g(xx2)

while ((abs(b-a)>epsilon) & (j<iter))
    j=j+1
    if(g_x1<g_x2)
        b=xx2
        xx2=xx1
        xx1=a+(1-tau)*(b-a)
        g_x1=g(xx1)
        g_x2=g(xx2)
    else
        a=xx1
        xx1=xx2
        xx2=a+tau*(b-a)
        g_x1=g(xx1)
        g_x2=g(xx2)
        end
j=j+1
end

if (g_x1<g_x2)
    printf("Local maximum point of function\n")
    printf("min[f(x)]=%f  at  x=%f\n", abs(g_x1), xx1)
    plot(xx1,abs(g_x1),'rd')
else
    printf("Local maximum point of function\n")
    printf("min[f(x)]=%f  at  x=%f\n", abs(g_x2), xx2) 
    plot(xx2,abs(g_x2),'rd') 
end

w=0.5:0.01:6
plot(w,f,'b')
xgrid()
