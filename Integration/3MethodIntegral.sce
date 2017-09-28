clc
clear
//By Gianfmg
disp("Integrate function by analytic aproximation, Simpson formula and Montecarlo")

a=0.5
b=3.5
C1=0.447111, C2=1.207199

function y=f(x)
    y=C1+C2*sin(x)
endfunction

Sa=((C1*b)-(C2*cos(b)))-((C1*a)-(C2*cos(a)))
printf("\nC1=%f C2=%f\n",C1,C2)
printf("\nIntegral of function y=C(1)+C(2)*sin(x) en [a,b]\n")
printf("\nC(1)=%f C(2)=%f a=%f b=%f\n",C1,C2,a,b)
printf("\nValue of analytic integral Sa=%f\n",Sa)
h1=0.5
h2=0.25
h3=0.125
n1=(b-a)/h1
n2=(b-a)/h2
n3=(b-a)/h3
s1=0
s2=0
s3=0
for i=1:n1
    s1=s1+(C1+C2*sin(a))
    a=a+h1
end
a=0.5
for i=1:n2
    s2=s2+(C1+C2*sin(a))
    a=a+h2
end
a=0.5
for i=1:n3
    s3=s3+(C1+C2*sin(a))
    a=a+h3
end
Sr1=s1*h1
Errp1=abs((Sa-Sr1)/Sa)
Sr2=s2*h2
Errp2=abs((Sa-Sr2)/Sa)
Sr3=s3*h3
Errp3=abs((Sa-Sr3)/Sa)
printf("\nRectangule rule left point Step=%g Sr=%f\n",h1,Sr1)
printf("Relative Error=%f\n",Errp1)
printf("\nRectangule rule left point Step=%g Sr=%f\n",h2,Sr2)
printf("Relative Error=%f\n",Errp2)
printf("\nRectangule rule left point Step=%g Sr=%f\n",h3,Sr3)
printf("Relative Error=%f\n",Errp3)
s1=0
s2=0
s3=0
a=0.5
    for i=1:n1
        c=(a+(h1/2))
        s1=s1+(C1+C2*sin(c))
        a=a+h1
    end
    a=0.5
    for i=1:n2
        c=(a+(h2/2))
        s2=s2+(C1+C2*sin(c))
        a=a+h2
    end
    a=0.5
    for i=1:n3
        c=(a+(h3/2))
        s3=s3+(C1+C2*sin(c))
        a=a+h3
    end
    Sp1=s1*h1
    Sp2=s2*h2
    Sp3=s3*h3
    Errm1=abs((Sa-Sp1)/Sa)
    Errm2=abs((Sa-Sp2)/Sa)
    Errm3=abs((Sa-Sp3)/Sa)
    printf("\nRectangule rule middle point Step=%g Sr=%f\n",h1,Sp1)
    printf("Relative Error=%f\n",Errm1)
    printf("\nRectangule rule middle point Step=%g Sr=%f\n",h2,Sp2)
    printf("Relative Error=%f\n",Errm2)
    printf("\nRectangule rule middle point Step=%g Sr=%f\n",h3,Sp3)
    printf("Relative Error=%f\n",Errm3)
    s1=0
    s2=0
    s3=0
    a=0.5
    fa=(C1+C2*sin(a))/2
    fb=(C1+C2*sin(b))/2
    for i=2:n1
        a=a+h1
        s1=s1+(C1+C2*sin(a))
    end
    St1=(s1+fa+fb)*h1
    Errt1=abs((Sa-St1)/Sa)
    a=0.5
        for i=2:n2
        a=a+h2
        s2=s2+(C1+C2*sin(a))
    end
    St2=(s2+fa+fb)*h2
    Errt2=abs((Sa-St2)/Sa)
    a=0.5
        for i=2:n3
        a=a+h3
        s3=s3+(C1+C2*sin(a))
    end
    St3=(s3+fa+fb)*h3
    Errt3=abs((Sa-St3)/Sa)
   printf("\nTrapezoidal rule Step=%g Sr=%f\n",h1,St1)
   printf("Relative Error=%f\n",Errt1)
   printf("\nTrapezoidal rule Step=%g Sr=%f\n",h2,St2)
   printf("Relative Error=%f\n",Errt2)
   printf("\nTrapezoidal rule Step=%g Sr=%f\n",h3,St3)
   printf("Relative Error=%f\n",Errt3)
   X1=zeros(100)
   x1=0
   s1=0
   s2=0
   for i=1:n1
    X1(i)=x1+h1
    x1=x1+h1
    s1=s1+f(X1(i))
    s2=s2+f(X1(i)+.5*h1)
end
a=0.5
b=3.5
fa=(C1+C2*sin(a))/2
fb=(C1+C2*sin(b))/2
simp1=0
simp2=0
for i=2:+2:n1
    simp1=simp1+f(X1(i))
end
for i=3:+2:n1-1
    simp2=simp2+f(X1(i))
end
sim=((b-a)/(3*n1))*(fa+fb+(4*simp1)+(2*simp2))
Errs=abs((Sa-sim)/Sa)
printf("\nSimpson rule. Step=%g.3 puntos per interval. Ss=%f\n",h1,sim)
printf("Relative Error err=%f\n",Errs)
a=0.5
M1=1000
M2=10000
    k=0
    x=[a:0.01:b]
    ymax1=max(f(x))
    ymax1=ymax1+(0.03*ymax1)
    px=zeros(M1)
    py=zeros(M1)
    px=a+rand(M1,1)*(b-a)
    py=rand(M1,1)*ymax1
    for i=1:M1
        if py(i)<f(px(i))
            k=k+1
        end
    end
    Sr1=(b-a)*ymax1
    Sm1=k*Sr1/M1
    k=0
    ymax2=max(f(x))
    ymax2=ymax2+(0.03*ymax2)
    px2=zeros(M2)
    py2=zeros(M2)
    px2=a+rand(M2,1)*(b-a)
    py2=rand(M2,1)*ymax2
    for i=1:M2
        if py2(i)<f(px2(i))
            k=k+1
        end
    end
    Sr2=(b-a)*ymax2
    Sm2=k*Sr2/M2
    Errsm1=abs((Sa-St3)/Sa)
    Errsm2=abs((Sa-St2)/Sa)
    printf("\nMonte Carlo method %g Iteraciones Smc=%f\n",M1,Sm1)
    printf("Relative Error err=%f\n",Errsm1)
    printf("\nMonte Carlo method %g Iteraciones Smc=%f\n",M2,Sm2)
    printf("Relative Error err=%f\n",Errsm2)

