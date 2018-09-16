function [ JAV ] = JAV() %X=p6
%% JAV is used for generatation of AV coupling :JAV()

para=I_para();
V=cell((para.N_total-1)/para.s+1,1);
A=cell((para.N_total-1)/para.s+1,1);
disp(['Total ',num2str((para.N_total-1)/para.s+1),' step(s)count:']);
for i=1:para.s:para.N_total
[para,T_all,UP_all,~,~,~] = dynaE(para,[0.1,0.1,10,10,i,10],[]);
V((i-1)/para.s+1,1)={UP_all(size(T_all,1),1:para.N_total)};
A((i-1)/para.s+1,1)={UP_all(size(T_all,1),para.N_total+1:2*para.N_total)};
disp(['i:',num2str((i-1)/para.s+1)]);
end
disp('end');
%r_A(1:para.N_total)=(kA(1:para.N_total).^2).*(A(1:para.N_total)>0)/(1+para.kA(1:para.N_total).^2);
%r_V(1:para.N_total)=(kV(1:para.N_total).^2).*(V(1:para.N_total)>0)/(1+para.kV(1:para.N_total).^2);
Vz=cell2mat(V);
Az=cell2mat(A); %%
MV=sum(Vz)/((para.N_total-1)/para.s+1);
MA=sum(Az)/((para.N_total-1)/para.s+1); %%
Mean=bsxfun(@times,MV,MA');
JAV=Vz'*Az/((para.N_total)/para.s)-Mean; %%
JAV=(JAV)/max(max(JAV));
save JAV_M JAV;
end