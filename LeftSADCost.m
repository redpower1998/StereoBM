function [disparityLeft]=LeftSADCost(img_left,img_right,MaxDisparity)
disp('Begin LeftSADCost');
blockSize = 21;
halfBlock=round(blockSize/2);

disparityLeft=zeros(size(img_left));
for i=halfBlock+1:size(img_left,1)-halfBlock
    for j=halfBlock+1:size(img_left,2)-halfBlock
        blockLeft=img_left(i-halfBlock:i+halfBlock,j-halfBlock:j+halfBlock);
        for k=0:min(j-halfBlock-1,MaxDisparity)
            blockRight=img_right(i-halfBlock:i+halfBlock,j-halfBlock-k:j+halfBlock-k);
            % calculate SAD
            sadValue(k+1, 1) = sum(abs(blockLeft(:) - blockRight(:)));           
        end
        [x disparity]=min(sadValue);
           disparityLeft(i, j) = (disparity-1);
    end
end
disp('End LeftSADCost');
                    