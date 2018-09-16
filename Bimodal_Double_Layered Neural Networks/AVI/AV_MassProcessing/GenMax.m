function [IF] = GenMax( )
II=cell(51,1);
for x=1:51
disp(['x:',num2str(x)]);
load(['D:\Dropbox\HKUST\UROP\AVI_data\Plot\ReTry\5E_SA\ColorP',num2str(x),').mat']) 
P=cell2mat(ColorP_all);[~,I]=max(P);
II(x)={I};
end
%IF= flipud(cell2mat(II));
end

