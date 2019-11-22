function [ disparityResult ] = StereoBM( imgLeft, imgRight, maxDisparity )
disp('Begin StereoBM');

%% from RGB to Grayscale
imgLeft = round(mean(imgLeft, 3));
imgRight = round(mean(imgRight, 3));

%% Sobel filter
sobelLeft = SobelFilter(imgLeft);
sobelRight = SobelFilter(imgRight);

%% SAD
disparityLeft = LeftSADCost(sobelLeft,sobelRight,maxDisparity);
disparityRight = RightSADCost(sobelLeft,sobelRight,maxDisparity);

%%Left Right check
disparityResult = LRCheck(disparityLeft,disparityRight);

%%Display 
figure;imagesc(disparityLeft);colorbar,title('left');axis off;  
figure;imagesc(disparityRight);colorbar,title('right');axis off; 

disp('End StereoBM'); 

