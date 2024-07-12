% Numerical Computation of the Derivative of a function

clear all; clc;
help exercise_4_CoPh;

syms f(x)  % create symbolic function f(x)
syms x     % create symbolic variable x

% f(x): the function of which you want to calculate the approximate derivative 
f(x)=cos(x);  

% x: the point at which you want to calculate the approximate derivative 
x=pi/6;

% h: initial value of h
h=0.2;  

% eps: desirable precision of the approximation
eps=0.00005; 


while h>eps              % main sequence of commands to compute-calculate the approximate 
                         % derivative at a specific point
    df=(f(x+h)-f(x))/h;  % df: approximate derivative
    h=h/2;               % decrease the value h for next loop
end

df=vpa(df,5)   % vpa is used to do calculations with sym variables


% calculate the exact derivative at the same point using diff() function
syms exact_df

exact_df=diff(f)   % present to the user the formula of the exact derivative

exact_derivative=exact_df(x);
exact_derivative=vpa(exact_derivative,5)

% evaluate the relative error using both these different methods of
% evaluating th ederivative (in percentage)
relative_error_percentage=vpa((abs((exact_derivative-df)/exact_derivative))*100,4)