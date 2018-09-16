function [ Distance ] = Distance_B(City,i_set)
for count=1:20
    if count==1
    City_=City.a1;
    else
    eval(['City_',int2str(count-1),'=City.a',int2str(i_set(count-1)),';']);
    end
end
x=zeros(1,20);
x(1)=sqrt((City_-City_1)*(City_-City_1)');
x(2)=sqrt((City_1-City_2)*(City_1-City_2)');
x(3)=sqrt((City_2-City_3)*(City_2-City_3)');
x(4)=sqrt((City_3-City_4)*(City_3-City_4)');
x(5)=sqrt((City_4-City_5)*(City_4-City_5)');
x(6)=sqrt((City_5-City_6)*(City_5-City_6)');
x(7)=sqrt((City_6-City_7)*(City_6-City_7)');
x(8)=sqrt((City_7-City_8)*(City_7-City_8)');
x(9)=sqrt((City_8-City_9)*(City_8-City_9)');
x(10)=sqrt((City_9-City_10)*(City_9-City_10)'); 
x(11)=sqrt((City_10-City_11)*(City_10-City_11)');
x(12)=sqrt((City_11-City_12)*(City_11-City_12)');
x(13)=sqrt((City_12-City_13)*(City_12-City_13)');
x(14)=sqrt((City_13-City_14)*(City_13-City_14)');
x(15)=sqrt((City_14-City_15)*(City_14-City_15)');
x(16)=sqrt((City_15-City_16)*(City_15-City_16)');
x(17)=sqrt((City_16-City_17)*(City_16-City_17)');
x(18)=sqrt((City_17-City_18)*(City_17-City_18)');
x(19)=sqrt((City_18-City_19)*(City_18-City_19)');
x(20)=sqrt((City_19-City_)*(City_19-City_)'); 

Distance=sum(x);     
end

