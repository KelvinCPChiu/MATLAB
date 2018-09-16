function [ City ] = Random_Net( )
City=zeros(1,9);
Test=ceil(10*rand(1));
for x=1:9
    while Test==0||Test==1||any(Test==City)
        Test=ceil(10*rand(1));
    end
    City(x)=Test;
end
end

