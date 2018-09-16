function [Min_Path,dl_min,Path_final,Distance_final,TT] = MLCN_A2(Temperature,Path)
City=CitySet();
%%%%%%%%%%%
if any(Path)==0
Path=2:10;
end
dl_final=Distance(City,Path);
dl_min=dl_final;
Min_Path=Path;
TT=zeros(1);
%%%%%%%%%%%
%for count=1:Times
while 1
    TT=TT+1;
    if rem(TT,1000)==1
    disp(TT);
    end
    %Temperature=abs(Temperature*cos(TT)*exp(-TT/50));
    Path_com=Random_Net();
    dl_com=Distance(City,Path_com);
    PP=rand(1);
    %Data Output
    %if rem(count,1000)==1
    %       disp(count);
    %       disp([dl_com,dl_final,exp(-1/Temperature*(dl_com-dl_final)),PP]);
    %end
    %find minimum Path and distance over the loop
    if dl_com<dl_min;Min_Path=Path_com;dl_min=dl_com; end
    %Count the number of reach exact minimum
    if dl_com>=41.94111&&dl_com<=41.94113;disp(TT);disp('The Exact Minimum was found');break ;end
    %Probability of switching
    if dl_com<dl_final; Path=Path_com;dl_final=dl_com;
    elseif dl_com>dl_final
        if exp(-1/Temperature*(dl_com-dl_final))>PP %%rand(1)
            dl_final=dl_com;Path=Path_com;
        end   
    end
end
Distance_final=dl_final;
Path_final=Path;
save Path_min_A Min_Path
save Distance_min_A dl_min
save Path_final_A Path_final
save Distance_final_A Distance_final
end



