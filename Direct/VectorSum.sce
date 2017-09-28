clc
clear
//By Gianfmg
disp("Vector Sum")

//Change X for desired vector
X=[2,0,-10,4,5,-10,-6]
 function Y=MySum(X)
     n=length (X)
     Y=X(1)
     for i=2:n
         Y=Y+X(i)
     end
 endfunction
 
 
 Y=MySum(X)
 
 printf("The sum of the vector elements is Y=%f\n",Y)
 
 function [MaxVal, MaxInd]=MyMax(X)
     n=length (X)
     MaxVal=-1000000000
     for i=1:n
     
    if X(i)>MaxVal then 
     MaxVal=X(i)
     MaxInd=i
 end
end
endfunction

[MaxVal, MaxInd]=MyMax(X)
printf ("Maximum value=%d\nPosition=%d",MaxVal,MaxInd)



