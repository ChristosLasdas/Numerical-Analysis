function [root,f]=my_bisection(f,a,b,eps)

f=vectorize(inline(f)); % vectorize function f to be able to plot it

%insert a variable to count the times Bisection Method is used
steps = 1;

if (f(a)*f(b)<0)
    m=(a+b)/2;
    
    while (f(m)~=0) && (steps<100) && (b-a>eps)
        if (f(a)*f(m)<0)
            b=m;
        else
            a=m;
        end
        m=(a+b)/2;
        steps=steps+1;
    end
    root = m;
    
    disp('The root of the function is: ')
    disp(root)
   
    disp('The number of times Bisection Method was used is: ')
    disp(steps)
   
elseif (f(a)*f(b)>0)
    disp('Bolzanos Theorem does not apply ')
end
end