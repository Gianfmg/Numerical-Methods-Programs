clear
clc
//By Gianfmg
disp("Nelder-Mead method for finding minimum value")  


printf("Function 2cos(x)+2sin(y)\n")
printf("Between x=[0,8] y y=[0,8] function has a minimum z=-4 near [3.14, 4.75]\n")
printf("We pick 3 points from initial simplex\n")

deff('z=f(x,y)','z=2*cos(x)+2*sin(y)')
x=[0:0.1:8]
y=[0:0.1:8]
n=length(x)
for i=1:n
    for i1=1:n
        z(i,i1)=f(x(i),y(i1))
    end
end
plot3d(x,y,z)
function z=g(Z)
    z=cos(Z(1))+sin(Z(2))
endfunction

function [V0,y0,dV,dy]=nelder(f,V,min1,max1,epsilon,show)

if argn(2)==5, show=0; end
[mm n]=size(V);

for j=1:n+1
 Z=V(j,1:n);
 Y(j)=f(Z);
end
[mm lo]=min(Y);
[mm hi]=max(Y);
li=hi;
ho=lo;
for j=1:n+1
 if(j<>lo & j<>hi & Y(j)<=Y(li))
  li=j;
 end
 if(j<>hi & j<>lo & Y(j)>=Y(ho))
 ho=j;
 end
end
cnt=0;

//Nelder-Mead
while(Y(hi)>Y(lo)+epsilon & cnt<max1) | cnt<min1
 S=zeros(1,n);
 for j=1:n+1
  S=S+V(j,1:n);
 end
 M=(S-V(hi,1:n))/n;
 R=2*M-V(hi,1:n);
 yR=f(R);
 if(yR<Y(ho))
  if(Y(li)<yR)
   V(hi,1:n)=R;
   Y(hi)=yR;
  else
   E=2*R-M;
   yE=f(E);
  if(yE<Y(li))
   V(hi,1:n)=E;
   Y(hi)=yE;
  else
   V(hi,1:n)=R;
   Y(hi)=yR;
  end
 end
 else
 if(yR<Y(hi))
  V(hi,1:n)=R;
  Y(hi)=yR;
 end
 C=(V(hi,1:n)+M)/2;
 yC=f(C);
 C2=(M+R)/2;
 yC2=f(C2);
 if(yC2<yC)
  C=C2;
  yC=yC2;
 end
 if(yC<Y(hi))
  V(hi,1:n)=C;
  Y(hi)=yC;
 else
  for j=1:n+1
   if(j<>lo)
    V(j,1:n)=(V(j,1:n)+V(lo,1:n))/2;
    Z=V(j,1:n);
    Y(j)=f(Z);
   end
  end
 end
end
[mm lo]=min(Y);
[mm hi]=max(Y);
li=hi;
ho=lo;
for j=1:n+1
 if(j<>lo & j<>hi & Y(j)<=Y(li))
  li=j;
 end
 if(j<>hi & j<>lo & Y(j)>=Y(ho))
  ho=j;
 end
end
cnt=cnt+1;
P(cnt,:)=V(lo,:);
Q(cnt)=Y(lo);
end
//Nelder-Mead

//Simplex
snorm=0;
for j=1:n+1
 s=norm(V(j)-V(lo));
 if(s>=snorm)
  snorm=s;
 end
end
Q=Q';
V0=V(lo,1:n);
y0=Y(lo);
dV=snorm;
dy=abs(Y(hi)-Y(lo));
if (show==1)
disp(P);
disp(Q);
end
endfunction

P1=[8.800000, 11.00000];P2=[10.000000, 10.000000];P3=[9.500000, 11.20000]
V=[P1;P2;P3]
min1=2
max1=200
epsilon=1d-7
show=0

[V0,y0,dV,dy]=nelder(g,V,min1,max1,epsilon,0)
disp(V0,"V0=")
disp(y0,"y0=")

printf("P1=(8.800000, 11.00000)\n")
printf("P2=(10.000000, 10.000000)\n")
printf("P3=(9.500000, 11.20000)\n\n")

printf("Results:\n")
printf("Coordinates for minimum vertex V0={%f,%f}  \n",V0(1),V0(2))
printf("Function minimum f(V0) es y0=%f\n",y0)
printf("Erros is err=%f\n", dy)
