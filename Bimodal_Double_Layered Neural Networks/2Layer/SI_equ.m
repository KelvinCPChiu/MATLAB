function dy = SI_equ(t,y,para)
dy = zeros(size(y));

B1 = 1+para.k/para.a/8/sqrt(2*pi)*sum (y(1:para.N_total).^2)*para.L/para.N_total;
B2 = 1+para.k/para.a/8/sqrt(2*pi)*sum (y(para.N_total+1:2*para.N_total).^2)*para.L/para.N_total;

r1=((y(1:para.N_total).*(y(1:para.N_total)>0)).^2)/B1;  % y=[1:para.N_total]' = x'
r2=((y(para.N_total+1:2*para.N_total).*(y(para.N_total+1:2*para.N_total)>0)).^2)/B2 ;

dy(1:para.N_total)=(-y(1:para.N_total)+...
     para.ExtVec*(t<=para.T)+...
     para.Jo*r1*para.L/para.N_total+...
     para.Jfb*r2*para.L/para.N_total)/para.Tau;

dy(para.N_total+1:2*para.N_total)=(-y(para.N_total+1:2*para.N_total)+...
    para.Jo*r2*para.L/para.N_total+...
    para.Jff*r1*para.L/para.N_total)/para.Tau;


end
