function para = I_para()
para.t1=2;
para.t2=5;
para.N_total = 512;
para.a =32/180*pi/2; %v1
para.a2=32/180*pi/2; %a1
para.a3=32/180*pi/2;  %between a-v
para.Tau =1;
para.L = 2*pi;
para.s=0.25;
load ('JAV_M');
para.JAV=JAV/sqrt(2*pi)/para.a3;
%%%%%%%%%%%%%%%%%%%%%%%%
para.JH=Sum_Hebbs(para.N_total,para.a2,para.s)/sqrt(2*pi)/para.a2;
para.Jo = Jo(para.N_total,para.a); 
para.temp_J_1=1/sqrt(2*pi)/para.a*E_Input(para.N_total,para.a,para.s);
para.temp_J_2=1/sqrt(2*pi)/para.a2*E_Input(para.N_total,para.a2,para.s);
para.offset =1421;
%%para.ExtVec_2=para.temp_J_2(:,para.offset);
end