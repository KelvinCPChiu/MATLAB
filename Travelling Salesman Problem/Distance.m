function [ Distance ] = Distance(City,i_set)
for count=1:10
    if count==1
    City_=City.a1;
    else
    eval(['City_',int2str(count-1),'=City.a',int2str(i_set(count-1)),';']);
    end
end
x=zeros(1,10);
%for counting=1:8
%eval(['x(1+counting)=sqrt((City_',num2str(counting),'-City_',num2str(counting+1),')*transpose((City_',num2str(counting),'-City_',num2str(counting+1),')));']);
%end  
%for loop excute time too is double of direct calculation
x(1)=sqrt((City_-City_1)*(City_-City_1)');
x(2)=sqrt((City_1-City_2)*(City_1-City_2)');
x(3)=sqrt((City_2-City_3)*(City_2-City_3)');
x(4)=sqrt((City_3-City_4)*(City_3-City_4)');
x(5)=sqrt((City_4-City_5)*(City_4-City_5)');
x(6)=sqrt((City_5-City_6)*(City_5-City_6)');
x(7)=sqrt((City_6-City_7)*(City_6-City_7)');
x(8)=sqrt((City_7-City_8)*(City_7-City_8)');
x(9)=sqrt((City_8-City_9)*(City_8-City_9)');
x(10)=sqrt((City_9-City_)*(City_9-City_)'); 

Distance=sum(x);
         
end

