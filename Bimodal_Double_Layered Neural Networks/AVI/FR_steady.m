function [R] = FR_steady(para, UP_all )
R = para.k2*UP_all(:,1:para.N_total)'.^2./(1+para.k*UP_all(:,1:para.N_total)'.^2);
end

