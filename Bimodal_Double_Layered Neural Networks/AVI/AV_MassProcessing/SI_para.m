function para = SI_para(para,p6)
para.k=p6(1);
para.k2=p6(2);
para.k3=p6(3);
para.A = p6(4);
para.A2=p6(5);
para.JHC = p6(6);
para.T_total = p6(7);
para.i=(p6(8)-1)/para.s+1;
para.JH=para.JHC*para.JH;
para.ExtVec_1 = para.A*(para.temp_J_1(:,para.offset));
para.ExtVec_2 = para.A2*(para.temp_J_2(:,para.i));
end