function [disparityResult] = LRCheck(disparityLeft,disparityRight)
disparityResult = disparityLeft;
disp('Begin LRCheck');
% Check left disparity image
for y=1:size(disparityLeft,1);
    for x=1:size(disparityLeft,2);
		left = disparityLeft(y,x);
        if x - left>0 
		    right = disparityRight(y, x - left);
		    dispDiff = left - right;
			if dispDiff < 0 
                dispDiff = -dispDiff;
            elseif dispDiff > 1 %  Maximum difference
				disparityResult(y,x) = 0;
			end
        end
    end
end
disp('End LRCheck');        
end