%%
%Parameter Setting
%%
function para = SI_para(p5)
para.T_total=p5(1);
para.I_in=0.19;
para.I_b=p5(2);
para.I_slope=p5(3);
para.lambda=0.1;
para.Lambda_s=0.5;
para.Lambda_p=0.5;
para.Lambda_c=0;
para.Gamma=0.9;
para.eta=1;
end