function [] = P_Convert()
h=figure('visible','off');
for x=1:51
disp(['x:',num2str(x)]);
filename=['C:\Users\Kelvin-Chiu\Desktop\UROP\New_Report\V2A5\ColorP(',num2str(x),').jpg'];
load(['C:\Users\Kelvin-Chiu\Desktop\UROP\New_Report\V2A5\ColorP(',num2str(x),').mat'])
P=cell2mat(ColorP_all);
pcolor(P);shading flat;
saveas(h,filename);
end
close(h);
end

