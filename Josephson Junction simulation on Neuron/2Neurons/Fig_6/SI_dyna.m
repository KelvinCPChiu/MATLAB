
function [T_all,UP_all] = SI_dyna(p5,ini)
para = SI_para(p5);
if size(ini,1) == 0
   ini =[0 0 0 0 0 0 0 0 0 0 0 0];%initial Condition , according to Fig.2 in the paper (First 4 for neuron 1, second 4 for connection, last 4 for second neuron)
end
[T_all,UP_all] = ode45(@(t,y) SI_equ(t,y,para),[0 para.T_total],ini);%call out the ode solver

end