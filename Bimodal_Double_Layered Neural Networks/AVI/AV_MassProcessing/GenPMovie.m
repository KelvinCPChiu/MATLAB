function [] = GenPMovie( )
for x=1:51
load(['D:\Dropbox\HKUST\UROP\AVI_data\Plot\Excitation_Time_10T\Shifting_V_position_.01_256\ColorP(',num2str(x),').mat']) 
P=cell2mat(ColorP_all);pcolor(P);shading flat;
M(x)=getframe;
end
movie(M);
end



