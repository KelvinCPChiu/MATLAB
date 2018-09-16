function [PS] = GenP()
%%Gen P would take too many time. GenS then GenP 2 would take fewer time
%%
SP=zeros(21,512);
Input=1:512;
Input=repmat(Input,21,1);
para=I_para();
for j=1:21
for i=1:512
    disp(['j:',num2str(j),',i:',num2str(i)]);
p4=[0.1,0.1,1.3,(j-1)/1000000+0.24837,1,1,50,i];
[para,T_all,UP_all,~,~,~] = dynaE(para,p4,[]);%P6=[0.1,1.0,0.25,1,1,1000]
[~,I]=max(UP_all(size(T_all,1),1:512));
SP(j,i)=I;
end
end
save SP SP
PS=SP-Input;
save PS PS
pcolor(PS);shading flat;
end

