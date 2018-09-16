function J = Jo(N_total,a)
x = 1 : N_total;
y=x';
dxy = bsxfun(@(x,y) (((N_total-2*abs(x-y)).*(abs(x-y)>N_total/2)+abs(x-y))*2*pi/N_total), y, x);
J = 1/sqrt(2*pi)/a*exp(-dxy.^2/4/a^2);
end