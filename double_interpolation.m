function [g]=double_interpolation(x_grid,y_grid,A,x,y)

[nx,mx]=size(x_grid);
[ny,my]=size(y_grid);
for j=1:(mx-1)                             % locate 'left' x and 'right' x between which is our
    if (x<x_grid(1,j+1) && x>x_grid(1,j))  % point of interest x
        x0=x_grid(1,j);              % 'left' x
        x1=x_grid(1,j+1);            % 'right' x
        column_of_A=j;               % saving number of column of 'left' x for further use
    end
end

for i=1:(ny-1)                             % locate 'left' y and 'right' y between which is our                                     
    if (y<y_grid(i+1,1) && y>y_grid(i,1))  % point of interest
        y0=y_grid(i,1);              % 'left' y
        y1=y_grid(i+1,1);            % 'right' y       
        row_of_A=i;              % saving number of row of 'left' y for further manipulaton
    end
end


% create a 2x2 matrix consisting of the elements of matrix A at 'left' and
% 'right' x and y respectively such so  X(1,1)=f(x0,y0), X(1,2)=f(x1,y0)
%                                       X(2,1)=f(x0,y1), X(2,2)=f(x1,y1)
X=[A((row_of_A),(column_of_A)),A((row_of_A),(column_of_A)+1);
    A((row_of_A)+1,(column_of_A)),A((row_of_A)+1,(column_of_A)+1)];

k=(x-x0)/(x1-x0);      % evaluate value of k index at the point of linear interpolation
l=(y-y0)/(y1-y0);      % evaluate value of l index at the point of linear interpolation

g1= X(1,1)+k*(X(1,2)-X(1,1));  % deploy two linear interpolations with respect to x and
g2=X(2,1)+k*(X(2,2)-X(2,1));   % one with respect to y and
g=g1+l*(g2-g1)                % compute the final result
end
