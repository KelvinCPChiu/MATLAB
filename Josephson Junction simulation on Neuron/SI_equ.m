function dy = SI_equ(t,y,para)
dy = zeros(size(y));
dy(1)=y(2);
dy(2)=para.

dy(para.N_total+1:2*para.N_total) = ...
    (1-y(para.N_total+1:2*para.N_total)- para.beeta*rate)/para.Tau_d;
end