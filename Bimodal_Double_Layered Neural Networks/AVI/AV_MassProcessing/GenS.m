function [] = GenS()
ColorP_all=cell(1,100);%TimeP_all=cell(10,512);
para=I_para();
for j=1:51
   for i=1:100
    disp(['j:',num2str(j),',i:',num2str(i)]);
p4=[0.1,0.1,0.187,(j-1)/50,25,1,200,i];
[para,T_all,UP_all,~,~,~] = dynaE(para,p4,[]);%P6=[0.1,1.0,0.25,1,1,1000]
ColorP_all(1,i)={UP_all(size(T_all,1),1:512)'};
%ColorP_all(mod(j+9,10)+1,i)={UP_all};
%TimeP_all(mod(j+9,10)+1,i)={T_all};
   end
%   if mod(j,10)==0
%    filename=['D:\Dropbox\HKUST\UROP\M_file\AVI\Plot\ColorP(',num2str(j),').mat'];
%    save(filename,'ColorP_all')
%    filename=['D:\Dropbox\HKUST\UROP\M_file\AVI\Plot\TimeP(',num2str(j),').mat'];
%    save(filename,'TimeP_all')
%   elseif mod(j,41)==0
%   filename=['D:\Dropbox\HKUST\UROP\M_file\AVI\Plot\ColorP(',num2str(j),').mat'];
%    save(filename,'ColorP_all')
%   filename=['D:\Dropbox\HKUST\UROP\M_file\AVI\Plot\TimeP(',num2str(j),').mat'];
%    save(filename,'TimeP_all')
%   end

filename=['C:\Users\Kelvin-Chiu\Desktop\UROP\New_Report\V2A5\ColorP(',int2str(j),').mat'];
save(filename,'ColorP_all');
end
%filename=['ColorP_all','ColorP_all']
%save(filename,'ColorP_all');
end
