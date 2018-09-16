function [ext] = Mov_Inp(para,t)
x = para.v.*t/2/pi*para.N_total;
x = x - floor(x/para.N_total)*para.N_total;
y = (1 : para.N_total)';
dxy = bsxfun(@(x,y) (((para.N_total-2*abs(x-y)).*(abs(x-y)>para.N_total/2)+abs(x-y))*2*pi/para.N_total), y, x);
ext = para.A*exp(-dxy.^2/4/para.a^2);
end