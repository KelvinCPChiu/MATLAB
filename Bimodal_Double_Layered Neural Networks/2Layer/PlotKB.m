function [ PositionD ] = PlotKB(p) %pset[A Jff Time];
ini=[];
PositionD=zeros(1/0.05,1/0.05);
T_test=round(0.95*(p(3)));

for k=0.05:0.05:1
    for Jfb=0.05:0.05:1
    p4=[k,p(1),p(2),-Jfb,p(3),p(4)];
    [para,T_all,UP_all,~,~,~] = dynaE(p4,ini);
    UP_all=UP_all';
    Y_all=(T_all-T_test+1);
    for ts=T_test:T_all
    [~,Y_1]=max(UP_all(ts,1:para.N_total));
    [~,Y_2]=max(UP_all(ts,para.N_total+1:2*para.N_total));
    Y_2 =Y_2-para.N_total;
    Y_all(ts-T_test+1)=((Y_2-Y_1)*2*pi/N_total);
    Y_average=average(Y_all);
    PositionD(20*k,20*Jfb)=Y_average;
    end
    end
end
pcolor(0.05:0.05:1,0.05:0.05:1,PositionD);
shading flat;
end

