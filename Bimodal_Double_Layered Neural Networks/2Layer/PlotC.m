function [ y ] = PlotC(k,A,Jff,Jfb,Time,ExtTime,Y)
p6=[k A Jff Jfb Time ExtTime];
ini=[];
[para,T_all,UP_all,intervs,TE,YE] = dynaE(p6,ini);
if isequal(Y,1)
    pcolor(T_all,1:2*para.N_total,UP_all');
else
    R=FR(para,UP_all);
    pcolor(T_all,1:2*para.N_total,R);
end
shading flat;

end

