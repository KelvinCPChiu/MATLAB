function [Min_Path,dl_min,Path_final,Distance_final,TT] = MLCN_B(Temperature,Times,Path)
City=CitySet();
%%%%%%%%%%%
if any(Path)==0
Path=2:20;
end
dl_final=Distance_B(City,Path);
dl_min=dl_final;
Min_Path=Path;
Tem_final=0.1;
TT=zeros();
%%%%%%%%%%%
%LL=zeros(1,Times);
for count=1:Times
    %if rem(count,100)==1
    %disp(count);
    %end
    Path_com=Random_Net_B();
    dl_com=Distance_B(City,Path_com);
    Tem_int=Temperature*abs(cos(Times-count)*(Tem_final/Temperature).^(count/Times));
    %Tem_int=Temperature*abs(cos(Times-count)*(Tem_final/Temperature).^(count/Times));
    %Tem_int = Temperature + (Tem_final-Temperature).*count/Times;
    if dl_com<dl_min;Min_Path=Path_com;dl_min=dl_com;TT=count; end
    if dl_com<dl_final; Path=Path_com;dl_final=dl_com;
    elseif dl_com>dl_final
        PP=rand(1);
        if rem(count,1000)==1
           disp(count);
           disp([dl_com,dl_final,exp(-1/Tem_int*(dl_com-dl_final)),PP]);
        end
        if exp(-1/Tem_int*(dl_com-dl_final))>PP %%rand(1)
            dl_final=dl_com;Path=Path_com;
        end   
    end
    %LL(count)=dl_final;
end
Distance_final=dl_final;
Path_final=Path;
save Path_min_B Min_Path
save Distance_min_B dl_min
save Path_final_B Path_final
save Distance_final_B Distance_final
end



