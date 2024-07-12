function p=sp_Newton(xp,yp)

N=length(xp);
M=length(yp);
if N~=M
    error('myApp:argChk', 'The matrices are not of the same dimensions')
end

syms x

for i=1:N
    dy(i,1)=yp(i);
end

for j=2:N
    for i=1:N-j+1
        dy(i,j)=(dy(i+1,j-1)-dy(i,j-1))/(xp(i+j-1)-xp(i));
    end
end

L=1;
p=dy(1,1);
for j=2:N
    L=L*(x-xp(j-1));
    p=p+dy(1,j)*L;
end

p=expand(p);