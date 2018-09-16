function [ J ] = E_Input(N_total,a,s)
Y=cell((N_total-1)/s+1,1);
for p=1:s:N_total
        T=Jx(N_total,p,a);
        Y(((p-1)/s)+1,1)={T};
end
J=cell2mat(Y)';
end
function Ji = Jx(N_total,p,a)
x = 1 : N_total;
dxy = bsxfun(@(x,p) (((N_total-2*abs(x-p)).*(abs(x-p)>N_total/2)+abs(x-p))*2*pi/N_total), x,p);
Ji = 1/sqrt(2*pi)/a*exp(-dxy.^2/4/a^2);
end

