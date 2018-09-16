%%
%Start simulation by inputing
% [T,Y,TE,YE] = SI_dyna(Time,[]) OR [T,Y,~,~]=SI_dyna([Times bias current],[]) ,for
% example [T,Y,~,~]=SI_dyna([200 -2],[]);
% Then, type plot(T,Y)
%Noticed, if a larger scale network is going to use, the governing equation should be
%coverted into matrix form
%Vp1=y(5), Vc1=y(6), Vout=y(3), Vp2=y(11) , Vc2=y(12), i12=y(4)
%Noticed that the extra term metioned as back action in page 5 is not included
%%
function [T_all,UP_all,TE,YE] = SI_dyna(p5,ini)
para = SI_para(p5);
options = odeset('RelTol',1e-9,'Events',@(t,y) evcs(t,y,para));%set the error tolerance
if size(ini,1) == 0
    ini =[0.05 0.21 0.05 0.21 0 0 0 0 0 0 0 0];%initial Condition , according to Fig.2 in the paper (First 4 for neuron 1, second 4 for connection, last 4 for second neuron)
end
[T_all,UP_all,TE,YE] = ode45(@(t,y) SI_equ(t,y,para),[0 para.T_total],ini, options);%call out the ode solver

end