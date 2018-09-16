%%
%Parameter Setting
%%
function para = SI_para(p5) %p5=[Time Bias Current]
para.T_total=p5(1);%Simulation Duration
para.I_in=p5(3);
para.I_b=p5(2);
para.lambda=0.1;
para.Lambda_s=0.5;
para.Lambda_p=0.5;
para.Lambda_c=0;
para.Gamma=1;
para.eta=1;%para.Ac/para.Ap;
end