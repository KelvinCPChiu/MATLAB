function para = SI_para(p6)
para.N_total = 512;
para.a =28/180*pi/2;
para.Tau =1;
para.L = 2*pi;
para.b1=28/180*pi/2;
para.b2=28/180*pi/2;
para.folder = 'E:\data\FCN2012_other\';

%%%%%%%%%%%%%%%%%%%%%%%%
para.k = p6(1);
para.A = p6(2);
para.Jff = p6(3);
para.Jfb = p6(4);
para.T_total = p6(5);
Temp=p6(6);

if isequal(Temp, para.T_total)
    para.T=para.T_total;
else
    para.T=Temp;
end

%%%%%%%%%%%%%%%%%%%%%%%%%

para.Jo = Jo(para.N_total,para.a); 
para.Jff = para.Jff*Jo(para.N_total,para.b1);
para.Jfb = para.Jfb*Jo(para.N_total,para.b2);

% para.ini_array = [zeros(1,para.N_total),ones(1,para.N_total)];
para.offset = para.N_total/2;
temp_J = Jo(para.N_total,para.a);
para.ExtVec = para.A*(temp_J(:,para.offset)); % A' is modified, A'=pJoA
%para.file_name = sprintf('SI_k%0.4f_Jff%0.4f_Jfb%0.4f_A%0.3f_a%0.3f_N%d',para.k,para.Jff,para.Jfb,para.A,para.a,para.N_total);
end