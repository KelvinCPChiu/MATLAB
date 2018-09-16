function [ City ] = Random_Net_B( )
City=zeros(1,19);
Test=ceil(20*rand(1));
for x=1:19
    while Test==0||Test==1||any(Test==City)
        Test=ceil(20*rand(1));
    end
    City(x)=Test;
end
end
