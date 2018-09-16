function [IF] = P_Convert_Green( )
h=figure('visible','off');
III=cell(51,1);
for x=1:51
%disp(['x:',num2str(x)]);
load(['C:\Users\Kelvin-Chiu\Desktop\UROP\New_Report\V2A2\ColorP(',int2str(x),').mat'])
P=cell2mat(ColorP_all);[M,~]=max(P);
III(x)={M};
end
IIIF=cell2mat(III);
IF=(IIIF>50).*1;
x = linspace(0,1,51);y=1:100;
pcolor(y,x,IF);caxis([0 1]);
title('Excitation Time: Visual=2,Auditory=2','FontSize',12);xlabel('Neruon','FontSize',12);ylabel('Strength of Visual Input','FontSize',12);
saveas(h,'C:\Users\Kelvin-Chiu\Desktop\UROP\New_Report\V2A2','jpg');
end



