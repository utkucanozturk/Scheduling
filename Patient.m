classdef Patient<handle

    properties
        name
        surname
        priority
    end
    
    methods
        function pat=Patient(a,b,c)     %constructor
            pat.name=a;
            pat.surname=b;
            pat.priority=c;
        end
        
        function pri=getPatientPriority(self)
            pri=self.priority;
        end
    end   
end