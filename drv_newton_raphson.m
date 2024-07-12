% Exercise 1 

% Root of Nonlinear Functions

% Newton Raphson Method

clear all; clc;

% f:      the function we want to find the roots of (in the parenthesis)
% df:     the derivative of function f (in the parenthesis)
% approx: the approximate root of the function
% eps:    the desired precision of the root


% *CAUTION* do not forget ".*", "./", ".^" notation
f=@(x)(x.^2-1.532842466*x + 1.415290958);


% *CAUTION* do not forget ".*", "./", ".^" notation
df=@(x)(2*x-1.532842466);


approx = -3;
eps= 0.0005;

% call newton_raphson function
[root]=newton_raphson(f,df,approx,eps);


% plot the given function

% making x an evenly spaced vector from a to b with n even spaces
% x=linspace(a,b,n)
% n: number of plotting points --> precision of the plot, here 100
x=linspace(-1000,1000,10000);

% plot the function
plot(x,f(x),'LineWidth',1.5) % plot(x,f(x))
hold on

% plot the root of the function
plot(root,f(root),'*r','LineWidth',2)
hold off

title('Newton-Raphson')
xlabel('x')
ylabel('f(x)')
grid on
