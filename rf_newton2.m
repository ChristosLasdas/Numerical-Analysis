%  Page 47 from 'Numerical Analysis' book

%  The function rf_newton2, that follows, has inputs
%   fs = a string of the fuction, for example ‘3*x^3+2*sin(x)–5’
%   xp = the initial approximation of the root
%   eps = the desired precision

%  The derivative of the function is "automatically" computed, using MATLAB's code 

%  while its outputs are
%   root = the root that's been found
%   res = a string that informs us if everything went okay and the root's
%         been found or if there was a problem

function[root,steps]=rf_newton2(fs,xp,eps)
f=vectorize(inline(fs));
df=vectorize(inline(diff(str2sym(fs),sym('x'))));
max_steps=100000;
step=1;
x=xp-f(xp)/df(xp);

while (abs(x-xp)>eps) && (step<max_steps)
    xp=x;
    x=xp-f(xp)/df(xp);
    step=step+1;
end

if (step<max_steps) && (~isnan(x))
    root=x;
    res='everything went okay';
    step
else
    root=x;
    res='unable to evaluate the root';
    step
end
end