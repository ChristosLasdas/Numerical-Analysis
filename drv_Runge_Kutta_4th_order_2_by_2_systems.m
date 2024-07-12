% Solve a system of first order ODE's with 4th order Runge-Kutta

clear all; clc;

disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
disp('This program solves systems of first order ODEs with the 4th order Runge-Kutta method')
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')


% Insert the system as y1'=df1(x,y1,y2) and y2'=df2(x,y1,y2)
df1=@(x,y1,y2) (3*y1+y2)
df2=@(x,y1,y2) (y1+3*y2)

%  Insert the initial conditions
y1_initial=0;
y2_initial=0;

% Insert step (h), starting and ending point of x variable
h=0.2;
x_initial=0;
x_final=1;


[xr,yr1,yr2]=Runge_Kutta_4th_order_2_by_2_systems(df1,df2,x_initial,x_final,y1_initial,y2_initial,h);

A=[xr;yr1;yr2]

plot(xr,yr1,xr,yr2)
title('R-K 4th order - 2x2 system','FontSize',13,'Fontweight','bold')
legend({'y1(R-K)(x)','y2(R-K)(x)'},'Location','southeast')