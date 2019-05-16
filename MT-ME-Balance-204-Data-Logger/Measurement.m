function [ All_data] = Measurement()
%Prompt Command
TimeOfMeasurement=input('How long is the data taking (second)?  ');
PeriodTimes=input('What is the data taking Period (second) ?  ');
USB_Port=input('What is the USB_Port (COMX)  ?  ','s');
%Set the variables
TaskTimes=round(TimeOfMeasurement/PeriodTimes);
Weight=zeros(1,TaskTimes);
Times=zeros(1,TaskTimes);
%%%%%%%
%Clear Previous USB serial Connection
InstrErr=instrfind;
if isempty(InstrErr)==1
    clear InstrErr
else
ErrCheck=strncmp('open',InstrErr.Status,4);
 if any(ErrCheck)==1
    fclose(InstrErr);
 end  
delete(InstrErr)
clear InstrErr
end
%ConvertT=[1 1/60 1/3600];
%ConvertT=repmat([1 1/60 1/3600],TaskTimes,1);
%All_Data=struct([]);
%%%
%I/O Equipment
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%assignin('base','Balance',eval(['serial(',char(39),'COM1',char(39),',',char(39),'DataBits',char(39),',',num2str(8),')']))
Balance=serial(USB_Port,'DataBits',8);
set(Balance,'FlowControl','Software');
set(Balance,'Terminator','CR/LF');
fopen(Balance);
%%%%%%%%%%%%%%%%%%%%%%
%TimerFunction
%%%%%%%%%%%%%%%%%%%%%%
%t = timer;
%t.TimerFcn = @(Balance,thisEvent,Weight) Measure(Balance,thisEvent,Weight);
%t.Period = PeriodTimes;
%t.TasksToExecute = TaskTimes;
%t.ExecutionMode = 'fixedRate';
%%%%%%%%%%%%%%%%%%%%
%Start Measurement
All_data.StartDate=datetime('now');
tic
All_data.Start=toc;
for i=1:TaskTimes
    Weight(i)=Measure(Balance);
    Times(i)=toc;
    %TimeTemp=datestr(datetime('now'));
    %disp([datestr(TimeTemp,'HH:mm:ss'),'------Weight=', num2str(Weight(i)),'g ']);
    %Times(i)=ConvertT*str2num([TimeTemp(13:14);TimeTemp(16:17);TimeTemp(19:20)]);
    plot(Times(1:i),Weight(1:i));xlabel('Times(s)');ylabel('Weight(g)');
    pause(PeriodTimes);
end
All_data.End=toc;
All_data.EndDate=datetime('now');
All_data.Task_Period=[TaskTimes PeriodTimes];
All_data.Time=Times;
All_data.Weight=Weight;
%Data Saving
filename=[datestr(All_data.StartDate,'YYYY_mm_dd_HH'),'.mat'];
save(filename,'All_data');
%%%%%%%%%%%%%%%%
fclose(Balance);
delete(Balance);
clear Balance
%%%%%%%%%%%%%%%%
%datetime('now');%,'Format','HH:mm:ss');
end
%Measurement Function
function [Weight] = Measure(Balance)
WeightTemp=Balance_SICS('S',Balance);
Weight=str2double(WeightTemp(4:14)); 
x=datetime('now');
disp([datestr(x,'HH:MM:ss'),'_____Weight=', num2str(Weight),'g ']);
end
%Command MT ME204 Function
%function [ Return] = Balance_SICS(Command,obj)
%Command=char(double(Command))';
%fwrite(obj,[Command char(32) char(13) char(10)]);
%Return=fscanf(obj);
%end
function [ Return] = Balance_SICS(Command,obj)
Command=char(double(Command))';
fwrite(obj,[Command char(32) char(13) char(10)]);
%ans=[];
%while isempty(ans) %#ok<*NOANS>
%   fscanf(obj);
%end
Return=fscanf(obj);
end

