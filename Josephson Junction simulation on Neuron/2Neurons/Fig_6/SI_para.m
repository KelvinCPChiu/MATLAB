%%
%Parameter Struct
%%
function para = SI_para(p5) %p5=[Time Bias Current]
para.T_total=p5(1);%Simulation Duration
para.I_in=0.54;
%%%%%%%%%%%%%%%%5
para.I_b1=p5(2);
para.I_b2=p5(3);
%%%%%%%%%%%%%%%%%
para.lambda=0.1;
para.lambda_p2=0.1;
%%%%%%%%%%%%%%%%
para.Lambda_s=0.5;
para.Lambda_s2=0.5;
para.Lambda_p=0.5;
para.Lambda_p2=0.5;
para.Lambda_c=0;
para.Lambda_c_2=0;
%%%%%%%%%%%%%%%%
para.Gamma=2;
para.eta=1;%para.Ac/para.Ap;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
para.MI=[para.Lambda_s (1-para.Lambda_p);para.Lambda_s -para.Lambda_p]; %Current Coefficient Matrix
para.MI2=[para.Lambda_s2 (1-para.Lambda_p2);para.Lambda_s2 -para.Lambda_p2];
para.TI=[para.I_in ; para.I_b1]; %First Neuron Current Column
para.TI2=[0 ; para.I_b2]; %Second Neuron Current Column
para.Meta=[1 0;0 1/para.eta]; 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Two Neurons Connectting Parameter
para.Lambda_syn=0.3;
para.Q=0.05;
para.Omega_0=1;
para.r_12=1.4;
end