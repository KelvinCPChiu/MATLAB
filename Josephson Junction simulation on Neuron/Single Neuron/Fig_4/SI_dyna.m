
function [T_all,UP_all] = SI_dyna(p5,ini)
para = SI_para(p5);
if size(ini,1) == 0
    ini =[0.05 0.21 0.05 0.21];
end
[T_all,UP_all] = ode45(@(t,y) SI_equ(t,y,para),[0 para.T_total],ini);
end