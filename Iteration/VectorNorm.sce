clc
clear
//By Gianfmg
disp("Vector Norms")

//Vectors
x1=[2,0,-10,4,5,-10]
x2=[-6,-4,-9,-7,-6,-8]

dif=x2-x1
n1=(x1(1)^2+x1(2)^2+x1(3)^2+x1(4)^2+x1(5)^2+x1(6)^2)^(1/2)
norm1=abs(dif(1))+abs(dif(2))+abs(dif(3))+abs(dif(4))+abs(dif(5))+abs(dif(6))
norm2=(dif(1)^2+dif(2)^2+dif(3)^2+dif(4)^2+dif(5)^2+dif(6)^2)^(1/2)
norm3=(abs(dif(1))^3+abs(dif(2))^3+abs(dif(3))^3+abs(dif(4))^3+abs(dif(5))^3+abs(dif(6))^3)^(1/3)
normmax=max(abs(dif))
erel=(norm2)/(n1)




disp(x1',"x1=")
disp(x2',"x2=")
disp(dif',"x2-x1=")
printf("Distancia= %f\n",norm2)
printf("Norm 1= %f\n",norm1)
printf("Norm 2= %f\n",norm2)
printf("Norm 3= %f\n",norm3)
printf("Max Norm= %f\n",normmax)
printf("Absolute error= %f\n",norm2)
printf("Relative error= %f\n",erel)

