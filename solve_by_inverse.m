function [X]=solve_by_inverse(A,B)

if det(A)==0                                 % check if the inverse of matrix, A, of the unknown
                                             % factors exist for the method to be deployed
    disp('Transpose matrix does not exist ')
else
    A_transpose = inv(A);  % compute the inverse of matrix, A
end

X = A_transpose*B  % evaluate the solutions, X, of the system 
end