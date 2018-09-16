function r_all = FR(para,UP_all)
r_all = bsxfun(@rdivide,UP_all(:,1:2*para.N_total)'.^2,1+para.k/(8*para.a*sqrt(2*pi))*sum((UP_all(:,1:2*para.N_total)').^2)*para.L/para.N_total);
end