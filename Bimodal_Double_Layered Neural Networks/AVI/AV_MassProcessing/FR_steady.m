function [R] = FR_steady(para, UP_all )
R = bsxfun(@rdivide,para.k2*UP_all(max(para.T_all),1:para.N_total)'.^2,1+para.k*UP_all(para.T_all,1:para.N_total)'.^2);

end

