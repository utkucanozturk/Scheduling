classdef Interval < handle
    
    properties
        left
        right
    end
    
    methods
        function Inter = Interval(lt, rt)
            Inter.left=lt;
            Inter.right=rt;
        end
        
        function w = getWidth(self)
            w=self.right-self.left;            
        end
        
        function scale(self, f)
            w= self.getWidth;
            self.right= self.left + w*f;
        end
        
        function shift(self, s)
            self.left= self.left + s;
            self.right= self.right + s;
        end
        
        function tf = isIn(self, other)
            tf= self.left>=other.left && self.right<=other.right;
        end
        
        function Inter = add(self, other)
            Inter.left=self.left+other.left;
            Inter.right=self.right+other.right;          
        end
        
        function disp(self)
            if isempty(self)
                fprintf('Empty %s\n', class(self))
            else
                fprintf('(%f,%f)\n', self.left, self.right)
            end
        end
        
    end %methods
    
end %classdef