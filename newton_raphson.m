function [root]=newton_raphson(f,df,approx,eps)

% insert a variable to count the times Newton-Raphson Method is used
steps=1;

x=approx-f(approx)./df(approx);  % Note the "./" notation

while (abs(x-approx)>eps) & (steps<10000)  
    approx=x;
    x=approx-f(approx)/df(approx);
    steps=steps+1;
end

if (abs(x-approx)<eps) & (steps<10000)
    root=x;
    disp('The root is: ')
    disp(root)
    
    disp('The number of times Newton-Raphson Method is used ') 
    disp(steps)
else 
    disp('Could not find the root');
    root=NaN;
    % ignore the error messages: errors because 
    % when the root can't be found, 
    % we have't assigned root to something 
    % and we don't want our plots to be messed up 
end
end