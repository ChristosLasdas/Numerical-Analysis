% 2D Linear Interpolation

clear all; clc;

x_grid=[1,1.1,1.2,1.3,1.4] % row vector of x values

y_grid=[2;2.2;2.4;2.6;2.8] % column vector of y values

A=[5.3069 5.4115 5.5245 5.6445 5.7704 ;    % data table handled as a matrix!!
   6.2515 6.3762 6.5092 6.6492 6.7951 ;    % each element of the matrix corresponds to a
   7.2845 7.4292 7.5822 7.7422 7.9081 ;    % specific (x,y) point (as if x_grid and y_grid
   8.4045 8.5692 8.7422 8.9221 9.1080 ;    % are overlayed to matrix A)
   9.6104 9.7951 9.9881 10.1880 10.3939] 

x=1.13;    % insert the point (x,y) we want to find the value of
y=2.44;

[g]=double_interpolation(x_grid,y_grid,A,x,y);

% give the exact expression of the function 
f = inline('a.*b+b.^2-log(a.*b)','a','b')

f_exact=f(x,y)
% compute the relative error when using the linear interpolation method
relative_error=abs((f(x,y)-g)/f(x,y))*100