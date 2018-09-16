function [ All_data] = StartMeasure(TimeOfMeasurement,PeriodTimes)
TaskTimes=round(TimeOfMeasurement/PeriodTimes);
Weight=zeros(1,TaskTimes);
Times=zeros(1,TaskTimes);
%%%%%%%
%Clear Previous Setup
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
Balance=serial('COM1','DataBits',8);
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
All_data.StartDate=datetime('now');
tic
All_data.Start=toc;
for i=1:TaskTimes
    Weight(i)=Measure(Balance);
    Times(i)=toc;
    %TimeTemp=datestr(datetime('now'));
    %disp([datestr(TimeTemp,'HH:mm:ss'),'------Weight=', num2str(Weight(i)),'g ']);
    %Times(i)=ConvertT*str2num([TimeTemp(13:14);TimeTemp(16:17);TimeTemp(19:20)]);
    %plot(Times(1:i),Weight(1:i));xlabel('Times(hrs)');ylabel('Weight(g)');
    pause(PeriodTimes);
end
All_data.End=toc;
All_data.EndDate=datetime('now');
All_data.Task_Period=[TaskTimes PeriodTimes];
All_data.Time=Times;
All_data.Weight=Weight;
save All_data All_data
%%%%%%%%%%%%%%%%
fclose(Balance);
delete(Balance);
clear Balance
%%%%%%%%%%%%%%%%
%datetime('now');%,'Format','HH:mm:ss');
end

