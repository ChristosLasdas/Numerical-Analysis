%%
% Solve the 2x2 differential equation system

clear all; clc;


% Insert value of P^2 (par=0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8) 
 par=0.1;

% Insert value of epsilon (as low as possible)
epsilon = 0.0000000000001;

% Insert a for loop in case we want to run all values of P^2 at once !!do
% not forget to uncomment both 'for' and 'end' commands!!
% for par=0.1:0.1:0.5

% Insert the system as d(phi)/d(ksi)=df1(ksi,phi,zeta) and d(zeta)/d(ksi)=df2(ksi,phi,zeta)
df1=@(ksi,phi,zeta) (zeta)
df2=@(ksi,phi,zeta) ((-2*zeta)/(ksi+epsilon)-abs(((phi.^2)-par).^(1.5)))
                
% Insert the initial conditions of phi and zeta
phi_initial=1;
zeta_initial=0;

% Insert step (h), starting and ending point of ksi variable
h=0.1;
ksi_initial=0;
ksi_final=5;

% Call function [xr,yr1,yr2]=Runge_Kutta_4th_order_2_by_2_systems(df1,df2,x_initial,x_final,y1_initial,y2_initial,h)
[ksi_r,phi_r,zeta_r]=Runge_Kutta_4th_order_2_by_2_systems(df1,df2,ksi_initial,ksi_final,phi_initial,zeta_initial,h);

% Make a matrix with the first row being the ksi_r elements
% its second row being the phi_r elements 
A=[reshape(ksi_r,[length(ksi_r),1]) reshape(phi_r,[length(phi_r),1])]

% Save data as 'WD_POL.dat' to a file named 'CoPh_exercise_5'
save('CoPh_exercise_5/WD_POL.dat','A','-ASCII');

%%
% Compute the radius (R) of the White Dwarf


xp=ksi_r;
yp=phi_r;

syms phi_expanded(x)

% Call function p=sp_Newton(xp,yp), while p=phi_expanded being a symbolic
% function for further use
phi_expanded(x)=sp_Newton(xp,yp); 

% temp(x) is a temporary variable (symbolic function) representing the
% function of which we want to find the root of
syms temp(x)
temp(x)=phi_expanded(x)-vpa(sym(sqrt(par)));

% Call solve() command to find the roots
root=vpa(solve(temp(x)==0,sym(x)));

% Save only the real roots of the equation
for i=1:length(root)
    if real(root(i))~=0 && imag(root(i))==0
        y(i)=root(i,1);   
        s=i;
    end  
end

% Specify which root we consider the right one and saving it as R
for i=1:length(y)
    if s==1
        R=vpa(y(s),5)
        break
    else
        if double(y(i))>3 && double(y(i))<7
            if abs(y(i)-y(i+1))>0.01 && abs(y(i)-y(i+1))<0.2
                R=vpa(y(i+1),5)
            else
                R=vpa(y(i),5)
            end
            break
        end
    end
end
 
%%
% Compute the mass (M) of the White Dwarf 


syms dphi(x)
dphi(x)=diff(phi_expanded,x);

% The equation from which we obtain the mass (M)
M=-(double(R)^2)*double(dphi(R))

%%
% Plot phi versus ksi for the specific value of P^2


plot(ksi_r,phi_r)
hold on
 legend({'P^2=0.8'},'Fontsize',9,'Location','southwest','NumColumns',2)

xlabel('î','FontSize',16,'Fontweight','bold')
ylabel('ö(î)','FontSize',16,'Fontweight','bold')

% end