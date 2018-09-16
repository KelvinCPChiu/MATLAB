function dy= SI_Equa(t,y,para)
dy = zeros(size(y));

B1=1+para.k/para.a/8/sqrt(2*pi)*sum((y(1:para.N_total)>0).*y(1:para.N_total).^2)*para.L/para.N_total;
B2=1+para.k2*y(para.N_total+1:2*para.N_total).^2;

r1=((y(1:para.N_total).*(y(1:para.N_total)>0)).^2)/B1;  % y=[1:para.N_total,1]' = x'
r2=para.k2*((y(para.N_total+1:2*para.N_total).*(y(para.N_total+1:2*para.N_total)>0)).^2)./B2 ;


dy(1:para.N_total)=-y(1:para.N_total)+...
    para.Jo*r1*para.L/para.N_total+...
    para.ExtVec_1;% V1_positioning
dy(para.N_total+1:2*para.N_total)=-y(para.N_total+1:2*para.N_total)+...
    para.JH*r2*para.L/para.N_total+...
    para.ExtVec_2;% From S1 to 
end

