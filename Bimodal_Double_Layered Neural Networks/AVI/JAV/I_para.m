function para = I_para()
para.N_total = 512;
para.a =32/180*pi/2; %V1
para.a2=32/180*pi/2; %S1
para.Tau =1;
para.L = 2*pi;
para.s=0.25;
%%%%%%%%%%%%%%%%%%%%%%%%%
para.JH=Sum_Hebbs(para.N_total,para.a2,para.s)/sqrt(2*pi)/para.a2;
para.Jo = Jo(para.N_total,para.a); 
para.temp_J_1=E_Input(para.N_total,para.a,para.s);
para.temp_J_2=E_Input(para.N_total,para.a2,para.s);
end