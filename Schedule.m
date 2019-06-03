classdef Schedule<handle
    
    properties
        planningHorizon
        numberOfRooms
        finalSchedule
    end
    
    methods
        function sch=Schedule       %constructor
            sch.planningHorizon=Interval(0,480);
            sch.numberOfRooms=4;    
            
            for i=1:20
                sch.finalSchedule{i}={};
            end
        end
        
        function [berf,oda]=constructSchedule(sch,a)
            oda=[];
            for i=1:sch.numberOfRooms
                for j=1:20
                    berf{i,j}={};
                end
            end
            
            for i=1:length(a)
                room=1;     place=1;
                l=a(i).availableInterval.left;      d=a(i).duration;    u=[l l+d];
                w=0;
                while w==0 && room<=sch.numberOfRooms
                    e=[];   t=0;
                    if isempty(berf{room})
                        berf{room,place}=[l l+d];
                        sch.finalSchedule{i}=a(i);
                        a(i).scheduledInterval=[l l+d];
                        oda(i)=room;
                        w=w+1;
                    else
                        for j=1:20
                            if isempty(berf{room,j})==0
                                e=[e j];
                            end
                        end
                        
                        for k=1:length(e)
                            t=t+( (max(max(u),max(berf{room,e(k)}))-min(min(u),min(berf{room,e(k)}))) < ((u(2)-u(1))+(berf{room,e(k)}(2)-berf{room,e(k)}(1))) );
                        end
                        
                        if t==0
                            berf{room,length(e)+1}=[l l+d];
                            sch.finalSchedule{i}=a(i);
                            a(i).scheduledInterval=[l l+d];
                            oda(i)=room;
                            w=w+1;
                        else
                            room=room+1;
                        end
                    end
                end
                
                if room==sch.numberOfRooms+1
                    u=u+20;
                    while w==0
                        room=1;
                        while w==0 && (room<=sch.numberOfRooms) && (u(2)<=a(i).availableInterval.right)
                            e=[];   t=0;
                            if isempty(berf{room})
                                berf{room,place}=u;
                                sch.finalSchedule{i}=a(i);
                                a(i).scheduledInterval=u;
                                oda(i)=room;
                                w=w+1;
                            else
                                for j=1:20
                                    if isempty(berf{room,j})==0
                                        e=[e j];
                                    end
                                end
                                
                                for k=1:length(e)
                                    t=t+( (max(max(u),max(berf{room,e(k)}))-min(min(u),min(berf{room,e(k)}))) < ((u(2)-u(1))+(berf{room,e(k)}(2)-berf{room,e(k)}(1))) );
                                end
                                
                                if t==0
                                    berf{room,length(e)+1}=u;
                                    sch.finalSchedule{i}=a(i);
                                    a(i).scheduledInterval=u;
                                    oda(i)=room;
                                    w=w+1;
                                else
                                    room=room+1;
                                end
                            end
                        end
                        u=u+20;
                    end
                end
            end
            
        end
        
        function printSchedule(room,opt)
            filename='PR_ID2114304_ID2032134.xlsx';
            xlRange='A1';
            A={'Room number','Available Interval','Duration (min)', 'Scheduled Interval', 'Patient Name', 'Patient Surname', 'Patient Priority'};
            for i=2:21
                A{i,1}=room(i-1);
                A{i,2}=sprintf('(%d , %d)',opt.finalSchedule{i-1}.availableInterval.left,opt.finalSchedule{i-1}.availableInterval.right);
                A{i,3}=opt.finalSchedule{i-1}.duration;
                A{i,4}=sprintf('(%d , %d)',opt.finalSchedule{i-1}.scheduledInterval(1),opt.finalSchedule{i-1}.scheduledInterval(2));
                A{i,5}=opt.finalSchedule{i-1}.patient.name;
                A{i,6}=opt.finalSchedule{i-1}.patient.surname;
                A{i,7}=opt.finalSchedule{i-1}.patient.getPatientPriority;
            end
            xlswrite(filename,A,xlRange);
        end
    end
end