function para = SI_para(para,p6)
para.k=p6(1);
para.k2=p6(2);
para.A = p6(3);
para.A2=p6(4);
para.offset = (p6(5)-1)/para.s+1;
para.T_total = p6(6);
%k=0.1%k2=0.1%A=10%A2=10%offset%T_total=200
para.ExtVec_1 = para.A*para.temp_J_1(:,para.offset);
para.ExtVec_2 = para.A2*para.temp_J_2(:,para.offset);
end