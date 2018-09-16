function para = SI_para(p6)
para.N_total = 512;
para.a =32/180*pi/2; %v1
para.a2=32/180*pi/2; %a1
para.a3=32/180*pi/2;  %between a-v
para.Tau =1;
para.L = 2*pi;
para.s=0.25;
load ('JAV_M');
para.JAV=JAV/sqrt(2*pi)/para.a3;
%para.folder = 'E:\data\FCN2012_other\';
%%%%%%%%%%%%%%%%%%%%%%%%
para.k=p6(1);
para.k2=p6(2);
para.k3=p6(3);
para.A = p6(4);
para.A2=p6(5);
para.JHC = p6(6);
para.T_total = p6(7);
para.t=p6(8);

%Temp=p6(7);

%if isequal(Temp, para.T_total)
%    para.T=para.T_total;
%else
%    para.T=Temp;
%end

%%%%%%%%%%%%%%%%%%%%%%%%%
para.JH=para.JHC*Sum_Hebbs(para.N_total,para.a2,para.s)/sqrt(2*pi)/para.a2;
para.Jo = Jo(para.N_total,para.a); 
para.temp_J_1=1/sqrt(2*pi)/para.a*E_Input(para.N_total,para.a,para.s);
para.temp_J_2=1/sqrt(2*pi)/para.a2*E_Input(para.N_total,para.a2,para.s);
% para.ini_array = [zeros(1,para.N_total),ones(1,para.N_total)];
para.offset =1021; %round((para.N_total-1/para.s+1)/2);
%temp_J = Jo(para.N_total,para.a);
para.ExtVec_1 = para.A*(para.temp_J_1(:,para.offset));
para.ExtVec_2 = para.A2*(para.temp_J_2(:,para.offset-1000));
%para.file_name = sprintf('SI_k%0.4f_Jff%0.4f_Jfb%0.4f_A%0.3f_a%0.3f_N%d',para.k,para.Jff,para.Jfb,para.A,para.a,para.N_total);

end