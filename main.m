function [] = main()
disp('Begin...');
% Load images
%% Test Case1
%imLeft  = imread('left.bmp');
%imRight = imread('right.bmp');  
%maxDisparity=128

%% Test Case 2
imLeft  = imread('left.jpg');
imRight = imread('right.jpg');
maxDisparity = 32;

imshow(imLeft);
%% Run Block Matching algorithm

disparityResult = StereoBM(imLeft, imRight, maxDisparity);

%% Display result
figure;imagesc(disparityResult);colorbar,title('result');axis off;  
end




