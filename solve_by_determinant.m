function [x]=solve_by_determinant(A,B)

dA=det(A);       % evaluate the determinant of the matrix, A, of the unknown factors
[N,M]=size(A);
[NB,MB]=size(B);
C=A;            % saving matrix A to a matrix C, 
                % in order to address its values later on, as matrix
                % A will be changing
 for i=1:N
     for j=1:M
         A(j,i)=B(j,MB); % contruct the matrix with the column vector of 
                         % the constants, B, replacing each time one of the
                         % columns of the matrix of the unknown factors,A
     end
     
     d(i)=det(A);  % compute the determinants Dx, Dy, etc.
     
     A=C;
 end

infinite=0;       % enter a variable to check whether the system has infinite or no solutions
no_solutions=0;
if (dA==0)
    if (d==0)
        infinite = infinite+1;
    elseif (d~=0)
        no_solutions=no_solutions+1; 
    end
elseif (dA~=0)
        x(i)=d(i)./dA;  
end
   
if (infinite==M)
    x=NaN;
    disp('The system has infinite solutions ')
    
elseif (no_solutions>=1)
    x=NaN;
    disp('The sytem has no solutions ')
    
else
    for (i=1:M)
        x(i)=d(i)./dA;  % evalutate the solutions of the system
    end
       
    x=x(:)   
end
end