classdef Operation<handle
    
    properties
        id
        patient
        availableInterval
        scheduledInterval
        duration
    end
    
    methods
        function opt=Operation(a,b,c,d)     %constructor
            opt.id=a;
            opt.patient=b;
            opt.availableInterval=c;
            opt.duration=d;
        end
        
        function setScheduledInterval(self,sinter)
            self.scheduledInterval=sinter;
        end
        
        function b=orderPri(a) %order with respect to priority
            n = length(a);
            for k = 1:n-1
                for j = 1:n-k
                    if(getPatientPriority(a(j).patient)> getPatientPriority(a(j+1).patient))
                        temp = a(j);
                        a(j) = a(j+1);
                        a(j+1) = temp;
                    end
                end
            end
            b=a;
        end
        
        function b=orderAve(a) %order with respect to width for equal priorities
            n = length(a);
            for k = 1:n-1
                for j = 1:n-k
                    q=a(j).availableInterval.getWidth;  v=a(j+1).availableInterval.getWidth;
                    if (getPatientPriority(a(j).patient)== getPatientPriority(a(j+1).patient)) && (q)> (v)
                        temp = a(j);
                        a(j) = a(j+1);
                        a(j+1) = temp;
                    end
                end
            end
            b=a;
        end
    end
end