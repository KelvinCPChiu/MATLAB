function [val,ist,dirc] = evcs(t,y,para)
ist = 0;
dirc = 0;
dy = deri_y(t,y,para);
val = dy(round(para.N_total*0.4));
end

function dy = deri_y(t,y,para)
if size(y,2) == 1
%newk  = para.k/(8*para.a*sqrt(2*pi));
dy = zeros(size(y));
B1=1+para.k/para.a/8/sqrt(2*pi)*sum(y(1:para.N_total).^2)*para.L/para.N_total;
B2=1+para.k2*y(para.N_total+1:2*para.N_total).^2;
Bk = 1+para.k3/para.a/8/sqrt(2*pi)*sum(y(1:para.N_total).^2)*para.L/para.N_total;

r1=((y(1:para.N_total).*(y(1:para.N_total)>0)).^2)/B1;  % y=[1:para.N_total,1]' = x'
r2=para.k2*(y(para.N_total+1:2*para.N_total).^2).*(y(para.N_total+1:2*para.N_total)>0)./B2 ;
r3 = y(2*para.N_total+1:3*para.N_total).*(y(1:para.N_total)>0).*y(1:para.N_total).^2./Bk;

dy(1:para.N_total)= -y(1:para.N_total)+...
    para.k3*para.JAV*r2*para.L/para.N_total+...
    para.Jo*r1*para.L/para.N_total+...
    para.ExtVec_1*(t<=para.t);% V1_positioning
dy(para.N_total+1:2*para.N_total)=-y(para.N_total+1:2*para.N_total)+...
    para.JH*r2*para.L/para.N_total+...
    para.ExtVec_2*(t<=para.t);%Mov_Inp(para,t);% From S1 to 

dy(2*para.N_total+1:3*para.N_total) =(1-y(2*para.N_total+1:3*para.N_total)- para.beeta*r3)/para.Tau_d;
else
    dy = zeros(size(y));
    for iy = 1 : size(y,2)
        dy(:,iy) = deri_y(t,y(:,iy),para);
    end
end
end