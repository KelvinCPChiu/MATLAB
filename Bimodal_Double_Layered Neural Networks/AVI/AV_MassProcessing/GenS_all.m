function [] = GenS_all()
para=I_para();
h=figure('visible','off');
load('MyColormaps','mycmap')
set(h,'Colormap',mycmap)
nFrames =51;% 101;
%mov(1:nFrames) = struct('cdata', [],'colormap', []);
  
for j=1:nFrames
    disp(['j:',num2str(j)]);
p4=[0.1,0.1,0.187,(j-1)/1000+0.3,25,1,40,100];%p4=[0.1,0.1,0.187,(j-1)/10000+0.326,25,1,40,100];
[para,T_all,UP_all,~,~,~] = dynaE(para,p4,[]);%P6=[0.1,1.0,0.25,1,1,1000]]
%plot(T_all,UP_all(:,20)','r--');hold;
%plot(T_all,UP_all(:,256)','b');hold;
pcolor(T_all,1:512,UP_all(:,1:512)');shading flat;colorbar;
filename2=['Transiant Response with increasing visual excitation | visual strength:',num2str((j-1)/1000+0.3)];
xlabel('Time');ylabel('Neutrons Position');title(filename2);
%mov(j) = getframe(gcf);
filename=['D:\Dropbox\HKUST\UROP\AVI_data\Summer_2014\Graph\0.3_0.35\ColorP(',int2str(j),').jpg'];
saveas(h,filename);
end
end
