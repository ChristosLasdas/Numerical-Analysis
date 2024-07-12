function [xr,yr1,yr2]=Runge_Kutta_4th_order_2_by_2_systems(df1,df2,x_initial,x_final,y1_initial,y2_initial,h)

i=1;
xr(1)=x_initial;
yr1(1)=y1_initial;
yr2(1)=y2_initial;
x=x_initial;
y1=y1_initial;
y2=y2_initial;

while ((x_final-x)/h>0) 
    K1_1=df1(x,y1,y2);                         % Calculate the Runge-Kutta 
    K2_1=df1(x+h/2,y1+K1_1*h/2,y2+K1_1*h/2);   % constants for df1 function
    K3_1=df1(x+h/2,y1+K2_1*h/2,y2+K2_1*h/2);
    K4_1=df1(x+h,y1+K3_1*h,y2+K3_1*h);
    y1=y1+((K1_1+2*K2_1+2*K3_1+K4_1)/6)*h;     % solution of the first ODE
    
    
    K1_2=df2(x,y1,y2);                         % Calculate the Runge-Kutta
    K2_2=df2(x+h/2,y1+K1_2*h/2,y2+K1_2*h/2);   % constants for df2 function
    K3_2=df2(x+h/2,y1+K2_2*h/2,y2+K2_2*h/2);
    K4_2=df2(x+h,y1+K3_2*h,y2+K3_2*h);
    y2=y2+((K1_2+2*K2_2+2*K3_2+K4_2)/6)*h;     % solution of the second ODE
    
    x=x+h;
    i=i+1;
    xr(i)=x;
    yr1(i)=y1;
    yr2(i)=y2; 
end