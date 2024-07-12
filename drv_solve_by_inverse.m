% Solutions to Linear Systems of Equations

clear all; clc;

equations = input('How many equations are there? ') % input the number of equations
unknowns=input('How many unknowns are there? ')     % input the number of unknowns, i.e x1, x2,...

if (unknowns>equations)
    disp('The system cannot be solved ') % there are more unknowns than the system's equations
elseif (unknowns<=equations)
    A=input('What is the Matrix of the unknowns factors (in [] with ";" to indicate next row)?  ')
%   i.e
%   A = [ 2 -1  3  4;1 -2  2  1;3  3  2  4;-2 -3  4  6];
    B=input('What are the constants (enter them as a row vector)? ')
%   i.e
%   B = [2;-13;30;-17];

    [NA,MA]=size(A);
    [NB,MB]=size(B);
    if (NA~=NB) || (MA>equations) % conditions that indicate that something is 
                                  % wrong with what the user
                                  % entered: #equations are not equal
                                  % to #constants, or  unknowns>equations                        
        disp('You have entered something wrong, please run the programm again ')
    else
        [x]=solve_by_inverse(A,B); % call solve_by_inverse function
    end
end



% quicker-direct code, without user inputing in the command window

% clear all; clc;

% A = [ 2 -1  3  4;1 -2  2  1;3  3  2  4;-2 -3  4  6];

% B = [2;-13;30;-17];

% [X]=solve_by_inverse(A,B);
