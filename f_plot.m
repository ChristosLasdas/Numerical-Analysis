function [p]=f_plot(f)

f=vectorize(inline(f)); % vectorize function f to be able to plot it

% making x an evenly spaced vector from a to b with n even spaces
% x=linspace(a,b,n)
% n: number of plotting points --> precision of the plot, here 100
 x=linspace(-10,10,100);
 
% plot function f
figure(1)
p=plot(x,f(x),'LineWidth',1.5);
 
title('Function')
xlabel('x')
ylabel('f(x)')
grid on
end