%%
%the governing equation should change evcs if changed this part
%%
function dy = SI_equ(t,y,para) 
dy = zeros(size(y));
%First Neuron
dy([5 6])=-para.Gamma*y([5 6])-sin(y([1 2]))+...
    para.Meta*(-para.lambda*(y([2 1])+y([1 2]))+(para.MI.*[(t<50)*(t>250),1;(t>50)*(t<250),1])*para.TI);
%For second Neuron
dy([11 12])=-para.Gamma*y([11 12])-sin(y([9 10]))+...
    para.Meta*(-para.lambda_p2*(y([10 9])+y([9 10]))+para.MI2*[y(4);para.I_b2]);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 %For the second order derivative
dy(1:3)=y(5:7); 
dy([9 10])=y([11 12]);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Neuron Connection 
dy(7)=(para.Omega_0)^2*(-para.Q/para.Omega_0*y(7)-y(3)+...
    y(5)-para.Q*para.Omega_0*para.Lambda_syn/para.lambda*y(4)-para.Lambda_syn/para.lambda*...
    para.lambda/para.Lambda_syn/(1-para.Lambda_syn)*(-para.r_12/para.Gamma*y(4)+y(3)-para.Lambda_syn*(y(11)+y(12))));
dy(4)=para.lambda/para.Lambda_syn/(1-para.Lambda_syn)*(-para.r_12/para.Gamma*y(4)+y(3)-para.Lambda_syn*(y(11)+y(12)));
end