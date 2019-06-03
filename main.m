clear classes
clear all
clc

[num,txt,raw] = xlsread('OperationData.xlsx');

for i=2:21
    name{i-1}=raw{i,1};
    srnm{i-1}=raw{i,2};
    pri{i-1}=raw{i,3};
    id{i-1}=raw{i,4};
    strt{i-1}=raw{i,5};
    fnsh{i-1}=raw{i,6};
    drtn{i-1}=raw{i,7};
end

for i=1:20
    ptnt(i)=Patient(name{i},srnm{i},pri{i});
end

for i=1:20
    opt(i)=Operation(id{i},ptnt(i),Interval(strt{i},fnsh{i}),drtn{i});
end
opt=opt.orderPri;
opt=opt.orderAve;
sch=Schedule;
[bitik, room]=sch.constructSchedule(opt);
printSchedule(room,sch);

Operationdoneinroom=room;
startTimes=[];  stopTimes=[];
for i=1:20
    startTimes=[startTimes opt(i).scheduledInterval(1)];
    stopTimes=[stopTimes opt(i).scheduledInterval(2)];
end

plot([startTimes;stopTimes],[1;1]*Operationdoneinroom,'LineWidth',10)
axis([-20 480 0 sch.numberOfRooms+1]);
ax=gca;
ax.XTick = [-20:20:480];
ax.YTick = [0:1:sch.numberOfRooms+1];