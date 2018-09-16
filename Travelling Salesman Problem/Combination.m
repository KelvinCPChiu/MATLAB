function [ Exact_Min_Dis ] = Combination( )
%for x=1:10
%y=genvarname('City_',who);
%%eval([y,'=zeros(1,2);']);
%Min_Path=zeros(1,9);
%end
CD=zeros(1);
City=CitySet();
dl_min=Distance(City,[2,3,4,5,6,7,8,9,10]);
    for i2=2:10
        for i3=2:10
            if i3==i2;continue;end
            for i4=2:10
                if i4==i3||i4==i2;continue;end;
                for i5=2:10
                    if i5==i4||i5==i3||i5==i2;continue;end
                    for i6=2:10
                        if i6==i5||i6==i4||i6==i3||i6==i2;continue;end
                        for i7=2:10
                            if i7==i6||i7==i5||i7==i4||i7==i3||i7==i2;continue;end
                            for i8=2:10
                                if i8==i7||i8==i6||i8==i5||i8==i4||i8==i3||i8==i2;continue;end
                                for i9=2:10
                                    if i9==i8||i9==i7||i9==i6||i9==i5||i9==i4||i9==i3||i9==i2;continue;end
                                    for i10=2:10
                                        if i10==i9||i10==i8||i10==i7||i10==i6||i10==i5||i10==i4||i10==i3||i10==i2;continue;end
                                        Path=[i2 i3 i4 i5 i6 i7 i8 i9 i10];
                                        dl=Distance(City,Path);
                                        if dl_min>dl;dl_min=dl;Min_Path=Path;end
                                        
                                        CD=CD+1;
                                        if rem(CD,1000)==1 
                                        disp(CD);
                                        end
                                       
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
%disp(CD);
save Min_Path Min_Path
Exact_Min_Dis=dl_min;
save Exact_Min_Dis_10_Cities Exact_Min_Dis 
end

