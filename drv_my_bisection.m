% Exercise 1 

% Root of Nonlinear Functions

% Bisection Method

clear all; clc;

f=input('Give the function as a string: ')  % asking the user to input the function

% plot the given function in order to choose the right starting and ending
% point by calling f_plot function
[p]=f_plot(f);

a=input('What is the starting point of the root evaluation? ') % asking the user to input 
                                                               % the starting point
                                                               
b=input('What is the ending point of the root evaluation? ') % asking the user to input 
                                                             % the ending point
                                                               
eps=input('What is the desired precision of the root? ') % asking the user to input 
                                                         % the desired precision

% call  my_bisection function
[root,f]=my_bisection(f,a,b,eps);


% plot the given function and its root

% making x an evenly spaced vector from a to b with n even spaces
% x=linspace(a,b,n)
% n: number of plotting points --> precision of the plot, here 100
x=linspace(-10,10,100);

% plot the function
figure(2)
plot(x,f(x),'LineWidth',1.5) % plot(x,f(x))
hold on

% plot the root of the function
plot(root,f(root),'*r','LineWidth',2)
hold off

title('Bisection')
xlabel('x')
ylabel('f(x)')
grid on