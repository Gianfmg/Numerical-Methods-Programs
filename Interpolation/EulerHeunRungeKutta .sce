clc
clear
//By Gianfmg
disp("Euler, Heun y Runge-Kutta method to find points")
//Constant for function
C=[1.362018, 2.315430]
//Function
function y=f(t,y)
    y=y^2-sin(C(1)*t)+cos(C(2)*t)
endfunction

function [Y,T,E]=E(t,y0,N,f)
    Y(1)=y0
    h=(t(2)-t(1))/N
    T=[t(1):h:t(2)]'
    for i=1:N
        Y(i+1)=Y(i)+f(T(i),Y(i))*h
    end
    Y0=ode(y0,t(1),T,f)
    E=sqrt(sum((Y'-Y0).^2)/(N+1))
endfunction
function [Y,T,E]=H(t,y0,N,f)
    Y(1)=y0
    h=(t(2)-t(1))/N
    T=[t(1):h:t(2)]'
    for i=1:N
        Y(i+1)=Y(i)+f(T(i),Y(i))*h
        Y(i+1)=Y(i)+(f(T(i),Y(i))+f(T(i+1),Y(i+1)))*h/2
    end
    Y0=ode(y0,t(1),T,f)
    E=sqrt(sum((Y'-Y0).^2)/(N+1))
endfunction

function [Y,T,E]=RK4(t,y0,N,f)
    Y(1)=y0
    h=(t(2)-t(1))/N
    T=[t(1):h:t(2)]'
    for i=1:N
        f1=f(T(i),Y(i))
        f2=f(T(i)+h/2,Y(i)+f1*h/2)
        f3=f(T(i)+h/2,Y(i)+f2*h/2)
        f4=f(T(i)+h,Y(i)+f3*h)
        Y(i+1)=Y(i)+(f1+2*f2+2*f3+f4)*h/6
    end
    Y0=ode(y0,t(1),T,f)
    E=sqrt(sum((Y'-Y0).^2)/(N+1))
endfunction

t=[0,%pi]
T=[t(1):.01:t(2)]
y0=0
Y0=ode(y0,t(1),T,f)
[Ye,Te,Ee]=E(t,y0,6,f)
[YE,TE,EE]=E(t,y0,24,f)
[Yh,Th,Eh]=H(t,y0,12,f)
[Yrk,Trk,Erk]=RK4(t,y0,6,f)
plot(T,Y0,'b-')
plot(Te,Ye,'rd')
plot(TE,YE,'ko')
plot(Th,Yh,'k+')
plot(Trk,Yrk,'b*')
xgrid()
printf("\nC1=%f, C2=%f\n",C(1),C(2))
printf("\nEuler. N=6 subintervals. Err=%f",Ee)
printf("\nEuler. N=24 subintervals. Err=%f",EE)
printf("\nHeun. N=12 subintervals. Err=%f",Eh)
printf("\nRunge-Kutta. N=6 subintervals. Err=%f",Erk)
